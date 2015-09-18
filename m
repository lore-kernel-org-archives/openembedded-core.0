Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DC14675F3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 16:50:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2015 09:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,553,1437462000"; d="scan'208";a="647638590"
Received: from ddperry-mobl4.amr.corp.intel.com (HELO [10.252.203.9])
	([10.252.203.9])
	by orsmga003.jf.intel.com with ESMTP; 18 Sep 2015 09:50:37 -0700
Message-ID: <55FC4135.1080506@linux.intel.com>
Date: Fri, 18 Sep 2015 11:52:05 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<4071162f4a5c0b32224c8c87b9e0deab82011787.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LY5DQ9WQnf9N0T23+HZPrDaxF+pWBAfFAqJjEuS=yQnOg@mail.gmail.com>
In-Reply-To: <CAJTo0LY5DQ9WQnf9N0T23+HZPrDaxF+pWBAfFAqJjEuS=yQnOg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] prserv/serv.py: Better messaging when starting/stopping the server with port=0
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
X-List-Received-Date: Fri, 18 Sep 2015 16:50:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/17/2015 03:01 PM, Burton, Ross wrote:
> On 15 September 2015 at 15:59, <leonardo.sandoval.gonzalez@linux.intel.com>
> wrote:
>
>> +        sys.stderr.write("WARNING: Server is listening at port %s instead
>> of %s\n"
>> +                         % (rport,port))
>>
>
> I wouldn't call this a warning: port=0 means "pick your own", so it's not a
> warning that a different port was changed, it's useful information.

I add the WARNING string so user notices the new port taken. This info 
is important when trying to stop the server, but you are right, is not a 
warning, it should be just an info. Sending V2 right now.

>
> Ross
>

