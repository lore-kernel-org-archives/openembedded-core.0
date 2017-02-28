Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 591E372F81
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:03:47 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 28 Feb 2017 01:03:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,218,1484035200"; d="scan'208";a="230520293"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 28 Feb 2017 01:03:48 -0800
To: openembedded-core@lists.openembedded.org
References: <1488244198-1976-1-git-send-email-california.l.sullivan@intel.com>
	<o93cl0$sqp$1@blaine.gmane.org>
	<CA+chaQcMnaTRrfVy-1xz_zHZCH-hQ5NS9pYqsHN_pUPDkHTbLg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <92f0a8d5-028f-a017-cf3d-97ce96c74843@linux.intel.com>
Date: Tue, 28 Feb 2017 11:02:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcMnaTRrfVy-1xz_zHZCH-hQ5NS9pYqsHN_pUPDkHTbLg@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/1] recipes-extended: Move efivar from meta-openembedded to oe-core
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
X-List-Received-Date: Tue, 28 Feb 2017 09:03:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2017 10:58 AM, Martin Jansa wrote:
> Everything outside oe-core is meant to be nice little colorful boxes
> which don't depend on each other (as discussed on OEDAM), but whatever
> intel needs has to go to oe-core.

FWIW, I'm with you and I strongly oppose people dumping stuff into 
oe-core even if they're Intel employees :)

Alex


