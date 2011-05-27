Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QQ5gC-0000Pk-Jy
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 00:38:52 +0200
Received: by wye20 with SMTP id 20so1792032wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 15:35:47 -0700 (PDT)
Received: by 10.227.58.207 with SMTP id i15mr2617766wbh.103.1306535747048;
	Fri, 27 May 2011 15:35:47 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id e1sm1487881wbh.22.2011.05.27.15.35.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 15:35:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306534987.27470.307.camel@rex>
Date: Sat, 28 May 2011 00:35:44 +0200
Message-Id: <D04CBB21-D2FD-46A7-A31D-3D29DD0AA480@dominion.thruhere.net>
References: <cover.1306530446.git.sgw@linux.intel.com>
	<8046a9b60d086b3f82c0733ecbf24785066625e4.1306530446.git.sgw@linux.intel.com>
	<1306531463.3120.124.camel@lenovo.internal.reciva.com>
	<1306534987.27470.307.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] xserver: force to use libdl
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
X-List-Received-Date: Fri, 27 May 2011 22:38:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 mei 2011, om 00:23 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-05-27 at 22:24 +0100, Phil Blundell wrote:
>> On Fri, 2011-05-27 at 14:09 -0700, Saul Wold wrote:
>>> From: Yu Ke <ke.yu@intel.com>
>>>=20
>>> [YOCTO #737]
>>>=20
>>> The AC_CHECK_FUNC([dlopen], [], AC_CHECK_LIB([dl], [dlopen], =
DLOPEN_LIBS=3D"-ldl"))
>>> macro seems not work well in ppc arch, so this patch force the =
DLOPEN_LIBS=3D"-ldl"
>>>=20
>>=20
>> That's a bit of a weird report.  Do we know why it doesn't work?  I
>> guess we don't care all that much about Solaris targets, but equally =
I
>> can't think of any reason why ppc should be special.
>=20
> Seconded. I'd like to see the config.log of that failing on ppc...

That reminds me of =
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D87d9fca0fc=
4112b5ca07d92af10a2e9ef1bf8d0b which I still can't really explain....=


