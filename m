Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 40AB26C729
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 13:47:50 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMDlh67018309; Fri, 22 Nov 2013 13:47:43 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 58BTsz0i94lV; Fri, 22 Nov 2013 13:47:43 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMDlWQn018299
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Nov 2013 13:47:34 GMT
Message-ID: <1385128049.16887.165.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 22 Nov 2013 13:47:29 +0000
In-Reply-To: <CAP9ODKry-KUYhXeKqn7iefb=rchCN9Xiu-GyFwj6A_eXtxD42g@mail.gmail.com>
References: <1385061961-4697-1-git-send-email-mark.hatle@windriver.com>
	<CAP9ODKry-KUYhXeKqn7iefb=rchCN9Xiu-GyFwj6A_eXtxD42g@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image-prelink.bbclass: use the pseudo env var PSEUDO_ALLOW_FSYNC for prelink
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
X-List-Received-Date: Fri, 22 Nov 2013 13:47:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-22 at 11:42 -0200, Otavio Salvador wrote:
> On Thu, Nov 21, 2013 at 5:26 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > (Note: this patch is sent for YP compliance, I don't believe it is
> >  applicable to general oe-core.)
> >
> > This would actually emit fsync calls, which may fix the do_rootfs failure
> > on older systems like CentOS 5.x or SuSE 11.
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> > Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> 
> There're a Yocto bug about this issue, no?

There is and its not something we're going to fix in master since the
changes are invasive and likely pointless since its a race problem and
just moves the race. You'd probably have to run fsync after ever single
command just to be safe.

The correct fix is to use an OS with a working filesystem as far as I'm
concerned.

Cheers,

Richard


