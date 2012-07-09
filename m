Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SoEw8-0004OW-W8
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 16:27:41 +0200
Received: by pbbrq2 with SMTP id rq2so18319613pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=q6bR6wUTid0H1nC8dzG9zPU1c7c0c1CY/K6bqkInngM=;
	b=MSfaknQf0WkB4gUJEr3S4iH8ZuCzw2Ws0Az9zskAoP10hPJ+6yeB/6R2WdHPU+eAv9
	iLvfUA9TiS7NBT8W+rRrklRu2SI5jE9/lfgNukMq8VHvd4h7otKgCC/TrkpOOJH7xZYW
	LH8VfThtt8i+6C7oS8FDro2w34RWbm6g0/pYI8YauYN9VCoiEnU1cf/BEXrF6u8XdR8I
	oMonApMwWd30JOsvLt8uGNsV0D56JbEiayxuHo4fRdrPuF3tZlypMF+LfrE5ioSY2sq8
	2YV1UzO1bBZAkSqsnRaXzVx0HBPFYFC0NLBDJAfVJHncH9P8MjHlf7G4JMEy208sKuhw
	BTFg==
Received: by 10.68.226.38 with SMTP id rp6mr60310701pbc.90.1341843385373;
	Mon, 09 Jul 2012 07:16:25 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id oy8sm27795317pbc.52.2012.07.09.07.16.23
	(version=SSLv3 cipher=OTHER); Mon, 09 Jul 2012 07:16:24 -0700 (PDT)
Message-ID: <4FFAE7B7.1080804@gmail.com>
Date: Mon, 09 Jul 2012 07:16:23 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1341834900.8066.9.camel@ted>
In-Reply-To: <1341834900.8066.9.camel@ted>
X-Enigmail-Version: 1.4.2
Subject: Re: [PATCH] ccache: Ensure CCACHE_DIR is cleaned by do_clean task
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
X-List-Received-Date: Mon, 09 Jul 2012 14:27:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 7/9/2012 4:55 AM, Richard Purdie wrote:
> This ensures a rebuild does really build from scratch when ccache
> is in use.
> 
> [YOCTO #2696]
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org> 
> --- diff --git a/meta/classes/ccache.bbclass
> b/meta/classes/ccache.bbclass index 5aa2da2..cd06a4b 100644 ---
> a/meta/classes/ccache.bbclass +++ b/meta/classes/ccache.bbclass @@
> -4,3 +4,5 @@ CCACHE_DISABLE[unexport] = "1"
> 
> do_configure[dirs] =+ "${CCACHE_DIR}" do_kernel_configme[dirs] =+
> "${CCACHE_DIR}" + +do_clean[cleandirs] += "${CCACHE_DIR}"
> 

so will this remove all contents of .ccache dir ?
or just the package you are cleanall'ing
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/657cACgkQuwUzVZGdMxR6/gCeIFHIc01FiI5bCB5jiFaPev0/
VXkAn1V/VQEEfwQop6kt2/kgaei2A5yZ
=gYFM
-----END PGP SIGNATURE-----


