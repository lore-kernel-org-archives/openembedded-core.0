Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 44FC371CE7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 11:21:46 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id k15so44312876qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 03:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1YLiF35pQDGngHlU4vi/aaGZhASBgnXLJFxXJOqlo2w=;
	b=tyyjJd7ZHmd3vpIxdZrHydfqfy+ju1w5/lruBQNwE6Pw/GNCDy+RgiydlfGAYIYNMU
	a3HCIAaahxaCliJG78UKczY5T3VDNzkcGhrkFitykp9sRr8x0ecvFo3tArjksg4QDjSQ
	/igNz+RnrLad4hot6gbVWR8c1QRuDX/7BNHwoo/F7fDPg9NK/Sjj3C1P7aXNdmdTMuBb
	eACiGZJ5yWoqA/B0Yf2yGzJL/MNWzGpv7DZlO8JGZHkHslOC12WIcVE899ZJPo/62e83
	JG0KvQTcWEva3HTfoevBjXWZjxYSlsgWzEiFQ+pcTMnqo6j32mi/C7jFGaIWr+zdJsmG
	LhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1YLiF35pQDGngHlU4vi/aaGZhASBgnXLJFxXJOqlo2w=;
	b=BvLHr+X/BpV2nkYtZ6T6m7RcN1/XyXsJKqOvJJ8KUf2NRZSLk+mo0e49serccnbXxj
	y5u2L8J252/Dh8GUum8BnzMlBARImx2fcW28CcT/gEB2uyWLI7BqCrbXXyJDvPb9JXdi
	gnoDp76okbgj2T32Cwjh+cQ2DPvbI/vpWMtZHaZFvHFeT6okG/gL56BdHeil6GwDD69u
	v7bBYb4Q2TEsQ/oDehBlvXdjGSnYSq3hYv+HbN7KRpH5pIcJxb6P9e0kr/nsUmRyRYer
	BOxQnau0TT9Xk6B1BawiqDVyDtwQ5/XDz77qg+A4x1UR6bI9odU8ZbNavpL30DIst5XC
	2vaw==
X-Gm-Message-State: AIkVDXKiAI7oVbvtshKW3U3xemv/fTaEwEmqW4MV1CRkhJD9J7vvAGx20OGR58dzDbuD7Z+VoLH46TPvM2sPjd0z
X-Received: by 10.200.39.212 with SMTP id x20mr16424839qtx.109.1484306506352; 
	Fri, 13 Jan 2017 03:21:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 13 Jan 2017 03:21:26 -0800 (PST)
In-Reply-To: <1483984165-7030-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
References: <1483984165-7030-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Jan 2017 11:21:26 +0000
Message-ID: <CAJTo0LawzEOCC2rq6CYUcjrV7MKWp=rBpcY6xpGKZ2gyBMATeQ@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-test: exclude recipes from world target
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
X-List-Received-Date: Fri, 13 Jan 2017 11:21:46 -0000
Content-Type: multipart/alternative; boundary=001a1135b5420c9e530545f80ad4

--001a1135b5420c9e530545f80ad4
Content-Type: text/plain; charset=UTF-8

On 9 January 2017 at 17:49, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> These recipes should be excluded from target 'world' because these are
> just intended to be used internally by oe-selftest (devtool, recipetool,
> etc.)
>

You failed to update the reference files for after the upgrade, which means
the tests now fail.

I've fixed locally, but please remember to re-run oe-selftest after
touching the test suite.

Ross

--001a1135b5420c9e530545f80ad4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 January 2017 at 17:49,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leonar=
do.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.g=
onzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":1fy" class=3D"a3s aXjCH m1598453cbe96dedc">These recipes s=
hould be <span class=3D"il">excluded</span> from target &#39;<span class=3D=
"il">world</span>&#39; because these are<br>
just intended to be used internally by oe-selftest (devtool, recipetool, et=
c.)<br></div></blockquote></div><br>You failed to update the reference file=
s for after the upgrade, which means the tests now fail.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;ve fixed locally, =
but please remember to re-run oe-selftest after touching the test suite.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a1135b5420c9e530545f80ad4--
