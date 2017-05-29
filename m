Return-Path: <prvs=032210ad29=mike.looijmans@topicproducts.com>
Received: from mx18-11.smtp.antispamcloud.com (mx18-11.smtp.antispamcloud.com
	[207.244.64.180])
	by mail.openembedded.org (Postfix) with ESMTP id E338F77FF1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 07:23:07 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1dFF13-0001Oo-NS for openembedded-core@lists.openembedded.org;
	Mon, 29 May 2017 09:23:05 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 May 2017 09:22:59 +0200
To: <openembedded-core@lists.openembedded.org>
References: <16ea8913-19d8-a67a-601a-98cad6657d58@topic.nl>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <a4e00554-74e0-41fb-bab5-5e40b444996a@topic.nl>
Date: Mon, 29 May 2017 09:22:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <16ea8913-19d8-a67a-601a-98cad6657d58@topic.nl>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.33)
X-Recommended-Action: accept
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNPBO
	dKLtLZEISGEZJLfHvhFVNIcKwZ4bNPojwI3ttsLCfDuQuhNm73bGCBJodue6FWbjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAANeo6Hr4UJMIZEVOGlXeApA3I626B4k1VCg2pmPRu/tteKBTpmz1xriKWz9HSWSgIcr47c+5/
	Q7Jp+ogF0zTpVb3upx1n/FUf/NwbTI+uRoXlWvXEyVXmV1DcCGMoc6ig/SVaKi0jvtxxX4zA29pu
	2ONYQFX+rhdRbxagFZk9QeUTMKkbMlXz2JUArHA+14sz3sbskoLsCzHbimU89cr33RKm353ztx8x
	waw1cKnsBGxm83Bq3Dr745Bh95etgupgGplHcpVCCoX989hgB8R+yFNe0necuBmgAaEH47pnSozS
	cx6dixYXWS0UC4sPAz0+pXCKotiid4fT6FgTzhNGF1dVG3udxDVjJl88/rWN0QJAZs8O0qGELL5L
	HSCgBqXfiEc3YcCUDBl3OGV65ZQULuQ0Yt6sBXejfJJliPYr+dmGNpsP5B714wOkUOWbsS00ryB6
	O+zmbEFTODeNU5/e++Y/fEwOzCrJDqZDpfC8Yuw1NVZrM7RWs640mZ+ZecaD
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Re: What's the "proper" way to start WiFi networking?
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
X-List-Received-Date: Mon, 29 May 2017 07:23:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 24-05-17 14:58, Mike Looijmans wrote:
> For boards that offer WiFi, I'd want them to connect more or less automat=
ically.
>=20
> I was wondering if there were better ways than handcrafting shell scripts=
 to=20
> do this on a headless embedded board?
>=20
>=20
>=20
> If I put wpa-conf into /etc/network/interfaces it works, but blocks booti=
ng=20
> for a long time if the wifi isn't there.
>=20
>=20
> I've been using ifplugd combined with wired ethernet, and this also works=
 fine=20
> with wireless. Once wpa-supplicant connects to an access point, the link=
=20
> reports up and DCHP can start.
>=20
>=20
> Starting wpa_supplicant from the commandline runs fine:
>=20
> /usr/sbin/wpa_supplicant -B -P /var/run/wpa_supplicant.wlan0.pid -i wlan0=
 -c=20
> /etc/wpa_topic.conf -D
>=20
> However, putting this line into a startup script (/etc/rc5.d/...) hangs. =
It=20
> doesn't matter whether I start early or late, the wpa_supplicant just han=
gs=20
> and waits and doesn't fork into daemon mode like it should. Tried setting=
 PATH=20
> and redirecting input, invoking through start-stop-daemon, but that didn'=
t help.

Found this issue, apparently the interface is down and wpa_supplicant waits=
=20
for it.

Adding "ifconfig wlan0 up" prior to wpa_supplicant prevents that hangup.

>=20
> Appending an ampersand to the command makes the boot continue, but=20
> wpa_supplicant doesn't work, it won't connect to the access point.
>=20

This problem remains however. Starting interactively works fine, starting f=
rom=20
any form of shell script at boot makes it start up fine but it doesn't=20
connect. Starting up "wpa_cli" interactively to diagnose what's going on, b=
ut=20
not actually typing any command, usually makes it connect all of a sudden.


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


