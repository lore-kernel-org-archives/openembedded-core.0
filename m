Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D450E6C6EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 09:26:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBD9Qdn7025695; Fri, 13 Dec 2013 09:26:39 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SQYCOH1OcE6e; Fri, 13 Dec 2013 09:26:39 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBD9QYQf025684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 13 Dec 2013 09:26:36 GMT
Message-ID: <1386926789.20901.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 13 Dec 2013 09:26:29 +0000
In-Reply-To: <52AAA463.5040100@windriver.com>
References: <cover.1386752561.git.liezhi.yang@windriver.com>
	<1386771992.4332.76.camel@ted> <1386772701.4332.80.camel@ted>
	<52A95C72.3030605@windriver.com> <1386891243.504.47.camel@ted>
	<52AAA463.5040100@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 000/122 V2] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Fri, 13 Dec 2013 09:26:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-12-13 at 14:08 +0800, Robert Yang wrote:
> 
> On 12/13/2013 07:34 AM, Richard Purdie wrote:
> > On Thu, 2013-12-12 at 14:49 +0800, Robert Yang wrote:
> >
> > Other than the patches I've mentioned, things should be merged in the
> > dora branch. We've found some build issues. I've pushed a fix for the
> > qt3 one, we also have one with lttng-modules which we don't have a fix
> > for yet.
> >
> 
> Hi RP,
> 
> For the failure of lttng-modules, it seemed the auto builder didn't take
> the patches that I had sent to poky@yoctoproject.org:
> 
> [poky] [PATCH 2/3] [dora] meta-yocto-bsp: update SRCREVs for 3.10.17 and 
> beagleboard fixes
> 
> Would you please help to merge it (them) ?
> 
> The branch robert/dora-next-oecore only contains the patches for oe-core,
> while the robert/dora-next contains patches for bitbake, oe-core and
> meta-yoctoX, I'm sorry that I didn't explain this clearly.

Sorry I missed the meta-yocto changes. I've merged these now.

Cheers,

Richard


