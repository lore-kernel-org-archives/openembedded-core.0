Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4217665C68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 11:27:14 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id k48so960365wev.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 04:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=6RTcNkV/AhXMB9IobNYwjAWzC+DGZOZD3PiJcclVJ8A=;
	b=H9oI7g4JsYeFUQULbOKPHklnN99eIFg4BdVRjX9g/de3MLcvvF6sFvSruEK2hTWk7n
	qUij7xhA5ZTAr2c1q31TxRROG1gwqwBBDgWW2czWLeI7Nl9pBZM9WxGx9RQLZ9M5wfvd
	ioEcn6jqhYSdv0xZ+Fd5WWUOpCl06aocfajLC7J9g2GjDMNd4vJUVXu5PuQUwJOzDYYm
	i6WLEvY59LzcxqXPGGCprZ6dyd72WmmZWfNtAc+Gbt/StPHiDsc3kGAtwOHeIN31tIOW
	7uKT4Yjkhv3JpckkQs3kk43NYIbhmPWUHxZ4Ybk0uiUeLcs/HBwZKkvWbmeP1MwsglEH
	lWMQ==
X-Gm-Message-State: ALoCoQkUHutHU590NP/6BL4MMKv+87UDESPZLRSA/2t4bVWJf0n5flnQCjxacUBWqPPC42YbO/uz
X-Received: by 10.194.3.100 with SMTP id b4mr2987315wjb.111.1408015635476;
	Thu, 14 Aug 2014 04:27:15 -0700 (PDT)
Received: from ?IPv6:2001:610:612::6070:ce8e:41b4:991d?
	([2001:610:612:0:6070:ce8e:41b4:991d])
	by mx.google.com with ESMTPSA id ge8sm78612722wib.4.2014.08.14.04.27.14
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 14 Aug 2014 04:27:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZy_BEMGRO4pcjaJYfdtmq24TJ3+iLAmWjYXDh9Bz4wRw@mail.gmail.com>
Date: Thu, 14 Aug 2014 13:27:14 +0200
Message-Id: <15DEAD10-F7DC-44D3-8A6B-948FE9A42A0A@dominion.thruhere.net>
References: <cover.1407951966.git.pkj@axis.com>
	<452f76082d13b3d1c7f9930c8754553c336bd176.1407951966.git.pkj@axis.com>
	<CAJTo0LZy_BEMGRO4pcjaJYfdtmq24TJ3+iLAmWjYXDh9Bz4wRw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gstreamer1.0-plugins-good: Add a PACKAGECONFIG for udev
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
X-List-Received-Date: Thu, 14 Aug 2014 11:27:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 aug. 2014, om 13:21 heeft Burton, Ross <ross.burton@intel.com> het =
volgende geschreven:

> On 13 August 2014 18:46, Peter Kjellerstedt =
<peter.kjellerstedt@axis.com> wrote:
>> +PACKAGECONFIG[gudev]      =3D "--with-gudev,--without-gudev,udev"
>=20
> Don't you need to depend on gudev here aswell?

gudev is part of udev, right? And as a shlib it will get picked up as =
RDEPEND automatically[1].

regards,

Koen

[1] Unless gst is stupid and dlopen()s it.=

