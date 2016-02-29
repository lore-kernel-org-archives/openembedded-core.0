Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id F1B65771BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 13:19:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 29 Feb 2016 05:19:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,520,1449561600"; d="scan'208";a="923399765"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 29 Feb 2016 05:19:57 -0800
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1456456877.git.mark.hatle@windriver.com>
	<39dcc8978920aeaf0eeb206b7292f32af4b775f7.1456456877.git.mark.hatle@windriver.com>
	<55970.10.252.8.77.1456498907.squirrel@linux.intel.com>
	<56D060AA.6020100@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56D4449F.8010407@linux.intel.com>
Date: Mon, 29 Feb 2016 15:16:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <56D060AA.6020100@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3 v2] rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head
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
X-List-Received-Date: Mon, 29 Feb 2016 13:19:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2016 04:26 PM, Mark Hatle wrote:
>> Why not update the oe-core recipe of db to 6.1 instead? Rpm is the only
>> thing that is holding it back.
>
> Because today is feature freeze, and I'm not going to introduce a new BerkleyDB
> version on the day of feature freeze.  The only thing I can test on is RPM --
> and there may be other users.
>
> The patch was done as a single unit specifically so when DB-6.1 is introduced,
> it's VERY simple to remove.

Can you then drop the NO_UPDATE_REASON from the db recipe as a part of 
this patchset?

Alex


