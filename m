Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMO2f-0001lR-Gt for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 19:26:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HHNphF018985
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 18:23:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18928-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 18:23:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HHNkCI018979
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 18:23:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=dSy1J3oP-aRH7QGSLeB3vy7Ykjw@mail.gmail.com>
References: <cover.1305418871.git.sgw@linux.intel.com>
	<E943FF3D-A282-4E6D-8B5A-B954A678A0E1@gmail.com>
	<4DD13B6F.4010009@intel.com>
	<BANLkTi=0TcHgXmYpwCjX6P5h6+y9O2YQFw@mail.gmail.com>
	<1305575479.3424.102.camel@rex> <4DD18DA1.4080501@intel.com>
	<BANLkTi=dSy1J3oP-aRH7QGSLeB3vy7Ykjw@mail.gmail.com>
Date: Tue, 17 May 2011 18:23:45 +0100
Message-ID: <1305653025.3424.269.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC 0/3] Move Old Recipes to meta-extras
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
X-List-Received-Date: Tue, 17 May 2011 17:26:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-16 at 15:34 -0700, Khem Raj wrote:
> On Mon, May 16, 2011 at 1:48 PM, Saul Wold <saul.wold@intel.com> wrote:
> > On 05/16/2011 12:51 PM, Richard Purdie wrote:
> >>
> >> On Mon, 2011-05-16 at 10:08 -0700, Khem Raj wrote:
> >>>
> >>> On Mon, May 16, 2011 at 7:57 AM, Saul Wold<saul.wold@intel.com>  wrote:
> >>>>
> >>>> On 05/15/2011 11:19 PM, Khem Raj wrote:
> >>>>>
> >>>>>
> >>>>> On May 14, 2011, at 5:23 PM, Saul Wold<sgw@linux.intel.com>   wrote:
> >>>>>
> >>>>>> From: Saul Wold<sgw@linux.intel.com>
> >>>>>>
> >>>>>> This proposes to move the YAFFS2-utils, older clutter-1.4
> >>>>>> and older GCC version (4.3.3 and 3.4.4) as they are unused
> >>>>>> and currently unbuildable.
> >>>>>>
> >>>>>
> >>>>> Are we left with any GPLv2 version of gcc after this ?
> >>>>>
> >>>> Khem,
> >>>>
> >>>> Is not having a GPLv2 version of gcc an issue? For the non-gplv3
> >>>> version, my
> >>>> understanding is to have an installed user-space for oe-core for a
> >>>> non-development system, therefore gcc is not an issue.
> >>>>
> >>>
> >>> there are certain parts of gcc which go onto target e.g. libgcc libstdc++
> >>
> >> These have specific license exceptions allowing non-gpl code to use them
> >> as system libraries though?
> >>
> > Richard is correct, there are exception for the runtime parts of GCC.
> > Sorry Khem, I was not catching to original gist of the question.
> 
> exceptions yes but they are not same exceptions between GPLv2 and GPLv3 gcc.

Is there a problem here though? What impact are you concerned with?

Cheers,

Richard



