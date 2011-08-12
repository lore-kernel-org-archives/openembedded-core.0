Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qrtix-0006km-4e
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 17:32:39 +0200
Received: by iyf13 with SMTP id 13so1922507iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=UdJz93ZDYA67H+3G21lNheKYxgCJUf04dgWq5k4ShAk=;
	b=sD6IsMz3yccIKP9lEx0nZNrdX3wG255wPLI9OTJsaqFCLro24dIEw2mETg7hwuYDKJ
	pyDEz136VENjj5z/Hne2sr1KEdXtPs6E6X/J9KN+4BkxeK0j2nYDTLMy/bXuJo9I5eFW
	x2L1W4JFCqnkBjFNXS5Oz8wVuPrf6L6ncpYOw=
Received: by 10.231.54.104 with SMTP id p40mr2230625ibg.39.1313162885725;
	Fri, 12 Aug 2011 08:28:05 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x18sm400971ibe.23.2011.08.12.08.28.04
	(version=SSLv3 cipher=OTHER); Fri, 12 Aug 2011 08:28:04 -0700 (PDT)
Message-ID: <4E454683.9040809@gmail.com>
Date: Fri, 12 Aug 2011 08:28:03 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110809 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1313064502.14274.418.camel@rex>
	<1313065783.6733.132.camel@phil-desktop>
	<1403530.aczy7koY2H@perseus>
	<1313159724.6733.158.camel@phil-desktop>
In-Reply-To: <1313159724.6733.158.camel@phil-desktop>
X-Enigmail-Version: 1.2pre
Subject: Re: [PATCH 2/3] Add basic Mips core tune config
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
X-List-Received-Date: Fri, 12 Aug 2011 15:32:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/12/2011 07:35 AM, Phil Blundell wrote:
> On Thu, 2011-08-11 at 07:49 -0700, Khem Raj wrote:
>> yeah I think major cpu architecture would be nice to have in
>> overrides e.g. mips for mipseb and mipsel. We dont need endianness
>> info since we can deduce that from tune features in todays setup.
> 
> I'm not entirely convinced it's wholesome for random recipes to
> start poking around inside TUNE_FEATURES.  SITEINFO_ENDIANNESS seems
> like the cleanest way for recipes to get that information.

yes. for endianness thats better to get it from SITEINFO_ENDIANNESS so
far TARGET_ARCH was being used which should be improved.

> 
> p.
> 
> 
> 
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5FRoMACgkQuwUzVZGdMxRoSACeLo3/aWiLbQn86+ZoxQDw4rXR
7zoAnA0TxTF7fDFQgLsgOWqji/KEz7hJ
=0IKr
-----END PGP SIGNATURE-----


