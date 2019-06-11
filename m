Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp7.bon.at (bsmtp7.bon.at [213.33.87.19])
	by mail.openembedded.org (Postfix) with ESMTP id 9F4037E659
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 14:52:16 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp7.bon.at (Postfix) with ESMTPSA id 45NXz52V68z5tlB;
	Tue, 11 Jun 2019 16:52:17 +0200 (CEST)
Date: Tue, 11 Jun 2019 16:52:16 +0200
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190611145216.2766qintxmm3pkwr@qschulz>
References: <20190611142607.18038-1-quentin.schulz@streamunlimited.com>
	<20190611142607.18038-2-quentin.schulz@streamunlimited.com>
	<CAJTo0Lb2E-yTtJaWE5ezF-jTNpVXKyWD0i5xhJY8rrnzxfrjhw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb2E-yTtJaWE5ezF-jTNpVXKyWD0i5xhJY8rrnzxfrjhw@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Jun 2019 14:52:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Tue, Jun 11, 2019 at 03:49:31PM +0100, Burton, Ross wrote:
> On Tue, 11 Jun 2019 at 15:27, Quentin Schulz
> <quentin.schulz@streamunlimited.com> wrote:
> > +from oeqa.core.decorator.oeid import OETestID
> 
> This was removed a while ago, can you rebase the patches on top of
> master please?
> 
> In this case you can just remove the import, but please verify the
> behaviour with master.
> 

Sorry for the noise, apparently forgot to pull master and didn't even
see my patch was already there *sigh*.

I'll remove the import and test on master with and without the patch you
already merged.

Do you want me to send a v5 or a separate patch series is better for
you?

Quentin
-- 
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
quentin.schulz@streamunlimited.com, www.streamunlimited.com

