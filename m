Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 913F760167
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 12:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5QCuf4l019175; Fri, 26 Jun 2015 13:56:41 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KFlva5HGBENc; Fri, 26 Jun 2015 13:56:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5QCuTRL019171
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 26 Jun 2015 13:56:40 +0100
Message-ID: <1435323389.10583.24.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>
Date: Fri, 26 Jun 2015 13:56:29 +0100
In-Reply-To: <CABcZANkDvPZcDHFEWauiZd8PFgipLbfsNTSZ3NUHcQwwF61eaQ@mail.gmail.com>
References: <cover.1435299778.git.liezhi.yang@windriver.com>
	<7eaec2a8209ca34e5d8b247f31935af496134aea.1435299778.git.liezhi.yang@windriver.com>
	<CABcZANkDvPZcDHFEWauiZd8PFgipLbfsNTSZ3NUHcQwwF61eaQ@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sanity.bbclass: check /bin/sh is dash or bash
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
X-List-Received-Date: Fri, 26 Jun 2015 12:56:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2015-06-26 at 05:47 -0700, Christopher Larson wrote:
> 
> On Thu, Jun 25, 2015 at 11:23 PM, Robert Yang
> <liezhi.yang@windriver.com> wrote:
>         The build would fail when /bin/sh links to ksh or csh, we only
>         test dash
>         and bash AFAIK.
> 
> Hmm, would this break self-hosted builds, as you don’t check for
> busybox, or am I missing something? Not that I’ve ever done a build
> like that, other than using the old build appliance, and I don’t know
> much about how that was built, but maybe someone else knows better
> than I :)

I think since that is a "developer" focused image it likely has bash in
it so the check will probably work there (since bash has priority over
ash). Good thought though.

Cheers,

Richard



