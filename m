Return-Path: <prvs=04168bb9d2=mike.looijmans@topicproducts.com>
Received: from mx6-05.smtp.antispamcloud.com (mx6-05.smtp.antispamcloud.com
	[95.211.2.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1E68E7804A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 07:17:11 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx5.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1dnJiy-0003Qm-5B for openembedded-core@lists.openembedded.org;
	Thu, 31 Aug 2017 09:17:12 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 31 Aug 2017 09:17:03 +0200
To: <openembedded-core@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <b9a6e5be-2625-f863-ce71-f949cef1cae3@topic.nl>
Date: Thu, 31 Aug 2017 09:17:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.30)
X-Recommended-Action: accept
X-Filter-ID: PqwsvolAWURa0gwxuN3S5YEa3T7JuZT23fGO2rGt3ZgWMD8gia7lRmdoHJ3n0cm6Vtfp9X1ZBchZ
	wvx8a7dTUQWF0kx98HH3GX+iQK7NiP6LBDMrD7q/cJogwbqzsuokIXMJ1U4MKKnQ5SAJ1V9dkP9x
	bu57BDazLmklZgT7xzYM+jZ7sU/vJ5sjBCbVZ/8eyhJzV2nMPBMBVmVpfr3OVENSMsT8o7QLZ5zg
	/NzYftI8CVsONrMJuGzuoGnKTKcygLJjfy2/hUPxxGqITycuLMdYaphGvYopQ24KJ9kgRDN3pbXn
	aMbbC1QSUBxihEsjBWOBqoptsYkcljagCMIDypReAQCFQo+KUtaSCrVTlxOfVsst/QEVbupaaYfx
	KYRJ8ar4sO9kYmr7/nmchPR9G2DCX9m2p4wUnZpURALMKaPBcC9OMLR/g2nFXNsLRUFidTAD5CT/
	yBXQNtEhbEXVjh6fAFACOy+V+YxtDCnAFa7fLM7Ww0jFUCG51FTiiz6cR64dodD7udB+zcx8OjSt
	1b1YgBvhxKfoFZHs3o0j+S0jv2y8/jlUqm+TeNrMp4+EH0CaKC/aSoSkCquNJllmCZnckpWaLvah
	yBjmQxBKOztbsILhTbeUyfxVdxn9bXHLMaIH54QhUfSSrDv+9VjF360jiD6XqsJZtjQxlyCdsexG
	0gXtdy5bqoOSE/i8cYnokNfMgzvXBR7NkJ1BgB9QX6of5RsuodOJ8HN1vciWiJYr37F2XCbB2TBD
	7gJ8QNcZqBymFCXKyDULH7eaFXybtm39G1itIxesJU7zTm2cc2o0bi3vQ9ekUkTaThhjugDx4MzI
	bjiCxdXbpXgPwfRxKKPWpou2t4TS1kIMz2vXQN8YVgxxWHOlwtB2oqnsuW9DHpt55GmbCafvczSS
	MwpJk+zXGTO9whKumiWhwYKwn6Q=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Running wic on target?
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
X-List-Received-Date: Thu, 31 Aug 2017 07:17:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI noticed that the "wic" recipes appear to focus on the host only.

Would it be possible to run "wic" on target?

For example, it would be really convenient to be able to program the eMMC=20
using wic and auto-expanding the root or data partition to cover the whole =
device.


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




