Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B356660069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 16:29:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2018 09:29:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,311,1517904000"; d="scan'208";a="35298910"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 15 Mar 2018 09:29:26 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180312164944.39923-1-alexander.kanavin@linux.intel.com>
	<20180312164944.39923-4-alexander.kanavin@linux.intel.com>
	<CA+chaQctko3eBUWpySaiZ19WXH+5cDrAu4Kh6TGLd9r4MTx-Qw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f6229a05-c425-6da9-aac2-026cdcbed92a@linux.intel.com>
Date: Thu, 15 Mar 2018 18:22:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQctko3eBUWpySaiZ19WXH+5cDrAu4Kh6TGLd9r4MTx-Qw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] lib/oe/patch.py: add a warning if patch context was ignored
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
X-List-Received-Date: Thu, 15 Mar 2018 16:29:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/15/2018 05:13 PM, Martin Jansa wrote:
> Now when more people will use devtool to refresh patches, would it make 
> sense for devtool to use --no-signature when refreshing patches?

I don't think that will help much to reduce the amount of change in the 
refresh. The refesh will also update the line numbers in chunks so that 
they match reality, and convert patches into git format - all useful things.


Alex

