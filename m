Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CEC59786BA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jan 2018 09:09:36 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0E99KAR025077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 14 Jan 2018 09:09:24 GMT
Message-ID: <1515920960.29722.191.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Amanda Brindle <amanda.r.brindle@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 14 Jan 2018 09:09:20 +0000
In-Reply-To: <cover.1513634861.git.amanda.r.brindle@intel.com>
References: <cover.1513634861.git.amanda.r.brindle@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH 0/2]
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
X-List-Received-Date: Sun, 14 Jan 2018 09:09:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-12-18 at 14:12 -0800, Amanda Brindle wrote:
> The following changes since commit
> b73e96e7f3f5d1ba3a221d99792a7a3c7ef42c21:
> 
>   python-scons: upgrade to v3.0.1; use pypi.bbclass (2017-12-13
> 14:00:52 +0000)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib abrindle/rprovides
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abrindle/r
> provides
> 
> Amanda Brindle (2):
>   oe-pkgdata-util: Refactor functions for consistency
>   oe-pkgdata-util: Add support for RPROVIDES
> 
>  scripts/oe-pkgdata-util | 173 +++++++++++++++++++++++++++-----------
> ----------
>  1 file changed, 97 insertions(+), 76 deletions(-)

Hi Amanda,

I pulled these into master-next for testing but we saw:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/753/steps/Running%20oe-selftest/logs/stdio

You can reproduce with:

oe-selftest -r pkgdata.OePkgdataUtilTests

Cheers,

Richard

