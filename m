Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYz0R-0006lP-67; Fri, 09 Dec 2011 12:52:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB9BjubI032178;
	Fri, 9 Dec 2011 11:45:56 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31402-07; Fri,  9 Dec 2011 11:45:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB9BjmPG032172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 9 Dec 2011 11:45:49 GMT
Message-ID: <1323431158.5309.126.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 09 Dec 2011 11:45:58 +0000
In-Reply-To: <4EE170C6.2070201@emagii.com>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
	<6c65669e1c223d59020c581750599c11ee222063.1323286080.git.elizabeth.flanagan@intel.com>
	<20111207215306.GE6351@sakrah.homelinux.org>
	<4EE170C6.2070201@emagii.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 4/8] Add copyleft compliance class --- MAJOR BREAKAGE!!!!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2011 11:52:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-09 at 03:21 +0100, Ulf Samuelsson wrote:
> On 2011-12-07 22:53, Khem Raj wrote:
> > On (07/12/11 11:34), Beth Flanagan wrote:
> >> From: Christopher Larson<kergoth@gmail.com>
> >>
> >> Deploys sources for recipes for compliance with copyleft-style licenses
> >> Defaults to using symlinks, as it's a quick operation, and one can easily
> >> follow the links when making use of the files (e.g. tar with the -h arg).
> >>
> >> By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.
> >>
> >> Signed-off-by: Christopher Larson<kergoth@gmail.com>
> >> ---
> >>   meta/classes/copyleft_compliance.bbclass |   94 ++++++++++++++++++++++++++++++
> >>   1 files changed, 94 insertions(+), 0 deletions(-)
> >>   create mode 100644 meta/classes/copyleft_compliance.bbclass
> >>
> >> diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
> >> new file mode 100644
> >> index 0000000..5d9ab11
> >> --- /dev/null
> >> +++ b/meta/classes/copyleft_compliance.bbclass
> >> @@ -0,0 +1,94 @@
> >> +# Deploy sources for recipes for compliance with copyleft-style licenses
> >> +# Defaults to using symlinks, as it's a quick operation, and one can easily
> >> +# follow the links when making use of the files (e.g. tar with the -h arg).
> >> +#
> >> +# By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.
> >> +#
> >> +# vi:sts=4:sw=4:et
> >> +
> >> +COPYLEFT_SOURCES_DIR ?= '${DEPLOY_DIR}/copyleft_sources'
> >> +
> >> +COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
> >> +COPYLEFT_LICENSE_INCLUDE[type] = 'list'
> >> +COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which include licenses'
> If the Ampersand is not accepted in the LICENSE string, then the recipes 
> below are broken.
> 
>  From my latest build, at least recipes with "&&" fail...
> This means that nothing really completes that I have tested.
> 
> MAJOR BREAKAGE!!!!
> 
> I think it would be better FIRST to fix the recipes, and then introduce 
> checking.

I think the single ampersand is accepted, the double might no longer be.
Certainly oe-core does continue to work. I hadn't realised there were
incompatibilities introduced by this patch :(

Not sure what we should do about this at this point, probably fix the
layers :/.

Cheers,

Richard





