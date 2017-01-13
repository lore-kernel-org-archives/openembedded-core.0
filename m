Return-Path: <prvs=0186a4dae7=mike.looijmans@topicproducts.com>
X-Greylist: delayed 5071 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 13 Jan 2017 09:50:58 UTC
Received: from mx6-09.smtp.antispamcloud.com (mx6-09.smtp.antispamcloud.com
	[95.211.2.200])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3B56FF80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 09:50:58 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1cRxBj-0002Ua-Qe for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2017 09:26:23 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 13 Jan 2017 09:26:18 +0100
To: OE-core <openembedded-core@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <6d93383f-2dfe-e3ea-d9ae-c25919f236d5@topic.nl>
Date: Fri, 13 Jan 2017 09:26:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
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
X-SpamExperts-Outgoing-Evidence: Combined (0.28)
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNA8a
	WsnlKLcRmV1lVnz/fjxjM0y/WcWr0R3RMXTbejcayqwJVe4RkcXIFXAMlxmmJGbjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAAdpU0oUDqng6Dyy2mQeofiWY6NKlqecEiE5yVHbZdrEt1el35jO+WJBgrWGjAavfuifnL+9wg
	oTj4ygNPw1XfN1IUJ2+rCMPpQhII5VkEVC//8GRISD+lYCwA5l6/Q4nfg8y63jKKBrO1BroJmvb9
	eW6r2rlUSNsSKfXWKXbAnTtpwWXpE+sdjNmnXWjiNaLzU4EFnW2XgX+M1ZN6UZmlFVODLzPsd/iT
	v744WiqgNunTiEw2ui8TVPldBCj8jBATaV0f1JQTj5AK4Kl1rn2kX7xCh4uqVodKdv1rgD9r0i+u
	FNKu9VJ1rLap0blNKeOv2YI5PogHEGUWoL6eStEYApwKXoD4iJBsNfB/QPOzo3NC59y3EFXUwBcT
	DQ0nlghOTckC4oN5XN7BzTWQhrf/s2FXG+RlRk606220Tay5bvowkOgRglJOpXrCHulns4cnitzI
	/N0Yci5ag97FkmIyM9BqLkXGaznuCfaQ1w/JpOE=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
X-Recommended-Action: accept
Subject: [morty] Please include the binutils-2.27 alignment frags for aarch64
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
X-List-Received-Date: Fri, 13 Jan 2017 09:50:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFCould this oe-core master commit be included in the "morty" branch=
 please:
f6f87019073d4f3caa7766aca89faa6781690fba "binutils-2.27.inc: Fix alignment=
=20
frags for aarch64"

Without this patch, arm-trusted-firmware (apparently a requirement to get=20
arm64 machines to boot these days) fails to build in the morty branch.


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






