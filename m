Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3AEC57027F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 05:45:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Jul 2014 22:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,642,1400050800"; d="scan'208";a="541836994"
Received: from hpatters-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.246])
	by orsmga001.jf.intel.com with ESMTP; 10 Jul 2014 22:45:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Fri, 11 Jul 2014 06:45:48 +0100
Message-ID: <5076045.c5iu4589rZ@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.8-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <53BF3CF3.609@windriver.com>
References: <cover.1404869333.git.Chong.Lu@windriver.com>
	<b7aeaae2912f4cbaf11091a64c8c620574ec4e2d.1404869333.git.Chong.Lu@windriver.com>
	<53BF3CF3.609@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] classes/insane: Show QA check name
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
X-List-Received-Date: Fri, 11 Jul 2014 05:45:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chong,

On Friday 11 July 2014 09:25:07 Chong Lu wrote:
> On 07/09/2014 09:39 AM, Chong Lu wrote:
> > QA errors/warnings would show the name of the QA failure in the
> > error/warning message.> 
> > The format is listed:
> > 	[The name of QA] QA Issue: messages
> > 
> > You can see which QA check you need to disable if you want to disable it.

The way I had envisaged this being shown was <message> [QA check name]; since 
the message is the important part (in general we really want to encourage 
people to fix the QA issues rather than disabling them). This also matches up 
with gcc's warning message behaviour.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

