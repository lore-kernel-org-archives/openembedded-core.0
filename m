Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D183260E24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 10:12:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5RACVkE023897; Fri, 27 Jun 2014 11:12:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id t9y5sWX4chOZ; Fri, 27 Jun 2014 11:12:31 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5RACQdL023892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 27 Jun 2014 11:12:27 +0100
Message-ID: <1403863939.28648.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 27 Jun 2014 11:12:19 +0100
In-Reply-To: <ly8uoi7k26.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1403654908.git.sgw@linux.intel.com>
	<06c0930e320d25880f1fab734179e949b1ffce46.1403654908.git.sgw@linux.intel.com>
	<ly8uoi7k26.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/10] liburcu: Update to 0.8.4
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
X-List-Received-Date: Fri, 27 Jun 2014 10:12:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-06-27 at 11:56 +0200, Enrico Scholz wrote:
> Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
> 
> > rename from meta/recipes-support/liburcu/liburcu_0.8.1.bb
> > rename to meta/recipes-support/liburcu/liburcu_0.8.4.bb
> 
> With this version, build fails always with
> 
> | liburcu/0.8.4-r0/userspace-rcu-0.8.4/urcu/compiler.h:125:5: error: #error Your gcc version produces clobbered frame accesses
> |  #   error Your gcc version produces clobbered frame accesses
> | make[2]: *** [wfqueue.lo] Error 1
> 
> This new package seems to blacklist[1] gcc-4.8.0 till gcc-4.8.2 which is
> used by OE.

OE-Core is using gcc 4.9 by default now?

That said do we know which fix is needed for gcc 4.8.x? I thought we
were on 4.8.2 to be honest but its possible we weren't...

Cheers,

Richard


