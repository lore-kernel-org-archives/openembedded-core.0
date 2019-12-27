Return-Path: <fdk17@ftml.net>
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by mail.openembedded.org (Postfix) with ESMTP id 288BE731AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2019 14:25:45 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 870BA4A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2019 09:25:44 -0500 (EST)
Received: from imap7 ([10.202.2.57])
	by compute6.internal (MEProxy); Fri, 27 Dec 2019 09:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftml.net; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type:content-transfer-encoding; s=fm2; bh=txttV
	c3B2eMExPkSpoSZZwR7WvD0EzEUTQ9VSOg7tHM=; b=r4RLbvdCECA+O1mMvJO/+
	Vip5kzAKP7K9gMAQ+SVFsyKxRBjvpDW71xjrVAt3GMqapi7nZz6obj+GbLFMl72y
	Np2aUHRna2kF3LDM0cgu/224DNz6aEAyyhi4YZESopT63CHB1PR9T9naP6yZvdQy
	lCRckM+yeRqLrWynXnKuHOflvtP52/IZTp+CbluMRVfj6Hmw6siIgmHkHmyQAwWf
	kUDEbaelkyWMxiexakqjTP8Q9NC3cnFY9D+J7uXZmK2pRl8UUx9XRXWryw3R2LRD
	CFdGYiaFwUPLOwE5QW7SirKr+eyq+jZVmobxC+Iz/gY/O50Ka7nNFpg+ToioDdMN
	Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=txttVc3B2eMExPkSpoSZZwR7WvD0EzEUTQ9VSOg7t
	HM=; b=JQurPoBQnJfxn30tdy0OdWdUNsfRe1svkXe5q29cEANynaH3qa1QzaZJ/
	l3VRmOPlmhE7qgJVCvFr9V3K+ycKV9RLdpvijWRytppevQ1Y52vMEwF4XdJKx3GF
	5raUPhZGMRORCm5gtRWa8XJV/zRaWaekJPG226f7av7jLFWDaNXZqAKa39UW3npl
	k4PncsQwSlLPf40rST0UdgZvjj5LiDS1kHIDasAMJRD/r7buKGi3T4wGsAkNAIsB
	l6Q5gzPSRQMy2TYfhAZaxiXaNP2O7iOVVhj3MxE1KeYM3JFPZ0+7qDnug9Fiu5Ut
	mNtmvva8GzF9KagPXSgxNWshzHaLA==
X-ME-Sender: <xms:aBQGXuHy0tDQavbPwcrejohXdhrJYZM4OuXi6ctcUjdTUhfJ4yo8EQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvkedgieefucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
	hqredtreerjeenucfhrhhomhepfhgukhdujecuoehfughkudejsehfthhmlhdrnhgvtheq
	necurfgrrhgrmhepmhgrihhlfhhrohhmpehfughkudejsehfthhmlhdrnhgvthenucevlh
	hushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:aBQGXlUvB053K8u1_yE84UF-9xIa24wxS1p-ZqK89gKkYhsxZTfsfQ>
	<xmx:aBQGXlx7OjquLNLzFhJB5Js1flhcF19Ic5DpomxpyWh1PavhEKwCkg>
	<xmx:aBQGXjN3Zf5O4TDSPfk-iV3-JEo0iW1yomJJdjQN16cCArkF88I29w>
	<xmx:aBQGXrQHcFLKRuMO2EwmnXlhEaZag2JNuDSVD9lg_TStPoFRyZv2jQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DB9881801C3; Fri, 27 Dec 2019 09:25:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-694-gd5bab98-fmstable-20191218v1
Mime-Version: 1.0
Message-Id: <32ae7b92-fdc4-4773-8977-282c4502edb0@www.fastmail.com>
In-Reply-To: <54a01022886647f9baa8608f8a6af5b1@XBOX03.axis.com>
References: <1758bd87-e492-46bc-8aaa-514e802c5030@www.fastmail.com>
	<54a01022886647f9baa8608f8a6af5b1@XBOX03.axis.com>
Date: Fri, 27 Dec 2019 09:25:23 -0500
From: fdk17 <fdk17@ftml.net>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meson][PATCH] meson: Allow for llvm-native tools to be	used
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
X-List-Received-Date: Fri, 27 Dec 2019 14:25:45 -0000
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Fri, Dec 27, 2019, at 7:03 AM, Peter Kjellerstedt wrote:
> If we=E2=80=99re adding a --native-file, shouldn=E2=80=99t it always b=
e specified, regardless of --cross-file?

I don't think so.  It seems to me that it should be one or the other.  I=
f you are building a -native package then you don't need a native file a=
nd vice versa.=20

> Also, it looks as most of what is currently done in override_native_to=
ols() and meson_do_configure_prepend_class-native() could be moved to th=
e native-file (the exception seems to be the unsetting of CPPFLAGS, CFLA=
GS, CXXFLAGS and LDFLAGS).

It could be but I didn't want to make unnecessary changes just to get ll=
vm-native working.  I think few  people  even attempt to use a native-ll=
vm for anything other than building llvm.  If anyone else needed this I =
would think that the  llvm-native recipe would have been updated by now =
by others.  In that regards this patch just not important.  I was just p=
utting it out there as this tripped me up for a few hours before underst=
anding what was happening.

