Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5EEAF731BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 02:15:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2016 19:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,543,1459839600"; d="scan'208";a="996998241"
Received: from hkao-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.158])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2016 19:15:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 29 Jun 2016 14:15:29 +1200
Message-ID: <4011216.TxvZQ32zt2@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAJ86T=UX4mrrftUtmnFX=Gv5JHXr0nFbh+qj7JOxbxFnKcfT9w@mail.gmail.com>
References: <CAJ86T=UX4mrrftUtmnFX=Gv5JHXr0nFbh+qj7JOxbxFnKcfT9w@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Setting SRC_URI via anonymous Python fails in OE 2.1
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
X-List-Received-Date: Wed, 29 Jun 2016 02:15:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre,

On Tue, 28 Jun 2016 15:53:24 Andre McCurdy wrote:
> The following works in OE 2.0, but fails in 2.1 and master:
> 
>   python () {
>       d.setVar("SRC_URI_FOO", "http://foo.com/foo.tgz")
>   }
> 
>   SRC_URI = "${SRC_URI_FOO}"
> 
> 
> Is it a regression or was something like that never intended to work?

You didn't mention how it fails. However, I don't see any reason why we 
wouldn't want this to work, so if it does no longer work that seems like a bug 
to me.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

