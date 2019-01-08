Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id D82317BE38
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 11:02:02 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id m62so5620269ith.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 03:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=T3QMdhQp17xdgfFHUU2h0s719WXMcHSMwVzBVmJunmo=;
	b=cujwTUK0LD+RXjf31u5eZiEJ5r9D0gzPAXM46y9esSP/pgVr6wsvK80l7P5hkLRH3c
	Md7bQHAjOocPnWxwlgG5CwTUSlioL7oOUE1kOPay1oon8lLp6iOG+dCQ6M+0ZRmFu5bX
	IXLYlfuVuY/5N8c5A19ZHYL/Sh4o1muE8HIPLu813dcFyxqgJtqrqDnltcA7RkUHdw/A
	FoK4ehGMNra43yXnkwKfm8Y+G+fONG5eJTHm6ReqBYTfiX5ZoUJVsurRsNuyagsqPhAT
	/djncPxGQ2UA9VL4P274wqHJ8yKnFy7NuLJzObHR2ZTv+p9Tloghu7v4077E8qF6T/jZ
	R50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=T3QMdhQp17xdgfFHUU2h0s719WXMcHSMwVzBVmJunmo=;
	b=em9o48++w31Ew3Nzsq0itn1Or4L4baqpVpNc7W1IDDRi4bLQZfWoAD8V1NksDilwy9
	GMO9K0Rjp/qoS645a5BulALyR5RBCkLMNxhHKl+ujzmmU/YFx9wp2i3Zx2AEDMdTBP+O
	Hdqyv4ny66+SBrYyd/qfqMIG3a9JwQN4b0gSrVhwcibKYzNe4s5h1WqEQ0K+KTbxtV6Z
	XYbBoPRCKbem/BtbQ4vTvcib0YZt80AmApqX2fZRhR1y7pPFqJdoC54n1uiDHymyFL3A
	n9Hhu7uwspEjkWzExLJHBjbXvbAEeqH6JMvxNfrKR7OUvgaHcK7gscj5GcdQKFsfqxsq
	e4Yw==
X-Gm-Message-State: AJcUukdJfJLyeoHqJCPcWXc6x8YWLJf1FSlXEcSqAPysN+YHiCR6Ewvp
	DK8JZbMVtJcYC4dz3nF1heqUMGn/Vvi2yppDWT/T1BbQ
X-Google-Smtp-Source: ALg8bN7flP13HA7DeRAmAhu1Eqm5NeohMVpZZn+2oYq+G9jxaChedVBXp5xF6S8j+7XGzF5y148TKfZmWPygZc8hhSM=
X-Received: by 2002:a24:c601:: with SMTP id j1mr1056019itg.130.1546945323687; 
	Tue, 08 Jan 2019 03:02:03 -0800 (PST)
MIME-Version: 1.0
References: <20190107163823.31816-1-ross.burton@intel.com>
In-Reply-To: <20190107163823.31816-1-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2019 11:01:52 +0000
Message-ID: <CAJTo0LZ__dsz_LuVUS6FPD+dkW7mkY+a5kMJJgTieUxwY0ZEHQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <jpewhacker@gmail.com>
Subject: Re: [PATCH 1/7] toolchain-scripts: run post-relocate scripts for every environment
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
X-List-Received-Date: Tue, 08 Jan 2019 11:02:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Jan 2019 at 16:38, Ross Burton <ross.burton@intel.com> wrote:
> SDKs for multilib configurations have multiple environment scripts, so
> re-arrange the post-relocate hook invocation so that it runs the post-relocate
> hooks after sourcing each environment script.

I think this change - whilst the right thing - exposes a problem that
icecc doesn't work properly in multilib SDKs.  Can I ask you to
investigate and sort this, as you submitted the icecc rewrite
recently?

Ross

