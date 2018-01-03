Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CFA8A7833C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 22:00:25 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w03LwLTh018725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 Jan 2018 21:58:22 GMT
Message-ID: <1515016700.5525.173.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Slater, Joseph" <joe.slater@windriver.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "BURTON, ROSS"
	<ross.burton@intel.com>
Date: Wed, 03 Jan 2018 21:58:20 +0000
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84D87A7007@ALA-MBC.corp.ad.wrs.com>
References: <20180102200049.44793-1-jslater@windriver.com>
	<1514933138.5525.101.camel@linuxfoundation.org>
	<e3528177-a042-0ac5-2a06-6cb9b279fd89@linux.intel.com>
	<007BD92917A2324FA403BCF9A464CF84D87A7007@ALA-MBC.corp.ad.wrs.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] allarch: do not set baselib
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
X-List-Received-Date: Wed, 03 Jan 2018 22:00:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-01-03 at 21:46 +0000, Slater, Joseph wrote:
> Currently, we do have to provide qemuwrapper with
> LD_LIBRARY_PATH.  We could hard-code all possible paths into that and
> not use ${libdir} and ${base_libdir}.  (I tried it and it works.)  We
> could also create a couple of new variables, like
> original_base_libdir, that don't get clobbered by allarch.   Maybe
> qemuwrapper should be smart enough to compute LD_LIBRARY_PATH...

I suspect somehow we therefore need to decouple qemuwrapper from the
target packages and just ensure that a separate script is available in
PATH when the rootfs is generated?

The rootfs should know which multilibs are enabled and be able to
generate the wrapper correctly?

Cheers,

Richard


