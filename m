Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SQKOL-0001kh-QA
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 17:25:57 +0200
Received: by wibhj13 with SMTP id hj13so1320966wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 08:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=AeTWLz9PsfZZDKpjzbJLpwNSHV28bIYToR23TBNReus=;
	b=Sr8Je2F3UmjcZbOEO+8kadd9UERtv0oKhtzbCpWmLm/oE19rArkcF604PcVkYOHnPk
	M4mERvMQi0yumpHb1FtDxZ7mScEhg/gePr9kZXK6vRHEgE+BGZZrzA5qIYXN21TNFuUi
	UvxDq8IjJB98X2MTmeeufFVWRt8bzr1FcUfZGUsvDDDfd/DTIE4TC/xZsxt7jf2ODbWI
	gNHPWAyzjEXHg9N8Y59Q9sra2Kp5idzRN3z2kGgG6Z7iNVL4rFpobUG676H5wDpQOI+3
	TX+d9gmbhs1VGh8pKYq596Gp19xOy8tL/U/1AohSufxNj3DdsbCPdpdqg6LZgip5V+kW
	7w3g==
Received: by 10.216.133.130 with SMTP id q2mr2490960wei.24.1336144570885;
	Fri, 04 May 2012 08:16:10 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm15938794wib.2.2012.05.04.08.16.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 08:16:09 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336144438.23777.22.camel@ted>
Date: Fri, 4 May 2012 17:16:08 +0200
Message-Id: <5FC2CA51-59D7-43CA-8FDB-13B7E97D08E6@dominion.thruhere.net>
References: <cover.1336138307.git.paul.eggleton@linux.intel.com>
	<372b4f451158c03f0d62bf406db1a16a883faa80.1336138307.git.paul.eggleton@linux.intel.com>
	<020C25C7-7981-4351-9AC3-F666A813A35A@dominion.thruhere.net>
	<3787476.jCWbAWHvna@helios>
	<EE194B64-5A8F-40B6-B59E-222D3754F7E2@dominion.thruhere.net>
	<1336144438.23777.22.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnRDKZ2aB8qimRGxJYDEk/QrGufbf+tzKZEr2Xp+FFp0fqi5AXOTBCrGVquHXY/rBvmVo8O
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Fri, 04 May 2012 15:25:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mei 2012, om 17:13 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-05-04 at 17:06 +0200, Koen Kooi wrote:
>> Op 4 mei 2012, om 16:30 heeft Paul Eggleton het volgende geschreven:
>>=20
>>> On Friday 04 May 2012 15:50:16 Koen Kooi wrote:
>>>> Looks good to me. If this goes in, can it go on the denzil =
shortlist as
>>>> well?
>>>=20
>>> I hope so, hence I've CC'd Scott Garman who is pulling together a =
branch for=20
>>> 1.2.1.
>>=20
>> oe-core or poky? I only care about oe-core.
>=20
> Both. Nothing goes into poky these days unless it comes from one of =
the
> appropriate trees.

That's not what I was asking. I was asking it scott is doing a poky or =
oe-core effort. =46rom Scotts emails it seems like a poky effort.=


