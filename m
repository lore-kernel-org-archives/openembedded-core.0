Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5D45A731C7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 13:24:29 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id d63so16992108ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 05:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=m3jGRMm7jHE/LGBnzoH/3qGEmyKk8mfRAj7IeRVI878=;
	b=XT8bTmANVvmkz+6FRKUN/Q8TIC4JvoQKNc3B2pGQowLQK8BKZIv6vDWgvyVsS9vi2H
	eeeAaF29YFwT1BvkvJB1q8WB+79oj0+R9zcm64kYu32r/uezakiPP/Qr5fNyIhNVN+AY
	WG+xSnU74ZqFCqd7H6oVszHAuP8XPf8mkZzCnVJWmeX625OOq1m5jEJMKuSOowPBi14W
	RM1Xoxo5UEC/q1fPHpau+7i+Fce//eRMq/S7Y3tjra4/dTyQs1Kft28jOXqHxNDnLLi7
	YYGRZlvUYiKasHei0k7BX0nWi6it/Zg3EbRqAO+X35P33taXHpHUJP5KnI17PEGr/YB6
	4Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=m3jGRMm7jHE/LGBnzoH/3qGEmyKk8mfRAj7IeRVI878=;
	b=Cq4xjU7Ies9awd3yPK9qlWMXra6hwLMse/x3pfy09mG5iISXK7Kkzv7oH1xRIlJfmD
	4JFjkMMXJhk7AoQ+GVf5K/XbP+4HdvPi+UDz1uYDFuZU0C76UZsN655YgkP8tBCDBiS+
	BawZmV6q9PR6b8/+CfMzY4inR3MjQnYRRAtkN7D4060KsRg90ofobp1Nz+pra0SZ3HEw
	HUnaCti4NIM5xnMh9GV30jEhOUy8g6Ndj8tIC6i30mow4kEexCCvVc+7fiyZsSwO+kFN
	VUPwOijD36bfodVVQdUdNI5aQZoqzCSUj7PmvXap8VGgkQpB9Y76lSW5oef+qCzazWy2
	DrUg==
X-Gm-Message-State: AG10YOTsXa4fh4B4J8TJOzRCQAOKv1Rk26kWVGEi36WkJ5U8jOHsp9NY0+8KtNatTYP7dLPjy43MQ6X1Yt8xlgu0
X-Received: by 10.107.164.15 with SMTP id n15mr30376832ioe.148.1455024270725; 
	Tue, 09 Feb 2016 05:24:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 9 Feb 2016 05:24:11 -0800 (PST)
In-Reply-To: <201602091307.54737.marex@denx.de>
References: <1455017471-6682-1-git-send-email-marex@denx.de>
	<1455017471-6682-6-git-send-email-marex@denx.de>
	<CAJTo0LZ7fpKqnuyzWmQ02dw5DnKS4+XBbAEx=nNmZDi-Fq6+ZA@mail.gmail.com>
	<201602091307.54737.marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 13:24:11 +0000
Message-ID: <CAJTo0Lbx2Cc=hAWE+WoLZuAfg-PFC1CY84iRB0mk9iu7fZgFag@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] liburcu: Add nios2 support
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
X-List-Received-Date: Tue, 09 Feb 2016 13:24:30 -0000
Content-Type: multipart/alternative; boundary=001a11377682cc0cf6052b563cc9

--001a11377682cc0cf6052b563cc9
Content-Type: text/plain; charset=UTF-8

On 9 February 2016 at 12:07, Marek Vasut <marex@denx.de> wrote:

> > Why did the license checksum change?
>
> Because the LICENSE file now contains one more entry for nios2, which
> changed
> the checksum of the whole file. Maybe we should trim the checksum to use
> only
> the header in the LICENSE file and not the whole file to prevent this ?
>
> This is the change which triggered the change of the checksum:


Oh yes, right.  Thanks!

Ross

--001a11377682cc0cf6052b563cc9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2016 at 12:07, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; Why did the license=
 checksum change?<br>
<br>
</span>Because the LICENSE file now contains one more entry for nios2, whic=
h changed<br>
the checksum of the whole file. Maybe we should trim the checksum to use on=
ly<br>
the header in the LICENSE file and not the whole file to prevent this ?<br>
<br>
This is the change which triggered the change of the checksum:</blockquote>=
</div><br>Oh yes, right.=C2=A0 Thanks!</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a11377682cc0cf6052b563cc9--
