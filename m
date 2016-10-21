Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F05FA71A4F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 19:36:41 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 12:36:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,526,1473145200"; d="scan'208";a="182422541"
Received: from limlingx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.187.49])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 12:36:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Olaf Mandel <o.mandel@menlosystems.com>
Date: Sat, 22 Oct 2016 08:36:38 +1300
Message-ID: <3112187.pLcoafoZIx@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.7-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1985222.nRgBkrL9KW@peggleto-mobl.ger.corp.intel.com>
References: <1476871513-19739-1-git-send-email-o.mandel@menlosystems.com>
	<1985222.nRgBkrL9KW@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] $COREBASE/LICENSE in LIC_FILES_CHKSUM
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
X-List-Received-Date: Fri, 21 Oct 2016 19:36:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 21 Oct 2016 12:29:55 Paul Eggleton wrote:
> For images and other recipes that don't pull in anything by themselves,
> there shouldn't be a need for LIC_FILES_CHKSUM (or indeed LICENSE) to be
> set at all - in order to understand the license for the result the
> appropriate place to look is the license manifest that represents
> everything that goes into the image. In fact, in master / morty, if SRC_URI
> is empty then LIC_FILES_CHKSUM is no longer verified [1].

Actually I will correct that statement to match the code - LIC_FILES_CHKSUM
is no longer *mandatory* if SRC_URI is not set. If it is set, it will still
be checked.

Cheers,
Paul

[1] http://cgit.openembedded.org/openembedded-core/commit/?id=c269547ae8e90a78349f6003385137e4145e145f

-- 

Paul Eggleton
Intel Open Source Technology Centre

