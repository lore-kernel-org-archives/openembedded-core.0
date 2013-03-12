Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UFRXX-000821-Dy
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 16:55:00 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2CFcITt023664
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 08:38:19 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 12 Mar 2013 08:38:19 -0700
Message-ID: <513F4BF9.4090903@windriver.com>
Date: Tue, 12 Mar 2013 10:38:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130216 Thunderbird/17.0.3
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1363087472-32085-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LZypsC9Ai9ZyBhEmS8gv4zSQd7ViJ4k_KppqwD2oBMeKw@mail.gmail.com>
In-Reply-To: <CAJTo0LZypsC9Ai9ZyBhEmS8gv4zSQd7ViJ4k_KppqwD2oBMeKw@mail.gmail.com>
Subject: Re: [PATCH] package.bbclass: add debug-without-src PACKAGE_DEBUG_SPLIT_STYLE
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
X-List-Received-Date: Tue, 12 Mar 2013 15:55:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/12/13 10:28 AM, Burton, Ross wrote:
> On 12 March 2013 04:24, Martin Jansa <martin.jansa@gmail.com> wrote:
>> * same as original and default version, but does not package source files in PN-dbg
>
> You can mark this as closing
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3621, which would be
> good for my bug list.  Richard had concerns that he listed in the bug,
> so having done tests and demonstrating that the loss of source doesn't
> impact the usefulness of the debug files would be good.

I am curious as to the use of the dbg package (w/o) source on the target system.

In my experience, the dbg binaries are useless without the associated source. 
Most of the people I know either use an on-target debugger or a cross debugger, 
both of which need the associated sources to tell you anything about what is 
going on.

For someone who just wants pure backtrace information, it's usually easier to 
avoid the whole split-and-strip process that generates the dbg files.  But of 
course this can sacrifice the usefulness of being able to do field debugging.

(Note, I'm not against the patch.. it looks fine to me... I just don't 
understand the usefulness..  other then the associated defect says they are "too 
big", which again, I don't doubt.)

--Mark

> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



