Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id BF24777E55
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 17:17:06 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id n69so13430215ioi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2trIRhcYYOML1AVUt6gyXXGjQwVQBEBOMMgqr5+nzl4=;
	b=RDu7GTH1xu729PCw2hYgzMM7EA4m5MBT/DSekdIEUj+iFNoYA0Cj1UYxDd3Xm7W2O/
	R2FAiSiIksgSij8yQEMYGhlKFrA6RWg0pQv1k+jDkP1ff2maNk/waGOkrgSXo6DyAnGq
	afo1lsTYXjDGEn/RdXRbbe4188vEJJDoL9YQBD9g9iuy0tipcWHMQ3ohC6U7LYvcIYyu
	ZuC2pCtKzQpiLkwFqYWA4LxrlrvL2uRF20WiqcgZTH/TbXLWLieIOpMuRaMtMShW9Brd
	Wpqv2Mj6rMpiodLOzBKc//1ZxkJj3DAGuuXEiE/Cowwfp4wxC6+gWKoY591UDlJVBSQK
	aGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2trIRhcYYOML1AVUt6gyXXGjQwVQBEBOMMgqr5+nzl4=;
	b=KFRWnDQ8R7l67r2oCU9xuYCRh0QfPJd/6WqsOeagmAJAEDDuIq5+ZU+ezSO2HmBNKk
	fbI4ihRb9qPSIU2AWfWZnc1r3FHnl2fNm1R7nXHrmKb8FhTPRyKkeJ9tHD5cVFt66nWl
	UEiXDKSMMr2lrcFvnk2k/GCl4BlOWCLA8HdGndn7X0w48qesgyaTRr938m2iSUjzXVs+
	Luf1DexX/FnK10hihI6Bt2jyqbMDaTN4k0k+xw+BoW+7hP+EHRJTgyTVEhXbUWa6hFTb
	mmxFtukRN82CmG7R1woITlJ6ryZ+eecjy6deV5uNce9N85nOS932J/ISwH4NL0z2dhwV
	YowA==
X-Gm-Message-State: AHPjjUjENTeaVMX4jwGVZYtaSYpc3hrujv2PmsGcvez4MPgZTkkO9WBX
	jdpDJabId02R3c5eT8k/VzJ8N1INUAdkqjFmyS6ihg==
X-Google-Smtp-Source: AOwi7QA371HY9D3nh3a7tUc34VyL03O9dIvwbSEPul0xOPRvPY2tGNGy8D4XGiwNhRoUV3y1FE8Dy60OHrfIAP5l5JA=
X-Received: by 10.107.41.135 with SMTP id p129mr14802264iop.142.1506446227758; 
	Tue, 26 Sep 2017 10:17:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 26 Sep 2017 10:16:47 -0700 (PDT)
In-Reply-To: <20170926165637.36321-1-alejandro.hernandez@linux.intel.com>
References: <20170926165637.36321-1-alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Sep 2017 18:16:47 +0100
Message-ID: <CAJTo0LZOkD1OOws7Fa2bHGBs5093Koiy=619CGUUZs7UOzYNaQ@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-native: Build with ipv6 enabled
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
X-List-Received-Date: Tue, 26 Sep 2017 17:17:06 -0000
Content-Type: multipart/alternative; boundary="001a1141f226479f9d055a1ad822"

--001a1141f226479f9d055a1ad822
Content-Type: text/plain; charset="UTF-8"

On 26 September 2017 at 17:56, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> This patch fixes the implementation of EXTRA_OECONF to get the ipv6
> configuration correctly (whether were building for native or target),
> and it also modifies DISTRO_FEATURES_NATIVE to add ipv6 by default,
> simply to get it working like it was before changes were made'
>

Why are changes beyond adding to DISTRO_FEATURES_NATIVE required at all?

Ross

--001a1141f226479f9d055a1ad822
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 26 September 2017 at 17:56, Alejandro Hernandez <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:alejandro.hernandez@linux.intel.com" targe=
t=3D"_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><=
div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">This patch fixes the implementation of EXTRA_OECONF to get the ipv=
6<br>
configuration correctly (whether were building for native or target),<br>
and it also modifies DISTRO_FEATURES_NATIVE to add ipv6 by default,<br>
simply to get it working like it was before changes were made&#39;<br></blo=
ckquote><div><br></div><div>Why are changes beyond adding to DISTRO_FEATURE=
S_NATIVE required at all?</div><div><br></div><div>Ross=C2=A0</div></div></=
div></div>

--001a1141f226479f9d055a1ad822--
