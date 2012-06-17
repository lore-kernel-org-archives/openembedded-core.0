Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SgNcE-0000wT-G8
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 00:06:39 +0200
Received: by pbbrq2 with SMTP id rq2so6969728pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2012 14:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=sBt1vrZlDUKJn3ROGWdrjiRe6SF/lQ8M6AUWzbnw6pc=;
	b=w0dhjMPU7Z3HNcuJ3sBCSI+fbo1y5MBi7J5e99IVqGrOr8F4ltpQLY+Ak5IOKqTV7y
	aU4Gusmq/Baye+mKLoWrCHG1at/RHv3iChpMuSw2Si/P5Sgc9QMCga46CfWyQNjYh2Nd
	6kJralbDiLqpX1skcO/bfk2XlnHAKDRmLWFzjRS4rOKapJtf/kZm2sM6h6NqnFB7HPnX
	dqmp3aDMSg7di+FpKHxuVCgkDLqLAhyoCrgWF0KUqDej7ad6zqp3P+SQtzOb7PSLPllY
	Duk9CFp0zdAmxNr9TY6BymELeTZu9apdoYQpq4DTaQd5I0oJnxyMIJvvfAvjZVYaReMz
	z14A==
Received: by 10.68.223.138 with SMTP id qu10mr45340612pbc.50.1339970156174;
	Sun, 17 Jun 2012 14:55:56 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id vp4sm21432714pbc.61.2012.06.17.14.55.53
	(version=SSLv3 cipher=OTHER); Sun, 17 Jun 2012 14:55:54 -0700 (PDT)
Message-ID: <4FDE5268.6080603@gmail.com>
Date: Sun, 17 Jun 2012 14:55:52 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339799869.git.dvhart@linux.intel.com>
	<4FDCFEFB.3090004@linux.intel.com>
	<5351B318-5055-410D-91E9-7A0460FC451D@dominion.thruhere.net>
	<2995235.0tdnUIKyVU@helios>
In-Reply-To: <2995235.0tdnUIKyVU@helios>
X-Enigmail-Version: 1.4.2
Subject: Re: [PATCH 1/1] busybox: Include setsid and cttyhack in defconfig
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
X-List-Received-Date: Sun, 17 Jun 2012 22:06:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/17/2012 2:14 PM, Paul Eggleton wrote:
> Firstly, I think when Darren said "meta-intel" he meant to say
> "meta-yocto" which is where the poky-tiny distro config can be
> found (and indeed that is where I would expect to find it).

meta-yocto is then a distro layer as well as machine layer since the
reference yocto hardware are defined in same layer. and since
poky/poky-tiny are the distro policies for yocto I agree it makes
sense to have the busybox change in meta-yocto
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/eUmgACgkQuwUzVZGdMxTbqgCdFpLtxa/Oj5fetSrLF6o50cQD
AgUAn1ljKN78+6+6H0fAz5+9iN0M5JVx
=AKm1
-----END PGP SIGNATURE-----


