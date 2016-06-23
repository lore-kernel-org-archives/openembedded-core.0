Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EEA4D6E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 14:31:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jun 2016 07:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,517,1459839600"; d="scan'208";a="993687407"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2016 07:31:09 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1466669684.git.Qi.Chen@windriver.com>
	<888ea509ee84e93297278e52a394057993b9a8a4.1466669684.git.Qi.Chen@windriver.com>
	<825a92a1-c9ed-11f3-7580-0cef384914db@linux.intel.com>
	<CAMKF1so3JSBtJC6_Uz4L5NJ50HCjtpztxoJ+_H+aU1mVLOduxA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f82a34ab-311a-b69e-8922-de59e6c4f971@linux.intel.com>
Date: Thu, 23 Jun 2016 17:31:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1so3JSBtJC6_Uz4L5NJ50HCjtpztxoJ+_H+aU1mVLOduxA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 23 Jun 2016 14:31:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/23/2016 04:56 PM, Khem Raj wrote:

>> This is not correct. Systemd is configured using --without-python, and so
>> the python scripts are not added to the list of tests in the top level
>> Makefile.am. However they are still installed by the recipe - the correct
>> fix is to remove them from the test target directory after all the tests
>> have been copied into it.
>
> python support could be added too. Using packageconfig

Yes, if Python 3.x is used. Python 2.x is no longer the default choice 
in oe-core.

Alex


