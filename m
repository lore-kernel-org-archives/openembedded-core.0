Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8564B782A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 10:47:42 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1SAlfHf027550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 28 Feb 2018 10:47:43 GMT
Message-ID: <1519814861.3436.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Matt Madison
	<matt@madison.systems>
Date: Wed, 28 Feb 2018 10:47:41 +0000
In-Reply-To: <CAP9ODKpB38Kpfj3EUdGNM+dL_A0VM03mP0isV4Vg_0DZ8Jw14w@mail.gmail.com>
References: <20180227123634.2812-1-matt@madison.systems>
	<CAP9ODKpB38Kpfj3EUdGNM+dL_A0VM03mP0isV4Vg_0DZ8Jw14w@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/8] go1.10 update and misc improvements
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
X-List-Received-Date: Wed, 28 Feb 2018 10:47:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-02-27 at 14:16 -0300, Otavio Salvador wrote:
> On Tue, Feb 27, 2018 at 9:36 AM, Matt Madison <matt@madison.systems>
> wrote:
> > 
> > New in v2:
> >     * Fixed Upstream-Status line in go patches
> >     * Added GOTMPDIR to do_configure[dirs]
> > 
> > Updates to the go recipes and bbclasses for go1.10, which
> > moves the bulk of the toolchain bootstrap and build out
> > of the 'make.bash' script and to the 'dist' tool.  This
> > required a rework of the patches.
> > 
> > go1.10 introduces significant changes to the go build
> > tool as well, requiring some further patches to make
> > it work for OE builds.
> > 
> > See https://golang.org/doc/go1.10 for a complete list
> > of new features and changes.
> > 
> > Following the update are some cleanup/improvement
> > patches.
> I tested those patches and they are working fine. I pinged Matt
> specifically about one patch that seems that could be simplified. So
> please wait until we get back on this before merging it.
> 
> If possible to put this on MUT so we see if any issue is raised up,
> it'd be good as well :-)

I tested it in -next, one issue:

FAIL: test_go_dep_build (gotoolchain.oeGoToolchainSelfTest)

from https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/8
57/steps/Running%20oe-selftest/logs/stdio

(can reproduce with oe-selftest -r
gotoolchain.oeGoToolchainSelfTest.test_go_dep_build)

Cheers,

Richard

