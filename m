Received: from atl4mhfb01.myregisteredsite.com ([209.17.115.55])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1U8n2v-0000CU-1S
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 08:27:54 +0100
Received: from atl4mhob05.myregisteredsite.com
	(atl4mhob05.myregisteredsite.com [209.17.115.43])
	by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1M7BeTV007000 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2013 02:11:41 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob05.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1M7BdGb026027 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2013 02:11:39 -0500
Received: (qmail 32437 invoked by uid 0); 22 Feb 2013 07:11:39 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 22 Feb 2013 07:11:39 -0000
Message-ID: <51271A2A.6070604@topic.nl>
Date: Fri, 22 Feb 2013 08:11:38 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1361464203.git.sgw@linux.intel.com>
	<CAJTo0LbDEX1evEJHX9_dfB2+wEK_wYTB6kJd1iwxbXivmwtY0w@mail.gmail.com>
In-Reply-To: <CAJTo0LbDEX1evEJHX9_dfB2+wEK_wYTB6kJd1iwxbXivmwtY0w@mail.gmail.com>
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
X-List-Received-Date: Fri, 22 Feb 2013 07:27:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/21/2013 05:39 PM, Burton, Ross wrote:
> On 21 February 2013 16:31, Saul Wold <sgw@linux.intel.com> wrote:
>> MiLo (1):
>>    util-linux: Add package for libmount
>
> This appears fine but I'm seeing weird problems where although the
> library is moved out, the shlibdeps are not correct (i.e.
> util-linux-fsck will occasionally revert to finding libmount.so.1 in
> util-linux).  I'd love to understand why. :/

If there's anything I can do to help let me know. Is this now blocking 
the integration?

I haven't found any issues with the dependencies, but I've only tested 
with the util-linux-mount/umount pacakges, and the sfdisk package (which 
does not depend on libmount).

Mike.


