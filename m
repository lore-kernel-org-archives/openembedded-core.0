Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3CB7017D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 09:56:24 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id r30so23834596qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 02:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ntNuRDzji1voTPaPEi8Kj7fwG3i7EPoqycVnr8ape4o=;
	b=SHzsDvYoiuXt6vhMeR4SmASiz54OuOonqlietKmqv6pqE8VMnED0v6HzSNL0tGecWn
	ioDg8g2eDcu8vrUCQl7G7roJymNwSHidxAPOAIYcc8zVrZXqq+PnhXCBhsMlkR/ugmKY
	nk2RBCcLvEQBig3cN5LiXDweFC+0DCH39hNC0sAdSi0Sbhknb085nKbfb8U4cjAQGF8Z
	dXDiVJGxicz+dpDG9gbCn2MKcUrFF6mZB1+ZDYHmV5b7kAq7I7WAGmcp4VGWOOEtxVS8
	H//+RnrZAXYtGo02t6lM0u7PWyKoDebY1HiBaP3BYyJty4WjdnbNPZmaKQokYsJQ8q9P
	v1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ntNuRDzji1voTPaPEi8Kj7fwG3i7EPoqycVnr8ape4o=;
	b=d2KpMdIcexELXC+MZFdIQV4lJT1wFtR//bQcchDr4gxoHa5+ThMIHyPWaWqgRJyIU0
	k4iLq5Ys8ZV1sJAOelt4EpIpcLrEmJlHd4EQndK2KVRw6rFvHZB0ntp0ljkJhlRN4i3C
	af8s3b1DNcmYoJ41/rClqnaC2j27fXYRiJb79InmOm2WXjvGCW3Dk0uE71LKecjpdTS4
	CYPLPc4EEyVL0pRfJpbduv3Nl5UJiBn3PB9bmiGdcCd5iHOdP3IGPhsT8VwZixUPfsIO
	YXxIlAanDw06+5SJcwwiH4ySqgIzUNJZQHkJluTCKjsYQOo5GX2G5JIi9mm6Nh4QOgek
	ocmA==
X-Gm-Message-State: AKS2vOytbIngcAHELmafrwoz5OLdswBjaSvMh/fByPiX9GqLExAvNf3X
	EM71CzHNmMloLyojUYH/e831ZNbU4tP9
X-Received: by 10.200.45.221 with SMTP id q29mr24257241qta.177.1498470986072; 
	Mon, 26 Jun 2017 02:56:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Mon, 26 Jun 2017 02:56:05 -0700 (PDT)
In-Reply-To: <20170623173358.GX28053@denix.org>
References: <1497553789-126570-1-git-send-email-denis@denix.org>
	<20170623173358.GX28053@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Jun 2017 10:56:05 +0100
Message-ID: <CAJTo0LZqg=8Z9z+ksNm-WYdUn8QMaQ71ss1PGZb9kDcVk3tZsw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] toolchain-scripts: add check for LD_LIBRARY_PATH in the SDK env setup script
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
X-List-Received-Date: Mon, 26 Jun 2017 09:56:25 -0000
Content-Type: multipart/alternative; boundary="001a114516d0d4da600552d9f68c"

--001a114516d0d4da600552d9f68c
Content-Type: text/plain; charset="UTF-8"

On 23 June 2017 at 18:33, Denys Dmytriyenko <denis@denix.org> wrote:

> Ping
>

This has been in mut for a while, should be in soon.

Ross

--001a114516d0d4da600552d9f68c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 June 2017 at 18:33, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":tj" class=3D"a3s aXj=
CH m15cd604d619fab8c">Ping<br></div></blockquote><div><br></div><div>This h=
as been in mut for a while, should be in soon.</div><div><br></div><div>Ros=
s=C2=A0</div></div><br></div></div>

--001a114516d0d4da600552d9f68c--
