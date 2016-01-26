Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id C3F6D7316D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 12:21:02 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id g73so187212857ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 04:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0GnlIoMS4Ub6e954ZDNTKtrYloTSIykJ/Z8B0gYXuEI=;
	b=O9MbwYNPxY0+g+spTND+4vpiJP5aOwT4w3+CrnsP8SxKtdB22t6wAY9K9oIbFYVcwC
	zilxX0kTcEsWBluddf7XXYZNgr+nLhkfCYOrX28Jv6cT50/gbOguyTloFgJL9thdc4Zq
	3xQfyGH0v5QPqv+8nVIQBNR6wshMBDak/k//i79HQ4rJuiaq6lbdcJQGy2ZTxM4xsViD
	QscJDJ60rtmuPARtwSYlm4OYvasgNu0L9uj6rMDvAwNN0Z1chgHlz8pb4aEHgRFspmMJ
	gf6luN+i+azBCz1DoKPErCm4H54eqfG6Z3UgioJYFQywXI3xZz9xcunEo1QYgSCsQ4FE
	4TPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0GnlIoMS4Ub6e954ZDNTKtrYloTSIykJ/Z8B0gYXuEI=;
	b=dbpKAnhbu22xHjbREVQZHoLAC92C5PSrOIY26t1qKQrjaQR4AgkMvGrfvRJ3m8Ttf9
	uAUf0St/feFeAT9o+hKUfIqW9CVTFwF/jjK5troluZmF+omX/fOn6oVHNhmSwbXKHjK5
	4m6SNV6Mw6s/u1KKlB0i+RWge7w+zXC260g/offUmBCoLdSimjXj2NdahWq5GWR6d6iV
	+uz6wfNOiGoi7pKP1VGGHGD7pZU/X+hVp5Cw2xupezgLa/LYo7Uak/O/KKTjOcFzC1WP
	xMwPaUYAULSJszxuR+CazX+hWzuCLUvUOVemZ1j94NnBNHPA5LrO15A49LaKG1BxQJPA
	ic9g==
X-Gm-Message-State: AG10YOTLqOl0SAhh2DyytCb83eSsJ0JtePP0M1V3cNsOe8rAAjSKVc9LtQsU/Ot1x0CG1geq6kJfrouP0LRdPdMR
X-Received: by 10.107.3.154 with SMTP id e26mr20509958ioi.99.1453810863011;
	Tue, 26 Jan 2016 04:21:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 26 Jan 2016 04:20:43 -0800 (PST)
In-Reply-To: <1453807516-2205-1-git-send-email-adrian.ratiu@ni.com>
References: <1453807516-2205-1-git-send-email-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jan 2016 12:20:43 +0000
Message-ID: <CAJTo0LZqhHhX2dPGW5DGeKxavFTgn=9=51U=mrjExx0VOYis0w@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc: libgcc-common.inc: symlink gthr-posix -> gthr-default.h
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
X-List-Received-Date: Tue, 26 Jan 2016 12:21:05 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a0f937e052a3bb8d4

--001a113ec10a0f937e052a3bb8d4
Content-Type: text/plain; charset=UTF-8

On 26 January 2016 at 11:25, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> libgfortran needs gthr-default.h to exist (included by libgcc/gthr.h),
> but for some reason it is not symlinked in configure as defined by
> AC_CONFIG_LINKS. This patch creates it at the end of do_configure; thus
> allowing libgfortran to build without erros.
>

Are you sure?  libgfortran builds here and gthr-default.h is in the build
tree:

In
.../work/corei7-64-poky-linux/libgcc/5.3.0-r0/gcc-5.3.0/build.x86_64-poky-linux.x86_64-poky-linux/libgcc
$ ls -l gthr-default.h
lrwxrwxrwx 1 ross ross 76 Jan 25 16:20 gthr-default.h ->
/data/poky-master/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/libgcc/gthr-posix.h

I'll note that libgfortran actually then errors out in package QA:

ERROR: QA Issue: libgfortran: Files/directories were installed but not
shipped in any package:
  /usr/lib/gcc/x86_64-poky-linux/5.3.0/finclude
  /usr/lib/gcc/x86_64-poky-linux/5.3.0/finclude/ieee_features.mod
  /usr/lib/gcc/x86_64-poky-linux/5.3.0/finclude/ieee_arithmetic.mod
  /usr/lib/gcc/x86_64-poky-linux/5.3.0/finclude/ieee_exceptions.mod

If you actually use fortran would you be able to submit the right fix?  I'd
guess at adding those to FILES_PN would be right, but that's a guess.

Ross

--001a113ec10a0f937e052a3bb8d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 January 2016 at 11:25, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div id=3D":1cov" class=3D"" style=3D=
"overflow:hidden">libgfortran needs gthr-default.h to exist (included by li=
bgcc/gthr.h),<br>
but for some reason it is not symlinked in configure as defined by<br>
AC_CONFIG_LINKS. This patch creates it at the end of do_configure; thus<br>
allowing libgfortran to build without erros.</div></blockquote></div><br>Ar=
e you sure? =C2=A0libgfortran builds here and gthr-default.h is in the buil=
d tree:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
"><div class=3D"gmail_extra">In .../work/corei7-64-poky-linux/libgcc/5.3.0-=
r0/gcc-5.3.0/build.x86_64-poky-linux.x86_64-poky-linux/libgcc</div><div cla=
ss=3D"gmail_extra">$ ls -l gthr-default.h</div><div class=3D"gmail_extra">l=
rwxrwxrwx 1 ross ross 76 Jan 25 16:20 gthr-default.h -&gt; /data/poky-maste=
r/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/libgcc/gthr-posix.h</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;ll note that l=
ibgfortran actually then errors out in package QA:</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">ERR=
OR: QA Issue: libgfortran: Files/directories were installed but not shipped=
 in any package:</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/gcc/x86_64=
-poky-linux/5.3.0/finclude</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/=
gcc/x86_64-poky-linux/5.3.0/finclude/ieee_features.mod</div><div class=3D"g=
mail_extra">=C2=A0 /usr/lib/gcc/x86_64-poky-linux/5.3.0/finclude/ieee_arith=
metic.mod</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/gcc/x86_64-poky-l=
inux/5.3.0/finclude/ieee_exceptions.mod</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">If you actually use fortran would you be =
able to submit the right fix?=C2=A0 I&#39;d guess at adding those to FILES_=
PN would be right, but that&#39;s a guess.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div></div></div>

--001a113ec10a0f937e052a3bb8d4--
