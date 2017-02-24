Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9D59B77507
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 16:03:45 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2017 08:03:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,201,1484035200"; d="scan'208";a="229325076"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2017 08:03:45 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
	<93fa4a77d852419f068ccd2cd99faee771f4c29c.1487774787.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LZuDead4UYtB0yssZQrF1XAXPYXENiQvLOSBWo2dv7uug@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <da3abaee-373c-08f8-1aea-e81cf0e50303@linux.intel.com>
Date: Fri, 24 Feb 2017 18:02:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZuDead4UYtB0yssZQrF1XAXPYXENiQvLOSBWo2dv7uug@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 24/24] systemtap: update to 3.1
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
X-List-Received-Date: Fri, 24 Feb 2017 16:03:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2017 04:22 PM, Burton, Ross wrote:
>> Add support for python 3 probes
>
> ERROR: QA Issue: lib64-systemtap: Files/directories were installed but
> not shipped in any package:
>   /usr/lib/python3.5/site-packages/HelperSDT-0.1.0-py3.5.egg-info
>
> /usr/lib/python3.5/site-packages/HelperSDT-0.1.0-py3.5.egg-info/dependency_links.txt
>   /usr/lib/python3.5/site-packages/HelperSDT-0.1.0-py3.5.egg-info/PKG-INFO
>
> /usr/lib/python3.5/site-packages/HelperSDT-0.1.0-py3.5.egg-info/top_level.txt
>
> /usr/lib/python3.5/site-packages/HelperSDT-0.1.0-py3.5.egg-info/SOURCES.txt
>   /usr/lib/python3.5/site-packages/HelperSDT/__init__.py
>
> /usr/lib/python3.5/site-packages/HelperSDT/_HelperSDT.cpython-35m-x86_64-linux-gnu.so
> <http://HelperSDT.cpython-35m-x86_64-linux-gnu.so>
>   /usr/lib/python3.5/site-packages/HelperSDT/__main__.py
>   /usr/lib/python3.5/site-packages/HelperSDT/__pycache__
>
> /usr/lib/python3.5/site-packages/HelperSDT/__pycache__/__init__.cpython-35.pyc
>
> /usr/lib/python3.5/site-packages/HelperSDT/__pycache__/__main__.cpython-35.pyc

Just sent an updated patch that should fix this.

Alex


