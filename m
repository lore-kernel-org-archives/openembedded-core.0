Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE9A60017
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 21:25:56 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x13so836183qcv.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 14:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3A8rurLbJMZOecPYOSZ8gu+03luvaw1KgFlcaDcFANU=;
	b=YKYdxzdI5GAZiDDC95mXk/TN1mTNHQA6e5gtFPnMV4Lk4RFNdKIuydf5KF1K7p1dN2
	x8JmxEjAURxeElA/0obGo19i/Gu3kQBwaOot+lZQvClJenwRi4IPi/hE6qR7ac+oLuRG
	/HS//wdzLhq6jEMUdecNGOor9+HsKH1NSI6QwtoEYYV/GPuHXc96FzmACfBW6NhIgb1v
	2Hc1jSfiyaul4gtdpIysYZ3JVgdzywOw+HOqmo/cfJwU+q5gs2/qhFoE9wTADAASE9XC
	AxR2AMkfqcJ1QQafPGg7ay+uJe3f23SzRzEH2tScGIuKY/uFJFou7cI6/yCFjOYVNNvi
	C0gA==
X-Gm-Message-State: ALoCoQkyx5TXlw7Gv9IbPBzv/UhP2XUMsiGZPVTDMn8p8B5sIENcH+RaF+6OEsuNH1WPJCmEhO7t
X-Received: by 10.140.94.144 with SMTP id g16mr9846619qge.77.1410729958091;
	Sun, 14 Sep 2014 14:25:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Sun, 14 Sep 2014 14:25:37 -0700 (PDT)
In-Reply-To: <1410549622-30269-1-git-send-email-jslater@windriver.com>
References: <1410549622-30269-1-git-send-email-jslater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 14 Sep 2014 22:25:37 +0100
Message-ID: <CAJTo0Laoky+OvMSOAK3NGSq_2m6Etgdn9XXAmfxpxJbOfJYxdw@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] at-spi2-core: fix DBIND_CHECK_ALIGNOF m4 macro
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
X-List-Received-Date: Sun, 14 Sep 2014 21:26:02 -0000
Content-Type: text/plain; charset=UTF-8

On 12 September 2014 20:20, Joe Slater <jslater@windriver.com> wrote:
> Modify the macro so it will work when cross-compiling.
> Note that the values checked are normally in a site file
> so the macro rarely has to discover them.

Awesome.  I need to remember that AC_CHECK_ALIGNOF is magical.  For
what it's worth I've just submitted this to the gnome bugzilla.

Ross

