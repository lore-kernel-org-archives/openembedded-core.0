Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id EBC3D6CC84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 06:27:31 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id u57so1996439wes.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2013 23:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:content-transfer-encoding
	:subject:message-id:date:to:mime-version;
	bh=vfQZTvU/N6Sams9Ofg+WsMnEfak4E6RLZ0Kd/LvQuKE=;
	b=WgNlevYJ1J2Vtmz+WyjtNoGoGT4h0iPYAN8DGS/WRnEN2DvUuP3ohNWoeL9MnJtsZP
	BIGOdNNF8ezPvLeK5SOf7xRhr5BCG4iPPCwVy/nizX9wvX52EX8HBEz6O7oN7eCWJZoY
	Tw+yfWilzELfKD80CgkF6XrswzEJZ7UQWW68YKMbscU0I4R03yF5/YiXU84VZqszIyXO
	HrQz5vHUCONYiXMA8IJR36lh2VKF76hPCuLY1hgDOmp2SqXq5gzSYTZb8+9eYsE6sa21
	RuwCsho86SBglhXEpiTejDLoXPSKroRWgSy2JYI6PVHHpLjf30C5EYh4oxBTzbkDrDZL
	o2ww==
X-Gm-Message-State: ALoCoQlAvtAiOXN0tE6EmJICaJ0lTom2rmklu1eR1AOlyq6aCDWwVOXEdcxRK4+Q3BqOpQ0YhMpL
X-Received: by 10.194.242.200 with SMTP id ws8mr153651wjc.60.1381386453324;
	Wed, 09 Oct 2013 23:27:33 -0700 (PDT)
Received: from [172.20.0.132] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	om10sm22167175wic.5.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 23:27:32 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Message-Id: <D14FF4AA-C9DA-40C4-B706-3953E31F1A35@dominion.thruhere.net>
Date: Thu, 10 Oct 2013 08:27:31 +0200
To: "openembedded-core@lists.openembedded.org oe-core layer"
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
X-Mailer: Apple Mail (2.1510)
Subject: Architectures with underscores in their names, how to handle that?
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
X-List-Received-Date: Thu, 10 Oct 2013 06:27:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I'm working on adding support for big-endian armv8 and the toolchain =
people decided that it should be named 'aarch64_eb'. That currently =
works in OE because there isn't a 'eb' override yet, but there might be =
one in the future.

So my question is, how can I safely handle a name like this?

regards,

Koen=

