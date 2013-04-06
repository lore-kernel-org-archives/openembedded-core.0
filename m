Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UOQax-0003oH-0z
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 12:43:42 +0200
Received: by mail-ea0-f177.google.com with SMTP id q14so1593393eaj.36
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2013 03:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=y/uNGBPFFJSAN/H0auHxfl29ZiTcIJ0QJMQVAncF1Yo=;
	b=YgdNJPKnYeJr48Yiu7rUMbwfTMXHShBQh97RoWh4kjayVVhAzjAhgdfHLwJkCPQPXO
	FDYYsEt8Wx5JRxMWnT7A060o4W15pNzdvCAZW49EyBo8sUbgdt0PpfcwKXAcH8eFEX7A
	4Oem70TJBe1hBt7m6e6WKiFVdgra6aUa099vervKPn9k4LB2VpUMOUIeSTFLjTlv3VU8
	c3Fcw1ZE3ec/J2EE1fi9x/7exImXG24rM2IX5bZg5Rp9GznQ62i8RFHKzwV+4S91aqIi
	dvTU1J7CEag7mSmqa3iA4FhCKsmJyah832cAKuiCVHD+T/Zx+/9F6GQS7ef06yAldCze
	Sp/g==
X-Received: by 10.14.184.68 with SMTP id r44mr28092908eem.40.1365243983619;
	Sat, 06 Apr 2013 03:26:23 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id f47sm20129259eep.13.2013.04.06.03.26.21
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Apr 2013 03:26:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1365181591-6728-1-git-send-email-ross.burton@intel.com>
Date: Sat, 6 Apr 2013 12:26:23 +0200
Message-Id: <5BDCDCEF-35EC-4641-962B-DFBAE1570201@dominion.thruhere.net>
References: <1365181591-6728-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQlXEPyKLdLLPHj/eknyjZkBG5/1fnMDPCAfX1mzVIcRyLB1pONw0vL2jCjfnDsM6pxXDDBJ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: make the main package depend on all sub-packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Apr 2013 10:43:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 apr. 2013, om 19:06 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> Whilst splitting out specific large firmware blobs is a good move for =
space
> saving, it makes installing "all the firmware" tricky.
>=20
> Make linux-firmware depend on all of the separated packages so that =
installing
> that pulls in all of the sub-packages.

Speaking of firmwares, is anybody working on fixing the clashes between =
kernel-firmware-foo and linux-firmware-foo? It should only be a matter =
of adding RREPLACES to the linux-firmware subpackages.

Koen=


