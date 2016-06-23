Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6F8731B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 10:23:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 23 Jun 2016 03:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,516,1459839600"; d="scan'208";a="981762685"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 23 Jun 2016 03:23:47 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1466669684.git.Qi.Chen@windriver.com>
	<888ea509ee84e93297278e52a394057993b9a8a4.1466669684.git.Qi.Chen@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <825a92a1-c9ed-11f3-7580-0cef384914db@linux.intel.com>
Date: Thu, 23 Jun 2016 13:23:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <888ea509ee84e93297278e52a394057993b9a8a4.1466669684.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 2/5] systemd: upgrade to 230
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
X-List-Received-Date: Thu, 23 Jun 2016 10:23:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/23/2016 11:16 AM, Chen Qi wrote:
> 'python' is added to RDEPENDS of systemd-ptest.
> -RDEPENDS_${PN}-ptest += "gawk make perl bash xz \
> +RDEPENDS_${PN}-ptest += "gawk make perl bash xz python\

This is not correct. Systemd is configured using --without-python, and 
so the python scripts are not added to the list of tests in the top 
level Makefile.am. However they are still installed by the recipe - the 
correct fix is to remove them from the test target directory after all 
the tests have been copied into it.

Alex


