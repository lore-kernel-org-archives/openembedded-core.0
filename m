Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ABBA675D4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 07:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9T7djDH015579; Thu, 29 Oct 2015 07:39:45 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iUoJ5ElISK-C; Thu, 29 Oct 2015 07:39:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9T7dTqp015566
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 29 Oct 2015 07:39:40 GMT
Message-ID: <1446104369.4521.25.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Oct 2015 07:39:29 +0000
In-Reply-To: <CAJTo0LY-DAxN5+wbgkOv0TsVHUWfPtJ_yJN8cBdxCx5NP5UOJg@mail.gmail.com>
References: <C5B806CA-2384-4924-8FA7-8BC6F146416A@gmail.com>
	<611CD789-ACC1-47CE-9503-2C40F26E4BB1@gmail.com>
	<CAJTo0LY-DAxN5+wbgkOv0TsVHUWfPtJ_yJN8cBdxCx5NP5UOJg@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] perl: fix Perl5 module builds
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
X-List-Received-Date: Thu, 29 Oct 2015 07:39:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-29 at 07:31 +0000, Burton, Ross wrote:
> On 28 October 2015 at 10:26, Jens Rehsack <rehsack@gmail.com> wrote:
>         Since it's two weeks ago since submitted and this patch series
>         fixes several problems how yocto deals with perl module
>         distributions, I'd like to get a more concrete explanation why
>         an infrastructure fix isn't validated during feature freeze
>         for branching.
>
>         None of the three patches adds a feature, they all fix broken
>         infrastructure of perl module handling in Yocto which should
>         better now validated than after branching.
>         Since after freeze the master branch might become unstable for
>         a while, I might not be able to re-submit.

>
> These patches are in the current build under consideration for merging
> in time for the Jethro release.  Sorry for the lack of feedback on
> them, this release has been cursed with autobuilder stability problems
> which have taken up a lot of our time.

Given the last round of autobuilder results, I just merged them.

Cheers,

Richard



