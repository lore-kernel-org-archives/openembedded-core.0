Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 08343784FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 09:20:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Mar 2018 02:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,364,1517904000"; d="scan'208";a="45319117"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2018 02:20:44 -0700
To: "Ryan Pabis (pabisr)" <pabisr@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <E152D784-A26D-42D8-B3E4-FCF83A9A4A67@contoso.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <eacf0f81-dd09-091c-e06b-9a43dce0d07a@linux.intel.com>
Date: Mon, 26 Mar 2018 12:14:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <E152D784-A26D-42D8-B3E4-FCF83A9A4A67@contoso.com>
Subject: Re: What is the recommended approach to upgrade Openssl?
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
X-List-Received-Date: Mon, 26 Mar 2018 09:20:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03/23/2018 09:53 PM, Ryan Pabis (pabisr) wrote:
> So, my question is A) Is this the right approach or should I be updating 
> the entire openembedded layer (if so are there instructions anywhere on 
> how to do that?) and B).  If my approach is ok what is causing the ‘ar’ 
> error since this built previously with openssl 1.0.2d?

Yes, you should update to a supported YP release. Backporting security 
fixes is tedious and difficult, and gets increasingly more difficult as 
the distance between your codebase and what the upstreams are working on 
grows. So you should have a process in place to keep that distance under 
control.


Alex

