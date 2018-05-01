Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8AA7A7199E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 14:46:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w41EkquE001360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 1 May 2018 15:46:53 +0100
Message-ID: <1525186011.25196.117.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Daniel F. Dickinson" <cshored@thecshore.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 01 May 2018 15:46:51 +0100
In-Reply-To: <39f087be-1129-6131-d5d1-5714f127667b@thecshore.com>
References: <1524154643.18865.113.camel@linuxfoundation.org>
	<39f087be-1129-6131-d5d1-5714f127667b@thecshore.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: 2.6 planning proposals and meeting
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
X-List-Received-Date: Tue, 01 May 2018 14:46:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Fri, 2018-04-20 at 08:02 -0400, Daniel F. Dickinson wrote:
> I'm relatively new to OE; I've written a couple of pre-alpha layers
> to try some idea, and worked on meta-openembedded, but I've not had a
> chance to go in depth on the Yocto documentation, and at the some
> there see to be things (based on the lists) that are out of date, or
> new things that aren't even mentioned, which makes getting up speed
> somewhat difficult.

Writing down where you think there are issues would be a help so that
we can see if there is some way we can improve that.

> In any even one thing that I'm wondering if is of interest, is
> modifying the build process to build an eSDK which is used to build
> everything else.  The advantage of this, in my view, is that it makes
> it easier to do things like use GitHub+Travis integration on
> individual recipes.

I know people who've tried travis with OE and the challenge is the
length of the builds and the data usage. I'm not sure that problem
changes regardless of whether the eSDK or native sstate is used as the
size would be comparable.

> The biggest challenge for this type of per-recipe build is dealing
> with dependencies, but I think it would be helpful to get rid of 3-
> day+ world builds.
> 
> At the very least having a 'standard' binary eSDK for external layers
> to use for this purpose would helpful in my view.

How would that differ from a specific version of OE-Core used for
testing for which a known good set of sstate were available?

> I'm interested in working on this, but I don't think I've got a good 
> enough handle on OE for making this a 2.6 goal from me.
> 
> Thoughts?

I like the idea of thinking more in this area and would certainly
welcome help. I think the issue is more one of tools to generate a
locked sstate which layers then reuse rather than anything eSDK
specific. Its therefore partly a process problem of generating that
specific config and sstate which others would reuse. You could do this
from things that already exist, e.g. from the OE-Core milestone
releases but its not something people have really adopted for testing
of other layers.

Certainly worth exploring but the devil is in the details.

Also worth mentioning that build-appliance exists which is an image
capable of "self hosting" builds. There are often specific patches
applied to native tools and version requirements which mean that the
-native recipes are often essential to the build though.

Cheers,

Richard

