Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SXvT2-0007q9-Kq
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 16:26:12 +0200
Received: by eekd49 with SMTP id d49so318005eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 07:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=zl2/Ip/y85ehW6gvBKkvyt8kueV8HoXso4NYLaFIu/E=;
	b=XsqTu7fG+Dm7s1tYr+nCNtmT2Od+sLPAU6qwLbOUGhsf+GR2FJAW5kWIypQ5uSmPw4
	LNl40eeYfeYPLgTP/ZgVhnkA39+nS3AikbNo++Opa+t7T4DrLVCOna7zdZbBo85m+9hP
	NYgir0DWaAF292g7ujUPDiikTAwSlawYNFOnk2CfB16vL8yRZMmbgh2KSKyy6jgx4lat
	VqWQ4EIQNOABtirDSPwUL8rOmPmoZEcjMm3b13YrLm4jIWHwLM9thMnJqVy2+Rqs7Fmh
	jeDMPCeyVwkNCYAkfubcuIv7LpWIdQhgmcAdtBwukQntjOp+4Sxne4T0xokPXQayhG9V
	igjA==
Received: by 10.14.53.76 with SMTP id f52mr675674eec.79.1337955360067;
	Fri, 25 May 2012 07:16:00 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z5sm7781884eem.3.2012.05.25.07.15.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 May 2012 07:15:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
Date: Fri, 25 May 2012 16:15:56 +0200
Message-Id: <16430873-3E99-4D47-A114-B12D987F08E3@dominion.thruhere.net>
References: <cover.1337892418.git.scott.a.garman@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkAO0khDMWti6hhMSBFm6njHobGboq+CCulmCHvGVwyJnWeT749bsZyAt+yx/oLxn0yKZKp
Subject: Re: [PATCH 00/32] denzil pull request
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
X-List-Received-Date: Fri, 25 May 2012 14:26:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 mei 2012, om 23:38 heeft Scott Garman het volgende geschreven:

> Hello,
>=20
> This is the first pull request for the oe-core denzil branch, based on
> a set of commits I've been testing from my sgarman/denzil-next branch.
>=20
> These commits have passed an array of build and runtime tests,
> including the following nightly build:
>=20
> http://autobuilder.yoctoproject.org:8010/builders/nightly/builds/462
>=20
> a non-gplv3 build:
>=20
> =
http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/=
70
>=20
> and a tiny build:
>=20
> =
http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/47
>=20
> Please give this pull request a few days to receive feedback and ACKs
> from the community.

I've been running most of these for a few weeks now, the more recent =
changes build ok for me as well:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>=


