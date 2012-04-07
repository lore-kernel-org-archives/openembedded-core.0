Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGMir-00077l-2h
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Apr 2012 05:53:57 +0200
Received: by pbcum15 with SMTP id um15so2606667pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 20:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=fAA1CTMyEf2pUyIF7rcKEdprOI2AVZd338haCFl2c2o=;
	b=VPxj42AYZ9LP3gzvYzYA+AMtABdHeTVIPkPzE6dW3ZcjsKgtrLxriBX0XhIM5uTlNP
	QoBZfUERzIaptmkjqG9KOeyc6lO6/iZwulCaNCrqo4Irey3iQKVpJsSR+nd2KlMZPNPn
	vhFYSm5LjF9snNiZ2RW0QlBJmzgvRhs7waVquJUUOowIowrDvjU+v94lLhBzqx9WEoZD
	eeKnpPIPVrHs7RQuWMwFpCpvPRQVEny9xXDZIDKAQtK4Yhq3O1xceQiPjaao2Adtuu7Z
	k+pLtVa6vxY+ydSZYnXf2IQtjAVHRZ70Kgpx8Gd5hT7COH9grqiiPKSzw2r0A4th1CNE
	wMAg==
Received: by 10.68.201.6 with SMTP id jw6mr531344pbc.92.1333770282814;
	Fri, 06 Apr 2012 20:44:42 -0700 (PDT)
Received: from [192.168.1.79] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id wo6sm64736pbc.45.2012.04.06.20.44.40
	(version=SSLv3 cipher=OTHER); Fri, 06 Apr 2012 20:44:41 -0700 (PDT)
Message-ID: <4F7FB826.1000504@gmail.com>
Date: Fri, 06 Apr 2012 20:44:38 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120402 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <COL120-W391CDA1CEF0C6CE16540C8DD420@phx.gbl> <, > <, >, ,
	<1332192150.9740.72.camel@ted> <, >, ,
	<COL120-W278115027639B2C6CC9F7BDD420@phx.gbl> <, >, ,
	<EBB81F82C91641E49DD69302B85DB8BF@gmail.com>, ,
	<COL120-W6346678F9768AEFEA35D5EDD420@phx.gbl>, ,
	<B0098CE307294E64ABD9A4F359B2382D@gmail.com>,
	<COL120-W436E890CF0879C1F67450CDD420@phx.gbl>,
	<1332197654.9740.73.camel@ted>
	<COL120-W589EFDCD1837C8DE58A37FDD430@phx.gbl>
In-Reply-To: <COL120-W589EFDCD1837C8DE58A37FDD430@phx.gbl>
X-Enigmail-Version: 1.4
Subject: Re: Linking two recipes
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
X-List-Received-Date: Sat, 07 Apr 2012 03:53:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/20/2012 12:25 PM, simran singh wrote:
> 
> Hello, I was able to have the recipes find each other but I think 
> the problem lies somewhere else as to why the build is failing.But
>  thanks for all the help. Simran

It seems recipeB needs to run some binary from recipeA during its
configure step which tells me that you need a native version of recipeA
so add BBCLASSEXTEND = "native" to recipeA and then in recipeB add
recipeA-native to DEPENDS

- -Khem

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk9/uCYACgkQuwUzVZGdMxR+sgCdEx+b67XQhyH0V9cE6PtRKVk0
JRsAn0x5DBv9wILS1RGl8vw347lUz1uN
=8c5R
-----END PGP SIGNATURE-----


