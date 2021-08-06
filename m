Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web10.6845.1628266352970473066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 09:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=mwxrcI4Z;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id C2STmCnjCHBkXC2SUm0jOz; Fri, 06 Aug 2021 17:12:31 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=fI+iIaSe c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=MhDmnRu9jo8A:10 a=-An2I_7KAAAA:8 a=ugkhXdxtAAAA:8
 a=_enOPnqeAAAA:8 a=whRtrNdt0Wn0r-oXvA8A:9 a=CjuIK1q_8ugA:10 a=63wSdAoKnfsA:10
 a=KqUEti3kXUUA:10 a=eDHOid60NOgA:10 a=FZ_q8whQ1RAA:10 a=SIBqzdgODD4A:10
 a=VinBSYM5t5AA:10 a=Sq34B_EcNBM9_nrAYB9S:22 a=ZG-MjRxWnTTVGrJRUvVH:22
 a=XAbD3I9PDrnSMThV5XoS:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=TJhy6RbMnzSoZv3mMyRHHrBiMaYXTkJ5dYUAnT63e6o=; b=mwxrc
	I4ZQDgYuyzv6tl4YW8C/C0MFHEiCym2SUKYMvnfYWXhPGzffFpB1U0lmQkM27nhyL0r4lJcWO1ub2
	ccsWnYTu3TlBhRUeZmXVdy1xQOQy4Jz9mFuLRSzKD0A+A1Dj01vsqNgaoniu3BAD1/fXdhEzStY6G
	ZBQWTZn2hSCXXd72aWfHl5KT0Vx16EHyZh6GYKa6LvvmKmj2ZTAYdU71JtLpyLVcHR4fn7rGFlbOe
	K5dP3HJ10dhc8wCp/L+s3pBfB6ajphxe4nZR8zQux6T9QH/yYHsjbf3b4J3EBM4AZ8pGEyBAHmzL/
	0rLgkilNQJZO0RXyiXCRLQRbM6S7g==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mC2ST-0004H8-93; Fri, 06 Aug 2021 17:12:29 +0100
Date: Fri, 6 Aug 2021 17:12:29 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][dunfell 07/33] curl: Fix CVE-2021-22924 and CVE-2021-22925
Message-ID: <20210806161229.GA16017@mcrowe.com>
References: <cover.1628176985.git.steve@sakoman.com>
 <3631da82b3542df1c1e4bbd499fc2dbe67f5f3ec.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
In-Reply-To: <3631da82b3542df1c1e4bbd499fc2dbe67f5f3ec.1628176985.git.steve@sakoman.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfBOqjy1pNndbIh0e8rhv+P0c0/s5ghQtAIQ2TIsVPh9lC1+jNAKP6fCEHqq739DijRAO5VYfrdWJlS0fR7RMkD+ZK4r0Qh36a9mMaEI1eUQTbbNE32s9
 lWZEBB2fCJsJQeFzyLnmYkCgsClTtfpDLdYwqU+da2Y+vOdcY5WyMwXvoFd8wwTvN8QzesK0fmzgJw==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thursday 05 August 2021 at 05:33:44 -1000, Steve Sakoman wrote:
> From: Mike Crowe <mac@mcrowe.com>
> 
> curl v7.78 contained fixes for five CVEs:
> 
> CVE-2021-22922[1] and CVE-2021-22923[2] are only present when support
> for metalink is enabled. EXTRA_OECONF contains "--without-libmetalink"
> so these fixes are unnecessary.
> 
> CVE-2021-22926[3] only affects builds for MacOS.
> 
> CVE-2021-22924[4] and CVE-2021-22925[5] are both applicable. Take the
> patches from Ubuntu 20.04 curl_7.68.0-1ubuntu2.6 package which is close
> enough that the patch for CVE-2021-22924 applies without conflicts..

Now that you've added back the "== 2", I believe the final sentence is now
true for both patches. That may not be worth worrying about.

> 
> [1] https://curl.se/docs/CVE-2021-22922.html
> [2] https://curl.se/docs/CVE-2021-22923.html
> [3] https://curl.se/docs/CVE-2021-22926.html
> [4] https://curl.se/docs/CVE-2021-22924.html
> [5] https://curl.se/docs/CVE-2021-22925.html
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>

Mike.
