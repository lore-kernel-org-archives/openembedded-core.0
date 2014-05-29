Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (unknown [209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 35CA76FC83
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 10:16:10 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id q108so280097qgd.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 03:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HElaUu7hR9tVbwwJlQi4RFlNJmKN97F4P2GpVVsgmN0=;
	b=ChF33FU2BMgRBqvfx6BzlPeJmrhy0E9js4bs0Dg0ql9Ds2rUKA0KlDmMtlmAAQdMgN
	+tN3nzeo6q/44kcoWpiqdh0WIc9PqZ1DKU9P/1RlmHKPpAc0R3A37HQ6ktT9QlrzZxld
	y5t1s6SecqcrQ6lRuscyegpDT7swdIWEnm6ROaj7+LNkVOVcdxPlnqf5r+QU+3msDarY
	jvaD5RkH49/C0Ni7irotqwa7JF6WiKmzxzRBwuXnBtZuGlxJaNmPTXjiKF+NKQxs7P0Y
	yNAu1qKnS8pkEMCtgNYo5rQYD+IaZSSCOUF0+5AJDIqQw4fvVxpPC75HiUvfSbpHSeaW
	birg==
X-Gm-Message-State: ALoCoQnzRJuEKVhPv8ZZ6Fa2nP3UJTETqbP0HjsIwYBTEUsLBNbZ144IO67fuOlL7yr1tJCNFf5H
X-Received: by 10.140.48.161 with SMTP id o30mr8137804qga.68.1401358571244;
	Thu, 29 May 2014 03:16:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 29 May 2014 03:15:51 -0700 (PDT)
In-Reply-To: <e6a039546ac6da09a55950978189b3bc3b75fb8d.1401354584.git.Chong.Lu@windriver.com>
References: <cover.1401354584.git.Chong.Lu@windriver.com>
	<e6a039546ac6da09a55950978189b3bc3b75fb8d.1401354584.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 May 2014 11:15:51 +0100
Message-ID: <CAJTo0LZWqFB89AhgZtGOLmHGaZ-N=SVxLORsq-gK_Qhnfpib5w@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nfs-utils: use cross toolchain to compile testlk
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
X-List-Received-Date: Thu, 29 May 2014 10:16:13 -0000
Content-Type: text/plain; charset=UTF-8

On 29 May 2014 10:10, Chong Lu <Chong.Lu@windriver.com> wrote:
> testlk is built with host gcc at do_compile stage, which leads to unrecognized
> some flags for special architecture. Using cross toolchain instead.

The makefile explicitly uses the host compiler, so presumably there's
a good reason for this.  If the problem is that the host compiler is
being passed target CFLAGS, then you should set AM_CFLAGS to
CFLAGS_FOR_BUILD and so on.

Ross

