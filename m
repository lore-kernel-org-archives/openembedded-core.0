Return-Path: <prvs=0126027f72=mike.looijmans@topicproducts.com>
X-Greylist: delayed 951 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 Nov 2016 15:39:00 UTC
Received: from mx26-02.smtp.antispamcloud.com (mx26-02.smtp.antispamcloud.com
	[148.251.71.2])
	by mail.openembedded.org (Postfix) with ESMTP id 60D5460269
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 15:39:00 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx26.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1c6J67-0003sk-Je for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2016 16:23:07 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 14 Nov 2016 16:23:02 +0100
To: OE-core <openembedded-core@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <95b4383a-727c-a022-9a9a-5398c7dabf36@topic.nl>
Date: Mon, 14 Nov 2016 16:23:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtWU2yOX8PQJGjCrFTzGoLEGAwQOxc4FVEmxDKJstwBd0bZhgxO93tBuRnz1
	2oZKBUcccBIk1Sag4dKiqCrF8eZZlyTbTpSJSkzczSD2RcFt/e/6EUxK+1ThVeXBHjTgRxvXcWpW
	rY6lCH8L7CDV11D5JM7Xk65yci5j+xTRr7HgZJNWyY7q5BA/5iDO7tJWc5LW0A0HkzG7uPVDzc3F
	/UDJomVIDsS/itDc6L24kzSY8UBJuULIpDl323znR+D07qQWgmfZjarUMmGH47dIAOWiRBdQ80wr
	wyng3wNtDYr6IWSdEOMftBjsWb6BDQzjSsEw7+KMtoemwN8keIAcPKMB1JWPW1ubUBpCfn6LoGhW
	5JLDrkU04HNuE4ewywcImK0sQtRW99BWXFE0qdJnkA57UMZvCBNmhVTX9MJal8urfK0jiD6XqsJZ
	tjQxlyCdsewyK2B4yIHFlEAKh+Am6pqpGWO4wGoVBa5uuCaFQPSDyFUGXEqeSRtBFSfro95dU95R
	bJFIA5gJVfyuxDRMraMz
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.19)
X-Classification: unsure/combined
X-Recommended-Action: accept
Subject: Creating 'wic' image
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
X-List-Received-Date: Mon, 14 Nov 2016 15:39:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFIn order to make life easier for people, I was looking into creati=
ng images=20
with the "wic" tool.

There's just one big piece of documentation lacking: What's the format it=20
wants my rootfs and boot files?
http://www.yoctoproject.org/docs/2.2/mega-manual/mega-manual.html

Basically I want an SD card with a FAT boot partition and an ext4 rootfs, a=
nd=20
"sdimage-bootpart" is pretty close to that.

Without "wic", I build a tar of the rootfs and copy the boot files using a =
bit=20
of shell scripting.

Adding "wic" to IMAGE_FSTYPES just results in an error that I should set=20
WKS_FILE but I have no clue as to what file that should point to.

Running wic manually just results in more missing variables that I can't fi=
nd=20
what to specify in them...


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






