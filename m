Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 58799776A2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:12:06 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id q7so77534325uaf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 04:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=wUezSgSHlOAiH1Q4fOvJPUiKtenMb7kZvuJ6pz5LiN0=;
	b=ERMHtNlQmIWEBlDSFijQdOstHKWSTgMW06ekYqHnmF0eFqvSoEATPwSEVeYFQ7Oo3i
	aYExCT6i5/E43CUBW+6UNLD0a/82iefQSkN6j0aPfdYpPmLvsaXcuNQma9vXNCeksfgT
	GxZJg7spM9nSx4wpgGBQvxbjeuABE8QgSMeEY1koXhsBlPtD+wayEcob1gBbK/3QauR1
	X6r2SWe1pIUbuQ6ZvKi1NeAc/VZAvLuusQvwYBH2Zll2wNvJffyIuDoxSy8L3PTJ0g6h
	abw4RfrPZzW520v41u9HITNuEQZ+Fn1aqJ0S823t/uCMqKTTy29S7jJdwjJNZapM++h5
	okcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=wUezSgSHlOAiH1Q4fOvJPUiKtenMb7kZvuJ6pz5LiN0=;
	b=f/q/4ZUdkzsiwk3PRCgjabi3VXFwUm2ONTvuKXhNkOr6GnGlWVtsvB88GR8abA3+px
	G69593wdPhAncpmKMaXC5aDbrhrWL2IfxueUeAyQ4iQB/fHPgMADZ1Yj7P3mb8AqCEre
	AEp7XFGFM1fLpfS9O+bJf220z8EhmroR9LbVKbj64Kk00pPW7+dFBTY+gY36JcY24pU9
	+hckAHw8jlnSEKWPizetYqNumy95oBpTcZKDZIuy1yFdHDgakaXPoq5al8rpYL+KauCW
	wfAbwJ3342sJo19FFE3TMFm2H0pcUZ1/w+uETxpADhv3K/Yh/TrByquqxY4xmln8M6Lt
	wdHA==
X-Gm-Message-State: AMke39kPAXLfSMnW07HII60H6e08+xFiN8m73OqjhgSW0FzPViS0Zm8S/gaD3/MXTyzkpw==
X-Received: by 10.176.71.2 with SMTP id h2mr978091uac.23.1488543128087;
	Fri, 03 Mar 2017 04:12:08 -0800 (PST)
Received: from [10.5.3.7] ([189.114.111.135]) by smtp.gmail.com with ESMTPSA id
	a127sm1724444vke.27.2017.03.03.04.12.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Mar 2017 04:12:06 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
	<CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Organization: OS Systems
Message-ID: <d2ccba14-ac14-1379-d5e1-ac799e9c120b@ossystems.com.br>
Date: Fri, 3 Mar 2017 09:12:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com>
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
X-List-Received-Date: Fri, 03 Mar 2017 12:12:09 -0000
Content-Type: multipart/alternative;
	boundary="------------5388AB01CA0A67BA5121D035"

--------------5388AB01CA0A67BA5121D035
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

Sorry for delay. This error for qemux86 is because common.wks.inc and 
directdisk-gpt.wks files in scripts/lib/wic/canned-wks directory doesn't 
have option --fstype= for part /boot.

For qemuarm machines I get the error:

| DEBUG: Executing python function set_image_size
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_wic
| Error: Please build syslinux first

On 02/24/2017 08:02 PM, Burton, Ross wrote:
>
> On 23 February 2017 at 18:13, Fabio Berton 
> <fabio.berton@ossystems.com.br <mailto:fabio.berton@ossystems.com.br>> 
> wrote:
> >
> > Add function to read fstab and return all mount points. This function
> > is useful to _update_fstab doesn't duplicate entries in /etc/fstab.
>
>
> The AB just failed all over with this error message:
>
> | Traceback (most recent call last):
> |   File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/wic", 
> line 327, in <module>
> |     sys.exit(main(sys.argv[1:]))
> |   File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/wic", 
> line 322, in main
> |     return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, 
> subcommands)
> |   File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/help.py", 
> line 95, in invoke_subcommand
> |     subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
> |   File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/wic", 
> line 255, in wic_create_subcommand
> |     native_sysroot, options)
> |   File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/engine.py", 
> line 199, in wic_create
> |     plugin.do_create()
> |   File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py", 
> line 93, in do_create
> |     self.create()
> |   File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py", 
> line 176, in create
> |     fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
> |   File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py", 
> line 134, in _write_fstab
> |     if self._update_fstab(fstab_lines, self.parts):
> |   File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py", 
> line 156, in _update_fstab
> |     opts, "0", "0"]) + "\n"
> | TypeError: sequence item 2: expected str instance, NoneType found
>
> Ross


--------------5388AB01CA0A67BA5121D035
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><tt>Hi Ross,</tt></p>
    <p><tt>Sorry for delay. This error for qemux86 is because
        common.wks.inc and directdisk-gpt.wks files in
        scripts/lib/wic/canned-wks directory doesn't have option
        --fstype= for part /boot.<br>
      </tt></p>
    <p><tt>For qemuarm machines I get the error:</tt></p>
    <p><tt>| DEBUG: Executing python function set_image_size<br>
        | DEBUG: Python function set_image_size finished<br>
        | DEBUG: Executing shell function do_image_wic<br>
        | Error: Please build syslinux first<br>
      </tt></p>
    <div class="moz-cite-prefix">On 02/24/2017 08:02 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        On 23 February 2017 at 18:13, Fabio Berton &lt;<a
          moz-do-not-send="true"
          href="mailto:fabio.berton@ossystems.com.br">fabio.berton@ossystems.com.br</a>&gt;
        wrote:<br>
        &gt;<br>
        &gt; Add function to read fstab and return all mount points.
        This function<br>
        &gt; is useful to _update_fstab doesn't duplicate entries in
        /etc/fstab.<br>
        <br>
        <br>
        The AB just failed all over with this error message:<br>
        <br>
        | Traceback (most recent call last):<br>
        |   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/wic",
        line 327, in &lt;module&gt;<br>
        |     sys.exit(main(sys.argv[1:]))<br>
        |   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/wic",
        line 322, in main<br>
        |     return hlp.invoke_subcommand(args, parser,
        hlp.wic_help_usage, subcommands)<br>
        |   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/help.py",
        line 95, in invoke_subcommand<br>
        |     subcommands.get(args[0], subcommand_error)[0](args[1:],
        usage)<br>
        |   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/wic",
        line 255, in wic_create_subcommand<br>
        |     native_sysroot, options)<br>
        |   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/engine.py",
        line 199, in wic_create<br>
        |     plugin.do_create()<br>
        |   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py",
        line 93, in do_create<br>
        |     self.create()<br>
        |   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py",
        line 176, in create<br>
        |     fstab_path =
        self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))<br>
        |   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py",
        line 134, in _write_fstab<br>
        |     if self._update_fstab(fstab_lines, self.parts):<br>
        |   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/scripts/lib/wic/plugins/imager/direct.py",
        line 156, in _update_fstab<br>
        |     opts, "0", "0"]) + "\n"<br>
        | TypeError: sequence item 2: expected str instance, NoneType
        found
        <div><br>
        </div>
        <div>Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------5388AB01CA0A67BA5121D035--
