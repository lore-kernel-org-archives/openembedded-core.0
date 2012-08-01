Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SwZDH-0006Vk-W9
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 15:43:48 +0200
Received: by eaad12 with SMTP id d12so634313eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 06:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=pqcrsprrQSC6CzVhLQqR28M1oABv2k+Nez8oN4/txMs=;
	b=MloF2K7NEnTf/TABYVxPVl4AHAeu5U7bMQqMOm1GlzXybZutpN1r8y6uYaL0aNHd4F
	+4cy22rFtFHizSdB0wkZ41J0bcFTAqlHcNP1/B8BwGKSemopM5Uw+Ywnz9B6oK9OSIgw
	E7qusI/0pI3H+bsnWiabNA+43kGfzMZxAvuNU4IjDuP9c1VLtbFqGZ/CBG5ztPQP67Sl
	IwD2KYgDpbGjxwbXwr/RprwTAK4yK15uh8Ny3ZSFQffhD9yQRf/yKSA6DxYV1GV21iLd
	xaGiyvFdHAEXldloyb3uFLwosh+ois64ehN/Wdmr1oliLvvQsQHs5/l2YoPj8zmRgegL
	lvWQ==
Received: by 10.14.178.134 with SMTP id f6mr22703064eem.2.1343827929726;
	Wed, 01 Aug 2012 06:32:09 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a1b9:594:e8d9:e8db?
	([2001:610:612:0:a1b9:594:e8d9:e8db])
	by mx.google.com with ESMTPS id h42sm8981851eem.5.2012.08.01.06.32.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 06:32:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
Date: Wed, 1 Aug 2012 15:32:26 +0200
Message-Id: <40FAF05B-A7A4-45DF-8BA7-872A97FDF157@dominion.thruhere.net>
References: <cover.1343823907.git.ross.burton@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQln4fZlzJxGHKQfe/gat2Cx9SfZS58ma1VQURu8eQl4olqbk4ezWlUuONyr+ZxV70Da+Xss
Subject: Re: [PATCH 00/12] Mesa upgrade/improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 13:43:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 aug. 2012, om 14:31 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> This patch series upgrades mesa-dri to the latest upstream, enables =
GLES2 and
> EGL

That will sadly break all the powervr based evil binaries (e.g. all =
cortex arm chips from TI) since there will be 2 providers of those libs. =
I looked at this a few years ago (when mesa gained libegl) and I =
couldn't come up with a  solution other than "don't build it" :( That =
solution also breaks a number of usecases but back then I had the =
liberty to not care about those.
Does anyone have suggestions on how to handle this?=20

regards,

Koen=


