Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B61177318A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 13:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3LDGANH012657; Thu, 21 Apr 2016 14:16:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zlxgqL25STvt; Thu, 21 Apr 2016 14:16:10 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3LDG6Sa012654
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 21 Apr 2016 14:16:07 +0100
Message-ID: <1461244566.31320.119.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Thu, 21 Apr 2016 14:16:06 +0100
In-Reply-To: <alpine.LFD.2.20.1604210848320.4088@localhost.localdomain>
References: <alpine.LFD.2.20.1604210738320.5726@localhost.localdomain>
	<CAJTo0LakXXOvj9_aKmYxy4OdxgP6rOp5EqLZtAajp8iFf7qkuA@mail.gmail.com>
	<alpine.LFD.2.20.1604210848320.4088@localhost.localdomain>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: trying to reconcile OE builds with rpm4-format rpm files built on centos 6
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
X-List-Received-Date: Thu, 21 Apr 2016 13:16:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-04-21 at 08:50 -0400, Robert P. J. Day wrote:
> On Thu, 21 Apr 2016, Burton, Ross wrote:
> 
> > 
> > On 21 April 2016 at 13:06, Robert P. J. Day <rpjday@crashcourse.ca>
> > wrote:
> >         next bit of muttering is, "can we downgrade the OE build to
> > use
> >       rpm4-format packages?", which is not a path down which i want
> > to walk.
> > 
> > 
> > Assuming that the obviously correct option of "build the packages
> > inside OE" really is being written off for mysterious reasons, rpm4
> > was only just removed from oe-core (though depending on what
> > releases you're using you may have never noticed it be added and
> > removed again).  So you could just recover that from history
> > (oe-core a6e7a86f1635be9a688c56c25e9d215ea4d2cc84 removed it) and
> > fix it up.
> 
>   just to be clear, if i can dredge up the recipe for rpm_4, i'm
> assuming i'd want to specify that i want the "package-management"
> image feature, as well as stating:
> 
> PREFERRED_VERSION_rpm = "4.%"
> PREFERRED_VERSION_rpm-native = "4.%"
> 
> correct?

Just to confuse things further, you could write an OE recipe which took
the v4 rpm files from the other system and then simply repackaged them
into v5 rpms files. Nothing says you *must* compile from source, the
input could be the v4 rpms.

Cheers,

Richard



