Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1TG7br-0001DM-VA
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 14:18:00 +0200
Received: (qmail 19627 invoked by uid 1003); 24 Sep 2012 12:05:11 -0000
Received: from unknown (HELO ?192.168.43.231?)
	(philip@opensdr.com@107.229.103.152)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	24 Sep 2012 12:05:11 -0000
Message-ID: <50604C73.6070309@balister.org>
Date: Mon, 24 Sep 2012 08:05:07 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1348436710.4444.247.camel@x121e.pbcl.net>
	<1540243.ihgQ8YivHP@helios> <505F99C3.1030409@balister.org>
	<CAJTo0Lbi+KEu1=857m0v5xX0geWHA4pDuQqHgALyMt2rPLD8XQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lbi+KEu1=857m0v5xX0geWHA4pDuQqHgALyMt2rPLD8XQ@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 24 Sep 2012 12:18:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2012 04:36 AM, Burton, Ross wrote:
> On 24 September 2012 00:22, Philip Balister <philip@balister.org> wrote:
>>>> Allow it to be suppressed by setting KERNEL_DEPLOY_MODULE_TARBALL=0.
>>>
>>> I'm wondering, does anyone still find this file useful?
>>
>> I've used it to put modules in rootfs when there is a new kernel version and
>> I do not have easy access to packages feeds. This speeds testing.
>
> Sounds like a less than common use-case.  How about setting it to 0 by default?

Fine with me.Expect me to be annoying on irc when I forget how to turn 
it back on :)

Philip


