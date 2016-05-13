Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9366665CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4DGRdIv019853; Fri, 13 May 2016 17:27:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GPeo3518ovAP; Fri, 13 May 2016 17:27:39 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4DGRZSl019839
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 May 2016 17:27:37 +0100
Message-ID: <1463156855.9746.112.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Seebach <peter.seebach@windriver.com>, Christopher Larson
	<kergoth@gmail.com>
Date: Fri, 13 May 2016 17:27:35 +0100
In-Reply-To: <20160512132406.12f33a04@seebs-worktop>
References: <1462983927-19691-1-git-send-email-kergoth@gmail.com>
	<20160512132406.12f33a04@seebs-worktop>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: obey our LDFLAGS
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
X-List-Received-Date: Fri, 13 May 2016 16:27:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-05-12 at 13:24 -0500, Peter Seebach wrote:
> On Wed, 11 May 2016 09:25:27 -0700
> Christopher Larson <kergoth@gmail.com> wrote:
> 
> > +Subject: [PATCH] Obey external LDFLAGS the way we obey CFLAGS
> 
> This has been merged into pseudo's upstream, now, but it's on top of
> some
> large changes, so we should probably go ahead with the local patch
> until
> later.

The original patch was missing an Upstream-Status. Since I don't
particularly want to have to think about this again, I've queued it
with an Upstream-Status: Backport in this case.

Cheers,

Richard

