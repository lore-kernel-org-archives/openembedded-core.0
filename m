Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGOrw-00056v-Iy
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Apr 2012 08:11:28 +0200
Received: by pbcum15 with SMTP id um15so2659753pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 23:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=MfA+ll4mpBGdBRL2Pk+Ec48UhjG4lC3/3LQchZOFerA=;
	b=X/+MLyRnDGNJ2T9dvWplppR1ENnualtGTfu2A5uFl2VtE4cMAGg4UAsQqBecSKumy1
	He2QGBG07ELL+1FMfbgTS6NahJcTOdjlGGlSiiH0GKKoVnnvAhuS2uXxe25plHLMVawR
	+9R1d71cgT4GRROOg0VbIzIDpvo7sqIXtO//EsSiOP0OA/+g7i5sYjMUrkGXoyvHPt0T
	xAkSsocUmdJ6hTSq494pGd0uimMellJXRdttz+e+NauQGi6anxlIYo9SgvXiJF/uczHv
	1PWipTQgAnOtpLhYEJS8r+Kp6jjUgQRz2cFMUtzKFXFqjIX8nSWNMupTlGLXu4UOkWO6
	4vBw==
Received: by 10.68.193.135 with SMTP id ho7mr854066pbc.119.1333778534241;
	Fri, 06 Apr 2012 23:02:14 -0700 (PDT)
Received: from [192.168.1.79] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id i8sm8311224pbi.47.2012.04.06.23.02.12
	(version=SSLv3 cipher=OTHER); Fri, 06 Apr 2012 23:02:13 -0700 (PDT)
Message-ID: <4F7FD863.3070702@gmail.com>
Date: Fri, 06 Apr 2012 23:02:11 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120402 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20120403131537.5CE3310218@opal>
	<20120404165943.GE4181@jama.jama.net>
	<4F7C8796.9070705@opendreambox.org>
	<20120404174521.GF4181@jama.jama.net>
	<4F7C8B6A.1000008@opendreambox.org>
	<20120404180615.GG4181@jama.jama.net>
In-Reply-To: <20120404180615.GG4181@jama.jama.net>
X-Enigmail-Version: 1.4
Subject: Re: [oe-commits] Andreas Oberritter : gdb: build with expat, add missing RRECOMMENDS_gdbserver
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
X-List-Received-Date: Sat, 07 Apr 2012 06:11:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/04/2012 11:06 AM, Martin Jansa wrote:
>>>>> 
>>>>> -EXPAT = "--with-expat" +EXPAT = "--with-expat
>>>>> --with-libexpat-prefix=${STAGING_DIR_HOST}"
>>>>> 
>>>>> helps..
>>> 
>>> OK. Can you please submit an incremental patch? I wonder why it
>>> didn't happen on my system, although I have libexpat-dev
>>> installed (Ubuntu).
> I've tested it only with target gdb (so I don't feel comfortable to
> send patch before testing -cross-canadian and -cross, but I don't
> have time for it now).
> 

This patch is good. So dont hesitate to send it.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk9/2GMACgkQuwUzVZGdMxSOAgCcCKwcG44tZMcTxkdY5tMgy2xj
qhYAnivdRqKDZoO4+lIjO9vPsX/lSCq1
=sMZh
-----END PGP SIGNATURE-----


