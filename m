Return-Path: <prvs=045169b0da=mike.looijmans@topicproducts.com>
Received: from mx36-out12.antispamcloud.com (mx36-out12.antispamcloud.com
	[209.126.121.60])
	by mail.openembedded.org (Postfix) with ESMTP id 3FAC177F85
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 14:49:35 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx19.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1e07Su-0002h5-Ti for openembedded-core@lists.openembedded.org;
	Thu, 05 Oct 2017 16:49:36 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Oct 2017 16:49:28 +0200
To: <openembedded-core@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <8b6c437e-c5b6-d242-5e1c-b19406153c76@topic.nl>
Date: Thu, 5 Oct 2017 16:49:28 +0200
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
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.09)
X-Recommended-Action: accept
X-Filter-ID: EX5BVjFpneJeBchSMxfU5l7RZG3Uw5vSKTw/Zx1Mq9kXv9krsgRhBn0ayn6qsUc7bT9yB6+5kUQX
	UPqxCpKoZ5jW+r1f/TnG1eQk5gcAU2WhbUpxw1vG9PXf7FQITIU+5y52g9tkUN1gyfQJCkGsPFpr
	jQPFk8m4tSTfORUp3ym5u2cOM36kSfHLUNZ8jXlTlpkp8lcBwdj1nW72qmYnhk6MzMc1fDmFYhRo
	7i9WJP5mbN3yE6VLW+O3vV6S7uAIDD99ZlIsNfiocclhkIZyCGjioP69xCSqetMX+Tub+tlh+q6J
	LTjskgR575u7xBF9hR7TYzdcZcyGV4sMr3jbmlhuJD+Y8aK1TyNciD6O03XTF30yCBdC0hoGIYfN
	AfQYf1exmkjWatqTdEex9V99jq6OzRuRTJwMfmIg2Nif3MxrBz0V0g4dFqQD34faMjgG1QvB/+yF
	uaiuWkOJt9O67X0L6e4zOli0rnG7yFLXzFow01W+NjrLbEwlXeN/SGGsLrdRfTGQ/ER6YFMqAKA1
	uuidX4Ts4xdG+C13IyWeZaJlAy8FU/wcJ5JtAUu50klfjzMVFIf3P+0IJqUbiG872h7xteQEmGaV
	W1mnJSWy6AuNgs8oYZ5lsqYsWCts9e//Ca1bA7EWj1UdpyT2OFucbhHs8hFved+TJQDB7m48G5wy
	ib2YE5CQCxqaNpZCFyWPoUMKiAE1LoIP8/8PHVIU4dU7sbKGfaun//Cs8l49htwccBIk1Sag4dKi
	qCrF8eZZ1QHMcEeBpH8yvscxmKl4od5A5psCwEHlRDIvt/V1ctXmZ4ldddW8AQ13MCJzaGFMOmG6
	/54gza7q5Za0AFsz6MnV7t/5I5IUYXUcyaqJvqWePPfahHwp+39ee3Z+Hn10kVWClPVvbW5lVyQa
	nRxw5oyYMyos1aE7d9BPogpXu4GPi179JfUwTJS+PZhsciKe
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Recipe versions and layer confusion
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
X-List-Received-Date: Thu, 05 Oct 2017 14:49:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI'm confused.

Layer "meta-xilinx" defines:

recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.1.bb

This recipe is too old for my liking, so I made a newer one in "meta-topic"

recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.3.bb


Much to my surprise, when I build, OE picks the 2017.1 version and not the=
=20
2017.3 version.

bitbake-layers show-layers reveils:
..
meta-xilinx           /home/mike/projects/zynq-platform/meta-xilinx  5
meta-topic            /home/mike/projects/zynq-platform/meta-topic  6
..

so that means that my meta-topic should win even if my PV were lower, right=
?


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


Visit us at the Space Tech Expo Europe (Stand E-71)

