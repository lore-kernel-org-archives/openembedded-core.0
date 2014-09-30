Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id E75D960809
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 19:42:01 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id x13so2127745qcv.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 12:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Xct+6G4rElTG6NCLVCAcdgeNOaX5GVeIi+sdrT+N3z8=;
	b=Qw+ttJzl77PoA0Vqb30WrgSX8yrCndEHSFInjzlt9bqyPYBoQXs8DavvYJ0vlSE6rL
	l7oeUJdBrwjYVmFnVCEkoYshYbXXoKCOwWqAistybFGT81QTP6Q7kFiQc8vozZWE73KM
	2ptpuzEKcglOKQLqbc7HTIHUZoeGY+Rt5uG430708N+tUtAL0udp7apAGfrtl4p2Iebp
	LhinqT9PnhY6dJuCDqzbg/Xr+6xrYHrbCHHvpHzdRhvbQWJQk7Qa/hsrvxXRN51+mMgK
	hZTGv9mZn+sv9pJqu46HolbUqPQRATGvLQvnR6lbfutQeB4IcRlHsm4h0EFRKbU/8JTD
	oXpA==
X-Gm-Message-State: ALoCoQk9twKaViO8IoOymZU2U96dju0aF9XKa79Me9FXk/xwWbkk4Sfs4NJ8DwT5tX4lt62xS3hl
X-Received: by 10.140.23.50 with SMTP id 47mr45480480qgo.77.1412106122216;
	Tue, 30 Sep 2014 12:42:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Tue, 30 Sep 2014 12:41:42 -0700 (PDT)
In-Reply-To: <CAAwVp3s=oVU-hsx81CMLb5Aumb6fsbrdsR21fsmTHY69ZAgb8A@mail.gmail.com>
References: <CAAwVp3s=oVU-hsx81CMLb5Aumb6fsbrdsR21fsmTHY69ZAgb8A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Sep 2014 20:41:42 +0100
Message-ID: <CAJTo0La6YvGmjuj9ttNjv9N488jbM6+hmJu0woCAgimTJLFt9w@mail.gmail.com>
To: Mario Schuknecht <schuknecht@dresearch-fe.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: u-boot update?
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
X-List-Received-Date: Tue, 30 Sep 2014 19:42:02 -0000
Content-Type: text/plain; charset=UTF-8

On 30 September 2014 20:28, Mario Schuknecht <schuknecht@dresearch-fe.de> wrote:
> is an u-boot recipe update in next release scheduled?
> Current version is v2013.07.

We're now in the feature freeze so no more upgrades are going in
unless they're critical.  There is a patch on the list for a more
recent version which will be merged as soon as 1.7 branches off
master.

Ross

