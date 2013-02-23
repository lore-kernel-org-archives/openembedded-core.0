Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1U9BjV-0005ap-8t
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Feb 2013 10:49:31 +0100
Received: from atl4mhob13.myregisteredsite.com
	(atl4mhob13.myregisteredsite.com [209.17.115.51])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1N9XFje002109 for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2013 04:33:15 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob13.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1N9XDHd001246 for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2013 04:33:13 -0500
Received: (qmail 18068 invoked by uid 0); 23 Feb 2013 09:33:12 -0000
Received: from unknown (HELO ?10.0.0.14?)
	(mike@milosoftware.com@85.150.144.104)
	by 0 with ESMTPA; 23 Feb 2013 09:33:12 -0000
Message-ID: <51288CD7.2070800@topic.nl>
Date: Sat, 23 Feb 2013 10:33:11 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1361464203.git.sgw@linux.intel.com>
	<CAJTo0LbDEX1evEJHX9_dfB2+wEK_wYTB6kJd1iwxbXivmwtY0w@mail.gmail.com>
	<51271A2A.6070604@topic.nl>
	<CAJTo0LaWCAtjiQWq5=FUWq68ty+O2fPYJ8DLLPT-35zqwWn6eg@mail.gmail.com>
In-Reply-To: <CAJTo0LaWCAtjiQWq5=FUWq68ty+O2fPYJ8DLLPT-35zqwWn6eg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/41] Selected Updates and fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Feb 2013 09:49:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/22/2013 10:52 AM, Burton, Ross wrote:
> On 22 February 2013 07:11, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>> If there's anything I can do to help let me know. Is this now blocking the
>> integration?
>>
>> I haven't found any issues with the dependencies, but I've only tested with
>> the util-linux-mount/umount pacakges, and the sfdisk package (which does not
>> depend on libmount).
>
> Can you verify that util-linux-fsck is no longer depending on
> util-linux with this patch?  Maybe I've got a confused build area.

This is what opkg reports on my running systems, with the libmount patch 
applied, looks fine to me, a few require libmount1, and none require 
util-linux itself. For example:


Package: util-linux-mount
Version: 2.22.2-r1
Depends: libmount1 (>= 2.22.2), update-alternatives-cworth, libc6 (>= 2.17)


Package: util-linux-fdisk
Version: 2.22.2-r1
Depends: update-alternatives-cworth, libblkid1 (>= 2.22.2), libc6 (>= 2.17)

Package: util-linux-fsck
Version: 2.22.2-r1
Depends: libmount1 (>= 2.22.2), update-alternatives-cworth, libblkid1 
(>= 2.22.2), libc6 (>= 2.17)


-- 
Mike Looijmans - Topic Automation


