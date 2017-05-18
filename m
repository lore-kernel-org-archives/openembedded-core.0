Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD7471BA0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 20:07:18 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id y201so45650692qka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 13:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QXppdHewFygKJxuwBYo8qFEZ0uZ+LKigoEmHE+EwMYk=;
	b=Ad0blPF/zkvvxqoUHrGQibd/KWcWqtl1kadlsZYONLy57cJQMRYwZUUnM1qLJYS0uO
	3aJrkO1tz1KdUrOV1c4SWQWTrdGvGmWN4PXC4hJCmwvvdLyM0s+CUbQLuEeP3+wbvtnE
	Jbq4wUrDcPMGzEprP/m86zaYnb6F3jdVuzQhfOTtU7QDC/EJF7h+hg3SXmYrl39STFnU
	GLt71mFO0FKJos5N2R8f4tQSz8MqGGfF2EWFJJUAN/eyVI0fBk8/XG4Fazu3IMFT2DGi
	eDxG8MkZQ13TdGJBnBYF1XxeqnhfUUUkahIpdzt15upvFfEX0+Ffdlo5jDFOiT4au/Em
	uG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QXppdHewFygKJxuwBYo8qFEZ0uZ+LKigoEmHE+EwMYk=;
	b=MS1azewcRTmN/grctqACa4ZXnHcQ2sj3SZxzGJeBwix3liBha5qtxGZ/9b85r7boiP
	rCtTzx7uRij3p+LF1hYYmxFCiOSHLgIlxPtvYr1XyhUWGIl1kf5ATIa8VCpDTfOb1eEr
	5ezca+1/fFX/l9hShYpSdgnr3h/pI2qL6ZjIw1WcoV7oeLB8LCbvb0GnflIMytwn+nRt
	hOV6G8qQbratKbyImeXdGrV6dJGQHrMrtoCBJC6h8+NhhUejNKSNfw48l5TkMRuPDIIp
	so+kLFMhBOBEgzxQlr3IYXFru2pa/F7YuduX7+W/ZOSsdr0s/c9hkftMk5UOrDBrJ3ik
	qEvQ==
X-Gm-Message-State: AODbwcBzfcrULvgVVjedPlxC45T8W9EQDRTSH7FkeUf09iceKiTVxUVa
	GHieqUcnyO/tECzPS2ZkMOpmmpb8HbBicQ0=
X-Received: by 10.55.69.67 with SMTP id s64mr5293278qka.221.1495138039393;
	Thu, 18 May 2017 13:07:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 18 May 2017 13:06:58 -0700 (PDT)
In-Reply-To: <20170510093529.6651-2-alexander.kanavin@linux.intel.com>
References: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
	<20170510093529.6651-2-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 May 2017 21:06:58 +0100
Message-ID: <CAJTo0LYCQ+Y2xgy6ZQvayQx--B+waGVuOm_rsTDcRfuKonE_4Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/11] trace-cmd: update to 2.6.1
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
X-List-Received-Date: Thu, 18 May 2017 20:07:21 -0000
Content-Type: multipart/alternative; boundary="001a11489b82baa8d3054fd1f318"

--001a11489b82baa8d3054fd1f318
Content-Type: text/plain; charset="UTF-8"

On 10 May 2017 at 10:35, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> License change is due to update in FSF address.
>
> Library path needs to be specified in absolute form now.
>
> Remove bash completion file from kernelshark package as it will cause
> a conflict with trace-cmd package.
>

This breaks under musl:

https://autobuilder.yoctoproject.org/main/builders/nightly-musl/builds/459/steps/BuildImages/logs/stdio

Ross

--001a11489b82baa8d3054fd1f318
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 May 2017 at 10:35, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-sty=
le:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gm=
ail-:1v6" class=3D"gmail-a3s gmail-aXjCH gmail-m15bf1b707d356542">License c=
hange is due to update in FSF address.<br>
<br>
Library path needs to be specified in absolute form now.<br>
<br>
Remove bash completion file from kernelshark package as it will cause<br>
a conflict with <span class=3D"gmail-il">trace</span>-<span class=3D"gmail-=
il">cmd</span> package.</div></blockquote></div><br>This breaks under musl:=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><a hr=
ef=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-musl/build=
s/459/steps/BuildImages/logs/stdio">https://autobuilder.yoctoproject.org/ma=
in/builders/nightly-musl/builds/459/steps/BuildImages/logs/stdio</a><br></d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a11489b82baa8d3054fd1f318--
