Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 249AB6CE09
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 15:35:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2014 07:31:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,691,1384329600"; d="scan'208";a="441715961"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.239])
	by orsmga001.jf.intel.com with ESMTP; 20 Jan 2014 07:35:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Mon, 20 Jan 2014 15:35:43 +0000
Message-ID: <3689607.VoMDkuYTJy@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.7-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <1390231901.2441.5.camel@e130.pbcl.net>
References: <1390231901.2441.5.camel@e130.pbcl.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image: Add kmod-native to DEPENDS
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
X-List-Received-Date: Mon, 20 Jan 2014 15:35:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Phil,

On Monday 20 January 2014 15:31:41 Phil Blundell wrote:
> We will run depmod so we need it to be in the sysroot.  (We do depend on
> depmodwrapper-cross already but this doesn't have any dependency on
> depmod itself.)

Perhaps I'm not grasping the subtleties but shouldn't the dependency be added 
to depmodwrapper-cross rather than here?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

