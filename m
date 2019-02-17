Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id C9B546C3B2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 17:54:27 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id j125so14690686wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 09:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=XBZsUl99XfqwC8xj3ioxkuYL0whhxiD8SYFVH3hmYTI=;
	b=M6SYdPlAj907626cUHc95/e0rKBrqn4rKD4nfc1Q22Ij80NlCfgt5WxkQGKPe3iKMq
	B99hu1VbnWURXtsGFytQ8IiyqRyEwNBT5k3fiytLJiLKGuAJrBhlOMqkqmc35kQEgDzz
	WjPhjvnV6BBwpG4YpcQgRpC1ykum7oxfrsMqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=XBZsUl99XfqwC8xj3ioxkuYL0whhxiD8SYFVH3hmYTI=;
	b=jjIwM1mfTrD/KqZDpmY8RouLoc+HyhIshjF7qJ9KcKEv6Jk8Klze/QF2lfMHCt1aqb
	VsVpjaFwg35ezwWyyRq0aXjjXUqMoQTKkNjgMM/optG6yVw3HwV7HDXPq5dkpCNQc09r
	pJvXAPK8Mfwb0FWNHoNUyBKXYmNHiqZz+bPib6/f/kYZ4krhclX56hPiiFk3r14BLFLz
	GSS6kY5eAaYffc7+Zbx17K/zj/0/nb8OmWmgkjpcGjuOO22MuiWsCgCAIJ0/otbXApvF
	dsFoWh7ZmbReinocqAXLrAe3JzMVZSujEhORHVfL7pxsFbcfHl3rNq23+CABv36GQZwr
	48jA==
X-Gm-Message-State: AHQUAuaR029eTLf0PN2ZwfgN1QhXHC8iyyZlGHopqzHudyragLK+0YKC
	yRodLwwqt+0CUgGA/xygI8cnzdrHPWA=
X-Google-Smtp-Source: AHgI3IZG0C2h5UBDuJdOADleeWNcx9wUrxug+vEPogiWnBwFnLvt0ewS/ECsxQ8+Uu2Dwn71JRaeOQ==
X-Received: by 2002:a1c:7eca:: with SMTP id z193mr12641172wmc.5.1550426068350; 
	Sun, 17 Feb 2019 09:54:28 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d9sm20914564wrn.72.2019.02.17.09.54.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 17 Feb 2019 09:54:27 -0800 (PST)
Message-ID: <8f788c03bb214b6b23dacec18b9efbc32d6bf81c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2019 17:54:26 +0000
In-Reply-To: <f26f1ce6b9b79817950b93f9aa0e38d32671e78f.camel@linuxfoundation.org>
References: <1550123438-37723-1-git-send-email-ee.peng.yeoh@intel.com>
	<f26f1ce6b9b79817950b93f9aa0e38d32671e78f.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2 v7] test-case-mgmt
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
X-List-Received-Date: Sun, 17 Feb 2019 17:54:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> Despite my changes there are things that still need to be done.
> Essential things which need to happen before this code merges:
> 
> * oe-git-archive is importing using the commit/branch of the current 
>   repo, not the data in the results file.
> 
> * Fix the -t option to merge command

Got rid of this for now, we can add it later if we need it, can become
a "nice to have" for later.

> * Audit the command option help

Done on my branch.

> * Revisit and redo the way the git branch handling is happening. We 
>   really want to model how oe-build-perf-report handles git repos
> for 
>   comparisons:
>   - Its able to query data from git repos without changing the
> current 
>     working branch, 
>   - it can search on tag formats to find comparison data
> 
> * Add ptest summary to the report command

Done on my branch.

Cheers,

Richard


