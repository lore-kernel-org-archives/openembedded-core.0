Return-Path: <jpewhacker@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 921E9796E8;
	Thu,  6 Sep 2018 20:08:23 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id y207-v6so22931143oie.13;
	Thu, 06 Sep 2018 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KIjBYnnOMoEz+RQeQJrOySiYCdziau0TASCdREdONf4=;
	b=ZT6fGVZ4Fxn5KkP7VIEwTmfFBWRjmg6L0BznXUiKHwFBs9+9e7/MYaT2q2tfXxI36j
	ZdSmaweIAgmPNw8VL8Wu2mcrhdnTPaxbFK3ZY3TjKk0LyWxpDoMDdWAleZMSeDGdkKtV
	zQDosuEs7lo4PCEGSrvYRB+HrMnGNCXnIF+MEcG2N9hse2VtxvFupIFraqCrB/NSTSi7
	YWsPtNHmanTJPNAqaauoKVqxMh9penAp0edDlyur+CsTWFadI43yKt4CQ3HqZpEK3CPA
	yuaJkqAriWjBaQQToq7vxqsIoTVmuXm8dA6e12JEMYzO1SIgmibeaWYPUKnvJcvMbGU8
	KHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KIjBYnnOMoEz+RQeQJrOySiYCdziau0TASCdREdONf4=;
	b=R6WXYJEs8kBbhafZAduGNAPzX62O6kdQtuwZKGJGILUNThNyedoZM9quvmma/UGolV
	0HYO8zs6OhtbJi36/G8FHuLemiLATYGB+mfZPLtSV4FP7BOW6mXpK/Zv/NILEhT5krpe
	vTaGAkSFAw5dMqvCAdhvEtK+xIp2GBDiSKx8du821gl2mZl6dYk52JNf48dIineHjoSr
	BySON8NUMxd7Mr54TP5u02w4Ym3wRMX0+GQjxYY6fbli3ThEiV/aWZgDg65NDr7ia3Y8
	l1vcej0tS27wUruyokD/LMetGIHoxF0/pNFyQQfCU6hTnmCxb31AxCSbqwSR5RIh/xV1
	0tcA==
X-Gm-Message-State: APzg51DoWOLMvBB96B0nllu0Pf9qmIYuD5Fi9a2j+3khtHa6MMP+Ybl9
	55iVkc/LdnNzTItPvnsKV+M=
X-Google-Smtp-Source: ANB0Vdbk8B7z/OXJoCn3AAnPw5BLjUPQQWy+WhAotTpCM8nZvVh5pxZr7hTHpxPInBVImsoslRHYSQ==
X-Received: by 2002:aca:2c02:: with SMTP id
	s2-v6mr4787291ois.305.1536264504496; 
	Thu, 06 Sep 2018 13:08:24 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	r187-v6sm4211765oie.43.2018.09.06.13.08.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 06 Sep 2018 13:08:23 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <bcaf6bfb74fb925d8987047c2a0552e726b3aea4.camel@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Thu, 06 Sep 2018 15:08:23 -0500
In-Reply-To: <CAHUNapR1AJEsDg8TUig18uSzYE74X7QGgj2pgc3Uo5OnaMxRVA@mail.gmail.com>
References: <81713c72-e806-ba69-0e6d-7ef4a2c00010@gmail.com>
	<CANNYZj8Doupz9W1zeuC5xygjqQ_ea3+v5Wa9xuBKSykLQ=yAJA@mail.gmail.com>
	<CAHUNapR1AJEsDg8TUig18uSzYE74X7QGgj2pgc3Uo5OnaMxRVA@mail.gmail.com>
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OEDEM Sunday, 21 October 2018 in Edinburgh (before ELCE) - Update
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
X-List-Received-Date: Thu, 06 Sep 2018 20:08:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-06 at 16:00 -0400, Trevor Woerner wrote:
> On Thu, Sep 6, 2018 at 5:39 AM, Alexander Kanavin <alex.kanavin@gmail
> .com>
> wrote:
> 
> > And the link for signing up is...? :)
> > 
> 
> https://www.openembedded.org/wiki/OEDEM_2018
> 
> or email Armin

Will there be an opportunity to dial in remotely?

-- 
Joshua Watt <JPEWhacker@gmail.com>

