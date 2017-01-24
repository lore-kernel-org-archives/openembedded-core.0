Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3450A60750
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 21:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0OLPkm2008696; Tue, 24 Jan 2017 21:25:46 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ysPU8qJurMwO; Tue, 24 Jan 2017 21:25:46 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0OLPgSR008693
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 Jan 2017 21:25:43 GMT
Message-ID: <1485293141.30673.63.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrew Goodbody <andrew.goodbody@cambrionix.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jan 2017 21:25:41 +0000
In-Reply-To: <LOXP123MB011715CA6AFD7F2EA6C0964B85750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
References: <LOXP123MB0117C97F4BE309CCAA9AFAF585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<LOXP123MB0117B11AD747FFC1742D78C685750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485277371.30673.59.camel@linuxfoundation.org>
	<LOXP123MB01174F8944CFABF7E023B92585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485280217.30673.61.camel@linuxfoundation.org>
	<LOXP123MB011715CA6AFD7F2EA6C0964B85750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: configure error for glibc 2.25.2
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
X-List-Received-Date: Tue, 24 Jan 2017 21:25:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-01-24 at 18:08 +0000, Andrew Goodbody wrote:
> > 
> > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > I'm running out of time to write this up and post properly but the
> > patch I think should work is this:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie
> > /wip-
> > rss&id=414a75521f5d5dfb50385abab052f87dbc88f1c1
> > 
> > ("staging: Remove hardcoded PACKAGE_ARCHS from the class" in case I
> > rebase it)
> > 
> > I will get this cleaned up and sent soon.
> Thanks but unfortunately that did not work for me.
> 
> I did a cleanall on glibc before trying to build it, but the result
> was the same.

Try a "bitbake glibc-initial -c clean"?

Cheers,

Richard

