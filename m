Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6AED56025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 14:40:54 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id b5so4049673itc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 06:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=taGTMNRNz+FNkSA1CY+9W8WSYRu+JUM+o0ezBlIbO3g=;
	b=ms6uEr5aKGGelbQrlhZoPlQbQiKKYgKACpYNJx5Koo55nOvfGbYuWaqyUh9skE9T8q
	yscZHqcwsT0wehzO4ZLEexOSXnl6rSzRE8Rg4atGnixgTWwYvMfijQ+W3Dh+cjGfJWqG
	TDRat7M5zwzcQdFenUq0ZuP3jvosANPQtGmF38YTE460zaYeO75rLfGsxr5q8oWl0OT2
	jRPVXEXBTlbAYl+W4+9oQPsSZ6b19inQL3iGKbs9RrkZkWRkDE+ApvVQ5bVZiH/EWAyT
	wSUcGHWh+4aVtVlgk9UQGK4dBzDEdYf0aM8Pk1LqTsU0FrAEZK8pRhhbIpvv+THDv+2I
	ZBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=taGTMNRNz+FNkSA1CY+9W8WSYRu+JUM+o0ezBlIbO3g=;
	b=ORyXT3WYsCjqI4vg8AkFWhT1TcSYrD9MTt5rFRpgZjrZUq9LSVpIApWzG2qcDpeVF1
	94yDOqKgz4WhcK7Nzlu05kuW8a/lftrybAkunWJXPbKoacZUb65cUO+VJ5DAlW3XcXaI
	isnLtigwIITADA6BZ7oH+64gEZdqjcCRnuzpqU0CHCe+LemiH403xBsrwhr/gDlVAqXw
	vSfnLXDozUHXE5xhfqc8TAJQjKqsu+Omk7kqEjAfTMeDRrNHT3eHk59SwQIrzoDSvygv
	6sKFyZYyFvXSJN3cFpB5SF7L88WOO+8+Be8ZcG+1MgOEzerBStqPyUMBljd7D59snhnj
	gLKw==
X-Gm-Message-State: AKGB3mK+GPOWU5QfSIYJOomAb4EjOYoKewTHaJa+k1ktSsKl8J09z2bD
	1wWj+KoT5ZOXAf4n0K74wcxLf4Nr3zsAHHZtHqFTBw==
X-Google-Smtp-Source: ACJfBouWZqRD9qAta+42fNCQ94fZq2OnlVs6Fa87HqwDaA3md7qOg5QBHULfylzvcdQUk3RPShgQwAFkT/068domEkA=
X-Received: by 10.36.162.65 with SMTP id o1mr3136584iti.85.1513176055525; Wed,
	13 Dec 2017 06:40:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Wed, 13 Dec 2017 06:40:34 -0800 (PST)
In-Reply-To: <20171128155527.GH3587@bill-the-cat>
References: <1510934900-22044-1-git-send-email-trini@konsulko.com>
	<1510934900-22044-5-git-send-email-trini@konsulko.com>
	<CAJTo0LbsO5iYxo5W9GRn-CMNpY+oyky9emUO69RTRvo6-D8ATg@mail.gmail.com>
	<20171124153611.GD3587@bill-the-cat>
	<20171128155527.GH3587@bill-the-cat>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Dec 2017 14:40:34 +0000
Message-ID: <CAJTo0LaOB_=4EPi=k+HCf=sqYAfrw+5J_cqQ-MFmTtC24EZtRA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 4/4] meta-selftest: wic: Add test for --use-uuid / --fsuuid
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
X-List-Received-Date: Wed, 13 Dec 2017 14:40:54 -0000
Content-Type: multipart/alternative; boundary="f403045fbd8445ccc5056039c158"

--f403045fbd8445ccc5056039c158
Content-Type: text/plain; charset="UTF-8"

I finally made it break locally, with MACHINE=qemux86 and using sysvinit
instead of systemd.  Basically, a pristine poky local.conf.  I've not dug
into it beyond that, or why it passes with systemd.

Ross

On 28 November 2017 at 15:55, Tom Rini <trini@konsulko.com> wrote:

