Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5C36B71210
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 09:59:23 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id c9so6249632qcz.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 02:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=x3m6kWYgpgkrX4Nj//JQw43Si0b3SoBSrKnf/dqkE8k=;
	b=B3X2LRwNBfCwg8m+EhL4V3AgKlIAVoinRPmGR+uqzdZc3i7wE6CtjdvfK+1IePt6nd
	Z0fU7qOf7a9Yc0T6ldjFXpSBYEM6ZTDhML3Wpixk9lBS1yzkLERqJD0utIkAExGqiJl3
	/YiW2CR50D/FxJV+UiVzpHeEs3LQH4oeWsfETD3OyNXMJSE/z3z7YQ2gVEr+jlgbw6Tt
	Xd+ScCFlJDRjv5iUZgLku82z8NZtKB/EU8aUGjybLg9ih5ohq6aZf68cZpSy2+jMyzXG
	kvNiX65c9F3NwBzusrMgjZWMxJLIAklfhecTj1cpDgwC4yA0Ld5o6zYQWeDDJN3GSLmD
	0mTw==
X-Gm-Message-State: ALoCoQn7QHdOkohZswvHkihsdFKndnODomGtDBNC07Hu0Er9kzdNwp5GgzXSHMZUJA9C9sUvyNTz
X-Received: by 10.224.28.68 with SMTP id l4mr7307240qac.22.1413280764614; Tue,
	14 Oct 2014 02:59:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.100.239 with HTTP; Tue, 14 Oct 2014 02:59:03 -0700 (PDT)
In-Reply-To: <543CF3AB.9030301@windriver.com>
References: <cover.1413275947.git.Chong.Lu@windriver.com>
	<be59231ba5c4dfafcb4d8e9951e8d10414ed0c64.1413275947.git.Chong.Lu@windriver.com>
	<CAJTo0La_gxKvJ3TqiimF4C6tMNmCay7_=NSQSTqo8itTANCtPw@mail.gmail.com>
	<543CF3AB.9030301@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Oct 2014 10:59:03 +0100
Message-ID: <CAJTo0LZQvykUoraK6b7gRyhi0V3fNsubOQ60SD0q+GphX96gHw@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Tue, 14 Oct 2014 09:59:26 -0000
Content-Type: text/plain; charset=UTF-8

On 14 October 2014 10:58, Chong Lu <Chong.Lu@windriver.com> wrote:
> Do you mean we should put /usr/lib64/gconf/gconfd-2 into lib64gconf and
> /usr/lib/gconf/gconfd-2 into lib32gconf?

No, the binary gconfd-2 goes into a separate package, such as gconf.

Ross

