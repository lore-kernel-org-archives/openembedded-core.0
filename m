Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QrBah-0001D9-27
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 18:25:11 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QrBWL-0007U0-8w from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 09:20:41 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 10 Aug 2011 18:20:36 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A50669D2C7@eu2-mail.mgc.mentorg.com>
In-Reply-To: <989A078976CDAD4CB2DC976EEF70E2A50669D251@eu2-mail.mgc.mentorg.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] difference between udev recipes of meta-oe and oe-core
Thread-Index: AcxXQt7fUEtBoSAAS2qyuDcO3wiDnAAAYUywAA07f4A=
References: <cover.1312967662.git.xiaofeng.yan@windriver.com><83a60eb818d866533f9ac2069eae38b03fcedac6.1312967662.git.xiaofeng.yan@windriver.com>
	<989A078976CDAD4CB2DC976EEF70E2A50669D251@eu2-mail.mgc.mentorg.com>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: difference between udev recipes of meta-oe and oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Aug 2011 16:25:11 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Kindly explain this difference to me. Thanks.

Regards,
Noor

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org
[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
Ahsan, Noor
Sent: Wednesday, August 10, 2011 3:12 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] difference between udev recipes of meta-oe and
oe-core

Hello,

I was looking at the udev recipes and noticed that there is minor
difference between oe-core and meta-oe recipes. I went through logs but
could not find the reason. The difference is meta-oe recipe is creating
extra files

touch ${D}${sysconfdir}/udev/saved.uname
touch ${D}${sysconfdir}/udev/saved.cmdline
touch ${D}${sysconfdir}/udev/saved.devices
touch ${D}${sysconfdir}/udev/saved.atags

which is used in init and cache script. But oe-core is not creating such
files and cache script does not exist in oe-core udev and init script is
totally different. Secondly meta-oe udev is copying modprob rules and
touchscreen rules but oe-core udev recipe is not doing that. Can anybody
explain to me that why there is such differences. Thanks.

Regards,
Noor

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


