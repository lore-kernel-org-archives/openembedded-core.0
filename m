Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id F28917108F;
	Thu, 28 Aug 2014 06:38:15 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id ey11so1259343pad.7
	for <multiple recipients>; Wed, 27 Aug 2014 23:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=UD/zt+pjpozkq/DDI5tUkCxGbT/SbhSr+gQ09DhnCqA=;
	b=eVbHhXiyWLGf/oTSgIZk+QS0USxbYhZp0mGpS4dRWOKMT43tizi6YvrIhif4f5l4GP
	GkFjfWM6lRqXVPkwXmJ3ySoHvy6TmosvmPRIHmuvkHyaTQxGQJgUEXGy75yTTkh1U7bN
	3YOaFk09D2PbyjrkJMm/wCki0pYS3R70JWOlR7DgG8LMUbAFLXTeu6PEhUenaVIVaTpv
	PRhLbJ9f9Ueb9uIZv5ALIEiQgK7lONuL5N7NmXCV1ReFNXXhiRYHsjqDWF383pKlShWG
	lw9XFjq3tT90VZv6bV8Pt0mRFRyC3tk7Lf7/SE/BuedB6mTC04AgzsLXRzg35GyA4h4Z
	2Pzg==
X-Received: by 10.68.57.144 with SMTP id i16mr2807181pbq.48.1409207896227;
	Wed, 27 Aug 2014 23:38:16 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id l4sm3810693pdp.66.2014.08.27.23.38.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Aug 2014 23:38:15 -0700 (PDT)
Date: Wed, 27 Aug 2014 23:41:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org, yocto@yoctoproject.org
Message-ID: <20140828064051.GA13139@haswell>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [RFT] Moving on from eglibc to glibc 2.20
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
X-List-Received-Date: Thu, 28 Aug 2014 06:38:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi All

As we all know eglibc has been merged back into glibc and 2.19 was the
last release, here I have put together the recipes for upcoming glibc
2.20 release and removed eglibc 2.19 in favor of move.

I also thought about leaving eglibc in there but then eglibc and glibc
were pretty much same as they always have been that it would be an
incremental change with lot more patches this time.

The tree is here

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/eglibc-to-glibc-2.20

This has not recieved much testing yet and I am looking out for helping
hands here, so try it out in your buid environments and machines of
interest and report back on issues.

The patches also forward port the options group support and few other
patches from eglibc, details are in commit logs, which I think would make 
good candidates for future glibc merge.

This tree will be reworked and rebased so sync back if you see issues
which we will address here

Thanks for your help

-Khem

