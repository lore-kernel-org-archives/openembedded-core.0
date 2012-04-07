Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGMYg-00070x-Ig
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Apr 2012 05:43:26 +0200
Received: by pbcum15 with SMTP id um15so2602644pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 20:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=klbmr2n9cX57M15Ybuo4Hh2sUVsrQ4NuFN0F0Sw4PD8=;
	b=X4+2WzylhXEum0n2NA+Yv0b7iPtHsnlc6dO2GiSVPBzJ95YHK45wdZZZYKXyW5CKyc
	mbeIHpLmQKFITA/sNjqVpEnJKCmb9lXVgjXjcRTOc3xRM5KTIvotE8/VDWJDit9IHzar
	b6ZxK1BZlMCFTBVACqudtXzufyG/P8/rNQX2JtVyBp4KQ7hpGD9b3Nzn10J610aXBRrM
	juwIH2PSGq+JVKhPANAUz6oJn/o88Fx4dKMvkxi1IDJMAHKd0705RNJD0ao6KXYCkCYm
	uR9KERX9j2PrEU30mlGHX+atKmgxMKF1NKCEmBTyz27UMTj8lIfPblI+910ut8L3VWSZ
	iCfg==
Received: by 10.68.136.162 with SMTP id qb2mr504116pbb.67.1333769651953;
	Fri, 06 Apr 2012 20:34:11 -0700 (PDT)
Received: from [192.168.1.79] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id i1sm7989307pbj.70.2012.04.06.20.34.09
	(version=SSLv3 cipher=OTHER); Fri, 06 Apr 2012 20:34:10 -0700 (PDT)
Message-ID: <4F7FB5B0.5050503@gmail.com>
Date: Fri, 06 Apr 2012 20:34:08 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120402 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1332202974-27977-1-git-send-email-denis@denix.org>
	<4F689BD8.4040201@linux.intel.com>
	<AE26A546-7EFB-4EB6-B3F1-398A6B291444@dominion.thruhere.net>
In-Reply-To: <AE26A546-7EFB-4EB6-B3F1-398A6B291444@dominion.thruhere.net>
X-Enigmail-Version: 1.4
Subject: Re: [PATCH] rt-tests: fix dependency on eglibc, clean LDFLAGS passing
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
X-List-Received-Date: Sat, 07 Apr 2012 03:43:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/20/2012 08:11 AM, Koen Kooi wrote:
> 
> Op 20 mrt. 2012, om 16:01 heeft Darren Hart het volgende 
> geschreven:
> 
>> 
>> 
>> On 03/19/2012 05:22 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@ti.com>
>>> 
>>> Replace dependency on eglibc with virtual/libc Pass LDFLAGS to 
>>> TARGET_CC_ARCH, instead of CFLAGS as Makefile overrides it
>>> 
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> 
>> Thanks Denys,
>> 
>> Looking through the rt-tests sources I don't see TARGET_CC_ARCH 
>> anywhere. Have you confirmed that changes made there make their 
>> way into the actual build?
> 
> TARGET_CC_ARCH is an OE thing, it's is what ends up in $CC.
> 

for record you should not need to pass LDFLAGS to TARGET_CC_ARCH in
OE-Core
if you were doing it to silence  hash style warnings
we have fixed toolchain for that


> regards,
> 
> Koen
> 
> _______________________________________________ Openembedded-core 
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk9/ta8ACgkQuwUzVZGdMxQGeACgj4VzDL18gKXxxI6pp0zhTOKs
a6kAn0GccFNh94ttjzSWxp7Q6UYTY/4R
=yKil
-----END PGP SIGNATURE-----


