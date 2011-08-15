Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QszWC-00058Y-UJ
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 17:56:01 +0200
Received: by gyg4 with SMTP id 4so3177757gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=J/P/FTZ2DnspgSaiyviQpSAaIWnW7wSfizpWN4T3wpw=;
	b=dMs1XlIaubB/Oa4sdRb7aVsNEOKHuX98BPnaGzUg7YtU06vWqZJFC3YxJ4SW31viJn
	OHJ3T7mZtraHVWVlP9CHpvbdbR3DLu3E/7+az5QC3DVcd6KDKsARmRLpXvVBUYq17Ysk
	1CQDyqxgMgPUQqpahkiV0U4uwhGYIwCVrJfv0=
Received: by 10.101.44.4 with SMTP id w4mr3959080anj.108.1313423483521;
	Mon, 15 Aug 2011 08:51:23 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id h15sm5235680ank.13.2011.08.15.08.51.22
	(version=SSLv3 cipher=OTHER); Mon, 15 Aug 2011 08:51:22 -0700 (PDT)
Message-ID: <4E494079.5060607@gmail.com>
Date: Mon, 15 Aug 2011 08:51:21 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110809 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <201108142050.37352.paul.eggleton@linux.intel.com>
	<1313420625.6733.182.camel@phil-desktop>
	<201108151649.40904.paul.eggleton@linux.intel.com>
In-Reply-To: <201108151649.40904.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.2.1
Subject: Re: Machine specific sysroot issue
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
X-List-Received-Date: Mon, 15 Aug 2011 15:56:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


> I've sort of figured this out. include.pro is getting installed to
> the sysroot and not ${D} in do_install (and it's the only file
> handled this way). I'm guessing that because of this it never gets
> picked up by sstate.

yes seems the cause to me

> 
> Cheers, Paul
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5JQHgACgkQuwUzVZGdMxTEQACggmD5qFdYqsfZ0GhbMVE9LMYL
e2AAnAz5FMDMA5d9F+msjxDulXuQpAY5
=92OM
-----END PGP SIGNATURE-----


