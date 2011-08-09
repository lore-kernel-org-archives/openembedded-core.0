Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qqo8H-0007i6-MD
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 17:22:18 +0200
Received: by iyf13 with SMTP id 13so159026iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 08:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=qRg0+/UxRnxkMazye0kKvtQMDmVbvffXe4oEmzSkQDY=;
	b=w94kpLB/wBdK+KjkHicz9FVaW6epPmAGXPjt3KpCs+Xr4DtgPAD2dhcGL4t8sxOXM+
	AEUdE04EkDPST0v7LqboBfz7NZ+aZMqLPdjdMwXdFpTZhYbatAcl/17ElhukK6OqlKVo
	iD6rdL7nOOBH7UE1ezCpEFNr7rE36q05lVIbE=
Received: by 10.42.151.137 with SMTP id e9mr6150889icw.409.1312903066384;
	Tue, 09 Aug 2011 08:17:46 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id a11sm10695ibg.38.2011.08.09.08.17.44
	(version=SSLv3 cipher=OTHER); Tue, 09 Aug 2011 08:17:45 -0700 (PDT)
Message-ID: <4E414F97.2010500@gmail.com>
Date: Tue, 09 Aug 2011 08:17:43 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110801 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312784043-3081-1-git-send-email-raj.khem@gmail.com>
	<1312845842.14274.282.camel@rex> <4E4097A3.8090204@gmail.com>
	<1312901324.14274.307.camel@rex>
In-Reply-To: <1312901324.14274.307.camel@rex>
X-Enigmail-Version: 1.2pre
Subject: Re: [PATCH 1/2] shared-mime-info, avahi, polkit: inherit perlnative
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
X-List-Received-Date: Tue, 09 Aug 2011 15:22:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


> I was proposing we change AC_PATH_PROG(INTLTOOL_PERL,perl) to 
> AC_PATH_PROG(INTLTOOL_PERL,nativeperl)

I see. I will test it out and resubmit

> 
> Cheers,
> 
> Richard
> 
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5BT5YACgkQuwUzVZGdMxRBJgCfZal6iToBIKUmitPcFGOA/AkE
z+oAnin/cNDyGxFRUlTiSM59WMKMPZhs
=TW7i
-----END PGP SIGNATURE-----


