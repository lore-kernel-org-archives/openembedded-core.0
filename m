Return-Path: <prvs=03027b71a8=mike.looijmans@topicproducts.com>
X-Greylist: delayed 1740 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 May 2017 11:46:40 UTC
Received: from mx5-04.smtp.antispamcloud.com (mx5-04.smtp.antispamcloud.com
	[95.211.112.140])
	by mail.openembedded.org (Postfix) with ESMTP id BB0A9601D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 11:46:40 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx5.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1d8398-0005tb-2z; Tue, 09 May 2017 13:17:39 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 May 2017 13:17:36 +0200
To: Alex J Lennon <ajlennon@dynamicdevices.co.uk>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
	<19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
	<be95c443-df9a-2c9a-394b-4b02c8710fdc@linux.intel.com>
	<931ee9bc-a5cb-fcc2-278b-20a07731524d@dynamicdevices.co.uk>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <9797fef2-fbec-2c90-aeb1-6af3f6c6e872@topic.nl>
Date: Tue, 9 May 2017 13:17:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <931ee9bc-a5cb-fcc2-278b-20a07731524d@dynamicdevices.co.uk>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.04)
X-Recommended-Action: accept
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNNn9
	LhPPIi0ypM2ge3Yu7Cv69sjEWyk4vRF+vWqM7NxoDtR/uP9bQ5OkftjMyOwihGbjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAANeo6Hr4UJMIZEVOGlXeApA3I626B4k1VCg2pmPRu/ts3ecKi5EKZCMssQlII7x2c97BGTJrx
	4C8BwCS2BVEwlL3upx1n/FUf/NwbTI+uRoXlWvXEyVXmV1DcCGMoc6ig/SVaKi0jvtxxX4zA29pu
	2ONYQFX+rhdRbxagFZk9QeU7sEKSfUWHty4XO0JvVoTKUz0sPgnpAk2KA2vJwMd1uVp/3TgIM4oj
	TBFr687rGjvGLWY+MgHYxfRtKtuAsj1l++DuIQUs/5JJj4C/n4CILo0QSzGNvD+RngRrZomAbi+I
	zFFbdmFRdTAoG6SY1sg8lojo5GHljHjgfMGosEgAyTQB58XtL2OmUgcwtsJrsd9thWJcDArBQLlQ
	+zm4f1mvd1VPQgOyF0VU5Apg2BGZWSIpkk35MI9DVHxM/A6I+CNS1Nm6pU9u31tgNDkS3Qq/R1+9
	aoDA/mNiPKpJYUKtLTZXPpdyX61x7CIxR1L10qle3o0H/nKqsejvGSuYtCPX+amuZtD/P1OB/Eee
	XCZHa74WGRgNu2VOWvP88pa4rWdmraJGWVbN0zdCh+St1HowDNDT1fCR6/ycarktyDip8z7uHMR7
	LB7NDR0Uo7QTLRHEXBJQSj18P7PHF7+bvoivFHi62c+876oxtBi6kxxY9w==
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: GUI based images
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
X-List-Received-Date: Tue, 09 May 2017 11:46:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 09-05-17 10:44, Alex J Lennon wrote:
>
>
> On 09/05/17 09:05, Alexander Kanavin wrote:
>> On 05/09/2017 01:15 AM, Paul Eggleton wrote:
>>>> LXDE in particular is Gtk2 based, it's no longer being developed, and
>>>> has been superseded by LXQt. So it's a non-starter (and so is LXQt,
>>>> which should be clear from its name :).
>>>
>>> FWIW I think this is a little short-sighted. Why are we ruling out Qt e=
xactly?
>>
>> We would first have to agree that Qt5 belongs in oe-core with appropriat=
e
>> level of maintenance and QA, and that it's okay to add half an hour or m=
ore
>> to the building time of a standard GUI image.
>>
>> From the screenshots of LxQT, it looks like yet another Win95 clone mean=
t
>> strictly for desktop use that would certainly scale poorly to small
>> resolution screens. Who would be the target audience for it in the embed=
ded
>> space? For the purposes of 'engineering UI', Sato is fine, and we don't =
need
>> something else.
>>
>> Alex
>
> fwiw. I would love to be able to develop devices like those pictured belo=
w,
> which I believe are based on Qt for Device Creation.
>
> https://d33sqmjvzgs8hq.cloudfront.net/wp-content/uploads/2014/08/devices.=
png

Things like that can be cooked up in OE using just meta-qt4 (or 5, but have=
n't=20
tried yet) and a main application recipe (just a QT project that you develo=
p=20
on your desktop) that inherits qt4e.

Qt doesn't need X11, saving big on build and boot time.

A Zynq demo running QT on a plain framebuffer boots in about 7 seconds (fro=
m=20
NOR flash) into the fully functional GUI, on a 10" touch panel, and all of =
it=20
fits in about 20MB flash storage.



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






