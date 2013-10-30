Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB4060FC1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 10:44:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9UAhvBf010772; Wed, 30 Oct 2013 10:43:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id t3rwkMvwokFp; Wed, 30 Oct 2013 10:43:57 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9UAhpgS010769
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 30 Oct 2013 10:43:53 GMT
Message-ID: <1383129826.25877.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2013 10:43:46 +0000
In-Reply-To: <CAMKF1sqT+NZkhg=74iXJtZUKSiTu8HXzPbQbPRO881LzzDWsbA@mail.gmail.com>
References: <1383022443-4171-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1sqT+NZkhg=74iXJtZUKSiTu8HXzPbQbPRO881LzzDWsbA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: fix library path in FILES_${PN}
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
X-List-Received-Date: Wed, 30 Oct 2013 10:44:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-10-29 at 16:03 -0700, Khem Raj wrote:
> On Mon, Oct 28, 2013 at 9:54 PM,  <rongqing.li@windriver.com> wrote:
> > -FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
> > -FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
> > +FILES_${PN} = "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
> > +FILES_${PN}-dbg += "${prefix}/lib/pseudo/lib*/.debug"
> > +INSANE_SKIP_${PN} += "libdir"
> > +INSANE_SKIP_${PN}-dbg += "libdir"
> > +
> 
> may be you can use ${nonarch_base_libdir} instead of hardcoding

It is pointless using that expression if the path is hardcoded into the
source though, which in this case, I suspect it is :(

Cheers,

Richard


