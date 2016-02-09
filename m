Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A7EB26FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 17:29:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 09 Feb 2016 09:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,421,1449561600"; d="scan'208";a="908678433"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.175.39])
	by orsmga002.jf.intel.com with ESMTP; 09 Feb 2016 09:29:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 10 Feb 2016 06:29:17 +1300
Message-ID: <1558558.pBdMUGvlJ2@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.4-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <CAJ86T=X3yr5YNmT+8UM5z2P8HVrWBgrvEo6=ZVqaSBtsFrFzHw@mail.gmail.com>
References: <1454963681-18756-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LaCMqE5kQR5SApPdBw-LYbdyxwtaFK+DpAfhbhU7LFScQ@mail.gmail.com>
	<CAJ86T=X3yr5YNmT+8UM5z2P8HVrWBgrvEo6=ZVqaSBtsFrFzHw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] libproxy: replace PACKAGECONFIG equivalent with the real thing
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
X-List-Received-Date: Tue, 09 Feb 2016 17:29:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 09 Feb 2016 00:05:15 Andre McCurdy wrote:
> On Mon, Feb 8, 2016 at 2:56 PM, Burton, Ross <ross.burton@intel.com> wrote:
> > On 8 February 2016 at 20:34, Andre McCurdy <armccurdy@gmail.com> wrote:
> >> '' if incompatible_license_contains('GPLv3', 'x', '', d) == 'x' or
> >> bb.utils.contains('DISTRO_FEATURES', 'x11', 'x', '', d) == '' else
> >> 'gnome' } \
> > 
> > Instead of returning 'x' or '' and then doing string comparisons, why not
> > just return True or False and let if/or/else do the right thing?
> 
> Just trying to preserve the original logic to make it clearer that no
> functionality is being changed.
> 
> The logic can be traced back to Paul Eggleton's original version here:
>  
> http://git.openembedded.org/openembedded-core/commit/?id=973351cf2e338f07c1
> 1395d494193e9c62857f2d

Well, slap my wrist then ;)

Ross's suggestion does make it a bit tidier.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

