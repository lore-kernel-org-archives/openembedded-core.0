Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2187C7CADA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 19:11:54 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id s16so8188262oih.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=qIZWq41RBqvcd6rQ2GReY1UAzIClcVd5zUEd7jlWDi4=;
	b=bvhuftRQvs82RlRCHocPm24qqiKPmEql1V6KtdXipaWmKenRXwXhevUQETrP2TGu31
	Y+IhPqbFTp56HTX2iGO29X2RCKGcrKkCUz9sB7ohyY1pkIlcw7XYw0YDonzyfBjNu5Bg
	+lIZU0EL7dvGYhbhNwT5BJ/FLxKQSuBWphP23q7JOXj1ert9Aw0miRYLHfpilDXR2OtX
	t3qhetLIWPu6dn9EQvgku1ZYcqJ+o7X1ksWHBEXH4yEl7f4g4M+KypDhN4ko/mOcB9w3
	jf+X5smA0v+VspOFu45zc4sdhu9iPDyVDshtHPwQ3kTsRtcpA3p84xKdzQKye190P7nj
	GcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=qIZWq41RBqvcd6rQ2GReY1UAzIClcVd5zUEd7jlWDi4=;
	b=Ho2PSawFs2wxbnqI+ppPU3i+Aql8gtmhLRnuM0bt0S+I24Jct1S0eqfDGrgHpistjL
	7HyKk1SUffriNHQ4I3GXcumHHhgjMxJFpaQ1JA4kFzLv+DrVxjwHFX8MQN/U8RzCdocD
	oXIc0aPASSx0wQpocCjp6t4aLV+CnLAzISyrkhEq8V8yU8NfCQLKIR0OAAY75sMu68KG
	AdE10aiYeTUmReYu0qUmLgZIkH9YAyACW5XdWhxxO0oxpbWLnXcBxba0MQlhxBX359SQ
	JDTEDZQNfglrwbPiCHWVj0T7WWILK1Ub3su2sugAk2vs8Dh/MRiJUx39h6XqyuufNN0b
	Z51A==
X-Gm-Message-State: AHQUAubmtOJZ/1ZWTrCh1KUnL+/jTEzoYFH6ozNbtXUGK5dYA8DszocC
	atk6bd547pqFSLqldtAl0QnWl52yDw2oNQ==
X-Google-Smtp-Source: AHgI3Ib/yVscCk/3hk6K3xDvI+QfMaK6L47fRfN1sfjGvfImYz57dJlwDWj6YkP79UwSWQezENEK8A==
X-Received: by 2002:aca:3ed4:: with SMTP id l203mr7758539oia.88.1551121915517; 
	Mon, 25 Feb 2019 11:11:55 -0800 (PST)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com.
	[209.85.167.174])
	by smtp.gmail.com with ESMTPSA id l5sm4140665oil.15.2019.02.25.11.11.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 11:11:54 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f174.google.com with SMTP id i8so8193294oib.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:11:54 -0800 (PST)
X-Received: by 2002:aca:54c5:: with SMTP id i188mr12369988oib.16.1551121913853;
	Mon, 25 Feb 2019 11:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20190222142333.9780-1-fabio.berton@ossystems.com.br>
	<CAJTo0LbhhwpyLh9wP+JswymO+T9CRJ64w8hw6g8HsxUSLg9jOw@mail.gmail.com>
	<CAJTo0LaugPSscMvBwJz+ezbp7DMF9rs59Svkr8WnFb3+oM-KwQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaugPSscMvBwJz+ezbp7DMF9rs59Svkr8WnFb3+oM-KwQ@mail.gmail.com>
Date: Mon, 25 Feb 2019 16:11:40 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrQUdFZ=EGf1uhcZgFdp3fg163wAUJOJcLKhFZE=PSyuQ@mail.gmail.com>
Message-ID: <CAP9ODKrQUdFZ=EGf1uhcZgFdp3fg163wAUJOJcLKhFZE=PSyuQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH v4] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Mon, 25 Feb 2019 19:11:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 25, 2019 at 4:05 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> So far:
>
> <dcbaker>rburton: according to this commit it's intentional:
> cc15460e182148292be877bec5a8a61cec57377d
> <dcbaker>although I'm not sure that patch was correct now, it looks
> like autotools has generated a 1.1.0 since 2014
>
> On Mon, 25 Feb 2019 at 18:54, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > packages/corei7-64-poky-linux/mesa/libgles1-mesa: FILELIST: removed
> > "/usr/lib/libGLESv1_CM.so.1.1.0", added
> > "/usr/lib/libGLESv1_CM.so.1.0.0"
> >
> > Is that intentional?  Looks like a version mistake in the meson.build.

I intend to wait for 19.0.1 to upgrade to meson, however, we will
again upgrade and then do the meson change so we can track regressions
or behavior changes.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

