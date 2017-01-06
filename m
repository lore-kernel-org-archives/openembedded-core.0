Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id AC45271A2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 14:46:42 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id x49so14403329qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 06:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s6dTyoIUlT1cdiAlTkzTqe+hQPicgl/6ezXO0B3kHTM=;
	b=DWukVdjAtKHd47k+jWcWQBiLRyOundgatfShOf6s2rezZwdp7Q8FkQjDRQksIrQb0p
	IoJ0rhzT8X0ZHaU+nmZEmU/UUZA06o0YNB633P6saLoIPEGMwpr+/IJW21yMbrMICZEI
	tETOJSmSTXuv3+QniPsv7rbxLgmESPmssQjmJUEYbWa3dkCY2T685o5tWZ+jEsVNGQId
	xJGHCPageURk8RnIJ/P7IywBedMS3CfpdVto5bmp3fUMUYyq25QtqmuT+jfB1+4tnqo8
	8SvqE23BFy5ASCh9Xl7Mz1KpT3slqSiPRupKm1zEtI6AKuyvGsfZQSwJDFkko++fGdBB
	IV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s6dTyoIUlT1cdiAlTkzTqe+hQPicgl/6ezXO0B3kHTM=;
	b=BkXNtRLdAS4lFoG7QOzEMkoDK2mrpZQsHXE/YbovC0sxskPK1BHmya4+p7+4WMHVeE
	glSB0M1rOtyJfYODQ8SZqQWQbtlEsdYeaEju6CxA8Jn6+j3ic1PDWk6bWV68HqyDDGFl
	/2smcfT0Dl7FujrAVVGt9KlWAVuP4GxFiiFsjaIitF/9610rAGWHoiSSvKBuCcF0oodJ
	FIB+AcIRtdcn5amzW/lOZ+jJw3oz40e4WmAde56QW13BXLPq6+U5adns6wjEr4BN4VMi
	GyTYGUXFxve8N0gg8DRZukmuZfJVFVSjVooxiKiV33jfb5YLjwCFBddiTEZC5fjHY7YV
	b0+Q==
X-Gm-Message-State: AIkVDXJodB6PEGHKRURUThFsaWpcgZ+L4eeiYINvsEcMNS5772wV0on6y2IRVRANZsKXvuINu7ke4Ch8JQYB4eok
X-Received: by 10.237.34.46 with SMTP id n43mr78201548qtc.105.1483714002651;
	Fri, 06 Jan 2017 06:46:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 6 Jan 2017 06:46:22 -0800 (PST)
In-Reply-To: <5460018.mmGskV4KOr@crde-port-20.cahors.local>
References: <20161220095122.11831-1-freesilicon@gmail.com>
	<20161222102320.15247-1-freesilicon@gmail.com>
	<CAJTo0LY5hHkOfQuzSO-W6TjDFPXY5N=J0x5DKoCT1Rn2ZU+4TA@mail.gmail.com>
	<5460018.mmGskV4KOr@crde-port-20.cahors.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Jan 2017 14:46:22 +0000
Message-ID: <CAJTo0LZdQBtdapvw+n189JWkAfrwkv=FJRh7aWV0Z1RdCaGrVg@mail.gmail.com>
To: David Vincent <freesilicon@gmail.com>
Cc: "Plascencia, Daniela" <daniela.plascencia@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] rootfs: Modify RPM installation
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
X-List-Received-Date: Fri, 06 Jan 2017 14:46:45 -0000
Content-Type: multipart/alternative; boundary=001a11377e1813a60505456e16af

--001a11377e1813a60505456e16af
Content-Type: text/plain; charset=UTF-8

On 22 December 2016 at 14:45, David Vincent <freesilicon@gmail.com> wrote:

>         - Another option I didn't think of
>

One other option would be to only pass --with-path-database in target
builds, as the default is fine (read: will never be used) for native.

I just looked at the configure.ac and it appears that for native builds
with this patch the database path is "yes".   :)

Ross

--001a11377e1813a60505456e16af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 December 2016 at 14:45, David Vincent <span dir=3D"ltr">&lt;<a href=
=3D"mailto:freesilicon@gmail.com" target=3D"_blank">freesilicon@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":567" cla=
ss=3D"a3s aXjCH m15926feacc8e2565">=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Another op=
tion I didn&#39;t think of<br></div></blockquote></div><br>One other option=
 would be to only pass --with-path-database in target builds, as the defaul=
t is fine (read: will never be used) for native.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">I just looked at the <a href=3D"=
http://configure.ac">configure.ac</a> and it appears that for native builds=
 with this patch the database path is &quot;yes&quot;. =C2=A0 :)</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11377e1813a60505456e16af--
