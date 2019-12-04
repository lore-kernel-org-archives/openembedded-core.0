Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 462 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Dec 2019 21:25:57 UTC
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by mail.openembedded.org (Postfix) with ESMTP id 10FBB7F7DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 21:25:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 491EE916;
	Wed,  4 Dec 2019 16:18:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Wed, 04 Dec 2019 16:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=H8+tPNDwec48vt4kbDYkyU/XZiZI04RFunrGiJ8yz
	Lk=; b=kv4xLppRCssW7n+QGurqUrK+deZ279EAd/X6Dm6X8XP3nDwJCvDRgTI4W
	N0AVoBDSGVKM5lmp7+4xC/G2FCTSofvU7Dzj42WUk/CnGjgifJN7ZLnOTeIBQAMH
	H70tArRgFep6M/5f1llHD1EJxNjGmaNvqPBoABM0Nm5A2gFakmdmy2X9BPnj3Ooq
	Rurvp3jNyw/5mwM6/SXxvC6BaSJpCHgl1S08w2j2+IWMXTyqCWAHb77QCqX7/Ujp
	VPBWe+YU49zWdk2vr7P9tdQaX78vNxNMBialPVTJh+Nw1GgGv/CBryBuoYlT2Sug
	1gsSQukGVhMCfGDVd85qgk183p6sA==
X-ME-Sender: <xms:lyLoXdZy1PZyzXRaoJiRSQM-EQ5jBn8FSH3tSQuJhC5TiBDzWwGCcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejledgudeghecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
	enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghn
	uhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinheplh
	hisggvrhgrphgrhidrtghomhdpuggvsghirghnrdhorhhgpdgrlhhsrgdqphhrohhjvggt
	thdrohhrghdpphgrthhrvghonhdrtghomhenucfkphepudeliedrvdeggedrudeluddrud
	dtieenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhinecuvehl
	uhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:lyLoXRF1k3Z_X1Fh6isEHcWmZ739GSkgue_ApSoEQ4OBtOPHnwVOwQ>
	<xmx:lyLoXT0BkBs6v4UQwG66OzyIa-5WN8PrXb_yqBOMdtQs00qce3u4zw>
	<xmx:lyLoXVxIb8Wb_UEMwFldU6H4ilA-Q329IV45sjmabi6tuGKEapFOIQ>
	<xmx:lyLoXU2Ii3Kn4VF4AFDdQJ0IDsqcAX8fDC4qkNaS_7USnSuLvwVaMA>
Received: from laptop (unknown [196.244.191.106])
	by mail.messagingengine.com (Postfix) with ESMTPA id CB7D630600D4;
	Wed,  4 Dec 2019 16:18:14 -0500 (EST)
Message-ID: <a8165efac9ffc06e16b0256e646799ded7ec272c.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Zang Ruochen
	<zangrc.fnst@cn.fujitsu.com>
Date: Wed, 04 Dec 2019 23:18:10 +0200
In-Reply-To: <CANNYZj9Xhm3ciQZQjSy6-sGamkQTFxT0K2QZ=k0ncwnWXYuMZw@mail.gmail.com>
References: <20191120051704.24066-1-zangrc.fnst@cn.fujitsu.com>
	<CANNYZj9Xhm3ciQZQjSy6-sGamkQTFxT0K2QZ=k0ncwnWXYuMZw@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib:upgrade 1.1.9 -> 1.2.1.1
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
X-List-Received-Date: Wed, 04 Dec 2019 21:25:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-20 at 12:16 +0100, Alexander Kanavin wrote:
> On Wed, 20 Nov 2019 at 06:17, Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> wrote:
> 
> > +From f419276a716daf8d98846b3df50995e5ac030134 Mon Sep 17 00:00:00 2001
> > +From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > +Date: Wed, 20 Nov 2019 11:24:17 +0800
> > +Subject: [PATCH] Fix problem with libtool not found
> > +
> > +Upstream-Status: Inappropriate
> > 
> 
> Why inappropriate? To me this seems like a real problem and should be
> submitted upstream.

I planned to submit this patch to upstream on behalf of Zang, but while
investigating what the root cause for the failure really is, I found
that this really is OE specific.

Upstream for some reason (not documented in the commit message, and the
main point of the commit was something else entirely[1]) added this to
the end of configure.ac:

dnl Taken from https://wiki.debian.org/RpathIssue
case $host in
   *-*-linux-gnu)
   AC_MSG_RESULT([Fixing libtool for -rpath problems.])
   sed < libtool > libtool-2 \
     's/^hardcode_libdir_flag_spec.*$'/'hardcode_libdir_flag_spec=" -D__LIBTOOL_IS_A_FOOL__ "/'
   mv libtool-2 libtool
   chmod 755 libtool
 ;;
esac

If I understand the referenced Debian wiki page correctly, this is only
useful if the tarball ships libtool older than 1.5.2 (released 2004-01-
05). That is, this addition seems completely useless to me. Probably
I'm missing something.

The configure script fails, because it tries to modify the libtool
script in the build directory, but the libtool script doesn't exist.
And it doesn't exist, because OE renames it to ${host_alias}-libtool
(e.g. x86_64-oe-linux-libtool).

I'm not sure where the libtool script in the build directory comes
from. Is it copied from the tarball's libtool script, or does it come
from the libtool package? (Bitbake seems to run autoreconf and
libtoolize, if that's relevant.) If the script comes from the libtool
package, then modifying the script in the source directory (like Zang's
patch does) is useless, since that script isn't used at all. If the
tarball's libtool script is used, then Zang's patch still doesn't do
what it's expected to do, because the script modification is the very
last thing the configure script does, and the build directory's libtool
script has already been created by then, so modifying the source
directory's libtool script happens too late.

I'll have to ask upstream if the strange configure.ac addition could be
just removed. If it for some reason won't be removed, then an OE
specific patch is needed. Either configure.ac needs to be modified to
operate on ${host_alias}-libtool, or I can simply remove the libtool
modification part, because OE hasn't needed that in the past, and I
can't see how it would be needed now.

[1] https://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff;h=75d393a563efb578c79364a277087c6326267f52;hp=1f37ba2a2b1c07c04de1c368cd4943f712cccfa5

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


