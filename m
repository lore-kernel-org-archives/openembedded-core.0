Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 82BA9606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 14:27:45 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20160726142744038_0485;
	Tue, 26 Jul 2016 14:27:44 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=19292 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bS3MR-0002Sb-UQ; Tue, 26 Jul 2016 10:29:32 -0400
Date: Tue, 26 Jul 2016 10:27:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0La791M2fVxEXcYud+K7A0SvGwwWUb51xMm-J0+kQ4=GYg@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1607261026280.14653@localhost.localdomain>
References: <alpine.LFD.2.20.1607261001570.14189@localhost.localdomain>
	<CAJTo0LZZ_1V_68Pya9EUNT6imRVONTkrMzejFAGG9A8f3GYfTQ@mail.gmail.com>
	<alpine.LFD.2.20.1607261016100.14495@localhost.localdomain>
	<CAJTo0La791M2fVxEXcYud+K7A0SvGwwWUb51xMm-J0+kQ4=GYg@mail.gmail.com>
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
X-List-Received-Date: Tue, 26 Jul 2016 14:27:48 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-2133194943-1469543256=:14653"

--8323328-2133194943-1469543256=:14653
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 26 Jul 2016, Burton, Ross wrote:

>
> On 26 July 2016 at 15:19, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         i'm good with that, and one more (potentially idiotic) question
>       about run-postinsts. i note in the OE recipe file that it inherits
>       "update-rc.d", but i'm not sure why.
>
>         AIUI (and i could be totally off-base here), i thought systemd
>       needed update-rc.d only for backward compatibility for sysvinit-style
>       services, is that right?
>
>         so while run-postinsts is free to inherit update-rc.d, does that
>       have any value if one is not using any sysvinit-driven services? or am
>       i misunderstanding the fundamental functionality of update-rc.d?
>
> It inherits update-rcd and systemd so that it runs on both systemd
> and sysvinit systems.

  ok, so my initial assumption was correct ... its value lies solely
in interoperability with sysvinit components; if i have a pure systemd
build, it has no effect. gotcha.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-2133194943-1469543256=:14653--
