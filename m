Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 46CF775D22
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 14:36:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 06 Nov 2015 06:36:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="813425208"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 06 Nov 2015 06:36:44 -0800
Message-ID: <563CBB37.8090103@linux.intel.com>
Date: Fri, 06 Nov 2015 16:37:43 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1446666421-2549-1-git-send-email-ross.burton@intel.com>	<1446666421-2549-3-git-send-email-ross.burton@intel.com>
	<CAJTo0LbgKKZC+iGewifxjOO5agRPq=j_fFw0von0Ap+80a+Nhw@mail.gmail.com>
In-Reply-To: <CAJTo0LbgKKZC+iGewifxjOO5agRPq=j_fFw0von0Ap+80a+Nhw@mail.gmail.com>
Subject: Re: [PATCH 3/4] gcr: remove Vala dependency
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
X-List-Received-Date: Fri, 06 Nov 2015 14:36:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2015 10:20 PM, Burton, Ross wrote:
> Retracting this, gcr needs vala's m4 file.  Back to wondering if we
> should have a vala-stub too...

Upcoming introspection patchset also adds a bonus vapigen support, so 
you don't really need to do these disable-vala fixes.


Alex


