Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.221.74.143])
	by mail.openembedded.org (Postfix) with ESMTP id 75794785B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 14:27:52 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 59B4F2ADC93;
	Thu, 14 Sep 2017 09:27:52 -0500 (CDT)
Date: Thu, 14 Sep 2017 09:27:50 -0500
From: Seebs <seebs@seebs.net>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20170914092750.19cedd67@seebsdell>
In-Reply-To: <CA+chaQcxHMzTwiAEQx4zPkVrbLHndUoVVS=yWz=hiOE43VZzNg@mail.gmail.com>
References: <20170913204659.1919-1-Martin.Jansa@gmail.com>
	<20170913205032.GD3288@jama> <20170913170830.6ac2b8bb@seebsdell>
	<CA+chaQcxHMzTwiAEQx4zPkVrbLHndUoVVS=yWz=hiOE43VZzNg@mail.gmail.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
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
X-List-Received-Date: Thu, 14 Sep 2017 14:27:53 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 14 Sep 2017 00:28:34 +0200
Martin Jansa <martin.jansa@gmail.com> wrote:

> OK, thanks.
> 
> Any insights to the first issue described in commit message? That we
> know that is an Actual Problem, but hard to reproduce it.

This one?
  glibc-locale-2.26:
  glibc-locale: /glibc-binary-localedata-en-gb/usr/lib/locale/en_GB/LC_MEASUREMENT
  is owned by uid 3004, which is the same as the user running bitbake.
  This may be due to host contamination [host-user-contaminated]

My first guess would be some kind of weird timing interaction involving
symlinks or, if it's still there, the really weird copy of locale data
into an intermediate location to move it from the glibc package to the
glibc_locale package or something. But it seems like that should be
reproducible, so I'm not sure.

-s

