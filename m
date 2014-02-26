Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 31D646F137
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 21:23:08 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id to1so1253539ieb.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 13:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cj/ZBS0oJrBtt2TGqYgLCjnIzTg1PbMT3keVGkVUKYQ=;
	b=q2JqL3OgJEAM/Z2rGlGY2wTTO4lcMffY2c5ELk+v+rTAqubOjuAJsm714U2ARNlSoz
	IXO6GDwtbc1I/6fd7cbLrDfuu5mXxVhaM19l43XoiNlUmGGzGYEhOhobsNtsQ0bCg7V2
	FlmulfATVYktIoLJuvz93CUSKHWlc/QQxWofKrVd1TnZuQd34SvE4Q6sNSez5Yi2sog4
	6UtRQJbQKhgccsgdFTrAaCkH2y8GKjw92bigGebcNmoZ9i62KkTrL2sq6sewdZfjuqqk
	ud325rzwThRE30rP5vFusat/evIDeqU6srdbp15OT43cXfXRXDhy9dHpeaKSokjVvB/G
	HH1g==
X-Received: by 10.50.143.69 with SMTP id sc5mr28850126igb.2.1393449789277;
	Wed, 26 Feb 2014 13:23:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Wed, 26 Feb 2014 13:22:38 -0800 (PST)
In-Reply-To: <1393449449.2453.41.camel@e130.pbcl.net>
References: <1393439715-317-1-git-send-email-diego.sueiro@gmail.com>
	<1393449449.2453.41.camel@e130.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Feb 2014 13:22:38 -0800
Message-ID: <CAMKF1sqzbMMdY7UFe0e7UYyOR0EvZ+XXkXhhyQ_eKWAn_T5fWA@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Wed, 26 Feb 2014 21:23:11 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 26, 2014 at 1:17 PM, Phil Blundell <pb@pbcl.net> wrote:
> If this library is intentionally static-only, shouldn't it go in qt4-dev

yes I believe so

