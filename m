Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id E54C165C7B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 23:59:46 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id i8so396032qcq.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 15:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=en5iQWuQD9cxtREhd2o7klrtiPO4bDtEUzCxVvxwHPo=;
	b=hb6F50c1ib1OwI/j/5fAPdFmoqaOHLsUGwwZNSkuaUTCl1mTubp2GlqYWcByYWVpAI
	5uiOF+ZX+qGSWVrRwQhWdOTa7Dheo1rbpRbvUmuq8ND/hizZiqjMSuXjzxbqVpBP5/sV
	8kkquvHDsaQu7FsLtuPrFLOOMJywhfFd3x0bXdSaTK7r5lkaAnGY6HrNkZBYMg+zNDjU
	7TN6vOMxvFqtCEEauUGfWaaK81sUvSkyNQ/tQRz1ybDgtd/RB5xRldr+u/kYRUfw1EzQ
	HfNp/6Zzf/6EO1GTT8hcJibhxRc3rBjKp0X4+ntv/9aeV6DcwQ+rSasbtd0q6ZBzzznr
	vwdA==
X-Gm-Message-State: ALoCoQnEqp/ohM18H9FhQBxWeykbpD4sFswOcUObsh7NcsIV63c3QCegT4dGfrKkyjP1eShpDcnl
X-Received: by 10.224.138.2 with SMTP id y2mr52851703qat.52.1415750387081;
	Tue, 11 Nov 2014 15:59:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Tue, 11 Nov 2014 15:59:26 -0800 (PST)
In-Reply-To: <1415617321-19302-1-git-send-email-net147@gmail.com>
References: <1415617321-19302-1-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Nov 2014 23:59:26 +0000
Message-ID: <CAJTo0LYpPaNdMUWpVu5YR8EMZ1REyVJYCTpLvGXkj3CTL1JW6Q@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] valgrind: Upgrade to 3.10.0
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
X-List-Received-Date: Tue, 11 Nov 2014 23:59:52 -0000
Content-Type: multipart/alternative; boundary=047d7b6709c3e9d44905079e12c5

--047d7b6709c3e9d44905079e12c5
Content-Type: text/plain; charset=UTF-8

On 10 November 2014 11:02, Jonathan Liu <net147@gmail.com> wrote:

> Updated two patches to fit new version:
> - remove-arm-variant-specific.patch
> - remove-ppc-tests-failing-build.patch
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
>

Two (so far) machines in the autobuilder are reporting QA errors with this:

ERROR: QA Issue: package valgrind-ptest contains bad RPATH
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/valgrind/3.10.0-r8/build/none/tests
in file
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/valgrind/3.10.0-r8/packages-split/valgrind-ptest/usr/lib/valgrind/ptest/none/tests/tls.so
[rpaths]

ERROR: QA Issue: package valgrind-ptest contains bad RPATH
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ipk/build/build/tmp/work/i586-poky-linux/valgrind/3.10.0-r8/build/none/tests
in file
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ipk/build/build/tmp/work/i586-poky-linux/valgrind/3.10.0-r8/packages-split/valgrind-ptest/usr/lib/valgrind/ptest/none/tests/tls.so
[rpaths]

Ross

--047d7b6709c3e9d44905079e12c5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2014 11:02, Jonathan Liu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:net147@gmail.com" target=3D"_blank">net147@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style=
:solid;padding-left:1ex"><div id=3D":1l6" class=3D"" style=3D"overflow:hidd=
en">Updated two patches to fit new version:<br>
- remove-arm-variant-specific.patch<br>
- remove-ppc-tests-failing-build.patch<br>
<br>
Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147@=
gmail.com</a>&gt;</div></blockquote></div><br>Two (so far) machines in the =
autobuilder are reporting QA errors with this:</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">ERROR: =
QA Issue: package valgrind-ptest contains bad RPATH /home/pokybuild/yocto-a=
utobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/work/ppce500v2-=
poky-linux-gnuspe/valgrind/3.10.0-r8/build/none/tests in file /home/pokybui=
ld/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/work/=
ppce500v2-poky-linux-gnuspe/valgrind/3.10.0-r8/packages-split/valgrind-ptes=
t/usr/lib/valgrind/ptest/none/tests/tls.so [rpaths]</div><div><div><br></di=
v><div>ERROR: QA Issue: package valgrind-ptest contains bad RPATH /home/pok=
ybuild/yocto-autobuilder/yocto-worker/nightly-ipk/build/build/tmp/work/i586=
-poky-linux/valgrind/3.10.0-r8/build/none/tests in file /home/pokybuild/yoc=
to-autobuilder/yocto-worker/nightly-ipk/build/build/tmp/work/i586-poky-linu=
x/valgrind/3.10.0-r8/packages-split/valgrind-ptest/usr/lib/valgrind/ptest/n=
one/tests/tls.so [rpaths]</div></div><div><br></div><div>Ross</div></div></=
div>

--047d7b6709c3e9d44905079e12c5--
