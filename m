Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 73A8876EB2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 12:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t83CAhmC024773; Thu, 3 Sep 2015 13:11:41 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id njkcAoImZ0N7; Thu,  3 Sep 2015 13:11:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t83CBSb4024791
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 3 Sep 2015 13:11:39 +0100
Message-ID: <1441282288.24871.113.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Thu, 03 Sep 2015 13:11:28 +0100
In-Reply-To: <CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
	<CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Joe Slater <jslater@windriver.com>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 12:11:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-02 at 16:23 -0300, Otavio Salvador wrote:
> On Wed, Sep 2, 2015 at 4:09 PM, Randy MacLeod
> <randy.macleod@windriver.com> wrote:
> > On 2015-09-02 11:55 AM, Otavio Salvador wrote:
> >>
> >> On Tue, Sep 1, 2015 at 6:34 PM, Joe Slater <jslater@windriver.com> wrote:
> >>>
> >>> Implements ifup and ifdown.
> >>>
> >>> Copied from https://github.com/WindRiver-OpenSourceLabs/meta-overc.git
> >>> as of commit aa89eebffe06e4aa04701eae9691cb3049cbaef9.
> >>>
> >>> Signed-off-by: Joe Slater <jslater@windriver.com>
> >>
> >>
> >> I think this belongs to meta-networking. Also, what this one provides
> >> which is not provided by the busybox one?
> >
> > We're trying to make busybox optional for larger systems
> > that want to only use the full-featured/bloated packages.
> > It's not a large tax to carry busybox in a 50+ MB image but
> > it would be nice to not require it.
> 
> I see; I still think this belongs to meta-networking as it will allow
> this to be done however won't add new recipes in core.
> 
> If many people start to use this, we can move this to core.

To put this another way, I think it is probably reasonable that we
should be able to build an image from OE-Core with basic functionality
like networking without busybox?

Cheers,

Richard



