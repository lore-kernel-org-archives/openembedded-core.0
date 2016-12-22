Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id D9BCC77616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 12:44:55 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id t184so112211067qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 04:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F+XOf7Ui2B+2XBewPP6g/gqgfve1s5ZWTDeHz1shJx4=;
	b=CNUiQ5JaPQq4tVgDqvuloatw+jQOpClP2TqhmmUJv5lGHgbMgFMNiSf8vms6BK28Kq
	/pi5H2aIevsYbxVDJHgXQM4O3fehu+lDv6kz0A6trHlcxIM8lohEfeNIl5P5OpHXFq0A
	7u+nAEkZU9G1MMswHsktwcXlxqcQTqaA4yXpTdgQH7JacQBiqfxa9gZE7qfzNhZvEYIz
	NdZ3xbF0MvWXyFQG4yScwzrCW7c0Tu9fhd3VWfSNvr3hoAFeVumHHtl/FjhrpqfOAyqv
	YileybP7qODR7C1du5G52+0ZBvrgYtM9JE/7vKzOXuyGNB6KlEKUxbKfyHfuMkpN57DF
	XAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F+XOf7Ui2B+2XBewPP6g/gqgfve1s5ZWTDeHz1shJx4=;
	b=KPhvtaYIfbftMpmYMkkjce6OSpnnJscG4b2QvIBYWx8oiE4NBKi8SehN1F3DFVyMjv
	gZ9nIC4ttFoaRASgY0Y5QrUrdt3l6kCmm6ol2lH1Y9zChR7dH2Dp5bNddjWULAbB1dkX
	oE+t1FDmGR2afYJCjJ9GDRg5fm4rlxoZKsUI4ohYMKkxfGTyxRjjkHkRVouAf6dU+CBL
	gV+r4oVPNdtppHPuLF4yI+Bop8DYCsbsfoRPmrOTOnsMXDyUUbJB/qKrFM2gGLhStGfC
	88mcm/fE5h+k3igq0QPY37y6ZguI93SJH8GbxJp/Q90Au5wutrDPp58NYLzJegnJrro7
	QepA==
X-Gm-Message-State: AIkVDXIONkAjtFU91INBnwnpjtPjgEQHbhXnrwchtJFtKSweWdwqA5k8/2FdvZF+I8N+aSeoW9Gxsp9BxUldANXK
X-Received: by 10.55.8.20 with SMTP id 20mr11039639qki.3.1482410696409; Thu,
	22 Dec 2016 04:44:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 22 Dec 2016 04:44:36 -0800 (PST)
In-Reply-To: <73f28b0aa183538fd3471df4e5d748488a5c30d2.1482339995.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482339995.git.alejandro.hernandez@linux.intel.com>
	<73f28b0aa183538fd3471df4e5d748488a5c30d2.1482339995.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Dec 2016 12:44:36 +0000
Message-ID: <CAJTo0LYKytObhH1tNQ+1fpVcGE9Y=oCT1+psyj6QU+WA=eVTOQ@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] gummiboot: Remove old gummiboot recipe, related class and wks file
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
X-List-Received-Date: Thu, 22 Dec 2016 12:44:56 -0000
Content-Type: multipart/alternative; boundary=001a114c9d60f8dde105443ea2bd

--001a114c9d60f8dde105443ea2bd
Content-Type: text/plain; charset=UTF-8

On 21 December 2016 at 17:08, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

>  delete mode 100644 scripts/lib/wic/canned-wks/mkgummidisk.wks
>

I'm guessing this is why selftest fails:

FAIL: test_mkgummidisk (oeqa.selftest.wic.Wic)
Test creation of mkgummidisk image
----------------------------------------------------------------------
Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/decorators.py",
line 109, in wrapped_f
    return func(*args, **kwargs)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/wic.py",
line 169, in test_mkgummidisk
    self.assertEqual(0, runCmd(cmd).status)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/commands.py",
line 121, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status
%d:\n%s" % (command, result.status, result.output))
AssertionError: Command 'wic create mkgummidisk --image-name
core-image-minimal' returned non-zero exit status 1:
Checking basic build environment...
Done.

No image named mkgummidisk found, exiting.  (Use 'wic list images' to list
available images, or specify a fully-qualified OE kickstart (.wks) filename)

Ross

--001a114c9d60f8dde105443ea2bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 December 2016 at 17:08, Alejandro Hernandez <span dir=3D"ltr">&lt;<a =
href=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">aleja=
ndro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
<div id=3D"gmail-:hy" class=3D"gmail-a3s gmail-aXjCH gmail-m159225ad580c7f9=
d">=C2=A0delete mode 100644 scripts/lib/wic/canned-wks/<wbr>mkgummidisk.wks=
<br></div></blockquote></div><div class=3D"gmail_extra"><br></div>I&#39;m g=
uessing this is why selftest fails:</div><div class=3D"gmail_extra"><br>FAI=
L: test_mkgummidisk (oeqa.selftest.wic.Wic)<br>Test creation of mkgummidisk=
 image<br>-----------------------------------------------------------------=
-----<br>Traceback (most recent call last):<br>=C2=A0 File &quot;/home/poky=
build/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeq=
a/utils/decorators.py&quot;, line 109, in wrapped_f<br>=C2=A0 =C2=A0 return=
 func(*args, **kwargs)<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuild=
er/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/wic.py&quo=
t;, line 169, in test_mkgummidisk<br>=C2=A0 =C2=A0 self.assertEqual(0, runC=
md(cmd).status)<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yoct=
o-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/commands.py&quot;, l=
ine 121, in runCmd<br>=C2=A0 =C2=A0 raise AssertionError(&quot;Command &#39=
;%s&#39; returned non-zero exit status %d:\n%s&quot; % (command, result.sta=
tus, result.output))<br>AssertionError: Command &#39;wic create mkgummidisk=
 --image-name core-image-minimal&#39; returned non-zero exit status 1:<br>C=
hecking basic build environment...<br>Done.<br><br>No image named mkgummidi=
sk found, exiting. =C2=A0(Use &#39;wic list images&#39; to list available i=
mages, or specify a fully-qualified OE kickstart (.wks) filename)</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a114c9d60f8dde105443ea2bd--
