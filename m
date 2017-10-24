Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 27D4E7198E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 09:06:10 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Oct 2017 02:06:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,427,1503385200"; d="scan'208";a="164204370"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 24 Oct 2017 02:06:10 -0700
To: Ovidiu Panait <ovidiu.panait@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20171023173916.271270-1-ovidiu.panait@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8bb8f1fc-7dfd-8ce1-891b-e8d60f83b927@linux.intel.com>
Date: Tue, 24 Oct 2017 12:01:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171023173916.271270-1-ovidiu.panait@windriver.com>
Subject: Re: [PATCH] git: CVE-2017-14867
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
X-List-Received-Date: Tue, 24 Oct 2017 09:06:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/23/2017 08:39 PM, Ovidiu Panait wrote:
> Git before 2.10.5, 2.11.x before 2.11.4, 2.12.x before 2.12.5, 2.13.x before
> 2.13.6, and 2.14.x before 2.14.2 uses unsafe Perl scripts to support
> subcommands such as cvsserver, which allows attackers to execute arbitrary
> OS commands via shell metacharacters in a module name. The vulnerable code
> is reachable via git-shell even without CVS support.

It's better to simply update the recipe to the latest version that does 
not have the vulnerability, can you do that please?


Alex

