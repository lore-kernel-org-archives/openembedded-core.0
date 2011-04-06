Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q7YUF-0007Vc-Df
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 21:33:55 +0200
Received: by wye20 with SMTP id 20so1740766wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2011 12:31:48 -0700 (PDT)
Received: by 10.216.161.205 with SMTP id w55mr1349299wek.104.1302118307620;
	Wed, 06 Apr 2011 12:31:47 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f30sm461229wef.7.2011.04.06.12.31.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 12:31:46 -0700 (PDT)
References: <cover.1302039585.git.sgw@linux.intel.com>
	<23fdb7fffa0e21931f4d6ddd2b02a0a44a450a61.1302039585.git.sgw@linux.intel.com>
	<46C1DB33-0AC8-486D-9E88-7D33EE44CF93@dominion.thruhere.net>
	<1302114663.22904.75.camel@rex>
In-Reply-To: <1302114663.22904.75.camel@rex>
Mime-Version: 1.0 (iPhone Mail 8G4)
Message-Id: <92E073DC-42BC-423D-B48C-C1C8DADFA2AF@dominion.thruhere.net>
X-Mailer: iPhone Mail (8G4)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 6 Apr 2011 21:31:39 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dongxiao Xu <dongxiao.xu@intel.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gst-meta-base: Support http/https remote streams
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
X-List-Received-Date: Wed, 06 Apr 2011 19:33:55 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 6 apr. 2011 om 20:31 heeft Richard Purdie <richard.purdie@linuxfoundation=
.org> het volgende geschreven:

> On Wed, 2011-04-06 at 09:11 +0200, Koen Kooi wrote:
>> Op 5 apr 2011, om 23:48 heeft Saul Wold het volgende geschreven:
>>=20
>>> From: Dongxiao Xu <dongxiao.xu@intel.com>
>>>=20
>>> Add libgstsouphttpsrc library to support remote stream playing via
>>> http/https protocols.
>>>=20
>>> This solves the mp4 playing issue by regel from mediatomb file server.
>>>=20
>>> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>>>=20
>>> -    gst-plugins-good-autodetect"
>>> +    gst-plugins-good-autodetect \
>>> +    gst-plugins-good-souphttpsrc"
>>=20
>> FWIW, souphttpsrc is quite heavy in dependencies, so in the future we
>> should look for something lighter (GIO?).
>=20
> Sounds like a good plan. Does something already exist or does code need
> writing for that?

It has been over a year since I looked at it, but back then GIO used libsoup=
 as backend, so doing http with gstreamer bloated up your product.
I'll have a look at the current state when I get some time.

regards,

koen


>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


