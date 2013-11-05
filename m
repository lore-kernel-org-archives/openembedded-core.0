Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 360036D1FB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 08:39:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA58crvH010934; Tue, 5 Nov 2013 08:39:17 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TSdifGJtqV61; Tue,  5 Nov 2013 08:39:17 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA58dCK3010959
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 5 Nov 2013 08:39:13 GMT
Message-ID: <1383640748.6271.172.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lu Chong <Chong.Lu@windriver.com>
Date: Tue, 05 Nov 2013 08:39:08 +0000
In-Reply-To: <5278AD91.70901@windriver.com>
References: <1383554475-20223-1-git-send-email-Chong.Lu@windriver.com>
	<1383565229.6271.108.camel@ted> <5278AD91.70901@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] makedevs: fix return error value when input invalid arguments
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
X-List-Received-Date: Tue, 05 Nov 2013 08:39:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-05 at 16:34 +0800, Lu Chong wrote:
> There is no function to implement "-q" and "--squash" in source 
> code(makedevs.c).
> I also checked in busybox, but I didn't find the function.
> So, may I need to add this function? or remove this options of help 
> information.

I kind of guessed this. These kind of details need to be mentioned in
the commit message. Its not good enough to say what changed, you also
need to say why.

Cheers,

Richard

> Best Regards
> Chong
> 
> On 11/04/2013 07:40 PM, Richard Purdie wrote:
> > On Mon, 2013-11-04 at 16:41 +0800, Chong.Lu@windriver.com wrote:
> >> From: Lu Chong <Chong.Lu@windriver.com>
> >>
> >> Remove "-q" and "--squash" options of help information.
> > Why are we removing this?
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> 



