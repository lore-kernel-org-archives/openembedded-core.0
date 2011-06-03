Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QSVK3-0000Wf-6L
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 16:25:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p53EMiIZ025341
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jun 2011 07:22:44 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 3 Jun 2011 07:22:43 -0700
Message-ID: <4DE8EE32.9060905@windriver.com>
Date: Fri, 3 Jun 2011 09:22:42 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4DE56B0D.4020209@intel.com> <4DE87AD1.1050004@linux.intel.com>
In-Reply-To: <4DE87AD1.1050004@linux.intel.com>
Subject: Re: Tell me your build error message annoyances!
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
X-List-Received-Date: Fri, 03 Jun 2011 14:25:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/3/11 1:10 AM, Darren Hart wrote:
> 
> 
> On 05/31/2011 03:26 PM, Scott Garman wrote:

...

> o In general I find the default UI to be exceedingly noisy. It feels
>   very much like what I would write for something I was actively
>   developing - ie, something I expect to break a lot! I don't think
>   that's the sort of impression we want users to have while building a
>   release (for example).

I have heard similar comments from others as well.

>   I'd prefer if what we currently get today was the output of -D. The
>   current output could instead be something a lot more in the vein of
>   what we see with recipe parsing. Perhaps one line per
>   BB_NUMBER_TREADS (N), maybe something like:
> 
>   Task 2300/4600 [####################                    ]
>     0: linux-yocto: do_compile
>     1: matchbox: do_fetch
>     ...
>     N: dbus: do_configure
> 
>   It would of course update the current lines and not scroll. Most of
>   the time, this would be plenty information. Upon failure we stop
>   updating the "UI" and print something like:

Even if it did scroll, somehow limiting the messages being printed would be
beneficial.  It's been suggested to me simply one (or two) messages per step MAX.

Running linux-yocto do_compile
Running matchbox do_fetch
...

I believe currently we have around 3-5 messages per step, and it's still too
noisy -- unless you need to debug something.

>   ERROR: An unhandled exception occured while processing
>          linux-yocto: do_fetch
> 
>          Exception: No such file or directory.
> 
>          Run with -D for a more detailed error report or consult the
>          appropriate log file:
> 
>          $(pwd)/tmp/work/$machine/linux-yocto-$HASH-$HASH \
>          /temp/log.do_fetch.$PID
> 
>   Or something along those lines.
> 
> Thanks for collecting these Scott, great idea!
> 



