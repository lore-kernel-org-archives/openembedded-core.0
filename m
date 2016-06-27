Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id CD202605BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 05:43:49 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id q79so51410753qke.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jun 2016 22:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J9JZZ689D2pQLEq4IdquNVGeX0ruDs/Azgv4A0DN+lQ=;
	b=LKvjs675BPQaskzvm35+/wumRjS6WoQiZClyuiM7KAgG42vOTps329nJ5zc/8e2WWg
	wUYNcXrsuBgFcgaLFr4U1l/Gwgz/dz8ss5x6Yexb3jRi6yC2ttR0B/XgatgXatUQ5wMe
	qNjXh1iawSoMxLnI/zD6pDqtXvF2bufnG9vwFdScWMl/UtNfiyOOQvcFDoJyV/lcQ8j7
	Sz+OL2CIb+WPlqamZcvzZJBgEBnanwWO+y8fU+RmuMXjlY1MP/EpN1Jt5sS7y8rKe/B9
	A8P2pnaPhYElZ20yWiqwJMjx3PY5swjUb/EoKJ7Nn5tSrWhDTMnuZJ6fvi53JeoSotgs
	mTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J9JZZ689D2pQLEq4IdquNVGeX0ruDs/Azgv4A0DN+lQ=;
	b=jekPAgCDfM8ep31OSzjgiVrRRrYeZzkRzvTQE/0VDCctVTW+Nz+MWGltYXopKNjAe3
	MbZPa6+oPbWNt7D5JSVgdXWH3feeAc3p4Vt18l7Y2JiMU8E1GU8Eo6Bs4iF+bgO/p9T/
	37WouSAwSBq7j852eAd+g8S/LsHnb4miCTlVYOYlRMoJGGNj4GdD00Git4zJEf8+Qeyv
	J1Gwq+gAquhd0cuPOX6VjYb5wLgFxQMfN/vgmJZl3WVfqZKQINOiMV8O07tOYc5ErmU1
	doLjX/L6k9RKTDWEk5lbOay/zj1tRMj8KMILpZBUp1T3ldd6hzkLlSW4zeo6FFt0OAtR
	e+sQ==
X-Gm-Message-State: ALyK8tLa6t1WSVq0lhuDa5t4Dn1vE9uG7eJKpd4/y48hTrvwG1LCABnrQsXmLYTBdccIN4U0e2G/974+k7tmGg==
X-Received: by 10.55.39.141 with SMTP id n135mr22214751qkn.149.1467006229606; 
	Sun, 26 Jun 2016 22:43:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Sun, 26 Jun 2016 22:43:20 -0700 (PDT)
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC0141022F89@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <30DC4EDFD798C94083F3E083754532CC0141022F89@G08CNEXMBPEKD02.g08.fujitsu.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Jun 2016 22:43:20 -0700
Message-ID: <CAMKF1sri8r0Cv3rEqt6M+q2UvojuvmfNBWnCJ+da_RFkv3n7mA@mail.gmail.com>
To: "Bian, Naimeng" <biannm@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: question about security_flags.inc
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
X-List-Received-Date: Mon, 27 Jun 2016 05:43:50 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 26, 2016 at 8:41 PM, Bian, Naimeng <biannm@cn.fujitsu.com> wrote:
> Hi
>
> The settings as following in meta/conf/distro/include/security_flags.inc were added in 2013,
> -----------------------------------------------------------------
>  # These 2 have text relco errors with the pie options enabled
>  SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
> -----------------------------------------------------------------
>
> Would you tell me whether these errors tell us there are some bugs in LTP/Pulseaudio or GCC?

this is most probably a bug in package not in gcc.

> If so, why have not been fixed although they have been there 3years.

it probably has been, no one might have retried. Feel free to remove
these and see if they work ok now.

>
> Thanks
>  Bian
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

