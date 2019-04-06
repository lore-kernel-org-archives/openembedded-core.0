Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9996E7D42B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Apr 2019 18:27:24 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s7so7694207iom.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2019 11:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qgUGZN9NqPOPQ8wakZQouJRwV30MxnOqzCnGqUtLkGk=;
	b=J0Sz9I5GXcFfAhOKNhrUjJvqioRlS1Svi1uA0EW5uSC/bkEBh+n8yz9TvY2SoM9MEl
	RNA+57LhjZ1XM63ShOL8Svjf5QLCYhhZFMhJBH+mYR2Bsr41STuOH+wZLWIfOucfj7+i
	JG5DhfspAz71KBvFHAjgAvWkbAGvJNvRZRrVfEQGa7MX0l87xCPcILViPpZjnAZEUCTx
	/+Js8/pqtHaMOnL6KU4Eqa25Ct4+sq4mE8vbNCFSCBptqQH9Kcbh2HQb1FAjR4ZKCyA9
	01VMLGfmhWpW2OUGMP9zgAs2zEYr+En6aYUOoQdnin7IWNYOfDS+9bgxHetB0Zbk5gnh
	hozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qgUGZN9NqPOPQ8wakZQouJRwV30MxnOqzCnGqUtLkGk=;
	b=mjEAa4Qf2h/3Hf7gdhT4cFAIieYdNqFZcP279yItMUSHUEZH5PTvV0UKQYbqei4WKf
	uMYurp54JYDLfJCZNkQqnKHsqKn0kVm2Fq+VRSgB4BXgu2P7CWL+ya2PBqDUt7K+tiZF
	8CJ9Wh4amyCuXwPbw6qcFibNBOkyQMDVExkGOMmdr4BknAtdzoXpolJr63kHU/FFqng8
	kioU89ijTx/GEOYYMyTmYfiUxJKdfFbT658nqbhuI12Rlg4YWTGh7olkcc7vq625mnzC
	ryCgtNmHV8qm5Vyy30W7sa+MJfEhP5Ecnn1JYU0vsb7myJmYsLEg2s7eA9U2fLop6FPH
	X0qQ==
X-Gm-Message-State: APjAAAWbVwHUUM5mbaP8lBsfr9cZ/7u3BiRf2N781SJxjtRgSYawH542
	EriyphGwWMiivcAR3i35e6ntY2kmjaJ6o+NV0TA=
X-Google-Smtp-Source: APXvYqzHKajFm3V27llhGnMrnLibPEeVrB8I470bmbgYzI8GTcMGIjLcaSiG8zn+zthRaxBNX/Le6PriK9jggwz/QNw=
X-Received: by 2002:a6b:7417:: with SMTP id s23mr14011595iog.2.1554575245709; 
	Sat, 06 Apr 2019 11:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190406161948.9151-1-raj.khem@gmail.com>
In-Reply-To: <20190406161948.9151-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 6 Apr 2019 20:27:14 +0200
Message-ID: <CALbNGRS9mRJidO1dDRrwJjBadjMz4DjRr40pj=WhOSF8443x-w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-python: Remove --enable-introspection
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
X-List-Received-Date: Sat, 06 Apr 2019 18:27:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 6, 2019 at 6:20 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This option is not available and recently it is reported as error
>
> do_configure: QA Issue: gstreamer1.0-python: configur
> e was passed unrecognised options: --enable-introspection [unknown-configure-option]
>
Send out a patch already addressing [1] but honestly I parts of this
parts more: remove option instead of ignoring.

Cann you add:

-inherit autotools pkgconfig distutils3-base upstream-version-is-even
gobject-introspection
+inherit autotools pkgconfig distutils3-base upstream-version-is-even
gobject-introspection distro_features_check
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"

or shall I send V3?

[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-April/280958.html

Andreas

