Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx6-14.smtp.antispamcloud.com (mx6-14.smtp.antispamcloud.com
	[95.211.2.226])
	by mail.openembedded.org (Postfix) with ESMTP id 0DBD365D6E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 09:34:29 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1Zj29s-0000zl-EP for openembedded-core@lists.openembedded.org;
	Mon, 05 Oct 2015 11:34:28 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 5 Oct 2015 11:33:22 +0200
To: OE-core <openembedded-core@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <56124413.7020901@topic.nl>
Date: Mon, 5 Oct 2015 11:34:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtXS/WgqDgJCS36fZcYt9LJrFDKWPU/basrwgND+6zAvVgnvU9Kkp7pPdVtG
	+2FfnXc8CVsONrMJuGzuoGnKTKcy2xFkLpfI2GROc/TVFQ1M5w/S+L3ktki0yiouSvOolqeLT0PR
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
X-Spampanel-Outgoing-Class: unsure
X-Spampanel-Outgoing-Evidence: Combined (0.44)
X-Recommended-Action: accept
Subject: How to find out why my do_compile depends on $MACHINE
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
X-List-Received-Date: Mon, 05 Oct 2015 09:34:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI've been puzzling with this for many hours now, but I can't seem =
to figure=20
this out.

I have a recipe that doesn't mention MACHINE anywhere, but still the=20
sstate-cache won't be re-used for other machines, because OE somehow insist=
s=20
the package does depend on $MACHINE.

The workaround I could find is to put something like this in the recipe:

MACHINE[vardepvalue] =3D "any"

(Similar stupid hacks like "vardepsexclude" will probably work too, but I'm=
=20
not interested in forcing this particular recipe, but I'm trying to figure =
out=20
what makes bitbake think it matters)

Since it builds for an FPGA type, the package has=20
PACKAGE_ARCH=3D"${FPGA_FAMILY}" set, and FGPA_FAMILY is set in local.conf.


When switching machines, "bitbake -S printdiff fpga-image-dyplo-test" repor=
ts=20
that MACHINE changed and that is what caused sstate not beign reused. But t=
he=20
recipe does not use anything related to $MACHINE at all.

Is there a way to make it tell me WHY it thinks that MACHINE is important t=
o=20
the recipe?


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






