Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id F27D6728A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 20:46:40 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id r5so1482743qcx.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:46:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Pbp5i4MAg6QkphtapIF2XKyrexNklbwh2pJShePk++k=;
	b=XSorRJU8jWlHsF45gf2m2pKTmbmZo9Jmg7dhFwTgFiBRTyG0GVg1Ls4rlT0Dx6rkQA
	hkSdyfQDTPWN2P/WqgjL8BZiu0H2+r9ev+pcBKY5ppDOJilHWqTvndnoHQxPI95ZKXW8
	lbHVd1cmgNl1gT8GIvCNCZwNtIyJ+iRTBTItNZaYb1aCq7MmLe2nQB4JZLPB5Ex+cKNd
	0haywen1Vx39b5+Po9enwbEusBeNU1ciQJsaLpXEN1U+P6D+hdJFYy73/isFLez/ecfI
	FfTtKC0CBrOlL98F4R4+4LBZGVMC/yByJdhMBQB0pivCwnJsgEBviOxs3XjrSI4xsyuJ
	Uh1Q==
X-Gm-Message-State: ALoCoQnXkQPl/LG6OeqrhOlksx9uP/Gto9XVEITGTpLs3LnYW5ZXxwLCvSTXF2RjdURhXCLrnnr9
X-Received: by 10.229.249.68 with SMTP id mj4mr7539666qcb.23.1418935600249;
	Thu, 18 Dec 2014 12:46:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 18 Dec 2014 12:46:20 -0800 (PST)
In-Reply-To: <54931166.2050006@windriver.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
	<b18c4c9970004784d031a0776245fad792fc6a28.1418220684.git.bruce.ashfield@windriver.com>
	<CAJTo0Lb3-sYAyMreFv2AFhEo4Ejzmg3eDYOs6avJMjVO5SVjOQ@mail.gmail.com>
	<54931166.2050006@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 20:46:20 +0000
Message-ID: <CAJTo0La1Dqzu7cDqkVknM7WxqnnF6fGrrHLLHgoy83ZmM5mO9g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] linux-libc-headers: update to 3.17
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
X-List-Received-Date: Thu, 18 Dec 2014 20:46:41 -0000
Content-Type: multipart/alternative; boundary=001a1133525c69918c050a83b081

--001a1133525c69918c050a83b081
Content-Type: text/plain; charset=UTF-8

On 18 December 2014 at 17:39, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:
>
> This is unlikely to be fixed in the kernel header, but in the
> applications themselves.
>
> In this case, I see no changes to errqueue.h itself since 2012,
> but the uapi did go through some changes in 3.17 .. but then no
> more changes for 3.18.
>

It seems odd that kernel headers can't be included without the caller
having to include other headers.

I worry that this is just a workaround in one recipe for a test that is
failing in other recipes with the 3.17 headers...  doing a clean build to
see if I'm being over-cautious or not. :)

Ross

--001a1133525c69918c050a83b081
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 December 2014 at 17:39, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@w=
indriver.com</a>&gt;</span> wrote:<blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":4k0" class=3D"a3s" style=3D"overflow:hidden">This is unlikely to be fi=
xed in the kernel header, but in the<br>
applications themselves.<br>
<br>
In this case, I see no changes to errqueue.h itself since 2012,<br>
but the uapi did go through some changes in 3.17 .. but then no<br>
more changes for 3.18.</div></blockquote></div><div class=3D"gmail_extra"><=
br></div>It seems odd that kernel headers can&#39;t be included without the=
 caller having to include other headers.</div><div class=3D"gmail_extra"><b=
r>I worry that this is just a workaround in one recipe for a test that is f=
ailing in other recipes with the 3.17 headers... =C2=A0doing a clean build =
to see if I&#39;m being over-cautious or not. :)</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1133525c69918c050a83b081--
