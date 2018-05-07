Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 038EB74C75
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 13:05:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 May 2018 06:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,374,1520924400"; d="scan'208";a="53830256"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2018 06:05:29 -0700
To: Viacheslav Salnikov <slavasalnikovv@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <CACAZDOmB7+7WfZfzt_qxinq48ANmsbm_q0nrmneAuN7gM2pJvQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <dc9619db-2ee9-131a-fe29-614308f0495e@linux.intel.com>
Date: Mon, 7 May 2018 15:59:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CACAZDOmB7+7WfZfzt_qxinq48ANmsbm_q0nrmneAuN7gM2pJvQ@mail.gmail.com>
Subject: Re: cURL recipe: SSL backend
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
X-List-Received-Date: Mon, 07 May 2018 13:05:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/07/2018 03:51 PM, Viacheslav Salnikov wrote:
> cULR is built with GNUTLS for Target but OpenSSL is used for native and 
> SDK.
> 
> So my question is: why GNUTLS is used only for target? Is it necessary 
> for some good reason? Documentation for cURL has no explicit answer for 
> that.
> 
> Could somebody help me to find the answer?

I think enabling gnutls on the native side would add a ton of 
dependencies to build, and so openssl (which is more self-contained) is 
selected there.

Alex


