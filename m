Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CF0576FAE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 12:22:12 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2PCM8pO032333; Tue, 25 Mar 2014 12:22:08 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gUejTLjyImcI; Tue, 25 Mar 2014 12:22:08 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2PCM5c4032323
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 25 Mar 2014 12:22:06 GMT
Message-ID: <1395750118.24890.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 25 Mar 2014 12:21:58 +0000
In-Reply-To: <CAP9ODKr4icx=rWteGJ_o9zA2Czkn8ZOjMOAqmT3LwxJY79VZKw@mail.gmail.com>
References: <1395743793.24890.21.camel@ted>
	<CAP9ODKr4icx=rWteGJ_o9zA2Czkn8ZOjMOAqmT3LwxJY79VZKw@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Add fixes for binutils issue 16428
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
X-List-Received-Date: Tue, 25 Mar 2014 12:22:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-03-25 at 09:13 -0300, Otavio Salvador wrote:
> On Tue, Mar 25, 2014 at 7:36 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > "ld:i386 crashes with -static -fPIE -pie"
> > https://bugs.launchpad.net/ubuntu/+source/binutils/+bug/1266492
> >
> > This adds in two upstream binutils fixes to avoid the internal error
> > triggered by the combination of -static with -pie on x86 builds. This
> > triggers a backtrace which then triggers a bug in glibc where the process
> > ends up hanging on some systems with broken libcs.
> >
> > We can't fix the libc but we can stop the internal error and hence
> > avoid the hanging builds.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > +     file://fix-pr16428a.patch \
> > +     file://fix-pr16428b.patch \
> 
> Please add the Upstream-Status field in the two patch  files stating
> this is a 'Backport'.

Well spotted, I did realise this after I sent the patch and I've already
updated the version in master-next which is testing more widely at the
moment.

Cheers,

Richard



