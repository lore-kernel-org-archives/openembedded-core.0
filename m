Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QNDSt-0003iv-Qp
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 02:21:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 May 2011 17:18:18 -0700
X-ExtLoop1: 1
Received: from vorpal.jf.intel.com (HELO [10.7.199.57]) ([10.7.199.57])
	by orsmga002.jf.intel.com with ESMTP; 19 May 2011 17:18:18 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2011 17:21:54 -0700
In-Reply-To: <cover.1305752502.git.chris_larson@mentor.com>
References: <cover.1305752502.git.chris_larson@mentor.com>
X-Mailer: Evolution 3.0.1 (3.0.1-1.fc15) 
Message-ID: <1305850914.9983.33.camel@vorpal.jf.intel.com>
Mime-Version: 1.0
Subject: Re: [PATCH 0/5] Variable typing & reworked imports handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 May 2011 00:21:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-18 at 14:02 -0700, Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: kergoth/oe-sync-base
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kergoth/oe-sync-base
> 
> Thanks,
>     Chris Larson <chris_larson@mentor.com>

I like this, I was thinking about typing in BB about the time you first
showed me this so am pleased to see it submitted.

I think this will be especially useful for the oft discussed
configuration editor UI. Thanks!

Acked-by: Joshua Lock <josh@linux.intel.com>

> ---
> 
> 
> Chris Larson (5):
>   Implement variable typing (sync from OE)
>   oe.data: expand the flags
>   base.bbclass: switch to current OE's imports handling
>   Shift oe import logic out of the event handler
>   base.bbclass: use oe.data for OE_IMPORTS
> 
>  meta/classes/base.bbclass      |   46 +++++++++--------
>  meta/classes/typecheck.bbclass |   12 +++++
>  meta/lib/oe/data.py            |   18 +++++++
>  meta/lib/oe/maketype.py        |  100 ++++++++++++++++++++++++++++++++++++++
>  meta/lib/oe/test_types.py      |   62 ++++++++++++++++++++++++
>  meta/lib/oe/types.py           |  104 ++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 320 insertions(+), 22 deletions(-)
>  create mode 100644 meta/classes/typecheck.bbclass
>  create mode 100644 meta/lib/oe/data.py
>  create mode 100644 meta/lib/oe/maketype.py
>  create mode 100644 meta/lib/oe/test_types.py
>  create mode 100644 meta/lib/oe/types.py
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Joshua Lock
        Yocto Project Build Monkey
        Intel Open Source Technology Centre



