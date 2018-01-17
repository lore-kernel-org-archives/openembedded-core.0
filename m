Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4A65C78721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:29:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jan 2018 07:29:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,372,1511856000"; d="scan'208";a="20510256"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2018 07:29:25 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1516202745-18231-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1516202745-18231-3-git-send-email-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2aef8a4f-9d0b-ab44-02ea-e1ad8a4e1810@linux.intel.com>
Date: Wed, 17 Jan 2018 17:23:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1516202745-18231-3-git-send-email-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 3/4] lttng-modules: upgrade 2.9.5 -> 2.10.4
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
X-List-Received-Date: Wed, 17 Jan 2018 15:29:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/17/2018 05:25 PM, Richard Purdie wrote:
> LICENSE file contains a list of files and addtional files were added to
> the list, license was unchanged.

I'd like to standardize this to a tag, and so the license change text 
mentions a tag. Something like Otavio did:

License-checksum-change: added new contributors

The idea is to make the automatic check for this more reliable so we 
don't have to ask contributors to explain the license changes all the time.

Alex

