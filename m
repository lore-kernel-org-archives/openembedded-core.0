Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob14.myregisteredsite.com
	(atl4mhob14.myregisteredsite.com [209.17.115.52])
	by mail.openembedded.org (Postfix) with ESMTP id 19A73601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 13:47:34 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob14.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	u7VDlXYh020842 for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 09:47:33 -0400
Received: (qmail 20791 invoked by uid 0); 31 Aug 2016 13:47:33 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO ?192.168.80.121?)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 31 Aug 2016 13:47:33 -0000
To: openembedded-core@lists.openembedded.org
References: <1472649771-10124-1-git-send-email-mike.looijmans@topic.nl>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <57C6DFF4.20503@topic.nl>
Date: Wed, 31 Aug 2016 15:47:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1472649771-10124-1-git-send-email-mike.looijmans@topic.nl>
Subject: Re: [PATCH] initscripts: Start devpts at 06 instead of 38
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
X-List-Received-Date: Wed, 31 Aug 2016 13:47:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-08-16 15:22, Mike Looijmans wrote:
> For example bootlogd needs devpts to be running, but bootlogd starts
> at 07. Starting bootlogd early makes perfect sense, so the best option
> here is to move devpts up to 06 to prevent this error message at boot:
> cannot allocate pseudo tty: No such file or directory
>
> Systems that have CONFIG_LEGACY_PTYS in the kernel will not see this
> message. Since it is called "LEGACY" for a reason, fixing this in
> userspace appears to be the better option here.
>
> The devpts script does not need anything except a mounted "/dev" which
> has been arranged in "S02sysfs.sh" already.

A second thought here: I was looking into the other scripts and I think it 
would make sense to just integrate the "devpts" script into "sysfs". The sysfs 
description already claims to "Mount initial set of virtual filesystems the 
kernel provides and that are required by everything." and devpts fits that 
description quite well.



