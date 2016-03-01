Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 41D48731E3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 14:18:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 01 Mar 2016 06:18:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,523,1449561600"; d="scan'208";a="924327698"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 01 Mar 2016 06:17:50 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
	<cover.1456415870.git.alexander.kanavin@linux.intel.com>
	<549d5d18a9fe89af398559b3f8df60bb66643392.1456415870.git.alexander.kanavin@linux.intel.com>
	<89F0A1C5-6710-4F62-A646-0A2FDDDC75D8@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56D5A3B1.8080008@linux.intel.com>
Date: Tue, 1 Mar 2016 16:14:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <89F0A1C5-6710-4F62-A646-0A2FDDDC75D8@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/19] nspr: update to 4.12
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
X-List-Received-Date: Tue, 01 Mar 2016 14:18:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/29/2016 08:39 PM, Khem Raj wrote:
> This broke musl builds see
>
>
> http://errors.yoctoproject.org/Errors/Details/38154/

The failing patch is applied only when musl is in use (and so the 
regression went unnoticed). Can you rework it so that it can be applied 
unconditionally?

Alex


