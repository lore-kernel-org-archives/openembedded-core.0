Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BD5706F43F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 17:56:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s22HuGqA024262; Sun, 2 Mar 2014 17:56:16 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0dkiDzS9Tm3c; Sun,  2 Mar 2014 17:56:16 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s22Hu9Ri024258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 2 Mar 2014 17:56:11 GMT
Message-ID: <1393782962.31845.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 02 Mar 2014 17:56:02 +0000
In-Reply-To: <CADkTA4M-GiLi15gyUyD-fdsFf=NV0Q4SjWjnHbQRFjxPQ-PSuw@mail.gmail.com>
References: <1393597694-5843-1-git-send-email-bruce.ashfield@windriver.com>
	<CADkTA4OEvrDPDPq3-cKsX+_gN_qgR_dEVJKPWvkM2bV1TW0NHQ@mail.gmail.com>
	<1393627333.20876.2.camel@ted>
	<CADkTA4M-GiLi15gyUyD-fdsFf=NV0Q4SjWjnHbQRFjxPQ-PSuw@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-dev: bump to v3.14-rc4
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
X-List-Received-Date: Sun, 02 Mar 2014 17:56:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-02-28 at 20:54 -0500, Bruce Ashfield wrote:
> On Fri, Feb 28, 2014 at 5:42 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2014-02-28 at 13:41 -0500, Bruce Ashfield wrote:
> >> FYI: Some extended testing with my image-core-kernel-dev image type
> >> has shown that lttng and perf have some build issues, so we are
> >> finding the issues that we wanted to with this -dev kernel :)
> >
> > Yes, the autobuilder has shown up a raft of issues in that area.
> >
> > http://autobuilder.yoctoproject.org/main/tgrid
> >
> > the line starting 7a30f308b07... is pretty much all kernel related from
> > the dev kernel.
> 
> Yep, I consider the kernel available to BSp writers at the moment, the rest of
> the failures need to be addressed by updating and fixing the packages.
> 
> That being said, I can never make heads or tails of those autobuilder
> summaries .. what exactly would I click on to see if my builds and the
> autobuilder have the same packages causing problems ?

On the above link you can see the horizontal line of boxes corresponding
to "7a30f308b07...". Each red box on that line is a failaure in that
build. "nightly" is a trigger of the others skip that one and click on
the "failed \n BuildImages \n Running Sanity Tests". You'll see some
"stdio" links under the failed targets. Click that and you'll see the
output of the failed build. Obviously if the image fails to build, the
sanity tests fail too so you'd usually start at the first red item.

I appreciate this navigation is a pain, its just what we have right now.
There is an error reporting tool (combination of a pastebin and
kerneloops.org) in the process of being deployed which should make this
much easier in future.

Cheers,

Richard




