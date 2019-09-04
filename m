Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
	by mail.openembedded.org (Postfix) with ESMTP id AB01B7F265
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 14:57:25 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 46Nn3n73PWz5tlL;
	Wed,  4 Sep 2019 16:57:25 +0200 (CEST)
Date: Wed, 4 Sep 2019 16:57:24 +0200
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190904145724.w7tv6oorinwuxdhb@qschulz>
References: <20190903163241.87739-1-alex.kanavin@gmail.com>
	<20190904073239.rlk6spusid6m2zbd@qschulz>
	<CANNYZj_ZFESLDrUxU9XjjdTQXEp-awnq+-EJEavE32SqJOZSXA@mail.gmail.com>
	<20190904125538.c6f6mz6cwcz56ebr@qschulz>
	<CANNYZj_N9hz-mwKPofSUY7Lrf-L9B2Ep+z1sbCcL9wdhtBP0Gw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_N9hz-mwKPofSUY7Lrf-L9B2Ep+z1sbCcL9wdhtBP0Gw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: allow shell-style wildcards in PRIVATE_LIBS
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
X-List-Received-Date: Wed, 04 Sep 2019 14:57:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Wed, Sep 04, 2019 at 04:52:10PM +0200, Alexander Kanavin wrote:
> On Wed, 4 Sep 2019 at 14:55, Quentin Schulz <
> quentin.schulz@streamunlimited.com> wrote:
> 
> > So we just need to invert the logic actually.
> >
> > matched = False
> > for pattern in private_libs:
> >         if fnmatch.fnmatch(this_soname, pattern)]) == 0:
> >                 matched = True
> >                 break
> >
> > if not matched:
> >         sonames.add(prov)
> >
> 
> I think you are looking for the "for...else" feature in Python :) Still,

I'm discovering this one, thanks!

> the original code is not adding any lines at all while yours adds eight so
> I'd just keep the patch as it is.
> 

Added lines vs added execution time.

Anyway, glad to have this feature one day in Yocto, I was about to use
it in some project and was upset for having to name each and every lib
in the package.

Thanks!
Quentin
-- 
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
quentin.schulz@streamunlimited.com, www.streamunlimited.com

