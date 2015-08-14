Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2A88772A78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 11:01:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 14 Aug 2015 04:01:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="784055913"
Received: from apaulaux-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.160])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2015 04:01:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	Patrick Ohly <patrick.ohly@intel.com>
Date: Fri, 14 Aug 2015 12:01:16 +0100
Message-ID: <12971906.mb086C5zve@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.3-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAJTo0LbnRjSYpz5F41QjR_93Ex0YdVH+QKQChbRTGLXGrRumBQ@mail.gmail.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<616705173b62954740a1893c672c67eb5ce088f2.1439281753.git.patrick.ohly@intel.com>
	<CAJTo0LbnRjSYpz5F41QjR_93Ex0YdVH+QKQChbRTGLXGrRumBQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] tar-replacement-native: avoid race condition with host tar
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
X-List-Received-Date: Fri, 14 Aug 2015 11:01:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 14 August 2015 11:47:16 Burton, Ross wrote:
> On 11 August 2015 at 09:44, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > Installing "tar" into the sysroot leads to race conditions
> > (tasks which do not depend on tar-replacement-native may already
> > call tar while it's installation is incomplete). Avoid those
> > by installing only the tar binary under the name tar-native.
> 
> So the point of tar-replacement-native was that it's a *replacement* for
> the host tar, so it needs the same name.  If it was to be installed as an
> opt-in alternative there's a mechanism for doing that already (see
> EXTRANATIVEPATH) but that would break the purpose of tar-replacement-native.
> 
> I think for this situation you should show how to enable xattrs for images,
> with the caveat that if your host tar isn't suitable the user should
> bitbake just tar-replacement-native *first*.

Or install the buildtools perhaps.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

