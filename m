Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F41E8706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:54:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Feb 2015 09:54:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,632,1418112000"; d="scan'208";a="682125389"
Received: from afedko-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.4.45])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2015 09:54:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 23 Feb 2015 17:54:37 +0000
Message-ID: <5866784.j6W0KFP0Zl@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <CAP9ODKqa+7EZ_4hw=_-XOgQMyxeiSRRMAcXrGVpKwXLcLLrNPw@mail.gmail.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
	<dbb562e543729b016d4a31ceaf08da3abb24f267.1424709353.git.paul.eggleton@linux.intel.com>
	<CAP9ODKqa+7EZ_4hw=_-XOgQMyxeiSRRMAcXrGVpKwXLcLLrNPw@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] populate_sdk_ext: add extensible SDK
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
X-List-Received-Date: Mon, 23 Feb 2015 17:54:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 23 February 2015 14:41:34 Otavio Salvador wrote:
> On Mon, Feb 23, 2015 at 2:00 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > From: Randy Witt <randy.e.witt@linux.intel.com>
> > 
> > This bbclass will create an SDK with a copy of bitbake and the metadata
> > and sstate for the target specified for the task. The idea is to let
> > "system" developers both work on applications and then test adding them
> > to an image without having to switch between workspaces or having to
> > download separate items.
> > 
> > Rather than running bitbake directly however, the primary way of running
> > builds within the extensible SDK is to use the "devtool" command. The
> > rest of the build system is fixed via locked shared state signatures,
> > and thus only the recipes you have added get built.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> 
> Why another class? it could be tuned using SDKIMAGE_FEATURES

If you look at what the class does it would be a bit messy to do it that way - 
I wanted to get something working with minimal impact. I don't doubt
that it could be implemented as an SDKIMAGE_FEATURES item though
with extra work.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

