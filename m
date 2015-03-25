Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 771DF73C29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 13:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2PDq7o3014755; Wed, 25 Mar 2015 13:52:34 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3_vjt46u6z7d; Wed, 25 Mar 2015 13:52:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2PDqL8Y014771
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Mar 2015 13:52:33 GMT
Message-ID: <1427291541.14020.43.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Mar 2015 13:52:21 +0000
In-Reply-To: <CADkTA4M1TcH-FRStE8M9TREpnW0ZuxjBQW=s4H+GrjFKJoJtRg@mail.gmail.com>
References: <cover.1427222980.git.bruce.ashfield@windriver.com>
	<1427275585.14020.39.camel@linuxfoundation.org>
	<CADkTA4NKxxge6-vqyHka3PnEA9shUW3WHyWX-v4T9L2FDeyD0Q@mail.gmail.com>
	<CADkTA4M1TcH-FRStE8M9TREpnW0ZuxjBQW=s4H+GrjFKJoJtRg@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 25 Mar 2015 13:52:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-03-25 at 09:26 -0400, Bruce Ashfield wrote:
> On Wed, Mar 25, 2015 at 8:13 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Wed, Mar 25, 2015 at 5:26 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Tue, 2015-03-24 at 14:57 -0400, Bruce Ashfield wrote:
> >>> Hi all,
> >>>
> >>> Here is the latest linux-yocto consolidated pull request. It is a mix of
> >>> kernel version -stable imports (CVEs and fixes), kernel configuration
> >>> changes, a documentation update and kernel configuration enhancement.
> >>>
> >>> The -stable updates are routine, and I build/boot tested them here
> >>> (with my fixup commits being evidence). These are ready for a round of
> >>> autobuilder/soak testing.
> >>
> >> Something in here broke lttng-modules causing cascades of failures on
> >> the autobuilder so I've updated it to the latest code on the 2.6 stable
> >> branch and am retesting.
> >
> > Gah. I built and booted here, but can't think of any reason why that didn't
> > trigger and fail here.
> >
> > I've started my own build as well, with a completely clean starting point.
> 
> and sure enough, it blows up on my clean build.
> 
> If your update doesn't resolve this, ping me and I'll take care of the fix.

It seemed to work, we've merged everything to master and branched for
the release. Release build now in progress so we'll see... :)

Cheers,

Richard


