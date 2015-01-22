Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3950E7251B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 14:33:29 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id n4so1341523qaq.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 06:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=A7BwVu5m4tij3jWYExRKgjuiiHBECjUaUK63ZjSC4Wc=;
	b=Z0qL/xJCxEJbEWtnr8pptf9IaEGDKnOkIPWC1PaEuSXC4KKAR/lSMZX2DNRzDc7gXt
	7mdE2Ah2C/xVen6dDb0NPshY2yIQSPKYABGEhrBrXKM+oLDnud+IboKsQybWPzYU8t4L
	4ax4AJ5BWggOJdy1STDgVK4eMN8ugIKVZU8b5yRnlR4HnjWfYox4LZ+1JYr7VnFY1+TN
	gD4oN27xzwgwuwaLELGFu+b+RNMjeWUN0gRFKsVlwUlu8yygGbHuhm8lM8Ix2kvjEun1
	oDr0s8kVQSlr39KG1hSeLfkWtKTIgLfZdaQcwr7b8x9EKQ9+yecD58S9Aq2x7HkURpa2
	V9XQ==
X-Gm-Message-State: ALoCoQn8+YSowTN5DYhfJGSZR2AsHAMsnH23tW4YgVlIv7SLV5NzXgSv7nbiOzNR3iQEEn8wYeD5
X-Received: by 10.224.12.19 with SMTP id v19mr3019296qav.22.1421937209688;
	Thu, 22 Jan 2015 06:33:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 22 Jan 2015 06:33:09 -0800 (PST)
In-Reply-To: <7805B0FACE4FCC4E84636AB320CBA4AC360C5636@ALA-MBB.corp.ad.wrs.com>
References: <1421499689-4863-1-git-send-email-daniel.dragomir@windriver.com>
	<7805B0FACE4FCC4E84636AB320CBA4AC360C560B@ALA-MBB.corp.ad.wrs.com>
	<CAJTo0Lb1jQ_1ZCY8OrL6GaZ7S6VnBf3cea2ndLT1O69OyLW46Q@mail.gmail.com>
	<7805B0FACE4FCC4E84636AB320CBA4AC360C5636@ALA-MBB.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jan 2015 14:33:09 +0000
Message-ID: <CAJTo0LZRj5OceJHHXRs0EnWyUOnsj4pqv=maeiEZFR69hMk1dw@mail.gmail.com>
To: "Dragomir, Daniel" <Daniel.Dragomir@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gcc-runtime: Remove libgfortran data from receipe
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
X-List-Received-Date: Thu, 22 Jan 2015 14:33:30 -0000
Content-Type: multipart/alternative; boundary=089e0149cadc46dd66050d3e8e38

--089e0149cadc46dd66050d3e8e38
Content-Type: text/plain; charset=UTF-8

On 22 January 2015 at 14:29, Dragomir, Daniel <Daniel.Dragomir@windriver.com
> wrote:

> Thank you, Ross!
> I don't know the process.
> Sorry for insistance.
>

No insistence noticed - when it's merged just ping Armin to ensure it gets
backported.

Ross

--089e0149cadc46dd66050d3e8e38
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 January 2015 at 14:29, Dragomir, Daniel <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Daniel.Dragomir@windriver.com" target=3D"_blank">Daniel.Dragomir=
@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 style=3D"direction:ltr;font-family:Tahoma;color:#000000;font-size:10pt">Th=
ank you, Ross!<br>
I don&#39;t know the process. <br>
Sorry for insistance.</div></blockquote></div><br>No insistence noticed - w=
hen it&#39;s merged just ping Armin to ensure it gets backported.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--089e0149cadc46dd66050d3e8e38--
