Return-Path: <prvs=032210ad29=mike.looijmans@topicproducts.com>
X-Greylist: delayed 416 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 May 2017 06:03:40 UTC
Received: from mx18-11.smtp.antispamcloud.com (mx18-11.smtp.antispamcloud.com
	[207.244.64.180])
	by mail.openembedded.org (Postfix) with ESMTP id EB45F71A92
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 06:03:40 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1dFDmG-0004ZR-9U; Mon, 29 May 2017 08:03:42 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 May 2017 08:03:37 +0200
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <16ea8913-19d8-a67a-601a-98cad6657d58@topic.nl>
	<CAP71WjyNaSFd3Aw5WD9=aKkopAWaofR5b6TUbthzBSusLx45JQ@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <f9eecc58-44f5-64d8-c77f-c5629cca98c5@topic.nl>
Date: Mon, 29 May 2017 08:03:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAP71WjyNaSFd3Aw5WD9=aKkopAWaofR5b6TUbthzBSusLx45JQ@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.13)
X-Recommended-Action: accept
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNOEK
	NrYQW57WsYxjRA1Ux1GhGf1rwYL/aSvk8yX+WbqQVFDf11BDUksFLMtNheI4l2bjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAANeo6Hr4UJMIZEVOGlXeApA3I626B4k1VCg2pmPRu/tu4nyga8lW9tEVMYitDM7+yhMjnTQYb
	91c8o8sXyIHYib3upx1n/FUf/NwbTI+uRoXlWvXEyVXmV1DcCGMoc6ig/SVaKi0jvtxxX4zA29pu
	2ONYQFX+rhdRbxagFZk9QeUTMKkbMlXz2JUArHA+14sz3sbskoLsCzHbimU89cr33RKm353ztx8x
	waw1cKnsBGxm83Bq3Dr745Bh95etgupgGplHcpVCCoX989hgB8R+yFNe0necuBmgAaEH47pnSozS
	cx6dixYXWS0UC4sPAz0+bt/Gv4WE4ys5zo3LXTadBldVG3udxDVjJl88/rWN0QJAZs8O0qGELL5L
	HSCgBqXfiEc3YcCUDBl3OGV65ZQULuQ0Yt6sBXejfJJliPYr+dkd1etKa5Nq/q2DHPZtUu0QwVHj
	pxmv0LFZXDVo/Kt/6gVmJtP3Y/gn5Y6P8W6FvYevIHo77OZsQVM4N41Tn9775j98TA7MKskOpkOl
	8Lxi7FIIPDyod71wDzAkT5SU3Vo=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 29 May 2017 06:03:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 24-05-17 15:12, Nicolas Dechesne wrote:
> On Wed, May 24, 2017 at 2:58 PM, Mike Looijmans <mike.looijmans@topic.nl>=
 wrote:
>>
>> I was wondering if there were better ways than handcrafting shell script=
s to
>> do this on a headless embedded board?
>>
>>
>>
>> If I put wpa-conf into /etc/network/interfaces it works, but blocks boot=
ing
>> for a long time if the wifi isn't there.
>>
>>
>> I've been using ifplugd combined with wired ethernet, and this also work=
s
>> fine with wireless. Once wpa-supplicant connects to an access point, the
>> link reports up and DCHP can start.
>>
>>
>> Starting wpa_supplicant from the commandline runs fine:
>>
>> /usr/sbin/wpa_supplicant -B -P /var/run/wpa_supplicant.wlan0.pid -i wlan=
0 -c
>> /etc/wpa_topic.conf -D
>>
>> However, putting this line into a startup script (/etc/rc5.d/...) hangs.=
 It
>> doesn't matter whether I start early or late, the wpa_supplicant just ha=
ngs
>> and waits and doesn't fork into daemon mode like it should. Tried settin=
g
>> PATH and redirecting input, invoking through start-stop-daemon, but that
>> didn't help.
>>
>> Appending an ampersand to the command makes the boot continue, but
>> wpa_supplicant doesn't work, it won't connect to the access point.
>=20
> my 2 cents..
>=20
> after going back and forth for some time, I am now always using
> network-manager.. it has very handy command line utilities (nmcli and
> nmtui) and is well integrated with systemd. that happens to work well
> for me.

Apparently not for headless systems, networkmanager requires X11:

ERROR: Nothing PROVIDES 'consolekit' (but=20
.../meta-oe/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.=
12.bb=20
DEPENDS on or otherwise requires it)
ERROR: consolekit was skipped: missing required distro feature 'x11' (not i=
n=20
DISTRO_FEATURES)


> i want to believe that connman can do the same thing, but i have never
> tried it much..

I'll try that next...



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


