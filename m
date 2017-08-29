Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D12A36AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 10:30:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7TAUG5B027814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 29 Aug 2017 11:30:17 +0100
Message-ID: <1504002616.32591.323.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anders Darander <anders@chargestorm.se>, Yeoh Ee Peng
	<ee.peng.yeoh@intel.com>
Date: Tue, 29 Aug 2017 11:30:16 +0100
In-Reply-To: <20170829082014.ncc3tkyjrlurnkbm@ad.chargestorm.se>
References: <1503946921-111882-1-git-send-email-ee.peng.yeoh@intel.com>
	<20170829082014.ncc3tkyjrlurnkbm@ad.chargestorm.se>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 29 Aug 2017 11:30:18 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane: add qa check for uppercase recipe name
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
X-List-Received-Date: Tue, 29 Aug 2017 10:30:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-08-29 at 10:20 +0200, Anders Darander wrote:
> Hi,
> 
> * Yeoh Ee Peng <ee.peng.yeoh@intel.com> [170829 04:11]:
> 
> > 
> > Since we disabled uppercase characters in overrides a few releases
> > ago, uppercase characters in recipe names (and for that matter,
> > distro
> > and machine names) cannot be supported due to their reliance upon
> > overrides including the name.
> > 
> > QA check will produce an warning message when it verify that recipe
> > name is uppercase.
> > 
> > [YOCTO# 11592]
> Could you add QA checks also for uppercase in machine and distro
> names?
> 
> When giving an on-site training last winter (using Morty), I helped
> the
> customer solve quite a few issues stemming from the fact that they
> had a
> machine name with uppercase letters in.
> 
> I know that the bug in question specifically talks about recipe name,
> though adding checks for them all would be even better, IMHO.

I'd just note that such checks would belong somewhere else like
sanity.bbclass rather than here (we can check once per config, not per
recipe).

Cheers,

Richard

