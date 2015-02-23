Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5A86B71633
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 18:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1NI6WpX014801; Mon, 23 Feb 2015 18:06:32 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id I9O9JmIjyF8g; Mon, 23 Feb 2015 18:06:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1NI6IR0014776
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Feb 2015 18:06:29 GMT
Message-ID: <1424714778.26813.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 23 Feb 2015 18:06:18 +0000
In-Reply-To: <CAP9ODKp4QG0iSUzUU8ZaAkKjsg34zo8FwHiXZkD-XoA_su1hpA@mail.gmail.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
	<dbb562e543729b016d4a31ceaf08da3abb24f267.1424709353.git.paul.eggleton@linux.intel.com>
	<CAP9ODKqa+7EZ_4hw=_-XOgQMyxeiSRRMAcXrGVpKwXLcLLrNPw@mail.gmail.com>
	<5866784.j6W0KFP0Zl@peggleto-mobl5.ger.corp.intel.com>
	<CAP9ODKp4QG0iSUzUU8ZaAkKjsg34zo8FwHiXZkD-XoA_su1hpA@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] populate_sdk_ext: add extensible SDK
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
X-List-Received-Date: Mon, 23 Feb 2015 18:06:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-02-23 at 15:00 -0300, Otavio Salvador wrote:
> On Mon, Feb 23, 2015 at 2:54 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Monday 23 February 2015 14:41:34 Otavio Salvador wrote:
> >> On Mon, Feb 23, 2015 at 2:00 PM, Paul Eggleton
> >> <paul.eggleton@linux.intel.com> wrote:
> >> > From: Randy Witt <randy.e.witt@linux.intel.com>
> >> >
> >> > This bbclass will create an SDK with a copy of bitbake and the metadata
> >> > and sstate for the target specified for the task. The idea is to let
> >> > "system" developers both work on applications and then test adding them
> >> > to an image without having to switch between workspaces or having to
> >> > download separate items.
> >> >
> >> > Rather than running bitbake directly however, the primary way of running
> >> > builds within the extensible SDK is to use the "devtool" command. The
> >> > rest of the build system is fixed via locked shared state signatures,
> >> > and thus only the recipes you have added get built.
> >> >
> >> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >> > Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> >> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>
> >> Why another class? it could be tuned using SDKIMAGE_FEATURES
> >
> > If you look at what the class does it would be a bit messy to do it that way -
> > I wanted to get something working with minimal impact. I don't doubt
> > that it could be implemented as an SDKIMAGE_FEATURES item though
> > with extra work.
> 
> As far this does not gets merged I am fine with that. This is clearly
> a WIP code and shouldn't be merged as is.

This code adds in an alternative SDK format and it drives that using a
different task target. Right now its hard for people to see where things
are going, this puts it in easy reach whilst allowing the current SDK to
continue to work too.

I think a choice of two different task targets here makes sense to drive
this configuration rather than SDKIMAGE_FEATURES and I agree with Paul
that adding it the other way would be complex, error prone and
confusing.

Cheers,

Richard



