Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A136E70753
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 23:15:50 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6INERnh006482; Sat, 19 Jul 2014 00:15:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 94jlPtpRHlhE; Sat, 19 Jul 2014 00:15:31 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6INFP7g006684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 19 Jul 2014 00:15:27 +0100
Message-ID: <1405725320.26348.80.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Sat, 19 Jul 2014 00:15:20 +0100
In-Reply-To: <53C9A11B.3020805@linux.intel.com>
References: <cover.1405542583.git.ross.burton@intel.com>
	<934289b8ba6a8b7a0f1eec8aabf723f823d515d8.1405542583.git.ross.burton@intel.com>
	<53C9A11B.3020805@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] default-distrovars: update license whitelists to use canonical names
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
X-List-Received-Date: Fri, 18 Jul 2014 23:16:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-07-18 at 15:35 -0700, Saul Wold wrote:
> On 07/16/2014 02:08 PM, Ross Burton wrote:
> > Now that all licenses are canonicalised to SPDX names when processing, we need
> > to rename the whitelists to the match.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >   meta/conf/distro/include/default-distrovars.inc |    6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> > index 1bc8e46..8d24d66 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -23,9 +23,9 @@ IMAGE_FEATURES ?= ""
> >
> >   # This is a list of packages that are used by the build system to build the distribution, they are not
> >   # directly part of the distribution.
> > -HOSTTOOLS_WHITELIST_GPLv3 ?= ""
> > -WHITELIST_GPLv3 ?= "less"
> > -LGPLv2_WHITELIST_GPLv3 ?= "libassuan gnutls libtasn1 libidn libgcc libgcc-initial gcc-runtime"
> > +HOSTTOOLS_WHITELIST_GPL-3.0 ?= ""
> > +WHITELIST_GPL-3.0 ?= "less"
> > +LGPLv2_WHITELIST_GPL-3.0 ?= "libassuan gnutls libtasn1 libidn libgcc libgcc-initial gcc-runtime"
> >
> 
> This change seems to make multilib builds unhappy, both on the 
> Autobuilder and locally, see attached output.

FWIW I've fixed this before I merged it, it needed a tweak to
multilib.bbclass...

Cheers,

Richard


