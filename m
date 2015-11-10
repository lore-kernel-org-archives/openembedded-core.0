Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 318FA77145
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:31:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 10 Nov 2015 06:31:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,270,1444719600"; d="scan'208";a="847002924"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.0.72])
	by orsmga002.jf.intel.com with ESMTP; 10 Nov 2015 06:31:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Nov 2015 14:31:24 +0000
Message-ID: <1929406.Q4ZYjuCYAr@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.10-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <CAHiDW_Hu4q_K9QW7S44-0DM=ZgZDu1nr4gKZFv4rEJzjtHTiXA@mail.gmail.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641F042.5080704@linux.intel.com>
	<CAHiDW_Hu4q_K9QW7S44-0DM=ZgZDu1nr4gKZFv4rEJzjtHTiXA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 08/29] python-pygtk: remove the recipe
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
X-List-Received-Date: Tue, 10 Nov 2015 14:31:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 10 November 2015 16:18:00 Jussi Kukkonen wrote:
> On 10 November 2015 at 15:25, Alexander Kanavin <
> 
> alexander.kanavin@linux.intel.com> wrote:
> > On 11/10/2015 03:13 PM, Jussi Kukkonen wrote:
> >> Are the pygtk changes directly related to the introspection changes? If
> >> not then maybe they should happen in another patch set.
> > 
> > They are; pygtk requires an old (2.x) non-introspection based version of
> > pygobject, and the introspection patchset updates pygobject to latest 3.x
> > release which is a much thinner layer on top of libgirepository and is
> > incompatible with pygtk.
> 
> Oh I see that now: It's patch 23 in the series for anyone else looking. I
> think this should be pointed out more visibly: the patchset essentially
> removes gtk2 python support, a feature we've had so far.
> 
> Maintaining python-gobject-2 and python-gtk-2 should be possible alongside
> the GI-based versions, but A) it only makes sense if there's real demand
> and B) it obviously doesn't have to happen in oe-core.

Note that this does mean we will no longer be able to build a build-appliance-
image that includes Hob, since that requires PyGTK 2. However that's probably 
fine as Hob is deprecated already and is supposed to be going away in the 2.1 
release (to be effectively replaced by Toaster, once the latter's functionality 
is on par). I just wanted to make a note of this since if nothing else this 
change will force us to consider what we're going to do with the build 
appliance going forward.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

