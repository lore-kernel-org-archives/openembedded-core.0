Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B50246E650
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 21:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8RLQdtI009793; Tue, 27 Sep 2016 22:26:47 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hkm-jR6Lg6_a; Tue, 27 Sep 2016 22:26:47 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8RLQf09009840
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Sep 2016 22:26:44 +0100
Message-ID: <1475011601.30475.57.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2016 22:26:41 +0100
In-Reply-To: <20160927194046.GA19346@denix.org>
References: <1475004335-22336-1-git-send-email-denis@denix.org>
	<20160927194046.GA19346@denix.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [krogoth][PATCH] libarchive: respect disable-acl configuration option
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
X-List-Received-Date: Tue, 27 Sep 2016 21:27:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-09-27 at 15:40 -0400, Denys Dmytriyenko wrote:
> On Tue, Sep 27, 2016 at 03:25:35PM -0400, Denys Dmytriyenko wrote:
> > 
> > From: "Maxin B. John" <maxin.john@intel.com>
> > 
> > Update configure.ac to properly handle --disable-acl option
> > 
> > [YOCTO #9668]
> FYI, last night's updates to krogoth invalidated most of my sstate
> cache and 
> this issue re-surfaced again and broke half of my builds...

I've merged this, thanks for posting the rebased patch.

Cheers,

Richard

