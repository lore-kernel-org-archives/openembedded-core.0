Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3256260EA8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 20:34:47 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Oct 2013 13:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1015,1371106800"; d="scan'208";a="368432983"
Received: from unknown (HELO [10.255.15.107]) ([10.255.15.107])
	by azsmga001.ch.intel.com with ESMTP; 01 Oct 2013 13:34:44 -0700
Message-ID: <524B31E3.30709@linux.intel.com>
Date: Tue, 01 Oct 2013 13:34:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1380654945-17787-1-git-send-email-sgw@linux.intel.com>
	<1380656968.3822.12.camel@x121e.pbcl.net>
	<524B297C.7090804@linux.intel.com>
	<1380658028.3822.19.camel@x121e.pbcl.net>
In-Reply-To: <1380658028.3822.19.camel@x121e.pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] makedevs: Do not return error if the fifo exisits
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
X-List-Received-Date: Tue, 01 Oct 2013 20:34:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2013 01:07 PM, Phil Blundell wrote:
> On Tue, 2013-10-01 at 12:58 -0700, Saul Wold wrote:
>> On 10/01/2013 12:49 PM, Phil Blundell wrote:
>>> On Tue, 2013-10-01 at 12:15 -0700, Saul Wold wrote:
>>>> +	int status;
>>>> +	struct stat sb;
>>>> +
>>>> +	memset(&sb, 0, sizeof(struct stat));
>>>> +	status = stat(path, &sb);
>>>
>>> Don't you want lstat() there?  Also, I think *stat() is guaranteed to
>>> fill in all of sb if it returns anything other than an error, so the
>>> memset() may be redundant.
>>>
>> I was keeping the same code style from the file function in the same code.
>>
>> I chose to use stat() to maintain the same failure and error handling we
>> have currently.
>
> I'm not quite sure I understand the last sentence you wrote above.  Can
> you expand on why stat() rather than lstat() is the right thing?
>
To be able to handle the dangling symbolic link that Khem mentioned, or 
more like not handle it, let it fall through and fail.

Not that this case is going to happen very often since our 1 pipe fifo 
is the same and not likely going to be a link.

Sau!

>> I was attempting to get a point fix for the release, we can worry
>> about a more robust handling of the error / upgrade case in 1.5.1
>> or 1.6.
>
> Righto.  I am blissfully ignorant of the criteria for the release so I
> am happy to defer to your judgement on that.
>
> p.
>
>
>
>

