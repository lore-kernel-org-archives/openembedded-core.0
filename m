Return-Path: <prvs=02088e3d23=mike.looijmans@topicproducts.com>
X-Greylist: delayed 21752 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 04 Feb 2017 16:11:02 UTC
Received: from mx36-44.antispamcloud.com (mx36-44.antispamcloud.com
	[209.126.121.60])
	by mail.openembedded.org (Postfix) with ESMTP id 056E271AEB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Feb 2017 16:11:02 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx36.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1cZxGe-00072z-9T for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2017 11:08:30 +0100
Received: from [192.168.1.16] (85.150.144.104) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Sat, 4 Feb 2017 11:08:26 +0100
To: <openembedded-core@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <5895A819.8040509@topic.nl>
Date: Sat, 4 Feb 2017 11:08:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
X-Originating-IP: [85.150.144.104]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.20)
X-Recommended-Action: accept
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNC91
	O2BIc2ZJ7L5OntTyOTle3900U+ejMobX1EZ4lCjwnnzfTPuy4s9x0eTS2g7qGWbjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAAdpU0oUDqng6Dyy2mQeofiS4plulAd3qNwr6ITBIQU5d1el35jO+WJBgrWGjAavfuifnL+9wg
	oTj4ygNPw1XfN1IUJ2+rCMPpQhII5VkEVC//8GRISD+lYCwA5l6/Q4nfg8y63jKKBrO1BroJmvb9
	eZRnLIdgZtx/lY6Q73k96YmRVYKU9W9tbmVXJBqdHHDml2fQHaY9hVoT9jGvxqBU4l5OTHLiyLVU
	tMfloK+xuF/fUy6xfZdyLRnwP1q5wC1emDtv5qqTm+0PNEnl8p4HBOnBF7yvwYFBB4MFvzGTb06O
	85visHicU23+oLv+brtHInHPhNiH3NSHpRQdFLiVVNV0df1+ARMcUlNXLVWxy/18BrHvkSsNm9Qm
	kmrg2CBrlprCg1eH/Nhc39gnrWGZIOjSHqi4TwDPnU4RpokTHNsyBvL+tplTPyhmTMTBUOIau/fY
	R4iefv4jBsZ1VxeGPej0D/QhvoUyXPeeSa3l2Hs=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: [morty] Python cyclic dependencies
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
X-List-Received-Date: Sat, 04 Feb 2017 16:11:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFIn the do_rootfs log, I found these messages:

Breaking circular dependency on python-core for libz1.
Breaking circular dependency on python-core for python-lang.
Breaking circular dependency on python-core for libz1.
Breaking circular dependency on python-core for python-lang.
Breaking circular dependency on python-core for python-re.
Breaking circular dependency on python-core for python-re.

Looking at the Python recipes, the package information for Python seems=20
wrong indeed, in python-2.7-manifest.inc:

RDEPENDS_${PN}-re=3D"${PN}-core"
RDEPENDS_${PN}-lang=3D"${PN}-core"
RDEPENDS_${PN}-core=3D"${PN}-lang ${PN}-re"

And this is what creates that cycle. Either core depends on lang, or=20
vice versa, but not both (or they should simply be one and the same package=
)

I'd be happy to provide a patch either way...


--=20
Mike Looijmans


Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






