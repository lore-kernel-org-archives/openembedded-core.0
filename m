Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SRQZL-0002AT-O3
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 18:13:51 +0200
Received: by wibhj13 with SMTP id hj13so3201200wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 09:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=fLn8wuvzEIj1iEom2g2gMm5+uyADyZ6tXA14GduzNgI=;
	b=L3qq3n1fUX/85ZQsxxj87bf5dRTHBVQdrJ0vV8cNltf0bokrGPg2mlj4pbX1fhf3wY
	FiAcOBoS+rQGllFp65cwKmqpsxCST1v9BDXkrECndh8ngLMLXvW1QWjmzSPv0wzWct7o
	92oH5B1Y2UiAynvl5SjDmxvhKb6CSHkbKfTRbC3aCdCYGwN/Gp6fITt8VcdB6SGTXzKw
	pivp/bvPjWORIQtQs14KeBhvDVkqM2skpGShyxv0iez59572DjrSfDaNIDT2LYLUD/Er
	W8IrCM0b1Xh9Bs7+YE/doxExYcssirPGou4iE+f305ts2aJ4g0kzzaTOhrK9vmtXi2do
	fLlw==
Received: by 10.180.105.194 with SMTP id go2mr36450039wib.22.1336406641340;
	Mon, 07 May 2012 09:04:01 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e8sm22567398wiy.3.2012.05.07.09.03.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 09:03:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FA7EEA7.5070209@intel.com>
Date: Mon, 7 May 2012 18:03:57 +0200
Message-Id: <DE0A7E5C-90AF-4379-B962-DC7B6FBD1E64@dominion.thruhere.net>
References: <cover.1336138307.git.paul.eggleton@linux.intel.com>
	<372b4f451158c03f0d62bf406db1a16a883faa80.1336138307.git.paul.eggleton@linux.intel.com>
	<020C25C7-7981-4351-9AC3-F666A813A35A@dominion.thruhere.net>
	<3787476.jCWbAWHvna@helios>
	<EE194B64-5A8F-40B6-B59E-222D3754F7E2@dominion.thruhere.net>
	<1336144438.23777.22.camel@ted>
	<5FC2CA51-59D7-43CA-8FDB-13B7E97D08E6@dominion.thruhere.net>
	<4FA44961.4090409@intel.com>
	<A366210D-D188-4B36-8074-F51C538194C6@dominion.thruhere.net>
	<4FA7EEA7.5070209@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnGJ0huUx5I6FfWwt5TTdmMCjvdMUF4MCu2FSJw0rPLRCy7bHfczsaAmXf7eATODz35gLsZ
Subject: Re: [PATCH 1/1] buildhistory: fix multiple commit of images and packages at the same time
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
X-List-Received-Date: Mon, 07 May 2012 16:13:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 mei 2012, om 17:47 heeft Scott Garman het volgende geschreven:

> On 05/04/2012 11:55 PM, Koen Kooi wrote:
>>=20
>> Op 4 mei 2012, om 23:25 heeft Scott Garman het volgende geschreven:
>>=20
>>> On 05/04/2012 08:16 AM, Koen Kooi wrote:
>>>>>>> On Friday 04 May 2012 15:50:16 Koen Kooi wrote:
>>>>>>>> Looks good to me. If this goes in, can it go on the
>>>>>>>> denzil shortlist as well?
>>>>>>>=20
>>>>>>> I hope so, hence I've CC'd Scott Garman who is pulling
>>>>>>> together a branch for 1.2.1.
>>>>>>=20
>>>>>> oe-core or poky? I only care about oe-core.
>>>>>=20
>>>>> Both. Nothing goes into poky these days unless it comes from
>>>>> one of the appropriate trees.
>>>>=20
>>>> That's not what I was asking. I was asking it scott is doing a
>>>> poky or oe-core effort. =46rom Scotts emails it seems like a poky
>>>> effort.
>>>=20
>>> Hi Koen,
>>>=20
>>> I apologize for having made some confusing comments earlier about
>>> rebasing a denzil-next branch on my poky-contrib repo from being
>>> based on oe-core to poky. Since then, Richard has given me access
>>> to the oe-core-contrib repo, and I am now maintaining two
>>> denzil-next branches.
>>>=20
>>> This one is based on oe-core:
>>>=20
>>> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dsgarman/den=
zil-next
>>=20
>>>=20
>> When is that going to get merged into denzil? I'm in serious need of
>> that connman tests fix, so I have been using
>> http://cgit.openembedded.org/openembedded-core/log/?h=3Ddenzil-next
>> locally.
>=20
> The commit just got into master, so I'm hoping to pull it into my =
denzil-next-testing branch and run some build tests overnight tonight, =
then merge it if all goes well tomorrow.

Merge it into the oe-core 'denzil' branch, right?=


