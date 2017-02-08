Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 99E9971C27
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18E0dG7016222; Wed, 8 Feb 2017 14:00:39 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zt-zFNy4QbbZ; Wed,  8 Feb 2017 14:00:39 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18E0a2W016219
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Feb 2017 14:00:37 GMT
Message-ID: <1486562436.24931.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
Date: Wed, 08 Feb 2017 14:00:36 +0000
In-Reply-To: <CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
	<CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Wed, 08 Feb 2017 14:00:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-07 at 17:35 +0000, Burton, Ross wrote:
> 
> On 7 February 2017 at 04:24, Khem Raj <raj.khem@gmail.com> wrote:
> > This is converging the recipes for go from
> > meta-virtualization and oe-meta-go
> > 
> I'm still of the opinion that this should be in meta-go, not oe-
> core...
> 
> (but totally agree that converging is essential)

I've just been reading the various responses.

The benefit of core would be that it would get included in some of the
core test builds/coverage and that we've have the maintainer structure
that core has to help ensure patches get merged, if that has been a
problem in the past.

The downside is more pressure onto the OE-Core maintainers in various
ways.

I would like to see the duplication removed and have one good solution
for it. If adding it to core is how we achieve that, great, I can work
with that (and we can always split it out again) but I'm open to other
ideas too, if they can work...

Cheers,

Richard

