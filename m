Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A500172407
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 16:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBAGLToc000348; Wed, 10 Dec 2014 16:21:29 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZyNiLI4gb73c; Wed, 10 Dec 2014 16:21:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBAGLHHN000340
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 10 Dec 2014 16:21:28 GMT
Message-ID: <1418228514.22903.65.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 10 Dec 2014 16:21:54 +0000
In-Reply-To: <CAP9ODKpZ9bHJOnjLthir2XNntSORzEQUNe0jE2DJptLoL6Vr9Q@mail.gmail.com>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C7CF45250@ORSMSX103.amr.corp.intel.com>
	<54873BE9.9030905@linux.intel.com>
	<CAJTo0LbVEYT9=fo_gKAk0wRSg1H9_-vE5dd5N-SMrMXM38Lbvw@mail.gmail.com>
	<CAP9ODKp2nSb5qMVPW6tfG9Wm3zwuopPDt4Hm4+EY+eBjYyS4Jw@mail.gmail.com>
	<1418228127.22903.61.camel@linuxfoundation.org>
	<CAP9ODKpZ9bHJOnjLthir2XNntSORzEQUNe0jE2DJptLoL6Vr9Q@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 0/3] Upgrades for comply Intel Graphics Stack Release 2014Q3
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
X-List-Received-Date: Wed, 10 Dec 2014 16:22:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2014-12-10 at 14:17 -0200, Otavio Salvador wrote:
> On Wed, Dec 10, 2014 at 2:15 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2014-12-09 at 18:19 -0200, Otavio Salvador wrote:
> >> On Tue, Dec 9, 2014 at 6:06 PM, Burton, Ross <ross.burton@intel.com> wrote:
> >> >
> >> > On 9 December 2014 at 18:14, Aníbal Limón <anibal.limon@linux.intel.com>
> >> > wrote:
> >> >>
> >> >> I don't know, maybe Ross knows?.
> >> >
> >> >
> >> > I ask for Piglit results to verify that approx 95% passes as that's the
> >> > expected pass rate.  I don't bother tracking the exact count as how it
> >> > changes as there's almost ten thousand tests and at some point you have to
> >> > let upstream deal with this.
> >>
> >> What is the point in having a tool for regression test if it is not tracked?
> >
> > Going forward, the plan is to track this FWIW. Right now that is a work
> > in progress as the test result collection piece is missing. Its also a
> > chicken and egg problem, you can't track things until you have some
> > tests to track. Things are being run manually to check for regressions
> > in a coarse manner too and this is better than not at all.
> 
> Well, when asked Ross said he is not tracking this data. So the question...

He personally isn't and he had valid reasons for looking at an overall
percentage rather than individual scores, but the QA people working on
the project are working towards tracking the data. Once we can track it,
we will need some ways of analysing the data as that in itself is
tricky.

Cheers,

Richard



