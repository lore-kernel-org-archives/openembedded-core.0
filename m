Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 34DF278942
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 11:01:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jan 2018 03:01:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,330,1511856000"; 
   d="scan'208";a="8992734"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 08 Jan 2018 03:01:45 -0800
To: =?UTF-8?Q?Michael_Bl=c3=a4ttler?= <michael.blaettler@siemens.com>,
	openembedded-core@lists.openembedded.org
References: <20180108074239.13009-1-michael.blaettler@siemens.com>
	<20180108074239.13009-2-michael.blaettler@siemens.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1ce3b814-e30c-7adb-ae0d-1427a83ec9a1@linux.intel.com>
Date: Mon, 8 Jan 2018 13:01:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180108074239.13009-2-michael.blaettler@siemens.com>
Subject: Re: [PATCH 2/2] package.bbclass: variable to influence link style
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
X-List-Received-Date: Mon, 08 Jan 2018 11:01:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/08/2018 09:42 AM, Michael Blättler wrote:

> This commit introduces a new variable PACKAGE_DEBUG_SPLIT_LINK_STYLE
> which specifies the link option between debug infos and binary. If
> build-id is uesed as link option, the id can be defined with the
> BUILD_ID variable.

How did you test this? Can you add a test to insane.bbclass please? 
Adding new options without having a way to test in an automated, regular 
fashion is not a great idea.

Alex

