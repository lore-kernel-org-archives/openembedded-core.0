Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2D60B6EE11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 16:32:36 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rp16so14240133pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 08:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=97M2ZTT7PaZEVBZ/w547C4jQWwAjySsJtTkkLOFh+Pk=;
	b=VKyNVeMxTkYTufgyfG46/B0VYXMhiHDW2PvaYlusIKtgn57nbLzfQFnkAuSq7KZkFu
	nV1GjyAGvy26pfMJGXM/gwb+Jwss3BcbUw9Hf598NlEpCI/kTW0fFp/HeMSFVwonhx4D
	jBEn70j1D4HPMCxp0297pvLRXtraHN5DftDm+gLICjbkq0zdqhdHr8OFraxIQqaI2wMZ
	iPNV+n/9EIStqG7i/VvmeREFU7xiAXfFTCY5qXhjl1zg9UJDLZ8swdX8ebFMF4Hof4sV
	DnHkfaVVu6Ye2MyoS+49xZimNbPfOeDUrOn+MqOB5fkxFqLGm50PdqWAg4LOmSSqlGbG
	bOtg==
X-Received: by 10.68.130.202 with SMTP id og10mr21277831pbb.133.1392568356839; 
	Sun, 16 Feb 2014 08:32:36 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	eo11sm95408882pac.0.2014.02.16.08.32.33 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Feb 2014 08:32:34 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1443aee84d0.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
Date: Sun, 16 Feb 2014 08:32:31 -0800
Message-Id: <7E5E9405-A19A-46A8-9551-78D909886FE2@gmail.com>
References: <1392432877-15003-1-git-send-email-raj.khem@gmail.com>
	<1443aee84d0.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] usbutils: Patch to detect iconv support
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
X-List-Received-Date: Sun, 16 Feb 2014 16:32:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Feb 16, 2014, at 5:41 AM, Bernhard Reutner-Fischer =
<rep.dot.nop@gmail.com> wrote:

> On 15 February 2014 03:54:25 Khem Raj <raj.khem@gmail.com> wrote:
>=20
>> Fixes build failures on uclibc
>=20
> Does this also handle SDK images?
> I had to divert iconv.h ..
> Thanks && cheers,
>=20
>=20

I am able to generate SDK images yes.

> Sent with AquaMail for Android
> http://www.aqua-mail.com
>=20
>=20


