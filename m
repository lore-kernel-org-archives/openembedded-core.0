Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DD82C601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 23:11:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 02 Feb 2016 15:11:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; d="scan'208";a="904249370"
Received: from jzhang80-mac02.jf.intel.com (HELO [10.211.55.6]) ([10.24.1.104])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 15:11:11 -0800
To: openembedded-core@lists.openembedded.org
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Message-ID: <56B1378D.7010905@linux.intel.com>
Date: Tue, 2 Feb 2016 15:11:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: openssl parallel make error (again)?
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
X-List-Received-Date: Tue, 02 Feb 2016 23:11:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

One of my builds hit parallel make error in openssl today. After some 
search, I guess it could be an old issue and see parallel make has been 
toggling several times around this problem in openssl recipe in the history.

Is anyone or auto-builder seeing same issue recently?

| ../../libcrypto.so: file not recognized: File truncated
| collect2: error: ld returned 1 exit status
| make[3]: *** [link_o.gnu] Error 1

BTW, my build is based on poky master and meta-intel master. MACHINE is 
intel-corei7-64, though I don't think BSP layer is related...

Thanks

