Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id C333277534
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 23:03:18 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id s186so31242541qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 15:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FjZ1VdL/V0xGMo+LFra2zoonGd5KPiLjZm1NUG0JtaE=;
	b=NQZp7KN5J94NuvIStRY7RllgH/PbD7gQXGKslUIoyV7ksQkXaG8zqb9yXiJXMxjoU3
	VLpsK68s5iHo5OMpGj1352VqVwshJVAeKbaM4n8Cqdjw6JJDtucyEOx/8xq9jjYXr5b3
	bB0XX0EYdutCHKUYBfFzCmB+2B+PVuL2JTXO6YrCLqMm33hHAAoedeac/l9ovliNsGHm
	0Gvs8amqnyXRDX7e5Rk7Zhwte67Fm8QMjHdszrK49QVnOTWERG2I6zHIbVkKoyWqmS+q
	939nzUf/iuDQs8bi4i96ImzK2dC3mCsu/CngoJ1THNoYCShncRJDn3ff1+jAW+SA1Lk5
	zHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FjZ1VdL/V0xGMo+LFra2zoonGd5KPiLjZm1NUG0JtaE=;
	b=KOsfbDlWqwISAmJ806jAfp8mdMpprVscTOP5X0FI0G4g34E74MQe4K/4TeRIVS88cQ
	Bv7wWcDc1CFOzM2PzO/f/01W/T615Nh9DyAYqG9hEaVTjhPJhFcL7NV/cgskU+4vI2ts
	oOwrt4Azxc0Dup4jdp9aOVBqFVq7CDUqP/Svd14GeQzabxaLYZ47l+bBR2Y9FCBtWqQM
	8HN5wt2lq52JMI+hQwb3oiIZ+mSDZLBHidw2+9nwnQtQC4WmXQR+liA3sfyeUlo+27Sj
	Og1TxffsiVTxEly3clDmv2otVXH9g4IOlMR8mnZjZPrO1gfbWsZYFwxFwRn1ruN8szMn
	TUoA==
X-Gm-Message-State: AMke39nsuK8AKnGEBkx7ld5NZ5lOquDX0eHtFQEb35FO5IdzTCTgk0/LB+C01e2EnZA8qWEgij1/oRWae1LkI6i/
X-Received: by 10.55.40.27 with SMTP id o27mr5018627qkh.221.1487977399562;
	Fri, 24 Feb 2017 15:03:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 24 Feb 2017 15:02:59 -0800 (PST)
In-Reply-To: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
References: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Feb 2017 23:02:59 +0000
Message-ID: <CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Prevent duplicate entries on fstab
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2017 23:03:19 -0000
Content-Type: multipart/alternative; boundary=001a1144114455d2be05494ebcd1

--001a1144114455d2be05494ebcd1
Content-Type: text/plain; charset=UTF-8

On 23 February 2017 at 18:13, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:
>
> Add function to read fstab and return all mount points. This function
> is useful to _update_fstab doesn't duplicate entries in /etc/fstab.


The AB just failed all over with this error message:

| Traceback (most recent call last):
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/wic",
line 327, in <module>
|     sys.exit(main(sys.argv[1:]))
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/wic",
line 322, in main
|     return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage,
subcommands)
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/help.py",
line 95, in invoke_subcommand
|     subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/wic",
line 255, in wic_create_subcommand
|     native_sysroot, options)
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/engine.py",
line 199, in wic_create
|     plugin.do_create()
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py",
line 93, in do_create
|     self.create()
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py",
line 176, in create
|     fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py",
line 134, in _write_fstab
|     if self._update_fstab(fstab_lines, self.parts):
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py",
line 156, in _update_fstab
|     opts, "0", "0"]) + "\n"
| TypeError: sequence item 2: expected str instance, NoneType found

Ross

--001a1144114455d2be05494ebcd1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On 23 February 2017 at 18:13, Fabio Berton &lt;<a href=
=3D"mailto:fabio.berton@ossystems.com.br">fabio.berton@ossystems.com.br</a>=
&gt; wrote:<br>&gt;<br>&gt; Add function to read fstab and return all mount=
 points. This function<br>&gt; is useful to _update_fstab doesn&#39;t dupli=
cate entries in /etc/fstab.<br><br><br>The AB just failed all over with thi=
s error message:<br><br>| Traceback (most recent call last):<br>| =C2=A0 Fi=
le &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/s=
cripts/wic&quot;, line 327, in &lt;module&gt;<br>| =C2=A0 =C2=A0 sys.exit(m=
ain(sys.argv[1:]))<br>| =C2=A0 File &quot;/home/pokybuild/yocto-autobuilder=
/yocto-worker/nightly-x86/build/scripts/wic&quot;, line 322, in main<br>| =
=C2=A0 =C2=A0 return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage=
, subcommands)<br>| =C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yoc=
to-worker/nightly-x86/build/scripts/lib/wic/help.py&quot;, line 95, in invo=
ke_subcommand<br>| =C2=A0 =C2=A0 subcommands.get(args[0], subcommand_error)=
[0](args[1:], usage)<br>| =C2=A0 File &quot;/home/pokybuild/yocto-autobuild=
er/yocto-worker/nightly-x86/build/scripts/wic&quot;, line 255, in wic_creat=
e_subcommand<br>| =C2=A0 =C2=A0 native_sysroot, options)<br>| =C2=A0 File &=
quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scrip=
ts/lib/wic/engine.py&quot;, line 199, in wic_create<br>| =C2=A0 =C2=A0 plug=
in.do_create()<br>| =C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yoc=
to-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py&quot;,=
 line 93, in do_create<br>| =C2=A0 =C2=A0 self.create()<br>| =C2=A0 File &q=
uot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/script=
s/lib/wic/plugins/imager/direct.py&quot;, line 176, in create<br>| =C2=A0 =
=C2=A0 fstab_path =3D self._write_fstab(self.rootfs_dir.get(&quot;ROOTFS_DI=
R&quot;))<br>| =C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-wo=
rker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py&quot;, line=
 134, in _write_fstab<br>| =C2=A0 =C2=A0 if self._update_fstab(fstab_lines,=
 self.parts):<br>| =C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yoct=
o-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py&quot;, =
line 156, in _update_fstab<br>| =C2=A0 =C2=A0 opts, &quot;0&quot;, &quot;0&=
quot;]) + &quot;\n&quot;<br>| TypeError: sequence item 2: expected str inst=
ance, NoneType found<div><br></div><div>Ross</div></div>

--001a1144114455d2be05494ebcd1--
