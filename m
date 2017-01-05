Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 768186E5FB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 08:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v058sEaO027855; Thu, 5 Jan 2017 08:54:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MfVTzZbrxXR2; Thu,  5 Jan 2017 08:54:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v058sBdY027852
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 5 Jan 2017 08:54:12 GMT
Message-ID: <1483606451.4367.78.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Christopher Larson
	<kergoth@gmail.com>
Date: Thu, 05 Jan 2017 08:54:11 +0000
In-Reply-To: <CAJTo0LYepu3mAAc=Y76RxBW20w1gEVH1+ms7gpfmSTB-ePfrcQ@mail.gmail.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
	<CAJTo0LYepu3mAAc=Y76RxBW20w1gEVH1+ms7gpfmSTB-ePfrcQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Add opengl to REQUIRED_DISTRO_FEATURES for some recipes
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
X-List-Received-Date: Thu, 05 Jan 2017 08:54:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-01-04 at 23:49 +0000, Burton, Ross wrote:
> 
> On 4 January 2017 at 22:57, Christopher Larson <kergoth@gmail.com>
> wrote:
> > These aren't buildable without it, and adding it fixes oe-core
> > world builds
> > with nodistro (which does not have the opengl feature by default).
> > 
> Am I still the only person who thinks skipping of recipes should be
> recursive, so if say libx11 throws a SkipRecipe then everything else
> that depends on it is also magically skipped?

Just to highlight the challenge here, the provider of virtual/libc
raises a SkipRecipe, therefore every target recipe which isn't allarch
gets skipped and "bitbake world" returns success. We have SkipRecipe
code in the libcs so this isn't even that unlikely. I suspect you'd
argue that is broken.

How do you tell the difference between this case which is a clear error
and your case of X11 being disabled?

Cheers,

Richard


