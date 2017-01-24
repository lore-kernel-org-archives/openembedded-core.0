Return-Path: <prvs=019708acf4=mike.looijmans@topicproducts.com>
X-Greylist: delayed 3164 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Jan 2017 09:49:10 UTC
Received: from mx5-04.smtp.antispamcloud.com (mx5-04.smtp.antispamcloud.com
	[95.211.112.140])
	by mail.openembedded.org (Postfix) with ESMTP id 68B8977202
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 09:49:10 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx5.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1cVwtm-00064F-Lz for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2017 09:56:19 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 24 Jan 2017 09:56:17 +0100
To: <openembedded-core@lists.openembedded.org>
References: <CAPLgG=muXdcmCcFCC7NY8Zk9ANH5yf616T5b9Bc31OCJq=AD3w@mail.gmail.com>
	<20170123103403.GA15174@linux.intel.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <25cca98b-9e19-36b7-c53f-5ed79eeb5a91@topic.nl>
Date: Tue, 24 Jan 2017 09:56:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170123103403.GA15174@linux.intel.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.14)
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNPAb
	Ir5YXumFW2NvP9K1ruVzCDuFIl4Zu7hGXkOFyZoWDPm0LJzo3Ipss+vTa5o+vGbjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAAdpU0oUDqng6Dyy2mQeofifasUOopIrGRQ5xj0xNElph1el35jO+WJBgrWGjAavfuifnL+9wg
	oTj4ygNPw1XfN1IUJ2+rCMPpQhII5VkEVC//8GRISD+lYCwA5l6/Q4nfg8y63jKKBrO1BroJmvb9
	eS8/gEZbIQzNpzl9FXiGPzJpwWXpE+sdjNmnXWjiNaLzU4EFnW2XgX+M1ZN6UZmlFVODLzPsd/iT
	v744WiqgNunTiEw2ui8TVPldBCj8jBATWTBGqdJt0f5T8QbPnFgP6qI5l+bukEPAN7a+1bvsjney
	JfCBJ0OUhklcFy42x8r4TGNEHIeqEJHEXRcDdYgtoPFSqLjY6w6DP6U9VKa5TZ6Gs9HjdrlYbXkZ
	KU5GQmOJ6T38BJSNojNDpUW6fi2LX8Ch2g29BrFOGmEPaSrs1N1yAcBOUUaSDIlw73N6aFOq2O7e
	xZs3WniBPxy5Jg8b6QDuUevekYUa3+GyU0mcIF0=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
X-Recommended-Action: accept
Subject: Re: How to use WIC to generate raw flash images
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
X-List-Received-Date: Tue, 24 Jan 2017 09:49:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 23-01-17 11:34, Ed Bartosh wrote:
...
>> - How do I set padding to be 0xFF instead of 0x00?
> The same thing here. Currently wic images are sparse files created by
> os.ftruncate, but it's not a big deal to fill them with 0xFF

Correct me if I'm wrong here...
- All flash media (NOR, NAND) prefers padding with 0xFF because that's equa=
l=20
to an erased sector.
- Other media (magnetic disks) don't care about what they're padded with.

So I'd say it makes sense to make 0xFF the default padding for exerything?



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






