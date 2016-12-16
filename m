Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 49687773C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 13:17:18 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 16 Dec 2016 05:17:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,357,1477983600"; d="scan'208";a="43081488"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 16 Dec 2016 05:17:19 -0800
To: openembedded-core@lists.openembedded.org
References: <1481852668-23967-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d31cb432-562f-bcca-76d9-b15ec7e11bcb@linux.intel.com>
Date: Fri, 16 Dec 2016 15:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1481852668-23967-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
Subject: Re: [PATCH] dpkg: upgrade to 1.18.15
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
X-List-Received-Date: Fri, 16 Dec 2016 13:17:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/2016 03:44 AM, Edwin Plauchu wrote:
> From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>
> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>

In addition to file rename detection (see Jussi's mail), you need to 
explain in the commit message the changes that you made.

Specifically:

>  ...tinsts-expect-D-to-be-set-when-running-in.patch | 30 +++++++-------

Was this rebased? Did you have to also modify the code and how?

>  .../dpkg/dpkg/add_armeb_triplet_entry.patch        | 46 ----------------------
>  .../dpkg/dpkg/add_armeb_tuple_entry.patch          | 46 ++++++++++++++++++++++

Is this the same patch or two different patches? Why did triplet change 
to tuple?

> -           file://0006-add-musleabi-to-known-target-tripets.patch \

What happened to this patch? You removed it from the recipe, but didn't 
remove the file and didn't explain why.


Alex

