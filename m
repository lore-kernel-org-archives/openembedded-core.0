Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGPbR-0005jX-4M
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Apr 2012 08:58:29 +0200
Received: by pbcum15 with SMTP id um15so2679476pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 23:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:x-enigmail-version:content-type:content-transfer-encoding;
	bh=uk0hoOSWkKZx/evY0gOroIROJMZ3Gc0gqa320k6u5Fk=;
	b=Csc6o6feZ4dvFWG7884G6hK6Dae5x25gGeKhqK05R9MvFEIW3DIauc1ASVAUzKxoGt
	fSV1EXNtgnL3F1iZFsVLc3PxOIhTUKSPN7ZRc+pW4FNU3yN7TCqq98BOCBd0rvGkT3/q
	sJMShTN1J90OKqC+GHXyGvxnxNmqLXtCjeE3uqgM+2uIYLWaH5a9EFP1tJ7aSGnH8q7C
	wY17lBbApWqfWWCLDeqipC6faWehqR+sMfa7+Ni7b/KVEKhyB2dAlYr6uhvzlGpy8Mcs
	HoDvnVwk/pqICCnRPXyCVlBnLFA4JPVTry8eoKI8ySMp/amwerOPrDrw/Svy29r6MOQk
	hUJg==
Received: by 10.68.216.234 with SMTP id ot10mr1361616pbc.107.1333781354670;
	Fri, 06 Apr 2012 23:49:14 -0700 (PDT)
Received: from [192.168.1.79] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id v9sm8415439pbn.17.2012.04.06.23.49.12
	(version=SSLv3 cipher=OTHER); Fri, 06 Apr 2012 23:49:13 -0700 (PDT)
Message-ID: <4F7FE367.1020509@gmail.com>
Date: Fri, 06 Apr 2012 23:49:11 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120402 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.4
Subject: Adding --enable-checking=release to gcc
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
X-List-Received-Date: Sat, 07 Apr 2012 06:58:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I added the above option to gcc and did core-image-sato build to see
if I would gain some compile time performance.

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gcc-4.7&id=2d7004457a23c6c952f81e55b8ab7e3cc69bd905


The results were not very astounding but I do see some improvement

original

real    102m50.131s
user    437m7.463s
sys     67m29.237s


with --enable-checking=release

real    102m19.762s
user    439m41.749s
sys     66m10.376s

This was using shared state for native packages but cross packages
were all built too. overall gain in pecents will be more since we
would then
subtract the time it took to compile the cross tools.

This patch is for gcc-4.7 recipes as of now.

Thanks
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk9/42cACgkQuwUzVZGdMxS41wCfZb8YPP12HeWY35FGZINTc/+z
Ar0AniVM2osnwuPJFpgO2P/QrurW6HHl
=HzWp
-----END PGP SIGNATURE-----


