Return-Path: <ross.burton@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 179AE7D771
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 09:30:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Sep 2019 02:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,554,1559545200"; d="scan'208";a="189392083"
Received: from arokiasx-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.252.54.158])
	by fmsmga008.fm.intel.com with ESMTP; 27 Sep 2019 02:30:01 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1569569493.git.liezhi.yang@windriver.com>
	<240614c649cb0804b49efc464106399a6a9c7086.1569569493.git.liezhi.yang@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <b3c4ae73-4446-a476-a22a-4c580168231d@intel.com>
Date: Fri, 27 Sep 2019 10:30:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <240614c649cb0804b49efc464106399a6a9c7086.1569569493.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] apr: Check for libtoolize rather than libtool
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
X-List-Received-Date: Fri, 27 Sep 2019 09:30:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Much neater, but:
> -	libtool='${HOST_SYS}-libtool' ./buildconf
> +	./buildconf 2

Where did this 2 come from and what does it mean?

Ross

