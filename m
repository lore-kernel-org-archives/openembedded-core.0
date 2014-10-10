Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D447770734
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 10:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9AAbI8M005724; Fri, 10 Oct 2014 11:37:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id V1i2OLsjQ_83; Fri, 10 Oct 2014 11:37:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9AAbD5g005720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 10 Oct 2014 11:37:14 +0100
Message-ID: <1412937467.10719.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 10 Oct 2014 11:37:47 +0100
In-Reply-To: <54372DEF.7080101@windriver.com>
References: <1412891594-9608-1-git-send-email-otavio@ossystems.com.br>
	<543719D4.9080308@windriver.com>
	<CAP9ODKqHaOc6W0+WpyrdhQjXWaD++MdfMiUFWh0aKZVC0uJq8Q@mail.gmail.com>
	<54372DEF.7080101@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] toolchain-scripts.bbclass: Allow sourcing of subscript for environment
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
X-List-Received-Date: Fri, 10 Oct 2014 10:37:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-10-09 at 19:53 -0500, Mark Hatle wrote:
> On 10/9/14, 7:41 PM, Otavio Salvador wrote:
> > On Thu, Oct 9, 2014 at 8:27 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> >> On 10/9/14, 4:53 PM, Otavio Salvador wrote:
> >>>
> >>> Sometimes we require extra environment settings to be available on the
> >>> environment for proper SDK work. This were done, in past, using
> >>> '_append' tasks however with the split of the environment in a
> >>> canadian package this has been broken.
> >>>
> >>> The easier and more flexible solution is to use environment subscripts
> >>> which are sources by the main script. These are now looked at:
> >>>
> >>>    $OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh
> >>>
> >>> and sourced.
> >>>
> >>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >>
> >>
> >> I really like this approach.  However, is there any way for the subscripts
> >> to be arch specific?
> >
> > I think we can plan on that but this would be 1.8 material IMO. This
> > is enough for what we need today and can easily be improved in future
> > work. What do you think?
> >
> 
> I think it's a fairly low risk change..  I'm certainly not against it.

We can easily add the target part too, I've just sent out a patch which
does this. I do agree that this is probably a good way forward for being
able to extend the scripts.

Cheers,

Richard


