Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED2A60557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 23:05:50 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f27so11074842pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 16:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=jrhUr85+Uw98Gsnx4opWb6nTvqxy/0VKVZo3rguMAAE=;
	b=ejjrUZm2cr28453nMEvEheEk7V0UPTu1PJX1s/ezwmEMavP/UrQkGmUvrfAUBgFlC+
	2ZvX4MGFZ+gLIdVUs85MQuv6/ASK56KtRlWB8luHlNj1pstMd69FI5AmHfGNF+qY1rSl
	+ribFcknz05U/dW6KWN21MqpVKhfrEimiws0ipWZ+oDWQrVRlhgXl0uJlRZm3mTZdwz7
	Izu9um0IJDSnpLDC0IcszR78PBLqWyhFFObtfHyuU8wmpflxcAfDdl1mCIfZS8eNh6FD
	8ja09xnV2Mr4PW82IXR/qoXVTdIarQF+nW8FGNUk0QyEfE/otWE2bzTwsCukMP72CMn1
	jWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=jrhUr85+Uw98Gsnx4opWb6nTvqxy/0VKVZo3rguMAAE=;
	b=CIq9NJJrrWmIGArrLEA810u5ilkLXvsKKbkmFUgznTAVyH4EiwE4mCWY/7tZF1wmTq
	2Jnvu9gqOWsK/J5wpVSQCx8ffJ9KJb84SWNOHSe6OY2qhoMUS2iQpporsCEjzHoNVR+e
	zKp+ZZMZPoh2LrZYuXf6NXv8LFckVO8VPQ81/ctAjwKassY3ABlGg1qABGlNvIzd9xew
	vhq4v9CQhmomwfZiM3Xc0ODrWdn40IRCmhla0F2LarKntb+CmiuSlmHvirShI/byRq/f
	16lfjdkE5FV5fbYX/eKoq7ufGlSLaw8LU8iRqDTfDXh+BMyITk6r0BXEpYTFIZBdQ4IV
	uRNw==
X-Gm-Message-State: AODbwcB+u+08mo6Va94UMdLff/p85v0nMXjNlWmR21norhNZxGflwFgn
	05/YN71ssFFBnQ==
X-Received: by 10.99.170.2 with SMTP id e2mr442553pgf.204.1494975951937;
	Tue, 16 May 2017 16:05:51 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:553b:f7d3:3d4b:cdbd?
	([2601:202:4001:9ea0:553b:f7d3:3d4b:cdbd])
	by smtp.gmail.com with ESMTPSA id h21sm191656pgn.18.2017.05.16.16.05.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 May 2017 16:05:51 -0700 (PDT)
To: Denys Dmytriyenko <denis@denix.org>
References: <1490031500-38242-1-git-send-email-denis@denix.org>
	<20170421231816.GC20419@denix.org>
	<0fa0e630-137b-73ba-f212-0049b92e5199@gmail.com>
	<20170516215021.GO28053@denix.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d5b89969-7833-d1a7-8685-71468968b93f@gmail.com>
Date: Tue, 16 May 2017 16:05:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170516215021.GO28053@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [morty][PATCH] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Tue, 16 May 2017 23:05:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 05/16/2017 02:50 PM, Denys Dmytriyenko wrote:
> On Mon, Apr 24, 2017 at 09:08:55AM -0700, akuster808 wrote:
>> On 04/21/2017 04:18 PM, Denys Dmytriyenko wrote:
>>> Ping. It's been over a month now...
>> its in my stagging since 4/1.  The AB has been failing with my
>> current changes.
> Is morty now dead?

No. why do you say that? I just sent a pull request over the weekend for 
both Krogoth and Morty. Krogoth is the one heading to community 
supported now that Pyro is out.

this changes is in the pull request
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/meta/classes/sstate.bbclass?h=akuster/morty-next&id=838580431a8923bf38820f10963aca4af51f6f97

- armin


>
>
>>> On Mon, Mar 20, 2017 at 01:38:20PM -0400, Denys Dmytriyenko wrote:
>>>> From: Ed Bartosh <ed.bartosh@linux.intel.com>
>>>>
>>>> .siginfo files are not being accessed from local or NFS-mounted
>>>> sstate mirrors when sstate package is installed, so their atime
>>>> is not updated. If sstate mirror is cleaned based on access time,
>>>> they get deleted, even though they are still being used.
>>>>
>>>> Updated atime of .siginfo symlinks with 'touch -a'. This command
>>>> dereferences symlinks pointing to the local mirror and updates
>>>> atime of the .siginfo file on the mirror.
>>>>
>>>> [YOCTO #10857]
>>>>
>>>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>>> ---
>>>>   meta/classes/sstate.bbclass | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>>>> index 8643f3d..4fdfcc8 100644
>>>> --- a/meta/classes/sstate.bbclass
>>>> +++ b/meta/classes/sstate.bbclass
>>>> @@ -724,6 +724,8 @@ python sstate_sign_package () {
>>>>   #
>>>>   sstate_unpack_package () {
>>>>   	tar -xvzf ${SSTATE_PKG}
>>>> +	# update .siginfo atime on local/NFS mirror
>>>> +	[ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
>>>>   	# Use "! -w ||" to return true for read only files
>>>>   	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
>>>>   	[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig
>>>> -- 
>>>> 2.7.4
>>>>
>>>> -- 
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


