Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id ED10C77B20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 14:29:42 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170328142934056_0685;
	Tue, 28 Mar 2017 07:29:34 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=14883 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1css7j-0005Of-AV; Tue, 28 Mar 2017 10:29:27 -0400
Date: Tue, 28 Mar 2017 10:29:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
In-Reply-To: <01f71a47963847fbb79bf376b814d551@XBOX02.axis.com>
Message-ID: <alpine.LFD.2.20.1703281028540.4377@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703280641380.4243@uk63952.mitel.com>
	<01f71a47963847fbb79bf376b814d551@XBOX02.axis.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Standardize strings tests, and join some if/then/while/do lines
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
X-List-Received-Date: Tue, 28 Mar 2017 14:29:43 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Mar 2017, Peter Kjellerstedt wrote:

> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Robert P. J. Day
> > Sent: den 28 mars 2017 12:51
> > To: OE Core mailing list
> > Subject: [OE-core] [PATCH] classes: Standardize strings tests, and join
> > some if/then/while/do lines
> >
> >
> > For better or worse, two types of cleanup in meta/classes directory:
> >
> > * Replace old-style 'x${VAR} = x' tests with -n/-z string tests
> > * Unsplit lines to keep if/then, while/do on same line
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> >   i realize there are two types of tidying here -- if that offends
> > people, i can split it into two separate submissions. nothing here
> > should affect execution, but it's always possible i screwed something
> > up, not sure how to rigourously test these changes.
> >
> >   also, when i did change a shell string test, i added {} around the
> > variable name, it's just a standard i like for visual clarity. apply
> > all or part of what seems useful.
>
> You should absolutely not do this, especially if you want visual clarity
> in a BitBake recipe. This makes the variable look like a BitBake variable
> instead of a shell variable,  and not just to us humans, but to bitbake
> as well...

   yes, ross just pointed that out, i had totally forgotten about
that. so scrap what i sent in earlier.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


