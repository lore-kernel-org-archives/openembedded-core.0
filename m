Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id D352A770FF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 15:54:43 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id j124so28174946ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 08:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f6ihbxGGZYJpF169wKXdZZ/Iejj7QlKRIAYpToS1ACw=;
	b=ug9qZTwy1efox2rLfwg2xIle4CRKfkhqITCvRrE5vfort4POOOTV0wQxMlyNHrQIrF
	2FK6Z3g2OFpjdG2t7+W7gbl5XLX8YNvmbwd7ujPc9r388obEL2QEl0v5l6S1ZHfJBzK4
	+bFQ1YMJ5n5NnQDCDkHLMkQ5gLNUMms1rCns8BvGmcxYO96b9BZSBogxAZFWObXcQmK6
	sFGXRsxloioYVOzJ22K8JqCp+0YczIGvyY36uuCvjIADrr4KcvTPqBK1F7KtPXvZBq1f
	BsZxIxdOF/duZIPY4cdPoJ4lgMTMVtaG+/UFUnM4lJOJwtrVSxO/oC2tixl/ysijWQs4
	peGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f6ihbxGGZYJpF169wKXdZZ/Iejj7QlKRIAYpToS1ACw=;
	b=TKTPmJOQz3wpeiRn4/EzCY6m1RKalPHmWCJYUlJtAE2+IHBx/x9ea0zyAZcOHx1yLF
	GsFevMTHn6Vnr/kyFwi8ztDBH8WiESHqC3n7uLas+98RA5u+t4890cjjCMFOVY7V9XX9
	XQnUcaZJcwS/zh9iKvldF6dwD6rqHxj7irb781mo/HinSsDCmY5Lg1/3HWT3clQhu7/j
	Xi1OJat93w+UbTgUT2ZlW92wwPtFq3AByUlcV6rjglqSzM3x8n+eCFDKvLDPEnUcCVZf
	na8nB1cW0qJc1TDY4WS62CUWdjHWUVeZezgs22tnsRF14PnWI2ajbVx8ytWSSykw49Pv
	Dacg==
X-Gm-Message-State: AEkoout9DDqDMXrEAiQevgCXcK2rTjl5Z1acuWhqLWH7OtbfmoHT+e6ydTQkbYm/emFG/izIBie7FKXo2TRtpwTw
X-Received: by 10.36.129.213 with SMTP id q204mr5495730itd.38.1470412484293;
	Fri, 05 Aug 2016 08:54:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 5 Aug 2016 08:54:23 -0700 (PDT)
In-Reply-To: <04e8b0bc-8834-52db-8fe7-da7af806a1ba@gmail.com>
References: <1469821981-6456-1-git-send-email-anibal.limon@linux.intel.com>
	<04e8b0bc-8834-52db-8fe7-da7af806a1ba@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Aug 2016 16:54:23 +0100
Message-ID: <CAJTo0LZUFnurhrmqXuQ=iJSqh=6_zb_M=H6wN=ZnXaZ6Mb+Tvw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] apt: Upgrade to 1.2.12
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
X-List-Received-Date: Fri, 05 Aug 2016 15:54:48 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fccccc8e05395515bb

--94eb2c08b1fccccc8e05395515bb
Content-Type: text/plain; charset=UTF-8

On 5 August 2016 at 16:44, Khem Raj <raj.khem@gmail.com> wrote:

> This breaks on musl. Another plea to add a world build on AB for atleast
> 1 target for musl.
>

Does oe-core world build green with musl now?

Ross

--94eb2c08b1fccccc8e05395515bb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 August 2016 at 16:44, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":2q0" class=3D"a3s aXjCH =
m1565b61151f378e0">This breaks on musl. Another plea to add a world build o=
n AB for atleast<br>
1 target for musl.<br></div></blockquote></div><br>Does oe-core world build=
 green with musl now?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--94eb2c08b1fccccc8e05395515bb--
