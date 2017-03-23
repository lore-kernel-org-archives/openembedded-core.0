Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1553E72FA3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 11:25:27 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id n21so172349877qta.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 04:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ntrpt0Z0N2K+yNXAuFfzMfLzzRrGCdVivOLvPld/J/w=;
	b=jigJ/oLl1amo5royA9Lrmkwj40SvvnEQPNulvX2RhtJGeR5IN1BfqDVa8NvPC7o/O0
	cVDm7bTCA9eGEnraYzNpwQ6CmVUhVBCUPbYwVtm+J6StuB9vkRHH2xVNf/GFupNVhn5o
	t7wt/AEkj2HhU6Kq4fnZVluGyrLC7CDRkXkIYf9IFr1ltMRb042ZLRwxHc+l/RRgbgEZ
	KtfvCqOLy1EdkZDkwrbZgw7cvXXZg0rXJlT94zdVsPyKq91Xr9gZCCawr9/LQ64XoaHA
	a6SPSXXPOCLN4YPhbK5WCjBeVVtPnaL3YiuOCWXE5qC3JlNvRxZT8bJ+TcxP5uUzXdv3
	iMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ntrpt0Z0N2K+yNXAuFfzMfLzzRrGCdVivOLvPld/J/w=;
	b=VtDk9DpRNclvqjGlwMveTRn93Xa289j1/0182OAuz26Qiqy3HqwCmdst4tWoI1O6nn
	bEcSnyhnAM7wpT+nHZ52RmRqUvbV2quO0esbH76x1pKqrEjQgetezRDrwTaggSVrCqH+
	UA3Iip91fSX/ksC0g1qF4GwjhtbWJA34t+ZVidsa9Fwz7dVwAfjVBV3zLOKwpyC6HCJX
	UjSGgHT3EVxPXmRY1D9Atsx4WFarR6nGz7SxTnuudj/7sv8yyZEd9E4b1YHQwWE0tdri
	6ooFap17K95CGb8Nv+uH36yQvqOqMXXXkyHLKAnMuaFKyo+KoUSdHKR93wDWMw+cT8+6
	CrAg==
X-Gm-Message-State: AFeK/H2s+jxRdOhxjDH1IDXsACCpM5YrgkeJBOFkC2SXMgATJDQ432/MQ9ZwYcBoJIFXbLWU0ASmLCu71N60SVbO
X-Received: by 10.237.33.69 with SMTP id 63mr1625012qtc.109.1490268328749;
	Thu, 23 Mar 2017 04:25:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 23 Mar 2017 04:25:08 -0700 (PDT)
In-Reply-To: <20170323055412.10238-1-fathi.boudra@linaro.org>
References: <20170323055412.10238-1-fathi.boudra@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Mar 2017 11:25:08 +0000
Message-ID: <CAJTo0Lan2hjh13NJMFr2=j+g5D76CSNWBCnS4F=5M3MO7B9Fpw@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Thu, 23 Mar 2017 11:25:29 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c7fc85b0549054b642202

--94eb2c0c7fc85b0549054b642202
Content-Type: text/plain; charset=UTF-8

On 23 March 2017 at 05:54, Fathi Boudra <fathi.boudra@linaro.org> wrote:

> +           file://0028-bits-siginfo.h-enum-definition-for-TRAP_
> HWBKPT-is-mi.patch
>

Not that I'm suggesting you didn't test your patch, but this line is
missing a backslash...

:)

Ross

--94eb2c0c7fc85b0549054b642202
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 March 2017 at 05:54, Fathi Boudra <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:fathi.boudra@linaro.org" target=3D"_blank">fathi.boudra@linaro.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2vg" class=
=3D"a3s aXjCH m15af9bb239b4dd5d">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
file://0028-bits-siginfo.h-<wbr>enum-definition-for-TRAP_<wbr>HWBKPT-is-mi.=
patch<br></div></blockquote></div><br>Not that I&#39;m suggesting you didn&=
#39;t test your patch, but this line is missing a backslash...</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">:)</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0c7fc85b0549054b642202--
