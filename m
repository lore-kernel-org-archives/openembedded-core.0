Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id EC79F71AB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 11:09:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 10 May 2017 04:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="966764436"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 10 May 2017 04:09:51 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<9228554.pYdVeCRJpP@peggleto-mobl.ger.corp.intel.com>
	<37bc3fea-105c-a22f-9386-0b0f440bd118@linux.intel.com>
	<2037301.7Ncc1v2UnL@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <242ad7f7-4e04-7cac-fd3d-6fabd9b43c65@linux.intel.com>
Date: Wed, 10 May 2017 14:09:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <2037301.7Ncc1v2UnL@peggleto-mobl.ger.corp.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Wed, 10 May 2017 11:09:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2017 01:55 PM, Paul Eggleton wrote:
> I make no secret of it - I am a Qt supporter. I'm willing to be convinced
> that's not the right answer, though, if there are solid arguments. However, if
> you'll excuse my paraphrasing, "it's not in OE-Core and can't be, therefore we
> should just ignore it" isn't a case against it, it's a logistical issue. We
> could easily get past that by bringing meta-qt5 into poky as we do with OE-
> Core, or even just adding it to the build configuration as needed.

That's not what I'm saying. I'm saying that for people who want a 
'reference UI for real products' and have no problem with Qt, we should 
officially endorse meta-b2qt.

Seriosuly. They have a wayland compositor, and an app launcher, and a 
set of embedded-specific demos, and it's written and tested by 
specialists with an explicit target of making it easy to make products. 
And it's open source with optional commercial support. In that light, 
there is no sense whatsoever in solving the same problem in oe-core, poorly.

> If we keep Sato effectively on life
> support as we have done up until now, then it'll never get solved, and in the
> mean time we are presenting something that is frankly woefully outdated which
> we have to maintain entirely by ourselves.

Sato is not a reference UI, and has no pretensions of being that. It's 
strictly an engineering UI, which is a different thing, and it's very 
useful in that capacity.

Alex


