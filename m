Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0AEA86116C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 10:57:46 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id a108so5868769qge.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 03:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YT5XOw2IYZZoYM5gPFWP90yOdEGDpIZTP0xbBaXcKb8=;
	b=Q9vm0XQ5hD5cMa1pQcUeY1A5T6hZVSID8MTzoKXo0nH9//TThBKjeqchDiIvgUxwmn
	nrNn7/iC4px/81SmKn4hMlE0WOS7TcQ2w5Dq6W3+SeWauQVvfQjRyCvpm5S/spLX3A8H
	CbQquqZtcvv4Jj9tRQy1/f5CjF32P58YAFo+P2ovkeeAofu/7zu8ReXTS/KQMEWYHaHo
	ZJ4PjwRDBFc9lq9oH9BekH/9wIQwRbT4sDRQA3bMqgDyko0H5XwMAaCLT4PGmPjjivzW
	5zOGCtSlwCfEfdQeqDQ3rVohMpzvNQHMM3xGU2sXps9Wmfx8W4k/loraqoNXrQCOwHsK
	xO5g==
X-Gm-Message-State: ALoCoQleeO6oCox19MFxHnLPmpN1ivcnyRkkOrtVJnwTm76iXp2Y27XWBS9rWA2l5MZGxoqXcYKE
X-Received: by 10.229.238.133 with SMTP id ks5mr7643575qcb.23.1411556267575;
	Wed, 24 Sep 2014 03:57:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Wed, 24 Sep 2014 03:57:27 -0700 (PDT)
In-Reply-To: <1410836993-18483-1-git-send-email-rongqing.li@windriver.com>
References: <1410836993-18483-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Sep 2014 11:57:27 +0100
Message-ID: <CAJTo0LYX06fNa9Q+3qdgB3eEAxebXFKZ1R6B7DgnJrBa==ttwg@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: add PACKAGECONFIG for numactrl
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
X-List-Received-Date: Wed, 24 Sep 2014 10:57:50 -0000
Content-Type: text/plain; charset=UTF-8

On 16 September 2014 04:09,  <rongqing.li@windriver.com> wrote:
> ++AC_ARG_WITH([numa],
> ++  [AC_HELP_STRING([--with-numa],
> ++    [have the numa support (default=no)])],
> ++  [with_numa=yes],

The comment says default is no, the behaviour is default is yes.

> +PACKAGECONFIG[numa] = "--with-numa=yes, , numactl,"

Always pass --with and --without for clarity, especially so in this
case as the default is --with-numa so the disable path doesn't appear
to have been tested.

Ross

