Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sz0yF-0000CZ-Ly
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 09:46:23 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 08 Aug 2012 00:34:34 -0700
Received: by obbuo19 with SMTP id uo19so648952obb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 00:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=I3dcsJZyUCn421WQrt3TomMmRX06DPsnFsCydZ1S13I=;
	b=CrBFk6AdrJ6E8Mf9TXCncl5b9DxveLQ0YaRFnl4sNYrgTaxlEx/KveiF6ORpksVKrJ
	9i+1U2l9F2Rl+7QTzbI/HTthCFQI4Txj8F+zGj9efTRnnKCLmF5Tpcri+R6i+4PBQNvm
	0i9rRMoIHYCdKKuLE9ZltKD5zPvmcI/jpuGoN2NQzdb+5hvMULJqPQ3VTbh18/Gc6ypo
	FVE3/vXMs7jzZuqOJEqimnhfi0FUgGuvbIMGWcjJ1lYxQRkY1IBS9o+JL7ccC/pq04wb
	TetfqJyju0vuCUPMLrJ++do4ECfNaniLe7Jevv2hSYeSPxySuuTBmBmnpe6UHFoBXsUE
	cnTg==
Received: by 10.60.21.103 with SMTP id u7mr28476658oee.49.1344411273636; Wed,
	08 Aug 2012 00:34:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Wed, 8 Aug 2012 00:34:13 -0700 (PDT)
In-Reply-To: <20120802193028.GZ16306@jama.jama.net>
References: <CALbNGRSyCyCSX23dQXa1neOBior_vHbmKtk8SmSV8pKJdQt44w@mail.gmail.com>
	<CALbNGRTJFg7yWMDEs9tF7VijLAgxGA178qasUYuh=Z_ky+CpXA@mail.gmail.com>
	<20120802193028.GZ16306@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Aug 2012 08:34:13 +0100
Message-ID: <CAJTo0LYD0DRSXwgB1qdc0iWSRrRm-UdvyEDQ7R23GtvdAfNCMw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlHiuzJUaDP+W/z2mPQM56rH7w3WVKSUEnaWqlgn/qtg4iKFBHEBDsAfxYI/vMpyv7L0OzA
Subject: Re: pango modules postinst issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2012 07:46:24 -0000
Content-Type: text/plain; charset=UTF-8

On 2 August 2012 20:30, Martin Jansa <martin.jansa@gmail.com> wrote:
> I do. Already got ticket about it
> http://www.shr-project.org/trac/ticket/2045
> but didn't have time to look into it

This is curious, I wonder why the postinst isn't running on boot.  Has
anyone affected by this tried booting without a splash to see if the
first boot postinst throws an error?

Ross


