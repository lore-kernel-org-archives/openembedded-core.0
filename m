Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 4EDE571CAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 16:49:36 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170213164900523_0684;
	Mon, 13 Feb 2017 16:49:00 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=33691 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cdJo4-0000Lf-LW; Mon, 13 Feb 2017 11:48:52 -0500
Date: Mon, 13 Feb 2017 11:48:50 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Christopher Larson <kergoth@gmail.com>
In-Reply-To: <CABcZAN=Zusmrc4vzmgZoTbLC_GpOetU-r_fZa-Le1upevn18+Q@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1702131147380.14688@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702090654250.29564@uk63952.mitel.com>
	<37eeaba5-4561-6e3c-60e9-ae090b2e579f@linux.intel.com>
	<alpine.LFD.2.20.1702130808300.13813@uk63952.mitel.com>
	<CABcZAN=Zusmrc4vzmgZoTbLC_GpOetU-r_fZa-Le1upevn18+Q@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is the significance of the numeric version part of 'PV = "1.0.1+git${SRCPV}"'?
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
X-List-Received-Date: Mon, 13 Feb 2017 16:49:37 -0000
Content-Type: multipart/mixed; BOUNDARY="587868445-242642476-1487004532=:14688"

--587868445-242642476-1487004532=:14688
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 13 Feb 2017, Christopher Larson wrote:

> On Mon, Feb 13, 2017 at 6:51 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>  
>         next (and what might be a silly question), based on the above, is it
>       possible to set absurdly misleading PV values in recipe files for the
>       same recipe, such as:
>
>         rday_1.0.bb
>               PV = "2.0"
>
>         rday_2.0.bb
>               PV = "1.0"
>
>       of course the above is wildly confusing, but is it legal? and given
>       what's written above, i'm concluding that the most "recent" recipe
>       selected by default would be "rday_1.0.bb", yes?
>
>
> It’s legal, and the default lacking any specified preference would
> be the higher PV, 2.0, which is the rday_2.0.bb recipe. Default
> version selection when nothing is preferred (and no layer priorities
> are involved in the selection) goes based on PV, not the filename.

wait, did you mean to say rday_2.0.bb? because that recipe file
explicitly sets PV = 1.0. or am i misreading something here?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587868445-242642476-1487004532=:14688--
