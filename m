Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp7.bon.at (bsmtp7.bon.at [213.33.87.19])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6417D2AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 15:06:00 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp7.bon.at (Postfix) with ESMTPSA id 45NYGx588Nz5tlP;
	Tue, 11 Jun 2019 17:06:01 +0200 (CEST)
Date: Tue, 11 Jun 2019 17:06:00 +0200
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190611150600.xxvrht4lkpoemm3m@qschulz>
References: <20190611142607.18038-1-quentin.schulz@streamunlimited.com>
	<20190611142607.18038-2-quentin.schulz@streamunlimited.com>
	<CAJTo0Lb2E-yTtJaWE5ezF-jTNpVXKyWD0i5xhJY8rrnzxfrjhw@mail.gmail.com>
	<20190611145216.2766qintxmm3pkwr@qschulz>
	<20190611145605.ncwvewkse7cutcuu@qschulz>
	<CAJTo0LYXr0VSCAVCKLfGpzFkUWiJ0fRgCgr2CJQg4D8mXx51qw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYXr0VSCAVCKLfGpzFkUWiJ0fRgCgr2CJQg4D8mXx51qw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Adrian Bunk <bunk@stusta.de>, andriy.danylovskyy@streamunlimited.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] selftests: add tests for INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Tue, 11 Jun 2019 15:06:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2019 at 03:57:23PM +0100, Burton, Ross wrote:
> On Tue, 11 Jun 2019 at 15:56, Quentin Schulz
> <quentin.schulz@streamunlimited.com> wrote:
> > Also, I factored out everything into a function that shouldn't be run as
> > a test but when doing:
> > oe-selftest --run-tests incompatible_lic.IncompatibleLicenseTests
> > it tries to run the function and thus fails the test. Is that okay? if
> > not, how do you usually proceed?
> 
> So Python unittest's behaviour is that any function called test_*() is
> a test case and is executed, so just don't name any helper functions
> like this test_*.
> 

Ah, that's what I was missing. Thanks.

Quentin
-- 
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
quentin.schulz@streamunlimited.com, www.streamunlimited.com

