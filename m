Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAmJs-0005qw-Rr for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 19:01:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MHqA2P017758
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 17:52:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16529-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 17:52:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MHq0uo017752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 17:52:02 GMT
Message-ID: <1332438722.9740.290.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Mar 2012 17:52:02 +0000
In-Reply-To: <CAMKF1soTe_6YB+eh_5YLojiAh9=bMP+hu4DUzi8SHSvABv0Nuw@mail.gmail.com>
References: <cover.1330053959.git.raj.khem@gmail.com>
	<bab8960657c873358e301979445c8fa4e81cc15f.1330053959.git.raj.khem@gmail.com>
	<1330100504.5477.6.camel@ted>
	<CAMKF1srNpxainQ2ZyZ=wKZmmuLdp_fEjyTr1JKMRGVO4X8QV2w@mail.gmail.com>
	<4F5531C5.30007@linux.intel.com> <20120322012358.GF6857@denix.org>
	<CAMKF1soKyp62Q7K7xiAY-6YDdP+qezAC281-6qS3XYYf8emY+w@mail.gmail.com>
	<CAMKF1soTe_6YB+eh_5YLojiAh9=bMP+hu4DUzi8SHSvABv0Nuw@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/4] default-distrovars: Add empty weak definition for DISTRO variable
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
X-List-Received-Date: Thu, 22 Mar 2012 18:01:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-22 at 09:48 -0700, Khem Raj wrote:
> On Wed, Mar 21, 2012 at 9:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, Mar 21, 2012 at 6:23 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >>
> >> -DISTROOVERRIDES ?= "${DISTRO}"
> >> +DISTROOVERRIDES ?= "${@d.getVar('DISTRO', True) or ''}"
> >
> > whats wrong with patch I proposed ?
> 
> Richard
> 
> I was in same situation as Denys when I did that patch. I think
> this could be a good patch to consider

I agree and its merged! :)

Cheers,

Richard



