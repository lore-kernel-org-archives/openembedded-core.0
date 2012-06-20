Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ShOET-0002vG-OO
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 18:58:17 +0200
Received: by eekd49 with SMTP id d49so2598093eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 09:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=UW93XxJRW38o0ZoS11UNisXCUYUwPVaRLmiy9AQKJT4=;
	b=pDKNaG4GV3FTVk1KMVFamzFvEXYdd+U4MtTrhPKm3hxlTcgC5r9w7Gg4y6RobNIbZ8
	16Q/SNMIXionOtoYEW7pwHujckUdWKCgZ3aoC7JlOnkQgCLQIKrKIvoLR9pfgLptbKGt
	c1KnSiXL1vt7XbsxmGYwZjuJ7pULjgg1Mp0MlGq2Cicic/UBPAzI/1hwMpo5CRjsaXQa
	YNC5IhZJDKD7qV+h8n7mavoqKu7m40Dq7W30+pFUCI9SUbf/uZJO5s3z6dFGkjAty2MH
	ecvBr4rCV3QPBZvyo+++vc0pKJ49eYe5cx/pDcJB0F90fE77i7KnaJvFpUrkya5hNI/k
	6U8Q==
Received: by 10.14.127.198 with SMTP id d46mr5572285eei.101.1340210852762;
	Wed, 20 Jun 2012 09:47:32 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y54sm92896512eef.10.2012.06.20.09.47.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 09:47:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FE1E8D7.2010407@communistcode.co.uk>
Date: Wed, 20 Jun 2012 18:47:29 +0200
Message-Id: <F87AB0A3-3B41-4A89-95ED-68EB661BD732@dominion.thruhere.net>
References: <4FE1E603.4040408@linaro.org>
	<4FE1E8D7.2010407@communistcode.co.uk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQm8GffHysoJnk0KwRLl1AKqGN3UNuJU5xU82YatJu6fDm80WR41Cft9CqHEF4eKR8WXCmrN
Subject: Re: Apache recipe?
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
X-List-Received-Date: Wed, 20 Jun 2012 16:58:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 jun. 2012, om 17:14 heeft Jack Mitchell het volgende geschreven:

> On 20/06/12 16:02, Marcin Juszkiewicz wrote:
>> Does someone has recipe for Apache? I want to make LAMP image for our
>> tests and so far my choices are lighttpd or creation of new recipes =
for
>> Apache (based on 2.2.17 from OE classic).
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> Last time I checked the PHP recipe needs a bit of love too, I've done =
a slightly updated customised build but it's a fantastic hackfest.

There's a php recipe in meta-oe, but as you say, it's ugly=


