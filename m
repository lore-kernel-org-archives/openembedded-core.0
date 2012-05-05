Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SQZ3k-0000ZR-NY
	for openembedded-core@lists.openembedded.org;
	Sat, 05 May 2012 09:05:40 +0200
Received: by wera1 with SMTP id a1so2452291wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 23:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=LEAPiTGUOeALrJJ7aOVkt49VgoVjtmKMJ+xLuuSLPWo=;
	b=gNQ1R1hNjOxcrzifQW6/idwJ8bwYAjIwMmfXwBzIGloati/lkAy/qSaWxmyFm+pIAz
	VLHiTXhsP7ODoYK/PijYSxEIqrJ3SrNxyeaMPyljVZ2wKnzUEAfx/o6VHQVjd8ITbip9
	bNwenRLeS9YU+kyc2We+YRQqmkBuMDCrBF6tOEghUhTOLr6llPtdXf0ncKmf3KssjvuS
	F1g618giLr2S7KpdanALfEysQH8ZvgVuQKKco9TlDcXVL2nVCNDXuDQng/btFw1sIeaz
	YQYkM7NTP+KiHbZPi07CxFwbxystJx90EZNCEVk2jWg+outarL91jKK8BEp1VKdNbU5J
	Xi5g==
Received: by 10.180.88.67 with SMTP id be3mr18930805wib.20.1336200952730;
	Fri, 04 May 2012 23:55:52 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e8sm3194665wiy.3.2012.05.04.23.55.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 23:55:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FA44961.4090409@intel.com>
Date: Sat, 5 May 2012 08:55:50 +0200
Message-Id: <A366210D-D188-4B36-8074-F51C538194C6@dominion.thruhere.net>
References: <cover.1336138307.git.paul.eggleton@linux.intel.com>
	<372b4f451158c03f0d62bf406db1a16a883faa80.1336138307.git.paul.eggleton@linux.intel.com>
	<020C25C7-7981-4351-9AC3-F666A813A35A@dominion.thruhere.net>
	<3787476.jCWbAWHvna@helios>
	<EE194B64-5A8F-40B6-B59E-222D3754F7E2@dominion.thruhere.net>
	<1336144438.23777.22.camel@ted>
	<5FC2CA51-59D7-43CA-8FDB-13B7E97D08E6@dominion.thruhere.net>
	<4FA44961.4090409@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk1CFizYAdle1zwWykWva2U46KHwhXz6a675nFgPI5heX4s4YYAX3vn22C4mgbLbauJqitO
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
X-List-Received-Date: Sat, 05 May 2012 07:05:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mei 2012, om 23:25 heeft Scott Garman het volgende geschreven:

> On 05/04/2012 08:16 AM, Koen Kooi wrote:
>>>>> On Friday 04 May 2012 15:50:16 Koen Kooi wrote:
>>>>>> Looks good to me. If this goes in, can it go on the denzil
>>>>>> shortlist as well?
>>>>>=20
>>>>> I hope so, hence I've CC'd Scott Garman who is pulling together
>>>>> a branch for 1.2.1.
>>>>=20
>>>> oe-core or poky? I only care about oe-core.
>>>=20
>>> Both. Nothing goes into poky these days unless it comes from one of
>>> the appropriate trees.
>>=20
>> That's not what I was asking. I was asking it scott is doing a poky
>> or oe-core effort. =46rom Scotts emails it seems like a poky effort.
>=20
> Hi Koen,
>=20
> I apologize for having made some confusing comments earlier about =
rebasing a denzil-next branch on my poky-contrib repo from being based =
on oe-core to poky. Since then, Richard has given me access to the =
oe-core-contrib repo, and I am now maintaining two denzil-next branches.
>=20
> This one is based on oe-core:
>=20
> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dsgarman/den=
zil-next

When is that going to get merged into denzil? I'm in serious need of =
that connman tests fix, so I have been using =
http://cgit.openembedded.org/openembedded-core/log/?h=3Ddenzil-next =
locally.=20

regards,

Koen=


