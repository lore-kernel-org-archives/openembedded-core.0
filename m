Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 24E437A33D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Oct 2018 12:07:29 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w91C7QmA017855
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 1 Oct 2018 13:07:27 +0100
Message-ID: <829f16e68431d6fbeda54d3a16709ab47552589a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org, ross.burton@intel.com
Date: Mon, 01 Oct 2018 13:07:26 +0100
In-Reply-To: <1538289574-19536-1-git-send-email-hongxu.jia@windriver.com>
References: <1538289574-19536-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] openssl: fix ptest case `test_symbol_presence' failed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Oct 2018 12:07:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-09-30 at 14:39 +0800, Hongxu Jia wrote:
> The case in ptest use `nm -Pg libcrypto.so.1.1' to check symbol
> presence,
> hence we need to inhibit package split and package debug split.
> 
> The binutils provides `nm', hence add it to ptest runtime depends.
> (Without `nm', the test_symbol_presence will be skipped, that's the
> reason why ptest passed on a small image, and failed on a full image)
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1.bb | 6 ++++++
>  1 file changed, 6 insertions(+)

Breaking packaging when enabling ptest is not a nice or desirable
behaviour. I'd actually much rather just disable this test, or tweak it
to work on the -dbg package. Does the test pass if the dbg package is
installed?

Cheers,

Richard


