Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6437E60017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 18:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t75Is1Mi022546; Wed, 5 Aug 2015 19:54:01 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BBgKQDQQLwbY; Wed,  5 Aug 2015 19:54:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t75IrhGJ022530
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 5 Aug 2015 19:53:59 +0100
Message-ID: <1438800822.30467.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Wed, 05 Aug 2015 13:53:42 -0500
In-Reply-To: <55C0D57A.4060805@mlbassoc.com>
References: <1438699939-9055-1-git-send-email-gary@mlbassoc.com>
	<1438700203.30526.8.camel@linuxfoundation.org>
	<55C0D57A.4060805@mlbassoc.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python3: Fix nativesdk build
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
X-List-Received-Date: Wed, 05 Aug 2015 18:54:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-04 at 09:08 -0600, Gary Thomas wrote:
> On 2015-08-04 08:56, Richard Purdie wrote:
> > On Tue, 2015-08-04 at 08:52 -0600, Gary Thomas wrote:
> >> The nativesdk package is built without Py_DEBUG which causes some
> >> compile errors.  This patch fixes those errors allowing the nativesdk
> >> package to build.
> >>
> >> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> >> ---
> >>   .../python/python3/fix-nativesdk-build.patch       | 28 ++++++++++++++++++++++
> >>   meta/recipes-devtools/python/python3_3.4.3.bb      |  1 +
> >>   2 files changed, 29 insertions(+)
> >>   create mode 100644 meta/recipes-devtools/python/python3/fix-nativesdk-build.patch
> >>
> >> diff --git a/meta/recipes-devtools/python/python3/fix-nativesdk-build.patch b/meta/recipes-devtools/python/python3/fix-nativesdk-build.patch
> >
> > No description of the patch or Upstream-Status. I'm surprised python
> > would have this issue. Do they not recommend building in this
> > configuration or not support/test it?
> 
> I'm not sure - obviously it's not done often (as it breaks badly)
> 
> Maybe it would be cleaner just to let Py_DEBUG be set for the nativesdk
> build but I couldn't see how/why this is not set in this case.

This is what really worries me. I think we likely should be setting this
and the question is therefore why isn't it set?

Cheers,

Richard


