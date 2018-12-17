Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 802A47BE39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 12:43:00 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l9so12082359wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 04:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=r9LwtHp7EgTZM5LXwTumJ04Fmykb/b/bApUWiU5i/eU=;
	b=iTTWRB5OkZW6jy8TC5GtIvbLXWQJeBRr77zha+qt7ywO0P+3X09T+fUV7z5xmwJz7s
	rtTb625sB1nln1I1jv2/uX7/SVKlBrnwMquORpYa9sK5qwc5Ad18B/3mYHBUrc6MFLYA
	d1T4yB2Un6kPAxdcAbPkYp9JKD8CXok8e2TQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=r9LwtHp7EgTZM5LXwTumJ04Fmykb/b/bApUWiU5i/eU=;
	b=f1tkk4K7/4WQlYv3BKosS3jTuFJcbbvwG0aVFSooHt0LoNYJBHk9UvrliB9keUWwa9
	Vxcxb9kuzQjUzBenvKHWsS8poLw/3VBDQgBD2wxyppuU2534KqevWPUxQsYqsx3YB6Co
	zGHejr75f9kbjU/JNjb5aKQTiYb4MnboLv9OYtJAj37H5ggtVhI2xrrmLQSWiclT/Qge
	g3kfg9bD+zs9qv0oF/QcS4BwR+P5YYzE2dGHKqyuv60e5+rBCYc1pBMfcfUKkdUADHYl
	Qz4R+zzL0Q1VQ6iJqQ9FmJaHPRYzBde0oVShh9+quDoR8CYzriC7bV0zBanndVmDCafq
	sI4A==
X-Gm-Message-State: AA+aEWbxBZTtHahHMsMW4XQN11216jWL/r/UZ0Dl6oAg/zcNW52ixsYV
	GbeeESMp0PYXw594/kT00wWq5w==
X-Google-Smtp-Source: AFSGD/XxFw/zvDYXMpt71Yn2Zeg1SYuq0o9Hx7Aap7VnLSxfWSkYND/+ShWtqDHqVoHySgJTPYojlQ==
X-Received: by 2002:adf:8b4d:: with SMTP id v13mr10113617wra.282.1545050581067;
	Mon, 17 Dec 2018 04:43:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h127sm12481370wmd.31.2018.12.17.04.42.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Dec 2018 04:43:00 -0800 (PST)
Message-ID: <30c758bde6695a33dbdce671a42032a55bcb762e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Jens Rehsack <sno@netbsd.org>
Date: Mon, 17 Dec 2018 12:42:59 +0000
In-Reply-To: <CAJTo0LY-EVMH5AM-_7VnvFTBnZt=RB5oCGBQbSSf8n-U83vtFQ@mail.gmail.com>
References: <20181215125756.12133-1-sno@netbsd.org>
	<CAJTo0LY-EVMH5AM-_7VnvFTBnZt=RB5oCGBQbSSf8n-U83vtFQ@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] perl{, -native}: Update 5.24.4 -> 5.28.1
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
X-List-Received-Date: Mon, 17 Dec 2018 12:43:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-12-17 at 12:36 +0000, Burton, Ross wrote:
> Yes, there's plenty of prior art in OE, but please can we use this in
> the future:
> 
> threadmulti = "${@["",
> "-thread-multi"][bb.utils.contains('PACKAGECONFIG', 'thread', 1, 0,
> d)]}"
> threadmulti = "${"-thread-multi" if bb.utils.contains('PACKAGECONFIG',
> 'thread', True, False, d) else ""}"

That last one is missing a @.

We could also just use:

threadmulti = "${@bb.utils.contains('PACKAGECONFIG', 'thread', -thread-multi, "", d)}"

Cheers,

Richard


