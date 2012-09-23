Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1TFvi1-0001JJ-IN
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 01:35:33 +0200
Received: (qmail 24157 invoked by uid 1003); 23 Sep 2012 23:22:45 -0000
Received: from unknown (HELO ?10.212.226.128?) (philip@opensdr.com@98.191.4.50)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	23 Sep 2012 23:22:45 -0000
Message-ID: <505F99C3.1030409@balister.org>
Date: Sun, 23 Sep 2012 19:22:43 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1348436710.4444.247.camel@x121e.pbcl.net>
	<1540243.ihgQ8YivHP@helios>
In-Reply-To: <1540243.ihgQ8YivHP@helios>
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Allow modules.tar.gz generation to be inhibited
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
X-List-Received-Date: Sun, 23 Sep 2012 23:35:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2012 06:20 PM, Paul Eggleton wrote:
> On Sunday 23 September 2012 22:45:10 Phil Blundell wrote:
>> The modules.tar.gz archive is sometimes of no value and it can take
>> a noticeable time to build if many modules were enabled in the kernel
>> configuration.  The extraneous file also contributes to deploy/ clutter
>> and is a waste of disk space.
>>
>> Allow it to be suppressed by setting KERNEL_DEPLOY_MODULE_TARBALL=0.
>
> I'm wondering, does anyone still find this file useful?

I've used it to put modules in rootfs when there is a new kernel version 
and I do not have easy access to packages feeds. This speeds testing.

Philip


