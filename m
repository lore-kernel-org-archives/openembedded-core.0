Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 43506775F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 16:18:34 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170302161815207_0486;
	Thu, 02 Mar 2017 16:18:15 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=15187 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cjTQe-0005et-58; Thu, 02 Mar 2017 11:18:08 -0500
Date: Thu, 2 Mar 2017 11:18:06 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1488470976-8170-1-git-send-email-richard.purdie@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1703021117280.16020@uk63952.mitel.com>
References: <1488470976-8170-1-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
X-MAG-EWAV: unavailable
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] testsdk: Use auto.conf instead of local.conf to set SSTATE_MIRROR
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
X-List-Received-Date: Thu, 02 Mar 2017 16:18:35 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Mar 2017, Richard Purdie wrote:

> The local.conf file can get overritten and changed by the SDK so (ab)use
> auto.conf instead to ensure our configuration tweaks get applied.
>
> Also ensure we append to any other configured SSTATE_MIRROR variable
> that already exists.
                                               ^ SSTATE_MIRRORS?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


