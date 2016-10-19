Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BBB14700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 19:28:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 19 Oct 2016 12:28:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,367,1473145200"; d="scan'208";a="1056253464"
Received: from jkursms-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.184.45])
	by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2016 12:28:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 20 Oct 2016 08:28:22 +1300
Message-ID: <13189364.vBheUieID7@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.7-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <alpine.LFD.2.20.1610191126290.16108@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610191112240.15586@ca624034.mitel.com>
	<alpine.LFD.2.20.1610191126290.16108@ca624034.mitel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how can i ask to keep all the generated "nativesdk" rpms?
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
X-List-Received-Date: Wed, 19 Oct 2016 19:28:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 19 Oct 2016 11:27:05 Robert P. J. Day wrote:
> On Wed, 19 Oct 2016, Robert P. J. Day wrote:
> >   not sure how dumb a question this is, but as i was doing a basic OE
> > 
> > build, i saw the growing number of "nativesdk" rpms piling up under
> > tmp/deploy/rpm/x86_64_linux, and wanted to examine a couple of them
> > later, but after the sysroot was (i assume) populated with all of
> > these rpms, that entire directory was deleted.
> > 
> >   is there a switch to preserve that directory? thanks.
> 
>   oh, wait, i think i found it:
> 
> SDKIMAGE_FEATURES += "package-management"
> 
> does that look right?

No, it doesn't. That's for turning on package management database in the SDK, 
which is not quite the same thing. The fact that those rpms are disappearing 
is a separate issue.

Are you using rm_work?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

