Return-Path: <raltherr@google.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7332577233
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 18:44:31 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id l66so117002096ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 10:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e0eAcW20LR/+ODhPRR69E8ykinrym3FxdSwhPlO91XM=;
	b=QVC6QwiV7Nx/ZIQusossbOQmmur0fxwTCig4iMf4OCESzqpl2ZVIVDK8NF8HJW3TKX
	57J5f2evCmS/XDjyB0FHC987PWfbMB/RYaGfyo3cBXgFEMAitxrSp7Aovfe+IPOZwxTT
	cXya6a3oGT3/jNWZMplr6sAyBWpxTszdAVQkSZFqR11doDvq8pPNjRsglu2vcpeO4KGs
	sVqUb3x5zhTI9448aw+t35B2htP93PAKrS2y2CzQQuwZ/vheqjjZSowFhfPuL4RggVxT
	RZS8Rx29zETzyRIilxzELDDmzT68/3Wszf2amqDtq7WQf1eHBurxGDWNluaOKTiKTe4k
	F5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e0eAcW20LR/+ODhPRR69E8ykinrym3FxdSwhPlO91XM=;
	b=LlGuJ6zNyWb1pMcBQNJLYEhRne6D2zlxCHJF80QciBSx2CsudUO7bd9EomRtViB0mY
	hJlQcNRA9NfR8APz3vzLeAbDVcTgwGid2/0UUURMi3gMZALEcu6YaP8jOxG+a82vQvJ2
	NtTMvRSlXflnlbts+SyiisVqgMQcajCu5FbYwiOWBaNd1r1sQKYgBJmqAsEZ0SfBOE3y
	35IR2ZTFnAFnzQv2ZG9vR9nGLhHQwFoAvssTREEhIS0ZyylVosXvwLHm3uzzv8gUCZV/
	Y7dEogL8Fb4cpLkNrOMZmSLUpL7268GQEm1YKkYc+sfvG1NE5Zpm7gdZFVYxwLanMM7k
	ycWQ==
X-Gm-Message-State: AIkVDXJTtBdn2ZuRFUxKsVvHQqg5lecGTUBfBOqWaQrNrLflSAnhAUUjRBDVdswjI+ikX3qsHcJECByTst+EnBZX
X-Received: by 10.107.28.204 with SMTP id c195mr26664234ioc.223.1485197071224; 
	Mon, 23 Jan 2017 10:44:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.130.106 with HTTP; Mon, 23 Jan 2017 10:44:30 -0800 (PST)
In-Reply-To: <20170123103403.GA15174@linux.intel.com>
References: <CAPLgG=muXdcmCcFCC7NY8Zk9ANH5yf616T5b9Bc31OCJq=AD3w@mail.gmail.com>
	<20170123103403.GA15174@linux.intel.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 23 Jan 2017 10:44:30 -0800
Message-ID: <CAPLgG==wYa7=zKkk6uW+LMXBdRy0Nd48r0iMaFZL5tgHbFYHUQ@mail.gmail.com>
To: ed.bartosh@linux.intel.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to use WIC to generate raw flash images
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
X-List-Received-Date: Mon, 23 Jan 2017 18:44:31 -0000
Content-Type: multipart/alternative; boundary=001a113fd9a2da83dc0546c763ce

--001a113fd9a2da83dc0546c763ce
Content-Type: text/plain; charset=UTF-8

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10957

