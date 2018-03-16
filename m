Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id B05CD788EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 10:51:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2018 03:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,315,1517904000"; d="scan'208";a="35549990"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 16 Mar 2018 03:51:08 -0700
To: Tim Orling <ticotimo@gmail.com>, Derek Straka <derek@asterius.io>
References: <1520806702-5879-1-git-send-email-derek@asterius.io>
	<0fbe649e-846b-0446-64c1-587fa1221a9f@linux.intel.com>
	<CADNbA1pbbMD+7e8xXwOmzGAUmQXbis_cGx3zTrXLCNnRXqyrVA@mail.gmail.com>
	<c44dd7f9-8f0b-c19b-311e-8364171c8cb3@linux.intel.com>
	<CADNbA1ontzC-45M0e01w1NE=+U01WRqsn-tGuj+j9+1++2ANoA@mail.gmail.com>
	<CANx9H-BtAsgq9fhAaodGDXB0aO8vd0rb924Db6rj1GioYTRW6Q@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a04a7a8b-70a8-1717-7477-1706b21e363d@linux.intel.com>
Date: Fri, 16 Mar 2018 12:44:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-BtAsgq9fhAaodGDXB0aO8vd0rb924Db6rj1GioYTRW6Q@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] python3: update to version 3.5.5 to fix security issues
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
X-List-Received-Date: Fri, 16 Mar 2018 10:51:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/16/2018 07:06 AM, Tim Orling wrote:
> I looked into 3.6 as well, but the sheer number of patches we apply is a 
> pain point to rebase.
> 
> I am inclined to vote for 3.6 first and pick up 3.7 when it matures a 
> bit and is more widely supported. I have fears of rather massive 
> failures in our python ecosystem (especially in meta-python). Perhaps 
> backward compatibility will be there, but I need to be convinced. If 3.7 
> is widely the _default_ in traditional distros we support, then I will 
> sing a different tune. Also, I hope to have a ptest strategy for python 
> by the end of 2.6, which would dramatically increase my comfort level.

Perhaps we can provide both and default to 3.6? Eventually we will have 
to transition to 3.7, and I think it might be easier if it's widely 
available in oe-core, even if it has known (or unknown) issues and is 
off by default. We can then periodically test 3.7 on the AB etc, to 
assess where things are.

Alex

