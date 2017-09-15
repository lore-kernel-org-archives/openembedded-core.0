Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4740F7864A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 14:46:28 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Sep 2017 07:46:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,397,1500966000"; d="scan'208";a="152271745"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 15 Sep 2017 07:46:28 -0700
To: openembedded-core@lists.openembedded.org, seebs@seebs.net
References: <20170915142039.4855-1-alexander.kanavin@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bde8ed04-c337-e6ff-2ced-7997b64c6519@linux.intel.com>
Date: Fri, 15 Sep 2017 17:42:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170915142039.4855-1-alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH] pseudo: use epoll API on Linux
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
X-List-Received-Date: Fri, 15 Sep 2017 14:46:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/15/2017 05:20 PM, Alexander Kanavin wrote:

> ++#include <sys/epoll.h>

Forgot to wrap this one into #ifdef PSEUDO_PORT_LINUX as well.



Alex

