Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 502A760F50
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 23:17:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMNHMUe003147; Fri, 22 Nov 2013 23:17:22 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TcRX1Th3Kwpv; Fri, 22 Nov 2013 23:17:21 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMNHG8f003143
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Nov 2013 23:17:17 GMT
Message-ID: <1385162232.16887.191.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 22 Nov 2013 23:17:12 +0000
In-Reply-To: <CAP9ODKrX9s6S8Cw+m-NiuctPZ4nT7wjkd7CfwuCUjO5Vc5zwXw@mail.gmail.com>
References: <1385132854.16887.178.camel@ted>
	<CAP9ODKrX9s6S8Cw+m-NiuctPZ4nT7wjkd7CfwuCUjO5Vc5zwXw@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] metadata_scm: Avoid crashing on new svn version layouts
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
X-List-Received-Date: Fri, 22 Nov 2013 23:17:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-22 at 16:49 -0200, Otavio Salvador wrote:
> On Fri, Nov 22, 2013 at 1:07 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > This avoids crashing on newer svn layouts where the entries files
> > don't contain three lines. If someone wants to fix this to
> > get the right version on newer subversion checkouts, patches
> > welcome but this at least stops things crashing.
> >
> > [YOCTO #5363]
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Does not seem right to 'workaround' this; it'd be better to fix it properly.

Its bad the system completely crashes and this patch improves/removes
that particular problem.

Equally, I don't have any inclination to figure out the svn changes, I
also don't know anyone with any interest in figuring out svn changes.
This has been broken long enough that I don't think many people can be
using it. If people are, they will fix it...

Cheers,

Richard


