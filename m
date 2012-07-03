Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Slutg-0002c0-CW
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 06:39:32 +0200
Received: by ggnp4 with SMTP id p4so4603741ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 21:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=aZpeErca08a1dYYn1PV5r+JiPuVuGPSfdfrFbnbUusQ=;
	b=HwqGu+9D9zJnijHT1KVIQYo6OxH6/InRSG983+tW/GaZgM+rzAlu70Y0/aoOI+4qRG
	ETny69RU8zzd0tt9+3omOHo0Bq24ykc0JApjDONebBOVq/pAzV0ymJHy9l6c9qReceki
	1f9MmCqhIMneekpEor39Rgg0pTLyxkleWhDAdiqgVplZuY4rb0JzJyq/nkPGqeEZ1Hwo
	P4YWMJvNy8mpwnyCwwtw4V7Cn2mLARoLZJ7Qn26XdOYNtP9ZBsURuq/0ZZZrpL/hW3pb
	eM+FS9Efu2YyqwtTVIZN02VwCw7nq054DFG0JfrM/NKFC41gp9Ncet7YGYhv7d+jvSV2
	CQEA==
Received: by 10.66.73.133 with SMTP id l5mr26211133pav.74.1341289710305;
	Mon, 02 Jul 2012 21:28:30 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id og4sm14596181pbb.48.2012.07.02.21.28.28
	(version=SSLv3 cipher=OTHER); Mon, 02 Jul 2012 21:28:29 -0700 (PDT)
Message-ID: <4FF274EC.7030005@gmail.com>
Date: Mon, 02 Jul 2012 21:28:28 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <441e9c9457b3f888162fe83793df551a6ee97697.1341259773.git.dvhart@linux.intel.com>
	<CAMKF1srEBy_rLPp_DGr9zQ9WwRqma5JX6qRd6szBPQOf-AOv1A@mail.gmail.com>
	<4FF242B8.1000401@linux.intel.com>
In-Reply-To: <4FF242B8.1000401@linux.intel.com>
X-Enigmail-Version: 1.4.2
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] grub-efi: Do not use help2man
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
X-List-Received-Date: Tue, 03 Jul 2012 04:39:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 7/2/2012 5:54 PM, Darren Hart wrote:
> I added HELP2MAN='true' to EXTRA_OECONF and it failed in the same
> way.


hmmm export it I dont know passing in extra_oeconf will work
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/ydOwACgkQuwUzVZGdMxTWUACeNygHXozkGDFmDD45sOWV27nB
GZ8An1O/8t0oslk+tvkVn4cPK6qAe4B/
=Byze
-----END PGP SIGNATURE-----


