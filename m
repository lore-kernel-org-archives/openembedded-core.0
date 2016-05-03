Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4846072C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 18:27:59 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160503182758711_0685;
	Tue, 03 May 2016 11:27:58 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=54609 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1axf4b-0003BG-KF; Tue, 03 May 2016 14:29:29 -0400
Date: Tue, 3 May 2016 14:27:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4PPYfetBymZ1mii_sc7f71za-V0dBbcgApHyhDHwxKyVw@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1605031421460.12750@localhost.localdomain>
References: <alpine.LFD.2.20.1605031245360.6672@localhost.localdomain>
	<CADkTA4PPYfetBymZ1mii_sc7f71za-V0dBbcgApHyhDHwxKyVw@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: clarifying details about "is not set" lines in kernel config fragment files
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
X-List-Received-Date: Tue, 03 May 2016 18:28:00 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-1183785241-1462300060=:12750"

--8323328-1183785241-1462300060=:12750
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 3 May 2016, Bruce Ashfield wrote:

> On Tue, May 3, 2016 at 1:04 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>         oddly, in the current YP kernel dev manual, i don't see the
>       phrase "is not set" explained anywhere in the entire doc,
>       which is weird since it seems like it would be important.
>
> The manuals don't cover the mechanics of how the mainline kernel is
> configured. Just the same way the don't cover the configuration
> language for any number of packages in the system.

  assuming i'm understanding your position, that's where i'm going to
*strongly* disagree. people who work with the mainline kernel in a
non-OE environment don't use kernel config fragment files. period.
AFAIK (and correct me if i'm wrong), .cfg kernel config fragment files
are exclusively an OE/YP thing, so there is no reason for normal
kernel developers to understand how they work.

  knowing how regular kernel configuration works, and how kernel
config fragment files are processed to aid in that process, are two
*entirely* different things, and how those files are processed is,
IMHO, most assuredly the responsibility of the OE/YP docs to explain.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-1183785241-1462300060=:12750--
