Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SWT8W-0003vs-4N for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 15:59:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4LDmrlf025585
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 14:48:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25041-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 14:48:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4LDmi5L025577
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 14:48:44 +0100
Message-ID: <1337608123.22747.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 21 May 2012 14:48:43 +0100
In-Reply-To: <4FBA4608.6080401@balister.org>
References: <1336581863-23833-1-git-send-email-philip@balister.org>
	<CAF6bG8eNvdXghPDFh7omfan5mYY56SLJyPLM_oqWRD=-xsBPrw@mail.gmail.com>
	<4FBA3E04.50403@balister.org> <1337606728.22747.2.camel@ted>
	<4FBA4608.6080401@balister.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Add option to oe-buildenv-internal script to change bitbake location.
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
X-List-Received-Date: Mon, 21 May 2012 13:59:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-05-21 at 09:41 -0400, Philip Balister wrote:
> On 05/21/2012 09:25 AM, Richard Purdie wrote:
> > On Mon, 2012-05-21 at 09:07 -0400, Philip Balister wrote:
> >> On 05/09/2012 01:03 PM, Marko Lindqvist wrote:
> >>> On 9 May 2012 19:44, Philip Balister <philip@balister.org> wrote:
> >>>> Having bitbake inside the oe-core is annoying to some people. This commit
> >>>> adds a second option to the oe-init-build-env script.
> >>>>
> >>>> Run like this:
> >>>>
> >>>> . ./oe-init-build-env ../build ../bitbake
> >>>>
> >>>> for example. Without the second option, the old behavior is preserved.
> >>>>
> >>>> Signed-off-by: Philip Balister <philip@balister.org>
> >>>
> >>>  Maybe you should update comment in oe-init-build-env describing
> >>> typical use to contain this parameter.
> >>
> >> Richard, do you want me to se-send this with Marko's suggestions added?
> > 
> > I'm happy to have a follow up patch, I did merge the original. It broke
> > various assumptions being made by for example the autobuilder scripts so
> > I had to add some other changes already.
> 
> Thanks.
> 
> I'm curious how it could break things since it should not have had any
> effect unless a second argument was present.

Think about another script sourcing the internal build environment
script. You'd then see that script's second option...

Cheers,

Richard



