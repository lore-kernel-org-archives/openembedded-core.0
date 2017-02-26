Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6A171A8C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 04:23:50 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1chqNE-00047s-13 from Nathan_Lynch@mentor.com ;
	Sat, 25 Feb 2017 20:23:52 -0800
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Sat, 25 Feb 2017 20:23:49 -0800
From: Nathan Lynch <nathan_lynch@mentor.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4NZCsXM9eE4PyQmdsLa4sDdqawirzisZQmzw-mHZV63Qw@mail.gmail.com>
References: <1484089620-19725-1-git-send-email-nathan_lynch@mentor.com>
	<1484089620-19725-4-git-send-email-nathan_lynch@mentor.com>
	<CADkTA4NZCsXM9eE4PyQmdsLa4sDdqawirzisZQmzw-mHZV63Qw@mail.gmail.com>
Date: Sat, 25 Feb 2017 22:23:47 -0600
Message-ID: <871sultwa4.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] lttng-modules: upgrade to 2.9.0
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
X-List-Received-Date: Sun, 26 Feb 2017 04:23:51 -0000
Content-Type: text/plain

Bruce Ashfield <bruce.ashfield@gmail.com> writes:

> Following up on this old patch .. since it causing a problem with my
> introduction of
> the 4.10 kernel.
>
> I'm going to have to switch back to the git fetching of lttng to easily
> pull in the latest
> changes to adapt to the 4.10 kernel.

I don't see why.  Support for 4.10 has been in lttng-modules' stable-2.9
branch since January, and is included in the v2.9.1 release, which was
tagged a week ago, right before the 4.10 release.  I had intended to
send the update for lttng-modules on Monday but since I've got it ready
I'll send it in a few minutes.

You should not need to use lttng-modules' master branch to work with
released Linux versions.


> lttng just doesn't release often enough for bleeding edge kernels,

That's not my impression at all. The LTTng project diligently tracks
upstream kernel development and ensures that the latest stable branch of
lttng-modules supports the latest released kernel.


> while maintaining
> a set of patches on top of the released version is possible .. I don't see
> the point.

Maintaining a set of patches on top of the released version of
lttng-modules should not be necessary.


> I missed the discussion on this one when it first came out, so I missed the
> reason that
> we switched away from git to the release tarballs ?

I know there's a diversity of opinion on the subject in general, but in
the absence of a need to use git, I think using a release tarball should
be preferred.

