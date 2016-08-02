Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B2BD36612D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 10:38:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 02 Aug 2016 03:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,459,1464678000"; d="scan'208";a="1028228732"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 02 Aug 2016 03:38:23 -0700
Date: Tue, 2 Aug 2016 13:38:06 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20160802103805.GA15102@mbabyjoh-desk.ger.corp.intel.com>
References: <1470065689-27089-1-git-send-email-maxin.john@intel.com>
	<CAHiDW_GZOaN8u00PtXu=K=5eQSDE_AfaBrACC0nRP9bEsVVd3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHiDW_GZOaN8u00PtXu=K=5eQSDE_AfaBrACC0nRP9bEsVVd3Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] piglit: fix build failure with gold linker
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
X-List-Received-Date: Tue, 02 Aug 2016 10:38:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jussi,

>On Tue, Aug 02, 2016 at 01:09:31PM +0300, Jussi Kukkonen wrote:
>>On 1 August 2016 at 18:34, Maxin B. John <maxin.john@intel.com> wrote:
>>
<snip>
>> PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
>> +LDFLAGS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-ldl', '', d)}"
>>
>
> I think we should fix this with a build system patch and send it upstream -- the problem only
> shows up with gold but it looks like a real bug.
>
Agree, this looks like the best way to fix this bug. Please ignore this patch.  

>Jussi

Best Regards,
Maxin

