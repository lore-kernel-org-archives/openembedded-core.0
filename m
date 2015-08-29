Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 86F78766DF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Aug 2015 11:35:35 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2015 04:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,429,1437462000"; d="scan'208";a="634501965"
Received: from fjclune-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.18.75])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2015 04:35:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Sat, 29 Aug 2015 12:35:34 +0100
Message-ID: <2282129.zWgJW2nO2n@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAJTo0Lajxi8GD6DP_s4n4i4BBnQ3Sxsy0eOoYnxtEWL56u8izQ@mail.gmail.com>
References: <1440805397-3775-1-git-send-email-ross.burton@intel.com>
	<1440805397-3775-2-git-send-email-ross.burton@intel.com>
	<CAJTo0Lajxi8GD6DP_s4n4i4BBnQ3Sxsy0eOoYnxtEWL56u8izQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] oeqa/runtime/multilib: change test case to use glib-2.0-utils
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
X-List-Received-Date: Sat, 29 Aug 2015 11:35:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 29 August 2015 00:54:10 Burton, Ross wrote:
> On 29 August 2015 at 00:43, Ross Burton <ross.burton@intel.com> wrote:
> > Using connman-applet as a multilib test case seems quite heavy due to the
> > numerous dependencies it has, whereas the same test ("do binaries get
> > swapped
> > correctly") can be done with a lower-level library containing binaries,
> > for
> > example glib-2.0.
> 
> Updating the related bug made me realise that this would mean adding logic
> to the autobuilder to handle new and old tests, so it really isn't worth it.

Why is that? Really the autobuilder should just be running all valid tests for 
the image and not have any knowledge of what tests are being run.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

