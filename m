Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QszUm-00055V-JL
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 17:54:33 +0200
Received: by yxi19 with SMTP id 19so3148281yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=0Rs0QY6MyDtSuryShCVLFiAq4SFk5iMQ2X3ctNbJ+mk=;
	b=qTpsQRVbko5k64BIYQ4UHb3tE+bL5vBsPsoqvuoBsEF2NKYV+CrzDPQVFayLgikneZ
	acg9TyHhKz5Ek4b6K+dv1PdYF50I2bBgyypAiq+3BHA4FSxFxMV+v7xZuMu/d3lkIE2V
	j/m2Z5FCrKcQCsSyP1LyV0cqT4QBhq3ZH5lwg=
Received: by 10.100.245.35 with SMTP id s35mr4039204anh.84.1313423396068;
	Mon, 15 Aug 2011 08:49:56 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c5sm5234142anh.27.2011.08.15.08.49.54
	(version=SSLv3 cipher=OTHER); Mon, 15 Aug 2011 08:49:55 -0700 (PDT)
Message-ID: <4E494021.4040907@gmail.com>
Date: Mon, 15 Aug 2011 08:49:53 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110809 Thunderbird/6.0
MIME-Version: 1.0
To: Yu Ke <ke@linux.intel.com>
References: <cover.1313328487.git.ke.yu@intel.com>
	<fdc4b5810c9adedea19d41a7856612201615e99c.1313328487.git.ke.yu@intel.com>
	<4E47E757.9000408@gmail.com> <4E4913FC.5070108@linux.intel.com>
In-Reply-To: <4E4913FC.5070108@linux.intel.com>
X-Enigmail-Version: 1.2.1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc-cross-intermediate: revise the 64bithack.patch for multilib case
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
X-List-Received-Date: Mon, 15 Aug 2011 15:54:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/15/2011 05:41 AM, Yu Ke wrote:
> On 2011/8/14 23:18, Khem Raj wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> On 08/14/2011 06:32 AM, Yu Ke wrote:
>>> current gcc-cross-intermediate has build failure in qemux86-64
>>> lib64 multilib case. the reason is that it still use lib instead
>>> of lib64 while do_install use the libdir i.e. lib64
>>> 
>>> so this patch fix this issue by making gcc honour the libdir.
>> 
>> I think similar patch should be done to ppc and mips as well.
> 
> According to Kumar, current ppc works just fine in multilib 64bit
> case. so ppc may not need this kind of patch. I am not sure how is
> mips. Since i am not familar with mips, i'd like to leave it to other
> mips expert.
> 

I guess since mips multilib is not yet there and /lib  is used by o32
abi even in multilib case things would be simple for mips.
Would using gcc defaults for x86_64 work ? It might break backward
compatibility in non multilib case

> Regards Ke

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEARECAAYFAk5JQCAACgkQuwUzVZGdMxQdLwCY1ijPd8bFknmc8OLI9/OUVTZf
FACfToqH6QXmIRNIuZkIAkYHSSiFaro=
=pfvK
-----END PGP SIGNATURE-----


