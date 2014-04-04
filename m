Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 99BA760C14
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 10:38:56 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s34AcmQo004381; Fri, 4 Apr 2014 11:38:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CCOiJ1eWW47s; Fri,  4 Apr 2014 11:38:48 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s34AcjJQ004372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 4 Apr 2014 11:38:47 +0100
Message-ID: <1396607920.2910.109.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Fri, 04 Apr 2014 11:38:40 +0100
In-Reply-To: <533E89CD.206@linaro.org>
References: <1396601617-29638-1-git-send-email-koen.kooi@linaro.org>
	<20140404101456.GI2132@jama> <533E89CD.206@linaro.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] dbus: split dbus-launch out into its own package (again)
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
X-List-Received-Date: Fri, 04 Apr 2014 10:38:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-04-04 at 12:30 +0200, Koen Kooi wrote:
> On 04/04/2014 12:14 PM, Martin Jansa wrote:
> > On Fri, Apr 04, 2014 at 10:53:37AM +0200, Koen Kooi wrote:
> >>   FILES_${PN}-lib = "${libdir}/lib*.so.*"
> >>   RRECOMMENDS_${PN}-lib = "${PN}"
> >> +
> >> +FILES_dbus-launch = "${bindir}/dbus-launch"
> >> +RDEPENDS__dbus-launch = "${PN}"
> >> +RRECOMMENDS_${PN} += "dbus-launch"
> >
> > Is there special reason for not using ${PN}-launch?
> 
> PN is 'dbus-1', not 'dbus'

$ bitbake dbus -e | grep PN=
PN="dbus"

I suspect you're thinking of the name after debian.bbclass is done with
it.

Cheers,

Richard


