Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id D025A71984
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 13:36:52 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id n8so16509266otl.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=FbFVzqNVXpQxibOQaoeN1zFR5+Al7BhKWMji6RlVXeY=;
	b=QjA85vo0iwZqm3kLWBxcKvPvTlJKRg9+4JcLsZFEM7eUPgn/BlIgzd/H9hbFcMNZKV
	6bluh3MdFwYftb9luLV5b7Besa+iL1RvGwSd6fYvjoV6UKah6HyPGO61uloDACSG+Pe4
	BN+5I6x/QG4ylNZAVM3j42EwwPOIMguau0lPq3ZCgDOHSC6VksEAAtyl8ck+ov7R6sz4
	XoiCkvvl6MJvM/AD4HQPe0vMIdiOU/i9i3LlnRpthD2AAOH6yi9TLY8pDERXuzx7jUjx
	HZp1CrI+lB6moIZxMMOIMG/dAzzyO+ftpC8GkbipTtkKi2+WLwbSd7hZ1elYelDayEng
	Bg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=FbFVzqNVXpQxibOQaoeN1zFR5+Al7BhKWMji6RlVXeY=;
	b=mNpm9tUXExPmPLjOskvKb/xdm0b78RojTYkpwa31CAGrtMq/CpWP8eewXbYQYEkmw4
	RXtsGheV+U2GtjZCEQEDVHOlm0RFjXs1xF7Zv5LGb3tLzvRSdh5jHVxJEEQ6onHbbiu+
	2xAp2UE19hvWGHieOxIv5beMJ4++xHlnckDeZsN7fmJjxjzMQoeCKgBN8R37DkPiBHfw
	FrSqWAYq3nrNQDLVUWMxXzwU4gg0cjNalzy+eJnzcmElx37CkGr8etJhKw09FCHNtwcb
	YDB2o0l/cQ7gCqaKnfbVieuII4rnXJZ6B4Nf1rNLUs/rNzF4g3H2/9qw2DcuaT+AjsO6
	9FHQ==
X-Gm-Message-State: AHQUAuYSw6bL57oAYHbeAX1GWMmjW9M+mb+MYmkfITJX9+W4l/zH4zBy
	9KUEFN3XUCgOEF1sD3BjxsgKr5X35wjRRA==
X-Google-Smtp-Source: AHgI3IbmnVgP5DqNhjNkkGb38/AZtcqBSTdRfeSx9/DP/So6ww0Jy92vlXIngFA7B4wCk7SUVw7PAQ==
X-Received: by 2002:a05:6808:5c1:: with SMTP id
	d1mr5865962oij.170.1550237813425; 
	Fri, 15 Feb 2019 05:36:53 -0800 (PST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
	[209.85.210.54]) by smtp.gmail.com with ESMTPSA id
	r11sm2517894oib.45.2019.02.15.05.36.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 05:36:52 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f54.google.com with SMTP id 32so16435747ota.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:36:52 -0800 (PST)
X-Received: by 2002:a9d:1b2c:: with SMTP id l41mr5558863otl.1.1550237812066;
	Fri, 15 Feb 2019 05:36:52 -0800 (PST)
MIME-Version: 1.0
References: <1550224933-20658-1-git-send-email-alex.kiernan@gmail.com>
In-Reply-To: <1550224933-20658-1-git-send-email-alex.kiernan@gmail.com>
Date: Fri, 15 Feb 2019 11:36:40 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoP-pGOqZmGaz9bBTzp9fx1nUA32jQUkKrN-kb8fBWhvQ@mail.gmail.com>
Message-ID: <CAP9ODKoP-pGOqZmGaz9bBTzp9fx1nUA32jQUkKrN-kb8fBWhvQ@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bmap-tools: update from 3.4 to 3.5
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
X-List-Received-Date: Fri, 15 Feb 2019 13:36:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 15, 2019 at 8:02 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> bmap-tools 3.5 was released August 2018 but has no release tarball, so
> switch to using the git fetcher. Also pull in the fix for StopIteration
> being transformed into RuntimeError for Python 3.7.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
> Changes in v2:
> - Drop append of "+git${SRCPV}" to PV

Please keep the SRCPV as it is not pointing directly to the tag, but
for a commit next. So keeping the SRCPV is indeed required for
correctness.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

