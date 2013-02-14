Received: from atl4mhfb02.myregisteredsite.com ([209.17.115.56])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1U5zKP-0007s3-6L
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 14:58:22 +0100
Received: from atl4mhob10.myregisteredsite.com
	(atl4mhob10.myregisteredsite.com [209.17.115.48])
	by atl4mhfb02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1EDgJ0T000877 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 08:42:20 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob10.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1EDgIuJ021716 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 08:42:18 -0500
Received: (qmail 8833 invoked by uid 0); 14 Feb 2013 13:42:18 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 14 Feb 2013 13:42:18 -0000
Message-ID: <511CE9B9.2010405@topic.nl>
Date: Thu, 14 Feb 2013 14:42:17 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <511BB265.8030505@windriver.com> <511CA4B2.1090307@intel.com>
	<511CA9E2.70700@windriver.com>
	<CAJTo0LYLtan2=YkzCN9Xvkj7k695LGba7T1QMHwYQ8EK46YvgQ@mail.gmail.com>
	<511CDA0F.9060002@topic.nl> <511CDBA1.70906@linaro.org>
	<511CDF1D.2060805@topic.nl>
In-Reply-To: <511CDF1D.2060805@topic.nl>
Subject: Re: How to "implement" systemd
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
X-List-Received-Date: Thu, 14 Feb 2013 13:58:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/14/2013 01:57 PM, Mike Looijmans wrote:
> On 02/14/2013 01:42 PM, Marcin Juszkiewicz wrote:
>> W dniu 14.02.2013 13:35, Mike Looijmans pisze:
>>> So far i've been using good old initscripts for my systems. I want to
>>> try out systemd. Having zero experience with that, I just added
>>> "systemd" to the DISTRO_FEATURES and started a fresh  build. The build
>>> ran fine, but it produced something that still seems to be using
>>> initscripts, albeit that a few things stopped working (the network did
>>> not start, for example).
>>
>> DISTRO_FEATURES_INITMAN = "systemd" is what you want.
>
> Sorry, I have to amend my original post.
>
> DISTRO_FEATURES_INITMAN = "systemd"
>
> is just what I did (added it to my distro .conf file), because from the
> source I gathered that that was the way to get it into DISTRO_FEATURES.
>
> How can I check whether it's using systemd? I don't see any obvious
> difference in the rootfs, and I never saw any systemd package being
> built either.

Ah, to (probably) answer my own question, there was a hidden
VIRTUAL-RUNTIME_init_manager = "sysvinit"
in my config chain, which was probably the cause. Running another build, 
and I've seen a systemd task being run now...


