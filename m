Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QodCO-00087r-EA
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:17:32 +0200
Received: by wwe32 with SMTP id 32so502100wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2011 08:13:09 -0700 (PDT)
Received: by 10.216.164.149 with SMTP id c21mr751233wel.98.1312384389831;
	Wed, 03 Aug 2011 08:13:09 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fp3sm758157wbb.13.2011.08.03.08.13.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Aug 2011 08:13:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E396289.5070509@gmail.com>
Date: Wed, 3 Aug 2011 17:13:06 +0200
Message-Id: <ECABAD7B-80FC-4AED-8BA9-483B6CC2F37F@dominion.thruhere.net>
References: <cover.1311682779.git.edwin.zhai@intel.com>	<73ea8ff94e4bda213df1a5a39615f4cd39899589.1311682779.git.edwin.zhai@intel.com>	<C36AA1E0-9A00-4761-9912-A3AC81367446@dominion.thruhere.net>
	<1311686782.2344.236.camel@rex> <4E38FE6C.3010005@intel.com>
	<4E396289.5070509@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 2/3] xinput-calibrator: Add 0.7.5 as new recipe
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
X-List-Received-Date: Wed, 03 Aug 2011 15:17:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 aug. 2011, om 17:00 heeft Khem Raj het volgende geschreven:

> On 08/03/2011 12:53 AM, Zhai, Edwin wrote:
>>=20
>>=20
>> Richard Purdie wrote:
>>>=20
>>> On Tue, 2011-07-26 at 14:53 +0200, Koen Kooi wrote:
>>> > This one looks suspicously like the one in meta-oe. Apart from =
that,
>>> > is it really needed in oe-core?
>>>=20
>>> Given that the xcalibrate extension has been removed from the =
xserver I
>>> think we're going to either need to migrate the tools like xtscal or
>>> adopt other tools. Certainly OE-Core should have a consistent story =
for
>>> touchscreens...
>>>=20
>>=20
>> RP,
>> There is another recipe pointercal-xinput that provides script for
>> calibration based on xinput_calibrator's output. So moving xinput,
>> xinput_calibrator and pointercal-xinput from meta-oe to oe-core make =
a
>> consistent story?
>>=20
>> If no objection, I'll do this...
>=20
> yes please. I have not been able to caliberate screen using =
xinput-calibrator. I would try anything that will get me going.

I've only used it under X and if you use xf86-input-evdev it "just =
works". The most recent system I tried was an ipaq hx4700 with kernel =
3.0.=


