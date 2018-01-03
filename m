Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 042787833C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 21:56:18 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w03LuAaT018572
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 Jan 2018 21:56:11 GMT
Message-ID: <1515016570.5525.171.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Joe Slater
	<jslater@windriver.com>, openembedded-core@lists.openembedded.org, "Burton,
	Ross" <ross.burton@intel.com>
Date: Wed, 03 Jan 2018 21:56:10 +0000
In-Reply-To: <e3528177-a042-0ac5-2a06-6cb9b279fd89@linux.intel.com>
References: <20180102200049.44793-1-jslater@windriver.com>
	<1514933138.5525.101.camel@linuxfoundation.org>
	<e3528177-a042-0ac5-2a06-6cb9b279fd89@linux.intel.com>
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
X-List-Received-Date: Wed, 03 Jan 2018 21:56:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-01-03 at 10:43 +0200, Alexander Kanavin wrote:
> On 01/03/2018 12:45 AM, Richard Purdie wrote:
> > 
> > Sorry, but I don't think this can work :/.
> > 
> > Do the sstate sig selftests pass with this change?
> > 
> > I appreciate this will make some things "work" but it will mean
> > that
> > allarch packages rebuild for each architecture or multilib and that
> > isn't right either.
> > 
> > So we need a better solution here. Why do we need libdir paths to
> > run
> > binaries anyway? Is this a libexec issue? Perhaps the things in
> > question shouldn't be allarch?
>
> I think Ross has spent some time developing a fix for this same
> issue, perhaps he can chime in?

I think he did, I think I also pointed him at the sstate signature
tests and that caused some problems. Ross may be able to elaborate
more...

Cheers,

Richard

