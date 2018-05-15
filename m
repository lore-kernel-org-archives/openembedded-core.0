Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3A45874BA0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 15:10:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2018 08:10:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,403,1520924400"; d="scan'208";a="55409790"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 15 May 2018 08:10:50 -0700
To: Stefan Agner <stefan@agner.ch>, openembedded-core@lists.openembedded.org
References: <20180515140451.60660-1-stefan@agner.ch>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b80d6b0c-6f27-8c28-26d3-b62019c303c9@linux.intel.com>
Date: Tue, 15 May 2018 18:03:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180515140451.60660-1-stefan@agner.ch>
Cc: muhammad_shakeel@mentor.com, Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 0/3] postinsts fixes
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
X-List-Received-Date: Tue, 15 May 2018 15:10:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/15/2018 05:04 PM, Stefan Agner wrote:
> This follows up on the discussion a while ago:
> https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg104996.html

Took me a moment to realize all three patches are specific to opkg/dpkg 
and do not change how rpm (or general 'postinst handling') works. 
Perhaps you could amend the commit messages to emphasize that?

Alex

