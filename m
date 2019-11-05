Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A6D917F959
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 10:41:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Nov 2019 02:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; d="scan'208";a="353110662"
Received: from sptommas-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.55.33])
	by orsmga004.jf.intel.com with ESMTP; 05 Nov 2019 02:41:01 -0800
To: openembedded-core@lists.openembedded.org
References: <20191105031056.179041-1-hongxu.jia@windriver.com>
	<20191105031224.179504-1-hongxu.jia@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <295b81ee-5a58-aa5c-bffc-a2ca6b4333ee@intel.com>
Date: Tue, 5 Nov 2019 10:41:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105031224.179504-1-hongxu.jia@windriver.com>
Subject: Re: [PATCH V2] python3-git: add python3-nose to RDEPENDS
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
X-List-Received-Date: Tue, 05 Nov 2019 10:41:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/11/2019 03:12, Hongxu Jia wrote:
> $>>> import git.test.lib
> Traceback (most recent call last):
>    File "<stdin>", line 1, in <module>
>    File "/usr/lib/python3/dist-packages/git/test/lib/__init__.py", line 9, in <module>
>      from .asserts import *
>    File "/usr/lib/python3/dist-packages/git/test/lib/asserts.py", line 10, in <module>
>      from nose.tools import (
> ModuleNotFoundError: No module named 'nose'

Would it make sense to rip the test libraries into a separate package 
(say, git-ptest) and add the dependencies there?

Ross

