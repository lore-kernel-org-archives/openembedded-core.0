Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EEB6D60721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 02:56:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 15 Dec 2015 18:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,435,1444719600"; d="scan'208";a="842081896"
Received: from mhchui-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.146.121])
	by orsmga001.jf.intel.com with ESMTP; 15 Dec 2015 18:56:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Wed, 16 Dec 2015 15:56:21 +1300
Message-ID: <1812827.UL8qvCl2DH@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.6-301.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <CAP9ODKpCU+5tM0UzjmxyARRCqP_VSQ0X1nnF3mDNYCtFoVjwuQ@mail.gmail.com>
References: <1450218466.13505.95.camel@linuxfoundation.org>
	<CAP9ODKpCU+5tM0UzjmxyARRCqP_VSQ0X1nnF3mDNYCtFoVjwuQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] m4: Drop unused/unreferenced patch
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
X-List-Received-Date: Wed, 16 Dec 2015 02:56:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Otavio,

On Tue, 15 Dec 2015 22:13:53 Otavio Salvador wrote:
> Is there a way to have a task, like fetchall, which checks for
> non-referenced metadata files? This would help to avoid this to happen
> in future.

We could do this, but one place I hope we can catch this in future is in a 
script to check submitted patches [1][2] - that way we catch the error before 
it gets merged. In that context we can easily see if a reference is removed to 
a file in SRC_URI and check if there's a corresponding delete of the file 
(assuming no other recipes reference it).

Cheers,
Paul

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=4078
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8648

-- 

Paul Eggleton
Intel Open Source Technology Centre

