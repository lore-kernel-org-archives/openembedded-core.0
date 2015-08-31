Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2FEFD76DBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 11:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7VBRjD4020036; Mon, 31 Aug 2015 12:27:45 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QD7ded9iGl6k; Mon, 31 Aug 2015 12:27:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7VBRXtG020018
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 31 Aug 2015 12:27:44 +0100
Message-ID: <1441020453.26554.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>
Date: Mon, 31 Aug 2015 12:27:33 +0100
In-Reply-To: <CABcZANncHYDHixOW7Ri9DmTURNk3JjFJKAZxnNOaZ5b6iU5yCQ@mail.gmail.com>
References: <cover.1440680489.git.jussi.kukkonen@intel.com>
	<ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<1b1addab8587973a984b477e271e3fd4df9d88a5.1440680489.git.jussi.kukkonen@intel.com>
	<CABcZANncHYDHixOW7Ri9DmTURNk3JjFJKAZxnNOaZ5b6iU5yCQ@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] mirrors.bbclass: Update gnutls mirrors
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
X-List-Received-Date: Mon, 31 Aug 2015 11:27:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-08-27 at 10:13 -0700, Christopher Larson wrote:
> 
> On Thu, Aug 27, 2015 at 6:06 AM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
>         * Remove mirror sites that no longer exist
>         * Update the gnutls.org path so the gnupg mirror gets used
>         
>         Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> 
> Hmm, I can't help but wonder if these app-specific mirrors should be
> moved to the recipes or classes that need them, rather than in the
> global default MIRRORS..

I do share that view for recipe specific entries like this. I will merge
the patch as it fixes broken things though.

Cheers,

Richard