On Mon, Jan 23, 2017 at 2:34 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> On Fri, Jan 20, 2017 at 10:37:15AM -0800, Rick Altherr wrote:
> > For OpenBMC (based on Yocto), the target is an SoC that has an external
> > boot flash connected via SPI.  Right now, we have a class (
> > https://github.com/openbmc/openbmc/blob/master/meta-
> phosphor/classes/image-overlay.bbclass)
> > used by our top-level image recipe (
> > https://github.com/openbmc/openbmc/blob/master/meta-
> phosphor/common/recipes-phosphor/images/obmc-phosphor-image.bb)
> > that manually constructs a flash image from the kernel, rootfs, etc.
>
> This is indeed very interesting work. We definitely need support of flash
> images in oe-core.
>
> > I'd like to move to an upstream-supported approach and I think that is
> WIC.
>
> > What I don't understand is:
> > - How do I build a raw flash image where it is divided into partitions
> but
> > has no partition table?
>
> Wic doesn't support this type of images, but it shouldn't be hard to add
> option to skip partitioning to .wks syntax and wic code.
>
> > - How do I set padding to be 0xFF instead of 0x00?
> The same thing here. Currently wic images are sparse files created by
> os.ftruncate, but it's not a big deal to fill them with 0xFF
>
> > - How do I include u-boot in the image?
>
> This can be done by using/extending rawcopy plugin or writing similar
> one.
>
> > Do I need to add a new imager plugin to support writing raw images with
> > non-zero padding and no partition table?  For U-Boot, do I add a new
> > bootimg plugin?
>
> This sounds reasonable. Can you create a bug for this in bugzilla to
> discuss design and implementation details?
>
> --
> Regards,
> Ed
>

--001a113fd9a2da83dc0546c763ce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D10957">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10957</a><b=
r></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, J=
an 23, 2017 at 2:34 AM, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailto:=
ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On F=
ri, Jan 20, 2017 at 10:37:15AM -0800, Rick Altherr wrote:<br>
&gt; For OpenBMC (based on Yocto), the target is an SoC that has an externa=
l<br>
&gt; boot flash connected via SPI.=C2=A0 Right now, we have a class (<br>
&gt; <a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-phospho=
r/classes/image-overlay.bbclass" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/openbmc/<wbr>openbmc/blob/master/meta-<wbr>phosphor/classes/i=
mage-<wbr>overlay.bbclass</a>)<br>
&gt; used by our top-level image recipe (<br>
&gt; <a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-phospho=
r/common/recipes-phosphor/images/obmc-phosphor-image.bb" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/openbmc/<wbr>openbmc/blob/master/meta=
-<wbr>phosphor/common/recipes-<wbr>phosphor/images/obmc-phosphor-<wbr>image=
.bb</a>)<br>
&gt; that manually constructs a flash image from the kernel, rootfs, etc.<b=
r>
<br>
</span>This is indeed very interesting work. We definitely need support of =
flash images in oe-core.<br>
<span class=3D""><br>
&gt; I&#39;d like to move to an upstream-supported approach and I think tha=
t is WIC.<br>
<br>
&gt; What I don&#39;t understand is:<br>
&gt; - How do I build a raw flash image where it is divided into partitions=
 but<br>
&gt; has no partition table?<br>
<br>
</span>Wic doesn&#39;t support this type of images, but it shouldn&#39;t be=
 hard to add<br>
option to skip partitioning to .wks syntax and wic code.<br>
<span class=3D""><br>
&gt; - How do I set padding to be 0xFF instead of 0x00?<br>
</span>The same thing here. Currently wic images are sparse files created b=
y<br>
os.ftruncate, but it&#39;s not a big deal to fill them with 0xFF<br>
<span class=3D""><br>
&gt; - How do I include u-boot in the image?<br>
<br>
</span>This can be done by using/extending rawcopy plugin or writing simila=
r<br>
one.<br>
<span class=3D""><br>
&gt; Do I need to add a new imager plugin to support writing raw images wit=
h<br>
&gt; non-zero padding and no partition table?=C2=A0 For U-Boot, do I add a =
new<br>
&gt; bootimg plugin?<br>
<br>
</span>This sounds reasonable. Can you create a bug for this in bugzilla to=
 discuss design and implementation details?<br>
<br>
--<br>
Regards,<br>
Ed<br>
</blockquote></div><br></div>

--001a113fd9a2da83dc0546c763ce--
