Return-Path: <petr.vorel@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id E4F6279CCB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:51:58 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id p6so3969862eds.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FyOHuIh8TegWjxX/ymJXVqKwApTMnk6lzALPZ6twwlQ=;
	b=qeuhHJNbGwImeTnOOmDDhCCdNGwqOSdw6EmthZqIVzvPg0SMstOKyHs42xvZBKom2V
	q9vc2uRq7rHgH5YeANYMfo/K2twNArmw9y+gWZ3iGjye1C/H6OSqm1/OC+QX78D8MZ8c
	49IwLDwWh4XuVccOJ1J6lQg3PD4uNSEuusGSVooHjabUOQuh4ZZhA+PnEXw/+vKbcyN3
	qtlqvSKwFQ08IZzfJm2SdHPenS+eS1R+s9a+As+R5fvpFlpV20YGMfCKcw/Rz2ZmjqAh
	5VUUYB1n4wiPUCNML0d9/08iI1fl4GfZjJA5mMtTtMbyHzGZnp3yl3eMUTOUvi4+Q682
	jHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FyOHuIh8TegWjxX/ymJXVqKwApTMnk6lzALPZ6twwlQ=;
	b=Ap6MvndSeMgNn3pSfr2Z8DcisMtpb/MeAe5V/lzFhIyyjG9tLXPsQls/UDEfG1tX1k
	N/D/rREr3aVkarn4JcF4rVt1ZR+3z1tgVYqcUaMJiqE7RITTWhgyJ14LQMP9LD2UhJFb
	4jdX8st8IGgHAaaK3tw54M85REqhgzah+GIA4c+ubHy1+5jUIfawM3BKapB9PHk3enwb
	FES3oe8HgrVw8+XTasUD/iznLoQuBG31coFUBzEo4DL2OR55u1fonnCio8R18y3ZkxLA
	EhOR2lD1JAzbJisM/s7eO/yRkwccL8cdLW26tGYRsWGxXPWxtyMrCBBarkspTxhXk74t
	XFcw==
X-Gm-Message-State: AJcUukfRVCoDXxVDWZnk7d6qR73qlGsvwcdQiRPfo2HrzfN6FhHTYHIq
	Pnzjkl43yH960l6pA83TcSd3o0pq
X-Google-Smtp-Source: ALg8bN62mJGup9PbFnJvy+bzckQHszBcq5T7Wkt0Wa3wLm5fO0Bhhze9kJ0NWzkAuqPLWE5BnUvUeQ==
X-Received: by 2002:aa7:d602:: with SMTP id c2mr5032229edr.203.1547592719118; 
	Tue, 15 Jan 2019 14:51:59 -0800 (PST)
Received: from dell5510 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	t18-v6sm2802963ejz.9.2019.01.15.14.51.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 Jan 2019 14:51:58 -0800 (PST)
Date: Tue, 15 Jan 2019 23:51:56 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190115225154.GA10097@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20190115212256.14404-1-petr.vorel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190115212256.14404-1-petr.vorel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [PATCH 1/1] ltp: Update to 20190115
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
X-List-Received-Date: Tue, 15 Jan 2019 22:51:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> Removed patches (accepted in upstream)
> * 0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
> * 0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch
> * 0001-setrlimit05-Use-another-method-to-get-bad-address.patch
> * 0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
> * 0001-statx-fix-compile-errors.patch
> * 0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch
> (accepted v2 version, see http://lists.linux.it/pipermail/ltp/2018-October/009691.html)

Patch is wrong, going to send v2.


Kind regards,
Petr

