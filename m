Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4816FFAB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 10:32:23 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160527103222415_0484;
	Fri, 27 May 2016 10:32:22 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [99.240.204.5] (port=37876 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1b6F5a-0002ZZ-MH; Fri, 27 May 2016 06:33:58 -0400
Date: Fri, 27 May 2016 06:31:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMKF1srrmTQx7eSz5ZmLP7jeFR1RgpwFT9vQ=Kw3cXvWLUdNCQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1605270627270.29934@localhost.localdomain>
References: <alpine.LFD.2.20.1605260450590.7564@localhost.localdomain>
	<CAMKF1srrmTQx7eSz5ZmLP7jeFR1RgpwFT9vQ=Kw3cXvWLUdNCQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there an actual defensible usage for combining "_append" and "+="?
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
X-List-Received-Date: Fri, 27 May 2016 10:32:27 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 May 2016, Khem Raj wrote:

> On Thu, May 26, 2016 at 11:56 AM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
> >
> >   i've grumbled about this before -- the *apparent* redundancy in
> > combining the "_append" and "+=" constructs -- but someone recently
> > suggested there's a use case for that that weirds me out if true.
> >
> >   given that "_append" defers appending, and that "+=" inserts a
> > space, the argument was that combining them both defers appending
> > *and* inserts a space when appending is finally done.
> >
> >   *blink*.
> >
> >    seriously? is that what that combination is being used for?
>
> I am not sure if its used consciously most of time, I ask developers
> why they used it they just wanted to add to an existing variable and
> += did not work.
>
> the construct is an unintended side effect of bitbake syntax

  but the question remains, are people using that weird combination
*deliberately*, if it in fact gives you the combination of the two
effects? as in, are people writing:

  VAR_append += "string"

when it would be equivalent to write

  VAR_append = " string"

simply because they're too lazy to add the leading space?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


