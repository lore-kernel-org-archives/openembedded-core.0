Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 048D977407
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 15:17:40 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP; 16 Dec 2016 07:17:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,358,1477983600"; d="scan'208";a="40563890"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 16 Dec 2016 07:17:41 -0800
To: openembedded-core@lists.openembedded.org
References: <1481828422-15950-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1b20e0d0-5a67-ccc1-f6ea-45260ad26d9d@linux.intel.com>
Date: Fri, 16 Dec 2016 17:17:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1481828422-15950-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
Subject: Re: [PATCH V2] python3-setuptools: upgrade to 31.0.0
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
X-List-Received-Date: Fri, 16 Dec 2016 15:17:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2016 09:00 PM, Edwin Plauchu wrote:
> From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>
> It is a simultaneous upgrade for python 2 and 3 over setuptools.
>
> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> ---
>  meta/recipes-devtools/python/python-setuptools.inc |  4 +--
>  .../python/python-setuptools_29.0.1.bb             | 38 ----------------------
>  .../python/python-setuptools_31.0.0.bb             | 38 ++++++++++++++++++++++
>  .../python/python3-setuptools_29.0.1.bb            | 37 ---------------------
>  .../python/python3-setuptools_31.0.0.bb            | 37 +++++++++++++++++++++

Same here - before sending patches, do make sure that rename detection 
worked correctly. It's otherwise very difficult to see what has changed 
inside the renamed file.

Alex


