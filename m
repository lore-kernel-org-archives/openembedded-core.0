Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id C7AF5738EC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 11:52:36 +0000 (UTC)
Received: by qgfa8 with SMTP id a8so37077606qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 04:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zHlBIiSR1aUImJRLtnUdv23Vgbp2NE86c6AoVpZS77U=;
	b=H5nYGwFtRajLld9wsxlcgkVyD7HXLqgvbRJnMfMGwPcYO3JNoTS1+lcptNkpW6ApAZ
	9Gqty+RhfXF2yK1Bw4wrsxpHrfarquFm3IpDdd7lGlzdQsfYUy6wHXVgMkq2lW90OmPR
	Wl2SNX8H8VadIDRXFMb3ZCRcLa7kXVwlLTxpAgTvmAD8Q+DBamLfOo1+KKH77WI+b0sh
	3WxA7CZRZJ3QkOJwThhK4C3npRrmQ+CG33HJx0IdMR8vd4YGM0IchFoZoTqJq40LxVmH
	3eCXWye4tJc/mfRJrzuZowOYbWC3FBnb1OWrMnN9Eijd63pS/24VLongfGUgvunpUXIq
	8iUw==
X-Gm-Message-State: ALoCoQk/NgcuvO4x1A7V4GyvqhRFtoKwwpAI9ozCxF3SIHXgWLsoCWbHVCFZ3S9gdgzZEQkaZl+l
X-Received: by 10.55.21.152 with SMTP id 24mr63113640qkv.40.1426506757876;
	Mon, 16 Mar 2015 04:52:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 16 Mar 2015 04:52:17 -0700 (PDT)
In-Reply-To: <CAC1BbcQU=b3FH7QqanMTu6c5PYYQ3ftJ_pVgYy6Z_tpbDRhYqA@mail.gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
	<CAJTo0La-P0daO2k0UWFjcYgHwjMGHnqrsj6gid=6-0oFZEe9Vw@mail.gmail.com>
	<CAC1BbcQU=b3FH7QqanMTu6c5PYYQ3ftJ_pVgYy6Z_tpbDRhYqA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Mar 2015 13:52:17 +0200
Message-ID: <CAJTo0LZA7zJvE-8QKcsSc4_o1LOnYqOEWcOL+pKre7Z1CexFEg@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libtirpc: respin patches
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
X-List-Received-Date: Mon, 16 Mar 2015 11:52:39 -0000
Content-Type: multipart/alternative; boundary=001a1147a9b892c24d0511667c91

--001a1147a9b892c24d0511667c91
Content-Type: text/plain; charset=UTF-8

On 16 March 2015 at 13:49, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
wrote:

> yea, i'm not changing anything from installed binaries perspective, right?
>
>
Even if you were we haven't needed explicit PR bumps for quite a while
now.  The PR service will automatically increase the PR if required.

Ross

--001a1147a9b892c24d0511667c91
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 March 2015 at 13:49, Bernhard Reutner-Fischer <span dir=3D"ltr">&lt;<=
a href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2g=
w" class=3D"a3s" style=3D"overflow:hidden">yea, i&#39;m not changing anythi=
ng from installed binaries perspective, right?<div class=3D"yj6qo"></div><d=
iv class=3D"adL"><br>
</div></div></blockquote></div><br>Even if you were we haven&#39;t needed e=
xplicit PR bumps for quite a while now.=C2=A0 The PR service will automatic=
ally increase the PR if required.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a1147a9b892c24d0511667c91--
