Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SQKFN-0001XT-Ct
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 17:16:41 +0200
Received: by wera1 with SMTP id a1so2043754wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 08:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=0hSYKJ62yjBIBEoo2VCCDmXBQ0gu0q8TOQZ+GkKfw/A=;
	b=i9lleq2eNiSRC4FwahCnbdscnyXtp8QdDG+k5a01Xm/Fq6gL0rYqyy0Wk/Fd0+BJIG
	Bi4sXfdwLs3PrKKXos0+7nFxVYAiJdE1qfSc/XVEBkCrwWMZ4MGXIb2BKlNTOgnoevQx
	p/RJLKCeURb6CpRf8dkEFdChL0ZWRaQfgkRzoa0G9KR6xJV/MsbEAxrFNUR5xWyrhwlM
	jd4zdJW2fixGH5eW/6ntizvoHwsUR7KxaDj/TZ14htymOmm4+0pcdi7IMAm5ddfa6W+u
	nw552ljsm+QO7NSNLrGNLtv7CeY+QjB10ebB35N0orzTBzge2tcSgMFDcxksGlrrAeq8
	hrxg==
Received: by 10.216.195.10 with SMTP id o10mr4288722wen.11.1336144013895;
	Fri, 04 May 2012 08:06:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ev10sm1699155wid.10.2012.05.04.08.06.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 08:06:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3787476.jCWbAWHvna@helios>
Date: Fri, 4 May 2012 17:06:51 +0200
Message-Id: <EE194B64-5A8F-40B6-B59E-222D3754F7E2@dominion.thruhere.net>
References: <cover.1336138307.git.paul.eggleton@linux.intel.com>
	<372b4f451158c03f0d62bf406db1a16a883faa80.1336138307.git.paul.eggleton@linux.intel.com>
	<020C25C7-7981-4351-9AC3-F666A813A35A@dominion.thruhere.net>
	<3787476.jCWbAWHvna@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlc41e20y7vdez4793H2AI6dOdIJH6Gnbqi13axmWJND9rTfVWTzIRX3Qwl3tEpVadvp3x8
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 04 May 2012 15:16:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mei 2012, om 16:30 heeft Paul Eggleton het volgende geschreven:

> On Friday 04 May 2012 15:50:16 Koen Kooi wrote:
>> Looks good to me. If this goes in, can it go on the denzil shortlist =
as
>> well?
>=20
> I hope so, hence I've CC'd Scott Garman who is pulling together a =
branch for=20
> 1.2.1.

oe-core or poky? I only care about oe-core.=


