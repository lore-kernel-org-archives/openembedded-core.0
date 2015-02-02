Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2C36018F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 17:00:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2015 09:00:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,507,1418112000"; d="scan'208";a="521399931"
Received: from bbodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.158])
	by orsmga003.jf.intel.com with ESMTP; 02 Feb 2015 08:52:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 02 Feb 2015 17:00:08 +0000
Message-ID: <1570155.OaRLeKE1VZ@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <CAK18fxFLTqDLfWp1rz+56BUY0M05KnQZgMfRO70VTnt+m8Vp0Q@mail.gmail.com>
References: <CAK18fxFLTqDLfWp1rz+56BUY0M05KnQZgMfRO70VTnt+m8Vp0Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: libpng 1.6.16 fetch fails
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
X-List-Received-Date: Mon, 02 Feb 2015 17:00:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andrei,

On Friday 30 January 2015 21:23:14 Andrei Gherzan wrote:
> After the latest libpng update, the source link seems broken.
> 
> WARNING: Checksum failure encountered with download of
> http://downloads.sourceforge.net/project/libpng/libpng16/1.6.16/libpng-1.6.1
> 6.tar.xz - will attempt other sources if available
> WARNING: Renaming
> /home/agherzan/work/personal/yocto/downloads/libpng-1.6.16.tar.xz to
> /home/agherzan/work/personal/yocto/downloads/libpng-1.6.16.tar.xz_bad-checks
> um_b2e23b153fad3034ec48336f81eefd33 ERROR: Fetcher failure for URL: '
> http://downloads.sourceforge.net/project/libpng/libpng16/1.6.16/libpng-1.6.1
> 6.tar.xz'. Checksum mismatch!

I just tried bitbake -c cleanall libpng; bitbake -c fetch libpng and it works 
here, as does using wget directly on the URL you pasted above. Are you sure 
this wasn't an intermittent error? Alternatively are you behind a firewall or 
proxy which is blocking the download?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

