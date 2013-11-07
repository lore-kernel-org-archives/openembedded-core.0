Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC636D571
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 22:26:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA7MQanY030271; Thu, 7 Nov 2013 22:26:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qguimOTCeUJG; Thu,  7 Nov 2013 22:26:36 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA7MQWIw030267
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 7 Nov 2013 22:26:33 GMT
Message-ID: <1383863188.6271.273.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 07 Nov 2013 22:26:28 +0000
In-Reply-To: <lyob5wb669.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1383182680-20871-1-git-send-email-xufeng.zhang@windriver.com>
	<20131031082625.GE32015@jama>
	<lyob5wb669.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Delay rm_work to run after do_bundle_initramfs
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
X-List-Received-Date: Thu, 07 Nov 2013 22:26:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-07 at 16:08 +0100, Enrico Scholz wrote:
> Martin Jansa <martin.jansa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> writes:
> 
> > Why not add "before" param to addtask?
> >
> > addtask bundle_initramfs after do_compile before do_build
> >
> > could do the trick
> 
> no; due to
> 
>   do_bundle_initramfs[nostamp] = "1"
> 
> a (non-initramfs) kernel will be rebuilt everytime although nothing has
> been changed.  The initramfs related tasks should be executed only when
> an initramfs is really used.

There is no good reason to have this as a nostamp task any more. With
the checksums on the stamp files, we have reliable image generation now.

Cheers,

Richard


