Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDEAC7F879
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 22:47:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9TMlpu6009545
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Oct 2019 15:47:52 -0700
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 29 Oct 2019 15:47:50 -0700
To: Adrian Bunk <bunk@stusta.de>, Trevor Gamblin <trevor.gamblin@windriver.com>
References: <20191029203921.17227-1-trevor.gamblin@windriver.com>
	<20191029211331.GB26658@localhost>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <c62fab85-862c-0770-89cc-770425703421@windriver.com>
Date: Tue, 29 Oct 2019 18:47:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191029211331.GB26658@localhost>
X-Originating-IP: [172.25.44.8]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: inotify-tools: move recipe to oe-core from meta-oe
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
X-List-Received-Date: Tue, 29 Oct 2019 22:47:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 10/29/19 5:13 PM, Adrian Bunk wrote:
> On Tue, Oct 29, 2019 at 03:39:21PM -0500, Trevor Gamblin wrote:
>> An interface for inotify already exists through pyinotify,
>> but migrating inotify-tools to oe-core provides an option
>> that doesn't rely on python.
>> ...
> 
> pyinotify is in meta-python.
> 
> The only option currently in oe-core is to use C,
> which is the standard way to use inotify.
> 
> inotify-tools can be useful, but I don't see the rationale
> why it should move from meta-oe to oe-core.

Trevor,

I thought the motivation for moving inotify-tools to oe-core
was:
  a) It's a nice cmdline utility
  b) coreutils ptests needs it.

I think I've mislead you into believing b) since
inotify-tools provides:
   /usr/bin/inotifywait
   /usr/bin/inotifywatch
and I don't see any mention of that in the coreutils/tests directory
or in fact in coreutils.git at all:

$ cd .../coreutils.git
$ grep -r inotifywa * -> NULL

So we need to figure out what the failing coreutils ptests that
involve inotify really need since it seems that it's not inotify-tools.

../Randy

> 
> cu
> Adrian
> 


-- 
# Randy MacLeod
# Wind River Linux

