Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0C45373E11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 09:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7M98xk9031889; Sat, 22 Aug 2015 10:08:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JrALL3J_EhrO; Sat, 22 Aug 2015 10:08:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7M98hZ9031886
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 22 Aug 2015 10:08:54 +0100
Message-ID: <1440234522.12105.283.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Aug 2015 10:08:42 +0100
In-Reply-To: <F5709C6C-5297-49D4-B2BD-931B59837210@gmail.com>
References: <1440193082-508-1-git-send-email-otavio@ossystems.com.br>
	<2ADD7CA4-0184-4D54-9E0B-8A58ACB51DC1@gmail.com>
	<CAP9ODKrEBfBH-+Z2VYg3qG5Bpi7aDozn6F1Z9r7MP3qC8Zs+RQ@mail.gmail.com>
	<F5709C6C-5297-49D4-B2BD-931B59837210@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Rename 'BRANCH' variable to 'SRC_BRANCH' for clearness
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
X-List-Received-Date: Sat, 22 Aug 2015 09:09:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2015-08-21 at 23:03 -0700, Khem Raj wrote:
> > On Aug 21, 2015, at 2:58 PM, Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
> > 
> > On Fri, Aug 21, 2015 at 6:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> 
> >>> On Aug 21, 2015, at 2:38 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> >>> 
> >>> The 'BRANCH' variable name has no explicit relation with the
> >>> SRC_URI. Using 'SRC_BRANCH' makes it more obvious and easier to
> >>> identify.
> >> 
> >> Look good to me, just may be avoid ‘_’ and call it SRCBRANCH
> > 
> > I did this initially but looking at how it looks in the source code,
> > it seems SRC_BRANCH makes easier to spot the relation with SRC_URI. So
> > I took the second.
> 
> since bitbake use ‘_’ as a override separator, its less confusing if variables don’t have underscore in them
> for future collision.

Names with '_' in them might look better but there is a small price to
pay for it in that bitbake then has to track whether "BRANCH" is an
override. Obviously it does this in many cases already (e.g. URI from
SRC_URI) but when you've looked at what the datastore actually has to do
to keep the system working, you start to lean against creating more work
for it.

I continue to believe we should probably find a better syntax for
overrides. If someone had a good alternative, it would probably be worth
the pain of switching...

I'm not saying we shouldn't take the above patch here, just that this is
something which does have a cost and all the uses do mount up
significantly.

Cheers,

Richard


