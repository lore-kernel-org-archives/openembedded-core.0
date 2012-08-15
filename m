Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T1bli-0008CC-St
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 13:28:11 +0200
Received: from localhost ([127.0.0.1]:57482 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T1baA-0005Iy-Gl
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 11:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=iI5lSKasSqZMnt/Ba1S1svp5WUY=; b=pjRLMHmChmckuG9VFH3L74KBoc1a
	hFlyy9Sr/z9g5CQa1hgo40hVxZA8vaQtLtJdfQ3toalZPzfbCLOOlWfe0nYsRZpJ
	zkUH5TNjk2Pe8kE8tYVa09bS9nUjyRdiMJxiKU9/zhXu4e+k/qgE/PShhjrDyYH4
	GWE+E9RstrdX/1c=
Received: from [195.171.99.130] (port=26959 helo=[192.168.0.47])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T1baA-0005Iv-ET
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 11:16:14 +0000
Message-ID: <502B8554.7070504@communistcode.co.uk>
Date: Wed, 15 Aug 2012 12:17:40 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <2404459.dJBf5OQotX@helios>
In-Reply-To: <2404459.dJBf5OQotX@helios>
Subject: Re: RFC: OE-Core task rework
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 15 Aug 2012 11:28:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 15/08/12 10:46, Paul Eggleton wrote:
> Hi all,
>
> There have been a few requests to review the task recipes (i.e. package
> groups) provided by OE-Core, and indeed these have not really been looked at
> seriously since OE-Core was created. Ideally I think we want them to be useful
> to a wide audience and provide useful units of functionality that can be added
> to an image without the person doing the selection having to manually select
> too many individual packages. Imagine presenting the list of tasks to someone
> in a UI for assembling images (such as Hob or Narcissus) and you can start to
> see that we have some work to do in this area.
>
> I know various distros and users of OE-Core have created their own tasks or
> resurrected tasks from OE-Classic, and this is an opportunity to perhaps look
> at bringing some of these (or at least, parts of them) into the core. It is
> true that tasks will often be an expression of distro policy, and we also
> can't have any tasks in OE-Core that refer to packages that don't exist in OE-
> Core; thus distros will always be extending the base tasks or adding their own
> - and that's fine. However, with some thought I believe we can come up with a
> set of tasks that are generally useful to most people using OE-Core.
>
> For reference, I've compiled a list on the wiki of the current tasks in OE-
> Core with links to the recipes and some notes:
>
>    http://www.openembedded.org/wiki/OE-Core_Task_Rework
>
> Some of the things I think we ought to consider/address as part of this
> exercise:
>
> 1) Do we rename "task" to something a little more understandable to the
> uninitiated, such as "package group"? The word "task" is already used in a
> much more natural sense within bitbake as a unit of work. Historically I
> believe we picked up this term from Debian but I'm not aware of significant use
> by other mainstream distributions.
>

Do the 'tasks' do anything other than specify meta-data groups? If they 
don't include any glue or additional processes then I strongly agree 
that the name should be changed.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



