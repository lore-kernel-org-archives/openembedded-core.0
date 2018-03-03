Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9CBAA78A22
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 08:53:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w238rrYB007823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 3 Mar 2018 08:53:55 GMT
Message-ID: <1520067233.3436.34.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 03 Mar 2018 08:53:53 +0000
In-Reply-To: <20180302153220.16494-1-alexander.kanavin@linux.intel.com>
References: <20180302153220.16494-1-alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] perl: use parallel build where possible
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
X-List-Received-Date: Sat, 03 Mar 2018 08:53:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-03-02 at 17:32 +0200, Alexander Kanavin wrote:
> While the upstream just runs a number of make tasks hardcoded to a
> single thread
> in succession, we can add '-j n_threads' to a few of them. The
> benefit
> is real: on my machine the do_compile() time goes from 250 seconds to
> about 90.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-devtools/perl/perl_5.24.1.bb | 5 +++++
>  1 file changed, 5 insertions(+)

I like the idea of the patch but I think it triggered:

https://autobuilder.yocto.io/builders/nightly-world/builds/806/steps/BuildImages/logs/stdio

Cheers,

Richard


