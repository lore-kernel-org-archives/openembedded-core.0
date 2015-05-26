Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx6-out14.antispamcloud.com (mx6-out14.antispamcloud.com
	[95.211.2.226])
	by mail.openembedded.org (Postfix) with ESMTP id DCDC6737F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 07:03:59 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1Yx8tv-0006iT-9O for openembedded-core@lists.openembedded.org;
	Tue, 26 May 2015 09:03:57 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 26 May 2015 09:04:15 +0200
Message-ID: <55641AD2.6040006@topic.nl>
Date: Tue, 26 May 2015 09:03:46 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <55641868.1080406@topic.nl>
In-Reply-To: <55641868.1080406@topic.nl>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtXS/WgqDgJCS36fZcYt9LJrJtmlGe8uDXaHve2+egwWfL8dwH2pZCeonLks
	FEcu2qM8CVsONrMJuGzuoGnKTKcy2xFkLpfI2GROc/TVFQ1M5w/S+L3ktki0yiouSvOolqeLT0PR
	GeOtHp8CevJaVP3RKAlmn4QY0Xa5w5mR23/WmQwqvMBYMukOyP3wW5yT57cTh6E2XHkoWr32bjya
	7gAvW4NAR0qbrlxNRt9ZoMCfLnY+akJNhL5qAttvzUBLxkQ2a3rCoHjHfcJIyKVF5T5LG2eHru/B
	zfgwTimxhZy/nuLrWedC6pqQQw+IVEM3KmRfQ4GqUWvgp7phkSqv0ZsqmdySlZou9qHIGOZDEEo7
	OyMdMb9bjBpP2U+fB0pr5dMhsfVz6trBKg1q8knCBzevPnb7rI0VfeqD9XJhW9OThywdm+G+OuTB
	a63I3wwHWkCYl0PAtPLuCCRu2JEQGZMQ31MusX2Xci0Z8D9aucAtXl4nN7+GwpCp8XCZQDlq825t
	pbQqVsjuh0JlrWxsIcuBhkb6GDdB6OAsNDDRIxpg15xifUD173ICRv+qGaUPXf0=
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
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Subject: Re: "bitbake -c menuconfig virtual/kernel" fails on ncurses dependency
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
X-List-Received-Date: Tue, 26 May 2015 07:04:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 26-05-15 08:53, Mike Looijmans wrote:
> I get this when running
> bitbake -c menuconfig virtual/kernel
>
> scripts/kconfig/mconf.o: In function `show_help':
> mconf.c:(.text+0x884): undefined reference to `stdscr'
> scripts/kconfig/lxdialog/checklist.o: In function `print_arrows':
> checklist.c:(.text+0x2c): undefined reference to `wmove'
> checklist.c:(.text+0x4c): undefined reference to `acs_map'
> checklist.c:(.text+0x54): undefined reference to `waddch'
> checklist.c:(.text+0x66): undefined reference to `waddnstr'
> checklist.c:(.text+0x76): undefined reference to `wmove'
>
> A bit of googling reveals that this is probably due to "ncurses" not bein=
g
> present.
>
> I just can't figure out what the proper syntax for this dependency would =
be.
> menuconfig needs the "native" version, so it's not simply DEPENDS+=3Dncur=
ses here.

Hmm strange, "kernel.bbclass" inherits "cml1.bbclass", which already states=
:
do_menuconfig[depends] +=3D "ncurses-native:do_populate_sysroot"

And ncurses-native has indeed been built. But menuconfig still fails to lin=
k.



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






