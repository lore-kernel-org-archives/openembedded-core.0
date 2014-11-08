Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 78F2F60557
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 18:53:29 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b13so5930389wgh.39
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Nov 2014 10:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=zOudw10/RuWHGGrdGCux2H4JvGc13vntpWBiT6Yb8qA=;
	b=jfU98t6plDF+SE96q+Hoo04Q2Ki8dJrCieZ/gyeeSh9Db4W2/da/NXZ8ZFBgDooYzb
	tNEYy6lrgJc36cL2y+5wN161f0/IGgZ+BI5ss0qE5ibZuulAyA3+jKc8pLr1s3gwdyxO
	fJeufL0HNrKud4R2eFOy+Lg9hjTXk2MtRbguvp61OmU4gIXC3F0UuUuc4xZMmFzVnHdF
	k1dzcOnilY9hFBK7jjUA/QNMq3crxUMXir18gjDBGRc6sukjfEjhbyV0bIkcn3j+h3yO
	XNLHNx/Znfpeh3KrR7EiSp5Z4+abvV/8TwNu78tuwaQ4Q8uoGqy8TTQbJE1mDTubuvhu
	SklQ==
X-Gm-Message-State: ALoCoQm8eT41JUHYS50r49RGdcrqX5We6a8HLHFA+ojMPoLiJdA/vd+z9RTPxT8cM4dGdVRMBrHw
X-Received: by 10.194.82.74 with SMTP id g10mr28642651wjy.116.1415472809893;
	Sat, 08 Nov 2014 10:53:29 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id mw7sm6608945wib.14.2014.11.08.10.53.28
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Nov 2014 10:53:28 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20141107143813.GF2444@jama>
Date: Sat, 8 Nov 2014 19:53:26 +0100
Message-Id: <01AE3AA2-1B18-4047-A760-E137E0A245D3@dominion.thruhere.net>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<16384282a6c5f4878b1c377bbe38cfae1d311d0b.1415346812.git.hongxu.jia@windriver.com>
	<20141107143813.GF2444@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] avahi.inc: use avahi-daemon as avahi's provider
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
X-List-Received-Date: Sat, 08 Nov 2014 18:53:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 7 nov. 2014, om 15:38 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:
>=20
> On Fri, Nov 07, 2014 at 03:57:01PM +0800, Hongxu Jia wrote:
>> The package avahi does not exist, so we use avahi-daemon as the =
provider.
>> It avoids the do_rootfs failure while IMAGE_INSTALL +=3D "avahi"
>=20
> Why don't you fix your IMAGE_INSTALL instead?

I agree with Martin, this is a non-problem, please fix your =
IMAGE_INSTALL.=20=

