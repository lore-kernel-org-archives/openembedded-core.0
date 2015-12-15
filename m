Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3ED9973195;
	Tue, 15 Dec 2015 16:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFGbdbR004678; Tue, 15 Dec 2015 16:37:39 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jiO_J9N38Lo4; Tue, 15 Dec 2015 16:37:39 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFGbXjG004673
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 15 Dec 2015 16:37:35 GMT
Message-ID: <1450197453.13505.72.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philip Balister <philip@balister.org>, Mariano Lopez
	<mariano.lopez@linux.intel.com>, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Date: Tue, 15 Dec 2015 16:37:33 +0000
In-Reply-To: <5670400E.6030201@balister.org>
References: <567039E1.5000205@linux.intel.com> <5670400E.6030201@balister.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [RFC] Mark of upstream CVE patches
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
X-List-Received-Date: Tue, 15 Dec 2015 16:37:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-12-15 at 11:30 -0500, Philip Balister wrote:
> I also suggest copying the
> 
> https://lists.yoctoproject.org/listinfo/yocto-security
> 
> list.

and the architecture list, this is something that should apply to more
than OE-Core ideally.

Cheers,
Richard

> Philip
> 
> On 12/15/2015 11:03 AM, Mariano Lopez wrote:
> > There is an initiative to track vulnerable software being built
> > (see
> > bugs 8119 and 7515). The idea is to have a testing tool that would
> > check
> > the recipe versions against CVEs. In order to accomplish such task
> > there
> > is need to reliable mark the patches from upstream that solve CVEs.
> > 
> > There have been two options to mark the patches that solve CVEs:
> > 
> > 1. Have  "CVE" and the CVE number as the patch filename.
> >   Pros:
> >     Doesn't require a new tag.
> >   Cons:
> >     It is not flexible to add more information, for example two
> > CVEs in
> > the same patch
> > 
> > 2. Add a new tag in the patch that have the CVE information.
> >   Pros:
> >     It is flexible and can add more information.
> >   Cons:
> >     Require a change in the patch metadata.
> > 
> > What I would recommend is to add a new tag in the patch, it must
> > contain
> > the CVE ID. With this it would be possible to look for the CVE
> > information easily in the testing tool or in NIST, MITRE, or
> > another web
> > page. For example, this would be part of the patch for CVE-2013
> > -6435,
> > currently in OE-Core:
> > 
> > -- snip --
> > 
> > Upstream-Status: Backport
> > CVE: CVE-2013-6435
> > 
> > Reference:
> > https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2013-6435
> > 
> > -- snip --
> > 
> > The expected output of this discussion is a standard format for CVE
> > patches that most, if not all, of community members agree on.
> > 
> > Please let me know your comments.
> > 
> > Cheers,
> > 
> > Mariano Lopez

