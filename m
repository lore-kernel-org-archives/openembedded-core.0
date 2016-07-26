Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 2725A606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 14:19:15 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160726141914132_0484;
	Tue, 26 Jul 2016 14:19:14 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=21339 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bS3ED-0001k8-Vg; Tue, 26 Jul 2016 10:21:02 -0400
Date: Tue, 26 Jul 2016 10:19:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZZ_1V_68Pya9EUNT6imRVONTkrMzejFAGG9A8f3GYfTQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1607261016100.14495@localhost.localdomain>
References: <alpine.LFD.2.20.1607261001570.14189@localhost.localdomain>
	<CAJTo0LZZ_1V_68Pya9EUNT6imRVONTkrMzejFAGG9A8f3GYfTQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: why is "run-postinsts" considered a "development" recipe?
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
X-List-Received-Date: Tue, 26 Jul 2016 14:19:17 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-1227494584-1469542746=:14495"

--8323328-1227494584-1469542746=:14495
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 26 Jul 2016, Burton, Ross wrote:

>
> On 26 July 2016 at 15:03, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         for the first time, i want to use run-postinsts to run some initial
>       system setup, so i'm assuming i need to add that recipe to my image
>       and the associated files, but i'm curious as to why run-postinsts
>       lives under recipes-devtools. it doesn't strike me as a development
>       tool, so what's the reasoning there? thanks.
>
> For no reason reason other than it's intimately tied to
> dpkg/opkg/rpm, which are also in devtools.

  i'm good with that, and one more (potentially idiotic) question
about run-postinsts. i note in the OE recipe file that it inherits
"update-rc.d", but i'm not sure why.

  AIUI (and i could be totally off-base here), i thought systemd
needed update-rc.d only for backward compatibility for sysvinit-style
services, is that right?

  so while run-postinsts is free to inherit update-rc.d, does that
have any value if one is not using any sysvinit-driven services? or am
i misunderstanding the fundamental functionality of update-rc.d?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-1227494584-1469542746=:14495--
