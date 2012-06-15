Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SfVkJ-00010z-GL for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 14:35:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5FCOj6e013341
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 13:24:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12720-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 13:24:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5FCObYR013335
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 13:24:38 +0100
Message-ID: <1339763076.24333.113.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jun 2012 13:24:36 +0100
In-Reply-To: <CAMZjud2uk23xtx3=nrmEg_uBNYcs_C6YiJ1Xeiz2vcD-LEdxdQ@mail.gmail.com>
References: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1so7Y_ccRi_RcfjRzzbska1WRbY7N8w=VuN=aFp-U5oYSw@mail.gmail.com>
	<CAMZjud22RrKU8cEAPwu+K4Ze2hPVHo-5z17uu3Zj1cJvk6pNnQ@mail.gmail.com>
	<CAMKF1sqDF9-hGz_H34AP1onxOrbJ5tp2Ds0_SuMfA=bOkL9o6g@mail.gmail.com>
	<CAMZjud2uk23xtx3=nrmEg_uBNYcs_C6YiJ1Xeiz2vcD-LEdxdQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] strace: update to 4.7
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
X-List-Received-Date: Fri, 15 Jun 2012 12:35:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-15 at 10:42 +0300, Marinescu, Bogdan A wrote:
> On Fri, Jun 15, 2012 at 12:27 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Thu, Jun 14, 2012 at 5:42 AM, Marinescu, Bogdan A
> > <bogdan.a.marinescu@intel.com> wrote:
> >> I was able to build strace 4.7 with uclibc succesfully, but I'm unable
> >> to build an uclibc image (even core-image-minimal) to do an actual
> >> test due to various compilation errors. Should I keep on trying to
> >> compile an Yocto image to test strace+uclibc or is the succesful
> >> compilation step enough?
> >
> > hmmm, it should be ok I guess. Which image were you trying to build.
> > btw. only core-image-minimal, core-image-core and core-image-sato,
> > meta-toolchain work with uclibc others are not tried.
> 
> I tried with core-image-minimal. I added these two lines to my local.conf:
> 
> CORE_IMAGE_EXTRA_INSTALL += "strace"
> TCLIBC = "uclibc"
> 
> The libiconv problem is a minor one, it turns out that gettext and the
> kernel also refuse to compile in this configuration.

I think the difference is that the poky distro config turns some
warnings into errors. We've gone through and fixed all those warnings
for all the usual "official" combinations we test.

Cheers,

Richard



