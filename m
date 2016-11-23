Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id DD7DB71AC1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 11:35:19 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161123113515953_0685;
	Wed, 23 Nov 2016 03:35:15 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=18898 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c9VpU-0002k7-Ec; Wed, 23 Nov 2016 06:35:08 -0500
Date: Wed, 23 Nov 2016 06:34:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZvk-Ssv3Bc5rSYSuYCm2rQma4Vwv2jvh5zdE7cCPE0Vg@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1611230633180.8293@ca624034.mitel.com>
References: <alpine.LFD.2.20.1611230540200.7856@ca624034.mitel.com>
	<CAJTo0LZvk-Ssv3Bc5rSYSuYCm2rQma4Vwv2jvh5zdE7cCPE0Vg@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: migrating simple tarballs over to OE recipes?
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
X-List-Received-Date: Wed, 23 Nov 2016 11:35:21 -0000
Content-Type: multipart/mixed; BOUNDARY="587864349-1252168029-1479900844=:8293"

--587864349-1252168029-1479900844=:8293
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 23 Nov 2016, Burton, Ross wrote:

>
> On 23 November 2016 at 10:42, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         colleague has a pile of tarballs that were used to customize an x86
>       centos system, wants to move all that to OE with as little fuss as
>       possible, i guess the simplest way is to just create recipes that have
>       the same tarball in the files/ directory, and write a trivial
>       do_install() task that untars it into the root fs, yes?
>
>
> Pretty much, yeah.
>
> If you've a large pile and they're all effectively the same then a
> little class can automate it even more.

  already going down that road, just wanted to make sure i hadn't
overlooked something obvious.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587864349-1252168029-1479900844=:8293--
