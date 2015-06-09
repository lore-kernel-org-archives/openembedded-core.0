Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6429F6AC43
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 15:50:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 09 Jun 2015 08:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,581,1427785200"; d="scan'208";a="584788765"
Received: from alefebvr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.29.139])
	by orsmga003.jf.intel.com with ESMTP; 09 Jun 2015 08:50:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 09 Jun 2015 16:50:11 +0100
Message-ID: <14493518.7eiJMhq6lQ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <CAJTo0LZ=bwCmkEQZez6eyhaR1aB7-DEs2x3JjLwYmkM6MHy-MQ@mail.gmail.com>
References: <CAMCfZKFgggP5Y21S58+jq8n_se3a3Tg06f2HTFTj8j0Go3ATUA@mail.gmail.com>
	<CAMCfZKGuZoHJGAYK4VgRM-q_GXWbn6VaEyrnnUFBvwXEdtMV2w@mail.gmail.com>
	<CAJTo0LZ=bwCmkEQZez6eyhaR1aB7-DEs2x3JjLwYmkM6MHy-MQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-qt5] Issue on linking qtwebengine
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
X-List-Received-Date: Tue, 09 Jun 2015 15:50:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 June 2015 16:14:41 Burton, Ross wrote:
> On 9 June 2015 at 15:53, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> > When qtwebengine compile task are running in parallel with another task I
> > get an "file not recognized: File format not recognized" error.
> > 
> > I put PARALLEL_MAKE="" but the compile task still uses all CPUs.
> 
> It's possible that qmake or whatever qtwebengine is using isn't respecting
> PARALLEL_MAKE.  I don't use qt so can't comment any further.

I believe internally it's using ninja since that's just inherited from 
Chromium, and yes that won't pay attention to PARALLEL_MAKE. Honestly if it 
can't cope with being built in parallel that's a bug that upstream should be 
fixing given that it does so by default - my advice would be to check upstream 
(at the very least, the Qt bugtracker) and see if there is a fix that can be 
applied.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

