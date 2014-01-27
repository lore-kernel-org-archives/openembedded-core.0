Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9EFE56E719
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 22:50:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 27 Jan 2014 14:50:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,731,1384329600"; d="scan'208";a="465612855"
Received: from dmilliga-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.55])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jan 2014 14:50:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 27 Jan 2014 22:50:01 +0000
Message-ID: <2100717.4T6aPSkm6s@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <CAK18fxFEFSd_zBwCLzgu_0p5U4E0kT2ojHF4j6gagqSnfEpD8A@mail.gmail.com>
References: <1387298031-15180-1-git-send-email-andrei@gherzan.ro>
	<CA+0k_w968Jt7sQktJnH9PLrxnLqs6pF37S6tba8PYn=QksoqNA@mail.gmail.com>
	<CAK18fxFEFSd_zBwCLzgu_0p5U4E0kT2ojHF4j6gagqSnfEpD8A@mail.gmail.com>
MIME-Version: 1.0
Cc: Alexandru Niculita <alexnick87@gmail.com>,
	openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libsdl: Add support for libsdl-native
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
X-List-Received-Date: Mon, 27 Jan 2014 22:50:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 27 January 2014 22:29:09 Andrei Gherzan wrote:
> On Jan 27, 2014 12:20 PM, "Alexandru Niculita" <alexnick87@gmail.com> wrote:
> > Hi,
> > 
> > I could not find a way to avoid using TexturePacker.
> > TexturePacker is used by XMBC to compile all images used
> >  in a skin into a single file.
> > 
> > I took the info from here:
> http://wiki.xbmc.org/index.php?title=TexturePacker

Without having looked at the source code, they don't give much in the way of 
detail as to what it actually does. I wonder if it could be replicated with a 
python script using PIL or similar.

> Would be great to have this soon so we can have xbmc support.

Well, if we truly have to have libsdl-native then we have to find a way to 
mitigate the QEMU problems that building that will trigger, which probably 
means preventing it from finding that in the sysroot. I'm not sure whether this 
will be an acceptable solution from an OE-Core perspective but I can't think 
of any other (other than writing an equivalent to TexturePacker that doesn't 
use SDL or anything that requires SDL).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

