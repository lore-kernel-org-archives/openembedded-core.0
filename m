Return-Path: <prvs=0317a3964b=mike.looijmans@topicproducts.com>
Received: from mx5-04.smtp.antispamcloud.com (mx5-04.smtp.antispamcloud.com
	[95.211.112.140])
	by mail.openembedded.org (Postfix) with ESMTP id 05CA8780C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 12:58:51 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx5.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1dDVsA-0007QL-J8 for openembedded-core@lists.openembedded.org;
	Wed, 24 May 2017 14:58:48 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 May 2017 14:58:40 +0200
To: <openembedded-core@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <16ea8913-19d8-a67a-601a-98cad6657d58@topic.nl>
Date: Wed, 24 May 2017 14:58:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
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
X-SpamExperts-Outgoing-Evidence: Combined (0.37)
X-Recommended-Action: accept
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNLaw
	485BtmosFMvCqal/QO0htt9CHmzuKHAweWDTwzwqHZAbppwxlk1uuJH566qLBGbjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAANeo6Hr4UJMIZEVOGlXeApA3I626B4k1VCg2pmPRu/tud8JYXs8ka69DsEJfXRUY5BBuJq/bB
	JqpdyZxrxsLOFL3upx1n/FUf/NwbTI+uRoXlWvXEyVXmV1DcCGMoc6ig/SVaKi0jvtxxX4zA29pu
	2ONYQFX+rhdRbxagFZk9QeU7sEKSfUWHty4XO0JvVoTKUz0sPgnpAk2KA2vJwMd1uVp/3TgIM4oj
	TBFr687rGjvg8i1EWhZgcWEg+htcON1+aIfVaCHpEB6cFH6WJxE4Zs5mbpFFk0cqJJSclmrLqtls
	116aTDs833MeJV30f/JZTYTLXPPqn30aSwSPCvFcphFMyLWU2atJ3T6oYWHm47FfucNbjTxIOR91
	bxck2vvLx45W6h2ctW+V1+EyMGTLxVItpNmHURF6jYEBDsakSw+nkEtQiy/nZPcgJ/iK0jlvN254
	2d/b7t9lHmDQ8yh7HaBeFoCpBTZf/vD+3CqUfp0dTB6Vlhm+OuzFuRWfaUgf
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: What's the "proper" way to start WiFi networking?
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
X-List-Received-Date: Wed, 24 May 2017 12:58:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFFor boards that offer WiFi, I'd want them to connect more or less =
automatically.

I was wondering if there were better ways than handcrafting shell scripts t=
o=20
do this on a headless embedded board?



If I put wpa-conf into /etc/network/interfaces it works, but blocks booting=
=20
for a long time if the wifi isn't there.


I've been using ifplugd combined with wired ethernet, and this also works f=
ine=20
with wireless. Once wpa-supplicant connects to an access point, the link=20
reports up and DCHP can start.


Starting wpa_supplicant from the commandline runs fine:

/usr/sbin/wpa_supplicant -B -P /var/run/wpa_supplicant.wlan0.pid -i wlan0 -=
c=20
/etc/wpa_topic.conf -D

However, putting this line into a startup script (/etc/rc5.d/...) hangs. It=
=20
doesn't matter whether I start early or late, the wpa_supplicant just hangs=
=20
and waits and doesn't fork into daemon mode like it should. Tried setting P=
ATH=20
and redirecting input, invoking through start-stop-daemon, but that didn't =
help.

Appending an ampersand to the command makes the boot continue, but=20
wpa_supplicant doesn't work, it won't connect to the access point.




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



Join our presentation at Electronics & Applications 2017:
FPGA for real-time data processing, subject =E2=80=9CHardware platform for =
industrial ultrasound steel plate Inspection=E2=80=9D Topic Embedded System=
s - Herman Kuster, 1st June 10 AM

Visit http://eabeurs.nl/author/612884/ for more information


