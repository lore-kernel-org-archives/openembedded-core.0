Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C46BF78663
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 12:14:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2017 04:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,389,1505804400"; 
   d="scan'208";a="7028131"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 13 Nov 2017 04:14:39 -0800
To: "Kravchuk, Oleksandr" <OKravchuk@luxoft.com>,
	"Kravchuk, Oleksandr (Pelagicore)" <oleksandr.kravchuk@pelagicore.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1510574454-26784-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
	<c47da4ce-1bed-5f09-b1d1-dd91b8767cc1@linux.intel.com>
	<6A9F147ED85DE04C91F3A60DD073E94302553D7F@ORO-MBOX-03.luxoft.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b1ab5865-28a9-852f-2c6b-c7ca0cba47e6@linux.intel.com>
Date: Mon, 13 Nov 2017 14:14:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <6A9F147ED85DE04C91F3A60DD073E94302553D7F@ORO-MBOX-03.luxoft.com>
Subject: Re: [PATCH] curl: upgrade to 7.56.1
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
X-List-Received-Date: Mon, 13 Nov 2017 12:14:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/13/2017 02:13 PM, Kravchuk, Oleksandr wrote:
> No, they rely on another header file, curl/system.h now, instead of curl/curlbuild.h, which used to be generated during the build time.
> 
> Here is an explanation: https://daniel.haxx.se/blog/2017/06/15/target-independent-libcurl-headers/
> 

Thanks :) I actually already knew that; the point is that you need to 
include the information and the link into the commit message.

Alex

