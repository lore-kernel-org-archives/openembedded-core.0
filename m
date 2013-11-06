Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DB2E26D445
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 23:42:53 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA6Nggid019196; Wed, 6 Nov 2013 23:42:42 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hRhpNg9WxOhF; Wed,  6 Nov 2013 23:42:42 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA6Ngbxj019191
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 6 Nov 2013 23:42:39 GMT
Message-ID: <1383781353.6271.200.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 06 Nov 2013 23:42:33 +0000
In-Reply-To: <CAP9ODKrLg1nb5syAUtM4_ipMKenTe1ejXmVsVrqGifiSpBqYjA@mail.gmail.com>
References: <1383689722.6271.184.camel@ted>
	<CAP9ODKrLg1nb5syAUtM4_ipMKenTe1ejXmVsVrqGifiSpBqYjA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: lib/oe/sstatesig: Ensure packagegroups don't continually rebuild
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
X-List-Received-Date: Wed, 06 Nov 2013 23:42:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-06 at 16:51 -0200, Otavio Salvador wrote:
> On Tue, Nov 5, 2013 at 8:15 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > packagegroups are allarch and shouldn't change depending on the target
> > or machine selected. In general they should have good stable namespaces
> > for their dependencies. As such we can exclude them from rebuilding when
> > dependency checksums change.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> What about machine-base and core-boot? this may change depending on machine.

Those already get marked as machine specific. I'd not expect
dependencies to be changing package names there for example so I'm not
sure this is an issue.

Cheers,

Richard



