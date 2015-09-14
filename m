Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 9293 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 Sep 2015 11:42:14 UTC
Received: from mx6-14.smtp.antispamcloud.com (mx6-14.smtp.antispamcloud.com
	[95.211.2.226])
	by mail.openembedded.org (Postfix) with ESMTP id B2C1273CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 11:42:14 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1ZbPj7-0006lS-J2; Mon, 14 Sep 2015 11:07:19 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 14 Sep 2015 11:06:27 +0200
Message-ID: <55F68E36.1020904@topic.nl>
Date: Mon, 14 Sep 2015 11:07:02 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <rongqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1442215997-24116-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1442215997-24116-1-git-send-email-rongqing.li@windriver.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarwz/JranuFG7WjVrudach2Mbql9V0UyRhY0gQ3A2Tj6ghEOeIoF9IAWOyYoSBw4zOJzdu
	eNnf2+7fZR5g0PMoex2gXhaAqQU2X/7w/twqlH6drAYFlMEm685+7MdKnBgxXEOeXmhDDkeFXPCt
	uM7U852V7M5yO2lcQdwCvR3etp4cqb5owzVwh2tLSAneXpL2G2bjO41FyBEqIaDudcVplPF/LmA2
	yXofPpu9UTTjJcgKoF6RdQbaL0aq6N3+IND68ZrH+sc8EjLuqCrc7WMgoj+Z3JKVmi72ocgY5kMQ
	Sjs7FfgNUKRAYCE2OIhkjrd3UxBlNuVQYCKBDREGm3Gz+6tynbBHKmj8PpjpHk0omGLE0z6bhalF
	EM/pjPCQA+BAlihTEzuhH4RXLgA+yrbzj5V7Zn6OGQcTLcl+10S2CCSFw5t/JJNzDYCqHXGiQWAF
	IavC0PSzboMv15NgMxO5GJBWBb39uS1TjWG2Inx+Ts2QCgay2O3PHOrAPSCfPk8Za9PHVX1uQF7e
	I6fa8+SQSXLBkQqJW+epIaGr0Ul6Vjri8M2oUrr42YKjVVGTpbenSWltkIEyb31pMCMMB0fkaiWa
	gvPXpcm8chwrA+CzbjkhUu/lltGsdqZhncgWCORTp/v2EwFMyChA4XSUAxJsdi13KLwbXHjHpxz8
	VOWtxaqRXMZCrFUeI14mn3kw3+LRTg==
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJXhXyDRoOQM5J3kcUr0HrMvJUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: unsure
X-Spampanel-Outgoing-Evidence: Combined (0.12)
X-Recommended-Action: accept
Subject: Re: [PATCH] quashfs-tools: make it be able to be compiled by gcc5 with "-O0"
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
X-List-Received-Date: Mon, 14 Sep 2015 11:42:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFTypo: "(s)quashfs"



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






