Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1093F6BC47
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 11:03:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7QBFf4u032626; Mon, 26 Aug 2013 12:15:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rMZSd-6OFoQK; Mon, 26 Aug 2013 12:15:41 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7QBFYsh032613
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 26 Aug 2013 12:15:36 +0100
Message-ID: <1377514993.26773.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 26 Aug 2013 12:03:13 +0100
In-Reply-To: <521AD8F8.10807@windriver.com>
References: <1377487515-26654-1-git-send-email-bruce.ashfield@windriver.com>
	<1377487515-26654-2-git-send-email-bruce.ashfield@windriver.com>
	<521AD4CE.2020907@linux.intel.com> <521AD8F8.10807@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-libc-headers: ptrace.h: remove ptrace_peeksiginfo_args
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
X-List-Received-Date: Mon, 26 Aug 2013 11:03:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-08-26 at 00:26 -0400, Bruce Ashfield wrote:
> On 13-08-26 12:08 AM, Saul Wold wrote:
> Thanks! And honestly, I didn't leave out the upstream status on purpose
> this time .. like I said, it just isn't in my workflow, since I normally
> seek and destroy them!
> 
> I'm pretty sure I can't convince the kernel guys to not export that
> structure, but I can try. Otherwise, it can have the "dirty hack" upstream
> status.
> 
> >
> > I will put this in MUT so we can move forward tonight.
> 
> Fingers crossed, my builds are working here.

Things failed badly on the autobuilder since we dropped the command
length patch and it was still needed. I've updated it against 3.10,
confirmed it worked on the autobuilder and then merged things.

Cheers,

Richard




