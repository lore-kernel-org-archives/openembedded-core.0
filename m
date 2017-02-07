Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id B6C50719FA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 12:03:56 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20170207120353836_0485;
	Tue, 07 Feb 2017 12:03:53 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=41104 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cb4Us-0007Gj-Bs; Tue, 07 Feb 2017 07:03:46 -0500
Date: Tue, 7 Feb 2017 07:03:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZtcKPVPQh5d-XmDcAQ+K8qH4nRB0YGhmyoqOf1eTAH6A@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1702070702100.10192@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702070603110.7387@uk63952.mitel.com>
	<CAJTo0LZtcKPVPQh5d-XmDcAQ+K8qH4nRB0YGhmyoqOf1eTAH6A@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: question about new "recipe-specific sysroots" feature
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
X-List-Received-Date: Tue, 07 Feb 2017 12:03:57 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Feb 2017, Burton, Ross wrote:

>
> On 7 February 2017 at 11:19, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>       and while i'm digging through the code, what should be a simple
>       question -- is what is being installed in a recipe-specific sysroot
>       *exactly* what used to be installed by a recipe in the common sysroot?
>
>
> Yes.
>
> The recipe-specific sysroot for recipe <foo> is the same sysroot as
> you would have got had you done bitbake foo with an empty tmp.  The
> advantage is that there will be nothing else in the sysroot.

  yup, i already knew that it would be a minimal (uncluttered) sysroot
for this recipe, it just wasn't clear if there were any subtle tweaks.
i suspect i will have more silly questions as i work my way through
this new feature.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


