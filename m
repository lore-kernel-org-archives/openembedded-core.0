Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 90C0776FF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 11:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8FBKGrm016660; Thu, 15 Sep 2016 12:20:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VB6pS2c4Uami; Thu, 15 Sep 2016 12:20:16 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8FBKAJA016654
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 15 Sep 2016 12:20:11 +0100
Message-ID: <1473938410.7207.106.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Williams <patrick@stwcx.xyz>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Thu, 15 Sep 2016 12:20:10 +0100
In-Reply-To: <20160915022125.GB25351@heinlein.lan>
References: <20160914171252.17773-1-patrick@stwcx.xyz>
	<CAJTo0LbF7JoT-K3dg0U8=TZLkMM8bhSSqkBL0UtF7GGUqGxNdg@mail.gmail.com>
	<20160915022125.GB25351@heinlein.lan>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: split {mkfs, fsck}.minix into packages
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
X-List-Received-Date: Thu, 15 Sep 2016 11:20:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-09-14 at 21:21 -0500, Patrick Williams wrote:
> On Wed, Sep 14, 2016 at 10:01:01PM +0100, Burton, Ross wrote:
> > 
> > On 14 September 2016 at 18:12, Patrick Williams <patrick@stwcx.xyz>
> > wrote:
> > 
> > > 
> > > mkfs.minix and fsck.minix are likely rarely used, so split
> > > them into their own packages to reduce the footprint of
> > > util-linux.  This follows the pattern of cramfs support
> > > within util-linux.
> > > 
> > Minix is so unlikely to be used, why don't we just disable it
> > entirely?
> > (--disable-minix).
> > 
> > Ross
> Sure, prefer I submit that instead?

Please, might as well not bother building that!

Cheers,

Richard