> On Fri, Nov 24, 2017 at 10:36:11AM -0500, Tom Rini wrote:
> > On Fri, Nov 24, 2017 at 03:28:21PM +0000, Burton, Ross wrote:
> > > Still fails on the autobuilder though:
> > >
> > > 2017-11-24 03:33:51,694 - oe-selftest - INFO - FAIL: test_qemu
> (wic.Wic)
> > > 2017-11-24 03:33:51,694 - oe-selftest - INFO -
> > > ----------------------------------------------------------------------
> > > 2017-11-24 03:33:51,694 - oe-selftest - INFO - Traceback (most recent
> call
> > > last):
> > >   File
> > > "/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py",
> > > line 32, in wrapped_f
> > >     return func(*args, **kwargs)
> > >   File
> > > "/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
> > > line 58, in wrapped_f
> > >     return func(*args, **kwargs)
> > >   File
> > > "/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
> > > line 639, in test_qemu
> > >     self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2
> /\r\n/dev/sda3
> > > /mnt\r\n/dev/sda4 /uuid')
> > > AssertionError: '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt' !=
> > > '/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid'
> > > - /dev/root /
> > >   /dev/sda1 /boot
> > > + /dev/sda2 /
> > > - /dev/sda3 /mnt+ /dev/sda3 /mnt
> > > ?               ++
> > > + /dev/sda4 /uuid
> >
> > Erm, that doesn't make any sense:
> >
> > > > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > > > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > > > @@ -633,11 +633,14 @@ part /etc --source rootfs --ondisk mmcblk0
> > > --fstype=ext4 --exclude-path bin/ --r
> > > >          self.assertEqual(0, bitbake('wic-image-minimal').status)
> > > >          self.remove_config(config)
> > > >
> > > > -        with runqemu('wic-image-minimal', ssh=False) as qemu:
> > > > -            cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
> > > > +        with runqemu('wic-image-minimal', ssh=False,
> > > runqemuparams="nographic") as qemu:
> >
> > ... I'll v2 since disabling graphics was a local thing, oops.
> >
> > > > +            cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' ' | sort"
> > > > +            status, output = qemu.run_serial(cmd)
> > > > +            self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2
> > > /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid')
> > > > +            cmd = "grep UUID= /etc/fstab"
> > > >              status, output = qemu.run_serial(cmd)
> > > >              self.assertEqual(1, status, 'Failed to run command
> "%s": %s'
> > > % (cmd, output))
> > > > -            self.assertEqual(output, '/dev/root /\r\n/dev/sda1
> > > /boot\r\n/dev/sda3 /mnt')
> > > > +            self.assertEqual(output,
> > > 'UUID=2c71ef06-a81d-4735-9d3a-379b69c6bdba\t/uuid\text4\
> tdefaults\t0\t0')
> >
> > We no longer want to match the string you've got showing up, and the
> > string you have showing up says that /uuid wasn't mounted either.
> >
> > Can you check the sources in the autobuilder please and make sure the
> > whole series got applied correctly?  Thanks!
>
> Have you had a chance to look at this?  It's really confusing as the
> test output is basically the wic-minimal-image without the change that's
> included in this patch having been applied (it's 3 partitions).  Thanks!
>
> --
> Tom
>

--f403045fbd8445ccc5056039c158
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I finally made it break locally, with MACHINE=3Dqemux86 an=
d using sysvinit instead of systemd.=C2=A0 Basically, a pristine poky local=
.conf.=C2=A0 I&#39;ve not dug into it beyond that, or why it passes with sy=
stemd.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On 28 November 2017 at 15:55, Tom Rini <span dir=
=3D"ltr">&lt;<a href=3D"mailto:trini@konsulko.com" target=3D"_blank">trini@=
konsulko.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div c=
lass=3D"HOEnZb"><div class=3D"h5">On Fri, Nov 24, 2017 at 10:36:11AM -0500,=
 Tom Rini wrote:<br>
&gt; On Fri, Nov 24, 2017 at 03:28:21PM +0000, Burton, Ross wrote:<br>
&gt; &gt; Still fails on the autobuilder though:<br>
&gt; &gt;<br>
&gt; &gt; 2017-11-24 03:33:51,694 - oe-selftest - INFO - FAIL: test_qemu (w=
ic.Wic)<br>
&gt; &gt; 2017-11-24 03:33:51,694 - oe-selftest - INFO -<br>
&gt; &gt; ------------------------------<wbr>------------------------------=
<wbr>----------<br>
&gt; &gt; 2017-11-24 03:33:51,694 - oe-selftest - INFO - Traceback (most re=
cent call<br>
&gt; &gt; last):<br>
&gt; &gt;=C2=A0 =C2=A0File<br>
&gt; &gt; &quot;/home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>ni=
ghtly-oe-selftest/build/<wbr>meta/lib/oeqa/core/decorator/_<wbr>_init__.py&=
quot;,<br>
&gt; &gt; line 32, in wrapped_f<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return func(*args, **kwargs)<br>
&gt; &gt;=C2=A0 =C2=A0File<br>
&gt; &gt; &quot;/home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>ni=
ghtly-oe-selftest/build/<wbr>meta/lib/oeqa/selftest/cases/<wbr>wic.py&quot;=
,<br>
&gt; &gt; line 58, in wrapped_f<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return func(*args, **kwargs)<br>
&gt; &gt;=C2=A0 =C2=A0File<br>
&gt; &gt; &quot;/home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>ni=
ghtly-oe-selftest/build/<wbr>meta/lib/oeqa/selftest/cases/<wbr>wic.py&quot;=
,<br>
&gt; &gt; line 639, in test_qemu<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0self.assertEqual(output, &#39;/dev/sda1 /boot\=
r\n/dev/sda2 /\r\n/dev/sda3<br>
&gt; &gt; /mnt\r\n/dev/sda4 /uuid&#39;)<br>
&gt; &gt; AssertionError: &#39;/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 =
/mnt&#39; !=3D<br>
&gt; &gt; &#39;/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /mnt\r\n/dev/sda=
4 /uuid&#39;<br>
&gt; &gt; - /dev/root /<br>
&gt; &gt;=C2=A0 =C2=A0/dev/sda1 /boot<br>
&gt; &gt; + /dev/sda2 /<br>
&gt; &gt; - /dev/sda3 /mnt+ /dev/sda3 /mnt<br>
&gt; &gt; ?=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++<br>
&gt; &gt; + /dev/sda4 /uuid<br>
&gt;<br>
&gt; Erm, that doesn&#39;t make any sense:<br>
&gt;<br>
&gt; &gt; &gt; --- a/meta/lib/oeqa/selftest/<wbr>cases/wic.py<br>
&gt; &gt; &gt; +++ b/meta/lib/oeqa/selftest/<wbr>cases/wic.py<br>
&gt; &gt; &gt; @@ -633,11 +633,14 @@ part /etc --source rootfs --ondisk mmc=
blk0<br>
&gt; &gt; --fstype=3Dext4 --exclude-path bin/ --r<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(0, bitbak=
e(&#39;wic-image-minimal&#39;).<wbr>status)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.remove_config(config)=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 with runqemu(&#39;wic-image-min=
imal&#39;, ssh=3DFalse) as qemu:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;mou=
nt |grep &#39;^/dev/&#39; | cut -f1,3 -d &#39; &#39;&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with runqemu(&#39;wic-image-min=
imal&#39;, ssh=3DFalse,<br>
&gt; &gt; runqemuparams=3D&quot;nographic&quot;) as qemu:<br>
&gt;<br>
&gt; ... I&#39;ll v2 since disabling graphics was a local thing, oops.<br>
&gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;mou=
nt |grep &#39;^/dev/&#39; | cut -f1,3 -d &#39; &#39; | sort&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =
=3D qemu.run_serial(cmd)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(=
output, &#39;/dev/sda1 /boot\r\n/dev/sda2<br>
&gt; &gt; /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid&#39;)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;gre=
p UUID=3D /etc/fstab&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status, outp=
ut =3D qemu.run_serial(cmd)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertE=
qual(1, status, &#39;Failed to run command &quot;%s&quot;: %s&#39;<br>
&gt; &gt; % (cmd, output))<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(=
output, &#39;/dev/root /\r\n/dev/sda1<br>
&gt; &gt; /boot\r\n/dev/sda3 /mnt&#39;)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(=
output,<br>
&gt; &gt; &#39;UUID=3D2c71ef06-a81d-4735-9d3a-<wbr>379b69c6bdba\t/uuid\text=
4\<wbr>tdefaults\t0\t0&#39;)<br>
&gt;<br>
&gt; We no longer want to match the string you&#39;ve got showing up, and t=
he<br>
&gt; string you have showing up says that /uuid wasn&#39;t mounted either.<=
br>
&gt;<br>
&gt; Can you check the sources in the autobuilder please and make sure the<=
br>
&gt; whole series got applied correctly?=C2=A0 Thanks!<br>
<br>
</div></div>Have you had a chance to look at this?=C2=A0 It&#39;s really co=
nfusing as the<br>
test output is basically the wic-minimal-image without the change that&#39;=
s<br>
included in this patch having been applied (it&#39;s 3 partitions).=C2=A0 T=
hanks!<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Tom<br>
</font></span></blockquote></div><br></div>

--f403045fbd8445ccc5056039c158--
