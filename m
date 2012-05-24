Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXaP4-0001kK-U5
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 17:56:43 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga02.intel.com with ESMTP/TLS/RC4-MD5; 24 May 2012 08:46:28 -0700
Received: by dano14 with SMTP id o14so11571452dan.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 08:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=rmIrtG3VIThMiUgtCN3IdV7/rosCvpE/ZLItFl7C0a4=;
	b=BJSLuUP3ciU5kRJd7/Ot1GV+1RD86qnFpxYVjsD/NVNCIwVT3dwPj0521/GY5rVIrW
	C9x0HkjF6TIf8psHOaOp67p8tEFfa5cgSjmU9XSY5SFg3lnuOpdzWDn7zjx0iblloWfW
	5wmdzNiWUIfqfIUTU85MqG8uIXmOAOTcJOJzHyYWflrh353kygQyoy6S9gcOyMWaQATL
	8K5yczHHs6oYWcAjDQw4nKY6dhJ9sbrtOAHMA0isAZEcr+kfN3Zv8zt7O6dO73viyKik
	ipUarjAEGpz0uOXzuhdW2BbUSfYm+dJa9vxXLh8qasldKJpIfFQ0avICXK6FrG47nD5f
	P9nA==
Received: by 10.68.190.136 with SMTP id gq8mr276925pbc.119.1337874388508;
	Thu, 24 May 2012 08:46:28 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id iv6sm5829217pbc.36.2012.05.24.08.46.25
	(version=SSLv3 cipher=OTHER); Thu, 24 May 2012 08:46:27 -0700 (PDT)
Message-ID: <4FBE57CA.6010307@intel.com>
Date: Thu, 24 May 2012 08:46:18 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <4FBD5E10.3070403@intel.com>
	<223B4521-59A6-42A5-9F1F-71B67C12B8E9@dominion.thruhere.net>
In-Reply-To: <223B4521-59A6-42A5-9F1F-71B67C12B8E9@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkb6X1bVw+7BPDThgfveYUvYvK0SASPA8jlQIRnGy8WDZTphFfgl/5iVqbulwN4kqkRNatz
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] RFC: Merging commits from into the main denzil branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2012 15:56:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2012 04:26 AM, Koen Kooi wrote:
> Op 24 mei 2012, om 00:00 heeft Scott Garman het volgende geschreven:
>
>> Hello all,
>>
>> As most of you know, I've been pulling commits into a pair of
>> sgarman/denzil-next branches which are intended to eventually
>> become the next Denzil point-release, 1.2.1.
>>
>> oe-core based branch:
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next
>
>>
> Would it be possible to do that in the main repo? That saves people
> from needing to add and fetch yet another repo.

I can't start with the main repo, because I don't have commit access to
it, and until I have done some significant testing with my commits, I
want to preserve the ability to rebase my branch.

However, now that I have some autobuilder resources to do more extensive
testing, what I'm proposing is to get my *tested* commits moved from
sgarman/denzil-next into the denzil branch after review from the
community and a merge that Richard will do.

That means the denzil branch will lag my sgarman/denzil-next branch by a
certain amount of time, which I intend to keep down to less than a week.

>> So now to address issue #2. The goal is to incorporate community
>> feedback, so I'm looking to get ACKs or NAKs for these commits
>> before they go into the main denzil branch.
>>
>> My proposal is to send denzil pull requests to the appropriate
>> mailing lists, and Richard can merge them into the main repo denzil
>> branches once they've received review by the community.
>>
>> My goal is to send these pull requests about once per week, once
>> I've managed to get a green build out of the Yocto autobuilder for
>> my contrib branch.
>>
>> What do folks think about this? Now's your opportunity to offer
>> feedback and influence this process.
>
> You're missing a process for people to propose commits for the denzil
> branch. How about this:
>
> If you want to propose a commit from master cherry-pick it into a
> local denzil branch and then send if for review to the oe-core list
> with the [for-denzil] subject prefix. Scott will take care of putting
> it in the pull requests based on the feedback the patch gets.

I can work with that. But keep in mind that if the request is not 
associated with a current bug marked for 1.2.1 in the Yocto bugzilla, I 
will need to see strong community support for including it (aka, 
multiple ACKs). This is needed to avoid scope creep in the point-release.

> What would be nice to have is a (soft) requirement to add the testing
> data in the commit e.g. "Runtime tested on beaglebone/angstrom". Not
> sure how to automate it, but pull-requests should include a
> buidhistory diff when possible.

The more testing that's done with a pull request for 1.2.1, the more it 
can be proven that the change is low risk, and the higher chances it 
will have of making it to the final denzil branch, for certain.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


