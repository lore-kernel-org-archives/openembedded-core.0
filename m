Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AAA7C76DE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 14:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8HE6ale030283; Thu, 17 Sep 2015 15:06:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Beba4a4B3r23; Thu, 17 Sep 2015 15:06:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8HE6kXa030302
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Sep 2015 15:06:57 +0100
Message-ID: <1442498806.26666.212.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Thu, 17 Sep 2015 15:06:46 +0100
In-Reply-To: <CAP9ODKqAQiGTZ5vbQjcpYbywAto6caG9Vcvbx4KQbYeQnUY2JQ@mail.gmail.com>
References: <1442496086-1994-1-git-send-email-otavio@ossystems.com.br>
	<55FAC07A.3000907@mlbassoc.com>
	<CAP9ODKqAQiGTZ5vbQjcpYbywAto6caG9Vcvbx4KQbYeQnUY2JQ@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Rename 'BRANCH' variable to 'SRCBRANCH' for clearness
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
X-List-Received-Date: Thu, 17 Sep 2015 14:07:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-17 at 10:33 -0300, Otavio Salvador wrote:
> On Thu, Sep 17, 2015 at 10:30 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> > On 2015-09-17 07:21, Otavio Salvador wrote:
> >>
> >> The 'BRANCH' variable name has no explicit relation with the
> >> SRC_URI. Using 'SRCBRANCH' makes it more obvious and easier to
> >> identify.
> >>
> >> This patch makes the use consistent across the metadata.
> >>
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >
> >
> > These should be separated into one for glibc and another for mmc.
> > Also, the subject line needs to mention the recipe name based on
> > the commit guidelines.
> 
> I can split it but it does not make much sense for this specific case,
> IMO. This is a global change and so it provides an easier view of
> affected recipes for such a change. If it, supposedly, introduces a
> regression it is easier to revert it.

I don't think it needs to be split, I would like "glibc/mmc-utils:" at
the start of the subject line so we give the casual reader some idea
what the scope of the patch is though. In this case I'll just add that
before merging.

Cheers,

Richard


