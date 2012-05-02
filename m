Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPhD8-0001NS-7z
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:35:46 +0200
Received: by pbbrq2 with SMTP id rq2so1409387pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 14:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=mzK5KfHDysywmJXvkAxVVnIh1yizRzRo15dB1XHRZww=;
	b=eEysNRPMrsZ14/yuOM0KwdshzLy+stXSn6MWJGkxx5WDq0bsWWCofd6tFhsxUrMUw+
	atfW7xdhJHSXuHoobc4rn0D9SJC4HmP0GzvMPYox/o9X90hQUkCIdEEK2F/+k5dNLzQu
	A7ohorTrwa+tMgKBRka7F+gbmmlFp6tfjZKbwEHJwSEm2DwBGbq1/gaEBeg9j4OFNkHg
	AaooK51Hc9u278PNHIvbGE9zxnqzzPkw8sdPJlwdGJiehBmGyKoYJexD76mjHpyZRtHM
	7TuKumTiz5vjo4etZlfbgpBk2Ox2v+ZkKKRXMq/lHevblKhL8xfZ1HJgaLbqDQ8Xfq7v
	j0OA==
Received: by 10.68.227.41 with SMTP id rx9mr1176365pbc.32.1335993960937;
	Wed, 02 May 2012 14:26:00 -0700 (PDT)
Received: from [172.23.3.173] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id vq9sm3020366pbc.18.2012.05.02.14.25.58
	(version=SSLv3 cipher=OTHER); Wed, 02 May 2012 14:25:59 -0700 (PDT)
Message-ID: <4FA1A663.2080302@gmail.com>
Date: Wed, 02 May 2012 14:25:55 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120411 Thunderbird/11.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
	<e8d5425f8ca14a0c0b7378a9202fd4c72761ea12.1335991900.git.raj.khem@gmail.com>
	<3279315.scVOi5yrOL@helios>
In-Reply-To: <3279315.scVOi5yrOL@helios>
X-Enigmail-Version: 1.4.1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] Enable PARALLEL_MAKE for testing
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
X-List-Received-Date: Wed, 02 May 2012 21:35:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/02/2012 02:12 PM, Paul Eggleton wrote:
> Rather than "for testing" it would be good to know that these fixes
> have been tested and proven before going in. I know quite a bit of
> testing with re- enabling PARALLEL_MAKE was done by you guys
> earlier - can you confirm this is the tested working set? If so can
> you make sure the commit message reflects this?


I have been testing them over a month and not a single time has it
shown a failure. I have been building them in different combination
and architectures/libcs I have been build with -j8, -j6 and TASK = 8
but I reckon I may not have convered all the possibilities however
from what I have seen it looks pretty good in shape.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+hpmMACgkQuwUzVZGdMxRosgCdG5jMaC7JvLNqmT9wSt7F/MFw
b0EAnAxId0b46ViGkszXyEiwbOOO2N0y
=AD8A
-----END PGP SIGNATURE-----


