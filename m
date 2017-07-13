Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB9571A35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 16:40:42 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id 188so4145754itx.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 09:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EDQQErel14RkY860ngNh2gEu5qXe8pzsb/DUYhIJD2k=;
	b=G9w20CSy0P1HwA68bETYE97uFGLA6Bar4z9ptJu1A+Wy2Hiy9SCptawCR8pVGJ7d9B
	OHOJKvvVLtuvmWkSUAIOikqO6qioscdb6BB52meYnmM3xllCD17wZBVajukGSXw+BicG
	TrIXOkC8yR6IKbGWI7hOijrxZQkaXpjuoaZYS0o1UKIqSJFwel1LhIQU1+xt0p/xztel
	CqG278yVQa8OPrPRsGmu5lqzTDlqRpAFCtBBvCYvXVgmMD+/6Pjx2p2oIg3eIX4A8DB7
	AGYEkKGw1pGcAbGpi+pTvMjkpou471jwP9jyyvR3xZGCWmEm8gTI+Rw4mhvFOZ1tpoey
	/a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EDQQErel14RkY860ngNh2gEu5qXe8pzsb/DUYhIJD2k=;
	b=nwE+20ajjSCjuKbsWQUbzNH2Ss43FVXrDIKNDxafmbTnFMikS4ACe2gG6NN84+debz
	DT7ExSyer2I/8rbMGDW1YwAEQzy8MhOarQQ76cNAm8yZD1R7quPdrC+CXwDtvbgOpWFO
	3qUkqM24obSgaxvJS69x/FE3/7p+KFJC3gTML9lU6R09MUdbHOMxPb6uDgIlT5Hl2f92
	dXPiikLz1ttmQ3kBnfSuspflvgwUDkcL+B+jxcSkFOKrJhDsQjJWSPxMn/er6wbdQnnW
	0HKk8sQ4b/t00sSP5tYP6TNP1g/UzpkkLVQf1q+gHEppBSS93sGnLl5Vv78CH4M75u4N
	V3lQ==
X-Gm-Message-State: AIVw110TiuB532I0B0aGxgrV0I4qcrETxN5xiyBANPlKrQTbpk3Mck0p
	GRHeDYBL5LtiVc6quIi5gBh9gzhhVodz
X-Received: by 10.36.25.8 with SMTP id b8mr27758470itb.29.1499964043528; Thu,
	13 Jul 2017 09:40:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Thu, 13 Jul 2017 09:40:23 -0700 (PDT)
In-Reply-To: <e99d1232-1ed5-5df1-7fc7-81437053988a@windriver.com>
References: <cover.1499784588.git.bruce.ashfield@windriver.com>
	<17a1741ee4d35f09f91f6b5216507410bb37ddb9.1499784588.git.bruce.ashfield@windriver.com>
	<CAJTo0LaacpM6wxd2Re+W6Vu7o8zPoq9MadE9csf+Pko_QCKX2Q@mail.gmail.com>
	<e99d1232-1ed5-5df1-7fc7-81437053988a@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Jul 2017 17:40:23 +0100
Message-ID: <CAJTo0LY6y+FvKgqbqCUwdD414Ub8Ba_1XY4PW3X15==BsDTRYg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] linux-yocto/4.1: update to v4.1.41
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
X-List-Received-Date: Thu, 13 Jul 2017 16:40:42 -0000
Content-Type: multipart/alternative; boundary="001a1144a5e8fdbc01055435976d"

--001a1144a5e8fdbc01055435976d
Content-Type: text/plain; charset="UTF-8"

On 13 July 2017 at 17:33, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> How would you like the fix, a completely new patch, or an incremental
> fix on my branch ?
>

A replacement patch please, it's not in master yet.

Ross

--001a1144a5e8fdbc01055435976d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 July 2017 at 17:33, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:31c" class=3D"a3s aXjCH m15d3ccc792311516">How would you like the fix, a c=
ompletely new patch, or an incremental<br>
fix on my branch ?<br></div></blockquote></div><br></div><div class=3D"gmai=
l_extra">A replacement patch please, it&#39;s not in master yet.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1144a5e8fdbc01055435976d--
