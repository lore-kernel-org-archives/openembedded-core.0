Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6B79A60119
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:45:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 06 Jul 2016 18:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,322,1464678000"; d="scan'208";a="1017010964"
Received: from lynhueyo-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.219])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2016 18:45:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 07 Jul 2016 13:45:13 +1200
Message-ID: <4148817.v0aE1nWUOy@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-202.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAMKF1sonCKidrVKfLWekD6=-VMChoWxXUUmTWfaAwgpQZx2ahA@mail.gmail.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
	<2e1423fa0b0ac6bf9facbe5e9ed9df1051ccd6fa.1467849364.git.paul.eggleton@linux.intel.com>
	<CAMKF1sonCKidrVKfLWekD6=-VMChoWxXUUmTWfaAwgpQZx2ahA@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] lib/oe/patch: handle encoding differences in patch files
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
X-List-Received-Date: Thu, 07 Jul 2016 01:45:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 06 Jul 2016 17:40:03 Khem Raj wrote:
> On Wed, Jul 6, 2016 at 4:57 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > With Python 3, the encoding of a file is significant; several recipes in
> > OE-Core have patches which are not fully utf-8 decodable e.g. man,
> > lrzsz, and gstreamer1.0-libav, leading to errors when using devtool's
> > modify, upgrade or extract subcommands on these recipes. To work around
> > this, try reading the patch file as utf-8 first and if that fails try
> > latin-1 before giving up.
> 
> while this makes devtool robust. I think it will also be a good
> opportunity to inform
> the user/developer of the utf-8 non compliant file and may be a hint
> on how to fix it if possible

Sure, I could easily have it print a warning, but I'm not sure this is going 
to be fixable for all cases. If the patch header is the source of the non-UTF8 
characters then it's easy, but what about if the code being patched has non-
UTF8 encoding? Surely in that case the patch has to correspond?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

