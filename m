Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 975896FF72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 14:40:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 14 Mar 2016 07:40:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,335,1455004800"; d="scan'208";a="669296865"
Received: from vmresent-mobl10.ger.corp.intel.com (HELO
	jlock-mobl1.gar.corp.intel.com) ([10.252.3.41])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Mar 2016 07:40:35 -0700
Message-ID: <1457966429.3209.9.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 14 Mar 2016 14:40:29 +0000
In-Reply-To: <1457718092.2804.258.camel@linuxfoundation.org>
References: <cover.1457705106.git.joshua.g.lock@intel.com>
	<1457718092.2804.258.camel@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [RFC PATCH 0/3] Remove RPM 4
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
X-List-Received-Date: Mon, 14 Mar 2016 14:40:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-03-11 at 17:41 +0000, Richard Purdie wrote:
> On Fri, 2016-03-11 at 14:07 +0000, Joshua Lock wrote:
> > 
> > This series removes RPM 4 and code to support it from OE Core.
> > There
> > are
> > several known issues with using RPM 4 and it seems better to
> > acknowledge it's
> > unsupported by removing it from OE-Core than to leave  it in a non
> > -functional
> > state.
> > 
> > Please review the following changes for suitability for inclusion.
> > If
> > you have
> > any objections or suggestions for improvement, please respond to
> > the
> > patches. If
> > you agree with the changes, please provide your Acked-by.
> I think I'm in favour of removing it at this point as its not getting
> much attention.
> 
> I'd note that we need to remove the QA test for it:
> 
> selftest/imagefeatures.py:    def
> test_rpm_version_4_support_on_image(self):

Right, thanks for catching this. I've pushed a patch to remove this to
the same branch, I'll submit a v2 with this removal included once the
RFC has had another day or so to collect comments.


Regards,

Joshua

