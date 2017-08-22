Return-Path: <twoerner@gmail.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id 274157829C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 18:46:42 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id s143so113272097ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 11:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+G1Ay8KQwxR7AVVeaa+CA74sf4oEkEuTxCjDkYZ+his=;
	b=Xp53FCe1ith+eWeOxNYUwDfDM12LosQuMGM79X32CMUXSsz2l1EBdS4b49gTcTHZMf
	1xySuHvX2Vajg2ts6qlqJSMGlI3hR4Ml7ZgDHL3H1d1qmEJTeGl6S41yOa/oJMNsL04j
	XwcSQ5ZxTfKAmDknE+CoOebHwXpO8Mfy+4uvTchII23wOGSsPVF82xGb+L39j0LjMe5d
	IE5YvfeXuvqQChkV2EdNEgomXGcc1srEjZm/Ds0UCZu5yVoeD4bkgmmzAv1oQFnc1aGA
	hwCiXNYF527OeFR+iQJujHfSuoBBIsKAngHGCAKcdKYrn+ILOPGFEsPQweSERzSnwiku
	smtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+G1Ay8KQwxR7AVVeaa+CA74sf4oEkEuTxCjDkYZ+his=;
	b=TehQV6AhDAYFEAHkHZ1UkMsZVco10MuY/Laaa/Vu7xFxaIsS/sNInE9p5FzIvTyn3+
	euZgNFNjUjtosW6bjCB5XMbEKZiNT4YdFgBKAg2vNh0eSoAMU1UwXhJkmJFNAuso+AMt
	NPlugZb+D7vZCuZl2E3RCQYNevFm38T4UnvtEyorCkpe/sicYkizoxC6QUDePnBBt4zy
	NSCC30X50CZQkx58fzxahL3ucDvpUftQm9HJ1Bbyn/FAuKwUIC0tEjeZ2jrvtTBL+SaM
	t0eunecgm3p0QlpDyxwcxb9PMzED+CBDWAtbg6KO11pKCWNGxsn/Ab2oVucLX0Aw42Sf
	XEcw==
X-Gm-Message-State: AHYfb5hFjbpGerMJYl5VkXjOVGK3uqaC3jkWbX3FLK44Q3p06yr4sis8
	pYoTCXBtHWyuuyWRxVYdnSAvcvMl8g==
X-Received: by 10.129.83.68 with SMTP id h65mr23917ywb.315.1503427604111; Tue,
	22 Aug 2017 11:46:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.66.145 with HTTP; Tue, 22 Aug 2017 11:46:43 -0700 (PDT)
In-Reply-To: <96bce0e3-a699-4993-3748-a0fc19684ffa@linux.intel.com>
References: <CAHUNapTr=oOvVTHvwxGJ2uPZB7Kbs4rBh9U8ZGzdNd0HuHi=1g@mail.gmail.com>
	<1503423645.32591.120.camel@linuxfoundation.org>
	<96bce0e3-a699-4993-3748-a0fc19684ffa@linux.intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 22 Aug 2017 14:46:43 -0400
Message-ID: <CAHUNapRMGUyRN0omktP7x2sgk1QuHh9C-j13Am4Wo3eWYe04=w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: long (never ending?) do_install for adwaita-icon-theme
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
X-List-Received-Date: Tue, 22 Aug 2017 18:46:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2017 at 2:01 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Do you have any kind of logs for when it happens?


Unfortunately not, I'll try to keep some the next time it happens.

But I have a suspicion it might be related to a build failure. Earlier
today I was doing a build which failed in a recipe that wasn't
adwaita-icon-theme, nor related to it. When I checked on my build
later I could see the tail of the error message from the failed
recipe, but the overall build was still waiting for
adwaita-icon-theme's do_install to finish (hours after the failure).

Maybe adwaita-icon-theme's do_install would have succeeded if
everything had gone well? Maybe to reproduce, it might be necessary to
time it such that another recipe fails while adwaita-icon-theme is
building?

