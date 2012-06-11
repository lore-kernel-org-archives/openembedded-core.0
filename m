Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Se5Mn-0004Ls-2o
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 16:13:41 +0200
Received: by dalh21 with SMTP id h21so5206903dal.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=5ZOhUKL2XT/fPPucmpAnsfKzzqonlDS7DIqhpDEPxm4=;
	b=roCtC/CTcJnCJz4o+QtsiSEXOS7Qj0YIbuzTJGIVGkkA5IMSGzq9uFQMd5DjJt/hzw
	YwrN1o+yV6xCMZGIpwni/k9jZoHyGcu7mxZH8+/hB5d/P9sb1VViip3KkmJv8NHbDz/R
	YEb4RRItCTYOGWBXdAGo9C6SMiziJrnRTlRlwfHsHV/x1zykUO6IY8UYxv1P7TJxnNv9
	ErbxALPkaGCE/0fi72B0y6P1b2i7za062SWVb6JS0XNoAcc6StORI+NGxGSs61q67hab
	MKHjJlxsRerOw3lFrToCCI+awip5iYDwtIhvfWtt8eUeXblAeR9GBoGGoE36Y5aKE7hl
	K2ww==
Received: by 10.68.134.163 with SMTP id pl3mr27249371pbb.167.1339423358640;
	Mon, 11 Jun 2012 07:02:38 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id oq8sm18583736pbb.23.2012.06.11.07.02.35
	(version=SSLv3 cipher=OTHER); Mon, 11 Jun 2012 07:02:36 -0700 (PDT)
Message-ID: <4FD5FA7B.9080406@gmail.com>
Date: Mon, 11 Jun 2012 07:02:35 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1339259893.git.raj.khem@gmail.com>
	<1339419838.30460.28.camel@ted>
In-Reply-To: <1339419838.30460.28.camel@ted>
X-Enigmail-Version: 1.4.2
Subject: Re: [PATCH 00/16 V2] Prelink/ld bug and rpm compilation on uclibc
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
X-List-Received-Date: Mon, 11 Jun 2012 14:15:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/11/2012 6:03 AM, Richard Purdie wrote:
> On Sat, 2012-06-09 at 09:42 -0700, Khem Raj wrote:
>> This patch now can compile a uclibc sato image using rpm as
>> packaging backend Introduces variables into cmake class to
>> control linker flags which was not available Adds npth recipe.
>> npth is next gen pth soon gnupg 2.1 will drop pth and move on to
>> use npth, right now its only used in uclibc case conditionalize
>> use of pth using libc overrides since pth is not compatible with
>> uclibc
>> 
>> The following changes since commit
>> 75a973328d50ef3c007edb7a471ea77fb97911ea:
>> 
>> kern-tools: anchor KMACHINE test (2012-06-08 11:56:21 +0100)
>> 
>> are available in the git repository at: 
>> git://git.openembedded.org/openembedded-core-contrib
>> kraj/misc-updates 
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates
>>
>>
>> 
Khem Raj (16):
>> binutils_2.22: Backport to fix bogus textrels pth: Mark
>> incompatible with uclibc libtool: Let -fstack-protector passed to
>> link step augeas: Fix compilation failure cmake.bbclass: Add
>> OECMAKE_C_LINK_FLAGS and OECMAKE_CXX_LINK_FLAGS variables 
>> task-self-hosted.bb,task-core-lsb.bb: Conditionalize pth
>> inclusion npth: Add recipe gpgme: Depend on npth for uclibc 
>> gnupg-2.0.19: Depend on npth for uclibc
> 
> I took the above patches.
> 
>> rpm: Fix compilation on uclibc rpm: Use link time check for
>> libssp sat-solver: Fix build on uclibc libzypp: Fix build with
>> uclibc rpm: pass lrt and lpthread to link step explicitly for
>> uclibc zypper: Fix build on uclibc libzypp: Define
>> OECMAKE_CXX_LINK_FLAGS when compiling for uclibc
> 
> I haven't taken these yet as I want to get Mark's rpm update in,
> then see where we stand. I also was a little worried about the
> extra OECONF/TUNE pieces in the sat-solver patch. There wasn't any
> mention of that in the commit message...

Thanks for looking into it. EXTRA_OECMAKE change should not be
required there. however appending to TUNE_CCARGS is needed for uclibc
since it does not have
same qsort expectations that sat-solver wants. I can make it apply
only for uclibc here.


I will redo this patch

> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/V+nsACgkQuwUzVZGdMxSbgACdG7VHCB6xFFHiyd6rW4/Y7HsL
CxYAnAhHzM7ieDonDCLNsYMYXAT+HAFs
=SOkF
-----END PGP SIGNATURE-----


