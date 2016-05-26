Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A17086B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 13:49:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 26 May 2016 06:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="985200002"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2016 06:49:43 -0700
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<e0ab0ad1-fb6d-a8a0-a31f-913b9fa4dcc2@windriver.com>
	<51113.10.252.8.31.1464181299.squirrel@linux.intel.com>
	<32be4839-8552-c5fa-6ba3-6df5d97aee7c@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5746FEED.1000907@linux.intel.com>
Date: Thu, 26 May 2016 16:49:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <32be4839-8552-c5fa-6ba3-6df5d97aee7c@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/45] Move recipes to use Python 3 whenever possible
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
X-List-Received-Date: Thu, 26 May 2016 13:49:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/26/2016 04:39 PM, Mark Hatle wrote:

> The interchange format of the newer createrepo is very different then the older
> format the smartpm uses.  Thus they have to be kept in sync.  The new format
> also does not have the extensions we added for the recommended package syntax.
>
> createrepo is very small, and it's not YUM dependent.  It simply reads the
> metadata (via the rpm interface) and dumps out data in an XML format.. then does
> a few more things as well.  So porting the existing one forward shouldn't be
> difficult.  It's just not clear at this point what the best behavior will be to
> do.. port createrepo forward -- or update smartpm to support the newer format
> (with appropriate extensions.)

I still don't understand why introducing yum/dnf as a replacement for 
smartpm should be avoided at all costs. Like smartpm, it's fully written 
in Python, so that theoretically should be less painful that building 
working binaries.

Alex


