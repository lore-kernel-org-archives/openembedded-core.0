Return-Path: <net147@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5436098F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 10:57:33 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id md4so2011415pbc.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 03:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=hNXvmOYHOqn3jLcDjxc4H3M0AeyLq8CFMRf7fbigdac=;
	b=MRgfM7Vy7DA+zQk+TRhThgU5U5DxDDIHOPxg4KxnEM/u/o7+ZwF4KCBv4Zoz4Qh0q7
	QmA8fPMM7rEd2CJE4KmGzegfBx6M0tATE/g7828Xq0OgYuZ461w7BWUX4F+aDw0LkH0U
	AMBBh+cgiloUVRWw2b0zHHOPBDu+f9y8TUtWmuUU+cIioQlNOJJRxs576cHPpEzKlLYN
	bQaaPytYDslCnbzhZa6UPgZPjnv2HjpjscSp7WkMQxUEwoootZNofqPoX/dhUHlqJzY4
	lj1YvXudpsbFEfIpO9KWfvcEZcIvKcY47F/GozqsX4/U8pD/0z8Yw+b5KKzmQingyh02
	J7Bg==
X-Received: by 10.68.243.40 with SMTP id wv8mr8529267pbc.34.1369997854225;
	Fri, 31 May 2013 03:57:34 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	rn7sm46243725pbc.12.2013.05.31.03.57.31 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 03:57:33 -0700 (PDT)
Message-ID: <51A880FA.2050108@gmail.com>
Date: Fri, 31 May 2013 20:52:42 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1369993335-21441-1-git-send-email-net147@gmail.com>
	<51A87B7F.7050702@gmail.com> <3462145.IjGzaGyojb@helios>
	<1466229.5OSf9FtHfZ@helios>
In-Reply-To: <1466229.5OSf9FtHfZ@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory: record removals with Git 2.0 and later
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
X-List-Received-Date: Fri, 31 May 2013 10:57:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 31/05/2013 8:50 PM, Paul Eggleton wrote:
> On Friday 31 May 2013 11:42:27 Paul Eggleton wrote:
>> On Friday 31 May 2013 20:29:19 Jonathan Liu wrote:
>>> On 31/05/2013 7:42 PM, Jonathan Liu wrote:
>>>> There is a behavior change with Git 2.0 where "git add ." will no
>>>> longer record removals by default unless -A (--all) is specified.
>>>> Change to "git add -A ." so removals are recorded with Git 2.0 and
>>>> later.
>>>>
>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>>> ---
>>>>
>>>>    meta/classes/buildhistory.bbclass | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>> Hmm... looks like I interpreted the Git warning incorrectly. Maybe I
>>> need to look into this a bit more and perhaps change the commit message.
>>>
>>> The following appears after a build with buildhistory enabled:
>>> warning: You ran 'git add' with neither '-A (--all)' or
>>> '--ignore-removal',
>>> whose behaviour will change in Git 2.0 with respect to paths you removed.
>>> Paths like 'test.txt' that are
>>> removed from your working tree are ignored with this version of Git.
>>>
>>> * 'git add --ignore-removal <pathspec>', which is the current default,
>>>
>>>     ignores paths you removed from your working tree.
>>>
>>> * 'git add --all <pathspec>' will let you also record the removals.
>>>
>>> Run 'git status' to check the paths you removed from your working tree.
>> So it seems the change is reasonable but yes perhaps the commit message
>> should change to mention that it also avoids a warning with 1.8.3.
> Hmm, I misread - looks like we should be using -A or --all right now since we
> do want deleted files to be recorded.
>
> Cheers,
> Paul
>
Updated patch submitted.

Regards,
Jonathan

