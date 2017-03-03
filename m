Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 7812277609
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 10:06:53 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170303100652670_0486;
	Fri, 03 Mar 2017 10:06:52 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=17053 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cjk6o-00046q-6e; Fri, 03 Mar 2017 05:06:46 -0500
Date: Fri, 3 Mar 2017 05:06:42 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Anders Darander <anders@chargestorm.se>
In-Reply-To: <20170303095825.k2mfmg2mnut7hvks@ad.chargestorm.se>
Message-ID: <alpine.LFD.2.20.1703030504170.6531@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703020605560.10072@uk63952.mitel.com>
	<alpine.LFD.2.20.1703020627050.11911@uk63952.mitel.com>
	<20170303095825.k2mfmg2mnut7hvks@ad.chargestorm.se>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "inherit setuptools" versus "inherit pypi" -- a python style question
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
X-List-Received-Date: Fri, 03 Mar 2017 10:06:54 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Mar 2017, Anders Darander wrote:

> * Robert P. J. Day <rpjday@crashcourse.ca> [170302 12:33]:
>
> > On Thu, 2 Mar 2017, Robert P. J. Day wrote:
>
> > >   inherit pypi setuptools
> > >   require python-psutil.inc
>
> > > and the corresponding .inc file contains:
>
> > >   RDEPENDS_${PN} += " \
> > >     ${PYTHON_PN}-shell \
> > >     ${PYTHON_PN}-subprocess \
> > >     ${PYTHON_PN}-threading \
> > >   "
>
> > > so the first recipe inherits pypi, the second one inherits setuptools,
> > > and the third inherits *both*. what is the *preferred* style?
>
> Well, different purposes... If you take a look at pypi.bbclass, it's all
> about how to retrieve the module (source code). setuptools.bbclass is
> about how to install the module...
>
> Ie retrieving and installing...

  yes, i finally twigged to that, but is there a *preferred* style?
from what i've seen, if there is a pair of files for a python module:

  * foo.bb (which includes ...)
  * foo.inc

the common style seems to be that:

  * foo.bb inherits setuptools, while
  * foo.inc inherits pypi (if necessary, of course)

at least i think that was the common style. obviously, there are
perfectly acceptable variations, i'd just like to know if there is a
recommended style.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


