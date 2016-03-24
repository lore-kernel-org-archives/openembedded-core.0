Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DB657731A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 21:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2OLc0I1006063; Thu, 24 Mar 2016 21:41:23 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XhHuDnH8b7tp; Thu, 24 Mar 2016 21:41:23 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2OLfHqu006156
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 24 Mar 2016 21:41:18 GMT
Message-ID: <1458855677.3073.35.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>, Andre McCurdy <armccurdy@gmail.com>, Khem
	Raj <raj.khem@gmail.com>
Date: Thu, 24 Mar 2016 21:41:17 +0000
In-Reply-To: <1458844322.3476.198.camel@pbcl.net>
References: <1458789553-3629-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spVnsTtz4Wwa562aVaafzSUR3tJrrvstRGjRhT-VGOUAw@mail.gmail.com>
	<CAJ86T=X4fDmNRjWv4nNPX3U3+Ak=z+2psGtTgFvt4-ga7b_sEg@mail.gmail.com>
	<CAMKF1sofsW2HYMNzDOc9WKKs2ADejfX+VcwqaYx5fEof4g6ngQ@mail.gmail.com>
	<CAJ86T=VjwZD9qKnhyX6-0xHQVRph1e0FSkwR7OWWJPQsvnOnnQ@mail.gmail.com>
	<1458844322.3476.198.camel@pbcl.net>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: duplicate armv7a over-ride for armv8a
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
X-List-Received-Date: Thu, 24 Mar 2016 21:41:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-03-24 at 18:32 +0000, Phil Blundell wrote:
> On Thu, 2016-03-24 at 10:37 -0700, Andre McCurdy wrote:
> > 
> > Renaming armv8a -> aarch32 is going to affect almost every line in
> > the patch. We should probably drop the current patch from master-
> > next.
> 
> "AArch32" applies retrospectively to all older versions of the ARM
> architecture as well, so it's not obvious to me that a straight
> rename
> of the existing "armv8a" override to "aarch32" would be the right
> thing
> either. 
> 
> I think the whole approach to ARMv8 and AArch64 in OE needs to be
> carefully thought through before we start landing any patches for
> that
> stuff.  We have a tangled enough maze of overrides right now and I
> think we should make all efforts to avoid it getting worse.

Agreed, I'm planning to drop the patch triggering this from -next and
defer it until 2.2. The discussions can happen in the meantime to get a
patchset we're all happy with.

Cheers,

Richard

