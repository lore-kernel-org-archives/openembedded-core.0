Return-Path: <mike.looijmans@topic.nl>
Received: from smtp10.online.nl (smtp10.online.nl [194.134.42.55])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4986F281
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 08:21:42 +0000 (UTC)
Received: from smtp10.online.nl (localhost [127.0.0.1])
	by smtp10.online.nl (Postfix) with ESMTP id 434E940253
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 09:21:42 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp10.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 09:21:42 +0100 (CET)
Message-ID: <5312EA16.6090403@topic.nl>
Date: Sun, 02 Mar 2014 09:21:42 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
References: <53121CF2.6090402@topic.nl>
	<CANyK_8fBSHAtoQ2ZyG4yJK87N42Wn5bb+xHanbvkNw3w7NxEbA@mail.gmail.com>
In-Reply-To: <CANyK_8fBSHAtoQ2ZyG4yJK87N42Wn5bb+xHanbvkNw3w7NxEbA@mail.gmail.com>
X-Online-Scanned: by Cloudmark authority (on smtp10.online.nl)
Subject: Re: rootfs fails to build in current master
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
X-List-Received-Date: Sun, 02 Mar 2014 08:21:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2014 07:03 PM, Paul Barker wrote:
> On 1 March 2014 17:46, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>> I get this mysterious error at rootfs after updating to current master:
>>
>> Exception: AttributeError: 'module' object has no attribute
>> 'shell_trap_code'
...
>
> As a quick stab-in-the-dark guess: Are you using the current master of
> Bitbake to build this? Each branch of OpenEmbedded has a corresponding
> branch of Bitbake, OE master requires Bitbake master.

That could be the case - though in the past it complained when bitbake 
was out of date.

I fetched bitbake's master.

Now I'm getting dozens of fetcher and parser failures, so apparently 
something changed in the fetching of repositories.


-- 
Mike

