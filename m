Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A20A373FE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 11:03:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 13 May 2015 04:03:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,420,1427785200"; d="scan'208";a="725219210"
Received: from drogers-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.14.115])
	by fmsmga002.fm.intel.com with ESMTP; 13 May 2015 04:03:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, ChenQi <Qi.Chen@windriver.com>
Date: Wed, 13 May 2015 12:03:29 +0100
Message-ID: <2966110.d7Dh0pOibD@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <5552B696.8010100@windriver.com>
References: <cover.1431411478.git.Qi.Chen@windriver.com>
	<187E6A9D-C952-418F-81BE-76D2E08AFDC3@gmail.com>
	<5552B696.8010100@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH V3 1/2] populate_sdk_ext: install the latest buildtools-tarball
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
X-List-Received-Date: Wed, 13 May 2015 11:03:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 13 May 2015 10:27:34 ChenQi wrote:
> On 05/13/2015 09:56 AM, Khem Raj wrote:
> >> On May 12, 2015, at 6:45 PM, ChenQi <Qi.Chen@windriver.com> wrote:
> >> 
> >> On 05/13/2015 12:19 AM, Khem Raj wrote:
> >>>> On May 11, 2015, at 11:19 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> >>>> 
> >>>> -	install
> >>>> ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUN
> >>>> E_PKGARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh
> >>>> ${SDK_OUTPUT}/${SDKPATH} +	# find latest buildtools-tarball and
> >>>> install it
> >>>> +	buildtools_path=`ls -t1
> >>>> ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUN
> >>>> E_PKGARCH}-buildtools-nativesdk-standalone-*.sh | head -n1` +	
install
> >>>> $buildtools_path ${SDK_OUTPUT}/${SDKPATH}
> >>> 
> >>> why not create a symink instead of poking using wild chars
> >> 
> >> Because it's simpler.
> > 
> > what happens if I touch an older installer ?
> 
> Hi Khem,
> 
> I make this patch to avoid installing a non-existent buildools-tarball.
> If we touch an old buildtools-tarball, the installation would still
> succeed. The touched one is installed.
> What would lead to a potential problem is the following situation.
> The user built buildtools-tarball, after one day, he modified key part
> of buildtools-tarball recipe, rebuilt it, and then he deliberately
> touched the old one, and then he built an ext SDK.
> I don't think that's a situation we need to take care of.
> But if you insist that we should, you can suggest a reasonable symlink
> name and I would make a new patch.

Honestly I don't see this is as being a problem we need to handle - who is 
going to touch this file during normal usage? Builds failing under the 
conditions described is a much more pressing issue at this point.

It could be that we should re-visit whether using buildtools-tarball rather 
than having its contents be part of the native portion of the SDK is the right 
approach. I'm not sure that we need to do that just at this moment though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

