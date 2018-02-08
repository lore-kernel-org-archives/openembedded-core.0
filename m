Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4D16076F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 06:57:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Feb 2018 22:57:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,477,1511856000"; d="scan'208";a="25784649"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Feb 2018 22:57:12 -0800
To: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin.hundeboll@prevas.dk>,
	openembedded-core@lists.openembedded.org
References: <20180206144152.7765-1-alexander.kanavin@linux.intel.com>
	<0dacebb9-8e33-749d-0b96-af527e05fe7d@prevas.dk>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <be0f28ca-fa21-cb5b-8061-246d7086f401@linux.intel.com>
Date: Thu, 8 Feb 2018 08:50:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <0dacebb9-8e33-749d-0b96-af527e05fe7d@prevas.dk>
Subject: Re: [PATCH 1/3] package.bbclass: run pre/post installation/removal scriptlets using sh -e
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
X-List-Received-Date: Thu, 08 Feb 2018 06:57:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02/08/2018 08:37 AM, Martin Hundebøll wrote:
> I guess there is no support for non-shell scriptlets? E.g. RPM supports 
> python:
> https://stackoverflow.com/questions/21590014/rpm-post-install-execute-with-python 

Nope, there is no support for it. Besides, that would mean the recipe 
would no longer work with deb or ipk as package types.

I hardly see an issue though: just write a shell one-liner that invokes 
the actual script.


Alex

