Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 3108 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Jul 2015 11:48:47 UTC
Received: from mx18-05.smtp.antispamcloud.com (mx18-05.smtp.antispamcloud.com
	[207.244.64.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6DB605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 11:48:47 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1ZJg5P-0007vq-Sb for openembedded-core@lists.openembedded.org;
	Mon, 27 Jul 2015 12:56:58 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 27 Jul 2015 12:56:39 +0200
Message-ID: <55B60E6D.8010708@topic.nl>
Date: Mon, 27 Jul 2015 12:56:45 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1437989436.821.221.camel@linuxfoundation.org>
In-Reply-To: <1437989436.821.221.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtXS/WgqDgJCS36fZcYt9LJrhylzZGDQTZ07zsiT6s6nt3m8vNYY1msxvfbK
	asZRFJY8CVsONrMJuGzuoGnKTKcy2xFkLpfI2GROc/TVFQ1M5w/S+L3ktki0yiouSvOolqeLT0PR
	GeOtHp8CevJaVP3RKAlmn4QY0Xa5w5mR23/WmQwqvMBYMukOyP3wW5yT57cTh6E2XHkoWr32bjya
	7gAvW4NAR0qbrlxNRt9ZoMCfLnY+akJNhL5qAttvzUBLxkQ2a3rCoHjHfcJIyKVF5T5LG2eHru/B
	zfgwTimxhZy/nuLrWedC6pqQQw+IVEM3KmRfQ4GqUWvgp7phkSqv0ZsqmdySlZou9qHIGOZDEEo7
	OyMdMb9bjBpP2U+fB0pr5dMhsfVz6trBKg1q8knCBzevPnb7rI0VfeqD9XJhW9OTh11z/z4WnEoC
	8C13cWABWlhWPxtvTWQlG7LubmSVPcFB6J1fhOzjF0b4LXcjJZ5lorygWaquS4QUc2X9/UmaFDUh
	sTbOm0n23gAH4LW5RBSd12aoSjUKxdXaKO35Ea/DrU+pok6SWPRM754kFPO4pu4=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: unsure
X-Spampanel-Outgoing-Evidence: Combined (0.21)
X-Recommended-Action: accept
Subject: Re: gcc 5.2 failures
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
X-List-Received-Date: Mon, 27 Jul 2015 11:48:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFWow, 5.2? I can't even get the broadcom MIPS kernels to compile us=
ing the=20
current master's 4.9.3 (I'm investigating still whether the kernel or gcc o=
r=20
OE is the problem here).

M.

On 27-07-15 11:30, Richard Purdie wrote:
> I've run a gcc 5.2 test build on the autobuilder:
>
> http://errors.yoctoproject.org/Errors/Search/?items=3D10&query=3D3628c3c0=
6fa4195003ac655bcc791acfac775173&limit=3D50
>
> 41 errors (with a few more pending).
>
> The good news is that if we tweak the security flags, the poky-lsb gcc,
> elfutils, coreutils and iptables issues can be removed and I have a
> patch for this. This leaves:
>
> 3.14 kernel failures for edgerouter, genericx86-64, qemuarm, beaglebone,
> mpc8315e-rdb
>
> openssl issue for p1022ds
>
> u-boot on imx28evk, p1022ds, mpc8315e-rdb
>
> xf86-video-imxfb-vivante on imx6qsabresd
>
> linux-imx issue on imx53qsb
>
> Some kind of "random" qemu runtime issue (4 cases).
>
> At this point I think we likely need to enter bugs into the bugzilla for
> each of these. If we want to switch 1.9 to use this (which I think is
> desirable), we need to get this fixed as a priority.
>
> Bruce: How do you want to handle the 3.14 issues? Switch to 4.1? or fix
> 3.14?
>
> Otavio: The freescale machines are looking unwell, can you help us make
> sure the right people know about this?
>
> Cheers,
>
> Richard
>
>
>
>



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






