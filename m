Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7727560EA8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 19:58:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Oct 2013 12:58:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1015,1371106800"; d="scan'208";a="410012472"
Received: from unknown (HELO [10.255.15.107]) ([10.255.15.107])
	by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2013 12:58:52 -0700
Message-ID: <524B297C.7090804@linux.intel.com>
Date: Tue, 01 Oct 2013 12:58:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1380654945-17787-1-git-send-email-sgw@linux.intel.com>
	<1380656968.3822.12.camel@x121e.pbcl.net>
In-Reply-To: <1380656968.3822.12.camel@x121e.pbcl.net>
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
X-List-Received-Date: Tue, 01 Oct 2013 19:58:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2013 12:49 PM, Phil Blundell wrote:
> On Tue, 2013-10-01 at 12:15 -0700, Saul Wold wrote:
>> +	int status;
>> +	struct stat sb;
>> +
>> +	memset(&sb, 0, sizeof(struct stat));
>> +	status = stat(path, &sb);
>
> Don't you want lstat() there?  Also, I think *stat() is guaranteed to
> fill in all of sb if it returns anything other than an error, so the
> memset() may be redundant.
>
I was keeping the same code style from the file function in the same code.

I chose to use stat() to maintain the same failure and error handling we 
have currently.

> I sort of wonder whether just unlink()ing the destination prior to
> calling mknod would be a simpler and more robust way of fixing this
> problem.
>
I was attempting to get a point fix for the release, we can worry about 
a more robust handling of the error / upgrade case in 1.5.1 or 1.6.

> Also, on a tangential note, you seemed to have rather a surfeit of
> signed-off-by lines in your email.
>
Fixed on the branch!

Sau!

> p.
>
>
>
>

