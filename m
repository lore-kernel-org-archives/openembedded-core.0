Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TkvxZ-0006wz-Qp
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 13:07:45 +0100
Received: from rrcs-24-173-181-34.sw.biz.rr.com ([24.173.181.34]:55474
	helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TkvjD-0006iw-Mc; Tue, 18 Dec 2012 06:52:55 -0500
Date: Tue, 18 Dec 2012 05:52:51 -0600 (CST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <50CF97C1.4010800@windriver.com>
Message-ID: <alpine.DEB.2.02.1212180552050.8256@oneiric>
References: <alpine.DEB.2.02.1212171522560.2766@oneiric>
	<50CF97C1.4010800@windriver.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: should BBFILES also refer to .inc files?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 12:07:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 17 Dec 2012, Mark Hatle wrote:

> On 12/17/12 3:27 PM, Robert P. J. Day wrote:
> >
> >    looking at someone else's layer and there's this line in layer.conf:
> >
> > BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend
> > ${LAYERDIR}/recipes*/*/*.inc"
> >
> > is there a rationale for including .inc files in BBFILES?  i don't
> > recall ever seeing that before.
>
> This is incorrect.  Only file that are processed by the recipe parser should
> be listed.  Specifically '.bb' and '.bbappend' files.

  i thought as much, i just never lose the ability to be surprised by
oddities i run across.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


