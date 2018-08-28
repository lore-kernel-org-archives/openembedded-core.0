Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CDDD9784B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:10:05 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7S9A2kN007896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 28 Aug 2018 10:10:04 +0100
Message-ID: <ddceb5bb2230ea780e27601a1ba289dd69351ea3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, yang.wang@windriver.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 10:10:02 +0100
In-Reply-To: <39d4429f-e3c6-33fc-3073-8cea08d81794@windriver.com>
References: <20180518085550.92085-1-mingli.yu@windriver.com>
	<5B1E1444.9000407@windriver.com>
	<30f93af9-5a38-059e-184f-bbbe52a01105@windriver.com>
	<f248ce00-4c47-7a70-9902-585960c5ccd4@windriver.com>
	<39d4429f-e3c6-33fc-3073-8cea08d81794@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] boost: add ptest support
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
X-List-Received-Date: Tue, 28 Aug 2018 09:10:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-08-27 at 20:57 -0400, Randy MacLeod wrote:
> On 08/27/2018 06:17 PM, Yang Wang wrote:
> > Not sure if it's worth to run the Ptest on QEMU though, I also run
> > Ptest 
> > on SIMICS simulators, thousands of tests didn't get run, looks like
> > the 
> > result was not good as well.
> > 
> > Now my nightly Ptest runs on x86 device and gets consistent result
> > every 
> > day:
> > 
> >      2018-08-27T06:26 -- 2018-08-27T09:52
> >      Passed:  40518
> >      Failed:  289
> >      Skipped: 1876
> 
> Consistent results are good and > 90% pass rate is very good.
> What are the stats using qemux86-64 and/or simics?
> 
> I don't expect that qemu results would be as close to real hardware
> as Simics but it is quite good and freely available.

I think this is an example of where we may need to start adding "stage
2" testing to the autobuilder. The first stage tests would be enough to
get patches merged and be the faster ones, the second stage would be
the longer running things which we'd only trigger when stage one had
passed, maybe on milestone releases.

We'd put off doing this due to the old creaking codebase. With the new
autobuilder codebase, this should be much more straightforward to do...

boost ptest would be something I'd put in the second stage.

Cheers,

Richard

