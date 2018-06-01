Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 6398A6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 19:34:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2018 12:34:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,467,1520924400"; d="scan'208";a="59644196"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 01 Jun 2018 12:34:03 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180531062031.40334-1-mingli.yu@windriver.com>
	<1527772404.16911.155.camel@linuxfoundation.org>
	<5B10A3D7.20309@windriver.com>
	<CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
	<5B10DBE5.5050603@windriver.com>
	<62a9d51c-67da-353b-778e-b8af72408413@gmail.com>
	<CANNYZj-JRVCWfRr++c6YQzEtq1WgmhUgf8CwAx4_N6PEdXrYHg@mail.gmail.com>
	<ef063f72-b7b0-e48b-fd50-1f0d05b22255@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <94dbb164-5f36-de0f-9d2f-c3e9f4afc6f5@linux.intel.com>
Date: Fri, 1 Jun 2018 22:34:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <ef063f72-b7b0-e48b-fd50-1f0d05b22255@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Improve reproducibility
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
X-List-Received-Date: Fri, 01 Jun 2018 19:34:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/01/2018 09:33 PM, Khem Raj wrote:
>> The .s file is not generated and it does not contain any .file
>> directives. The .o file also does not contain the path. It appears in
>> the final .so library at linking stage.
> 
> Can you share the linker cmdline ?

https://pastebin.com/WK9GVDfj

Note that of the three assembly-generated object files, only the path to 
the first shows up in the .so - because of assembly labels I believe.

Alex

