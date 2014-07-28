Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1737B7003A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 08:51:49 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so6919248wgg.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 01:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=IB60Px5YGZdiCUTr6EVkmC8Q8yI8fOgYCrQctGQMEVI=;
	b=J4kNbCiCkNNjB+Qf2lOQrOspNLes24h1ddOq2/HpVYUv0P9EvVIgyHz8CwpfJAtvPE
	DEAtvFfIFxFtMfKBhG7CWBNqWf41DPExVFd67VBzTX14fg8YUNzxdoYUjsI9SysBicZW
	3ksVceYkQ7jcYQTHsQz8/5c/iPCKYiQiL6BuiwK2UOP3gJNYbIRoneo2gMEbEiAHFkdA
	NOWQGUowc0lIxKmZ3Tug+7WqaRena1a3gjls5tI3f5GA2YYvzeqANOJGoTSgcaDEdhJm
	zUU0g6dWRWXbN/yBm6WDZ++Nj4pLy7na6f3TwfH/35kjQ0DjaetaBmtS3+YX/mbQTSiY
	4DIQ==
X-Gm-Message-State: ALoCoQkVC/L/lndXjUsldKHH/0F8ruYOBAxOgfOxNBwvHYZE6PX219OHUAYRiWzkWOafHjYgRiAC
X-Received: by 10.180.21.235 with SMTP id y11mr28254723wie.75.1406537510028;
	Mon, 28 Jul 2014 01:51:50 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	ek3sm47896673wjd.17.2014.07.28.01.51.48 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Jul 2014 01:51:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AABCAC0413@ALA-MBA.corp.ad.wrs.com>
Date: Mon, 28 Jul 2014 10:51:46 +0200
Message-Id: <3EFC00D1-B81F-4618-AC38-B3557430D4EE@dominion.thruhere.net>
References: <1406282736-30238-1-git-send-email-jackie.huang@windriver.com>
	<FE5CD361-F77F-4383-B608-E216734EDB6E@dominion.thruhere.net>
	<1B858668EC6A94408DCA5225FDFA85AABCAC0413@ALA-MBA.corp.ad.wrs.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib: remove non PN based -dev packages
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
X-List-Received-Date: Mon, 28 Jul 2014 08:51:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jul. 2014, om 08:49 heeft Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com> het volgende geschreven:

>=20
>=20
>> -----Original Message-----
>> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
>> Sent: Monday, July 28, 2014 2:30 PM
>> To: Huang, Jie (Jackie)
>> Cc: OE-core; Richard Purdie
>> Subject: Re: [OE-core] [PATCH] alsa-lib: remove non PN based -dev =
packages
>>=20
>>=20
>> Op 25 jul. 2014, om 12:05 heeft jackie.huang@windriver.com het =
volgende geschreven:
>>=20
>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>=20
>>> All dev related items should be packaged in the core PN-dev package
>>> not in seperate packages.
>>=20
>> What's the upgrade path here for image and users that have 'alsa-dev' =
installed? Looks like there are
>=20
> My patch is removing 'alsa-dev' and all related files goes into =
'${PN}-dev' (PN=3Dalsa-lib here), so users need to install
> alsa-lib-dev instead of alsa-dev.

*sigh* So you have no upgrade path for situations where 'alsa-dev' is =
already installed or listed in a packagegroup or image. Worse, you don't =
even understand the problem :/

>=20
>> now 2 conflicting packages, 'alsa-dev' in the feeds and =
'alsa-lib-dev' on OE, without and
>=20
> Only 'alsa-lib-dev' now with my patch, so no conflicts.

Hahahahahaha you are really funny.=

