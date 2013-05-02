Received: from mail-vc0-f170.google.com ([209.85.220.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UXtqs-0001co-VD
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 15:47:16 +0200
Received: by mail-vc0-f170.google.com with SMTP id gf12so464418vcb.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 06:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=BY1y113ysliSZsxuSgULw26I0lz7Ta/xNLJh4HQQc1U=;
	b=Rug58iWpMJMBTI0M+ro9PzZ5O2GXoAflXf8f5WiaQLZffJYb64fqGT82VEeQTYVq9a
	pKgd7XtOKuqrkC6Hbb8s8Ptze2a8QADhc5vFaRTBBJD/sPQWjGnf1UMJO6ET+Q8fsZNa
	nsND6lEX2xwvQDMecdqyzvRNPT74zckVIo06KfAkyrSEn1ZARS61ITJROkeyoxSfy3XN
	CVr88QiWAEJpQqv3u+cDUKs4nMvJr/nobME+mOtF1wFBSsIGU0OuGaviXxKCIix2MSRC
	8WfNEC+auvvZvQ24G9LuDS4ew+GPwDIkE98Fws1mX9mv8BRvbfFQ/r8hoUkI1xjJRPTX
	vymg==
X-Received: by 10.220.251.129 with SMTP id ms1mr2099280vcb.53.1367501360628;
	Thu, 02 May 2013 06:29:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Thu, 2 May 2013 06:29:00 -0700 (PDT)
In-Reply-To: <CALRxmdCsEHp6yDPsrTXyFjsiQ=65Jo=GLc1sqRUL0Gv4FiSZ_w@mail.gmail.com>
References: <CALRxmdD5r1MGDuDjBKHYcB9eLQ1FL9BZM5_QQxLNpQOcyOHvVA@mail.gmail.com>
	<CAJTo0LYk3yyh3dXk5hmvbvpiv9fWNmgoZpYzUb_U9Kc6CsMELA@mail.gmail.com>
	<2887547.jBA5alvWfN@helios>
	<CALRxmdCsEHp6yDPsrTXyFjsiQ=65Jo=GLc1sqRUL0Gv4FiSZ_w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 May 2013 14:29:00 +0100
Message-ID: <CAJTo0LaZJG=_T7gohNzFE6znFa-wO=-QV9zKjH4S+GcQ26DJdg@mail.gmail.com>
To: Stuart Yoder <b08248@gmail.com>
X-Gm-Message-State: ALoCoQmkpFKt9A7XN511hG4UbASCWQ4++rYjWQyPQ8TdvhGJbKz22hXkLXUzew7bJMR+/yGF/4d2
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: yajl: Installed (but unpackaged) file(s) found
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 13:47:33 -0000
Content-Type: text/plain; charset=UTF-8

On 2 May 2013 14:16, Stuart Yoder <b08248@gmail.com> wrote:
> It's just my observation that there seems to be a discrepancy between
> what is getting built and packaged.   Things get built in ./lib and
> packaged from ./lib64.

It looks like yajl is hard-coding "lib" but presumably your machine
configuration wants to use "lib64".   Basically, yalj should be
respecting the directories passed to it through the cmake class
instead of assuming it knows best.

Ross


