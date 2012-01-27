Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rqii3-00059U-JP for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 11:07:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0R9xJI5006727
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:59:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06380-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:59:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0R9xB9r006721
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:59:12 GMT
Message-ID: <1327658353.19643.443.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jan 2012 09:59:13 +0000
In-Reply-To: <CAAQYJAsUbgnrREyabxF6mLed5m+3a0mU_tMcSu_rPYF4DHSnnQ@mail.gmail.com>
References: <1326546473-26329-1-git-send-email-andrea.adami@gmail.com>
	<C049B63B-A0B3-4FFF-85AF-C9ECEA3FAEF9@dominion.thruhere.net>
	<CAAQYJAu_8aV4fs24bjJd-xCTc28QQ1nYtaSmbK04xzYDeuVqkw@mail.gmail.com>
	<15F6B012-1598-4434-8A1A-28E056BFFAE2@dominion.thruhere.net>
	<CAAQYJAupcHBBUNQWGyoCXV1OMcSpHH0UT0AzJWCsz5yMCoA_bA@mail.gmail.com>
	<4F1D8F89.2050806@windriver.com>
	<CAAQYJAsUbgnrREyabxF6mLed5m+3a0mU_tMcSu_rPYF4DHSnnQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] tzdata_2011n: provide pkg_postinst and timezone defaults
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2012 10:07:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-27 at 09:56 +0100, Andrea Adami wrote:
> Please take on hold this patch.
> Further inspection of do_rootfs logs reveals that the postinst is run
> during that task and the code tries to write /etc/localtime on host,
> fails and exits 1.
> 
> I'll add a check like
> 
> pkg_postinst_${PN}() {
> if test "x$D" != "x"; then
> 	exit 1
> else
> 
> and send a revised patch in a few hours.

How about prefixing the paths with $D instead of forcing this onto the
target? (note, not ${D})

Cheers,

Richard





