Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id EB1AF61005
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 12:02:40 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id ld13so1802663vcb.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 05:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aApakNNaBGMhTQbS0toAN6j1ZVn+KepF9xelh+UO120=;
	b=WEj70Tx9ucr6xOQBwgGfuzXX6t9SKe3CSzicPfqwDTKwKluXWT+cDkaCAxakjg5Cnv
	uVSoCIkjmXyI8EpJ9we+2llVJhZrBByGIkjLe5fcrR8o39IuFwWRn15oHo/nufZL8QA/
	uhrYHetXoMJ5n/RQ8fgrsSu4t9TlXJIdjJqm2VfF3oYKEG0JaIYm8Z7B+1FP/NEffs0Z
	68Cdi4Vd0juIgXXjAmuofTHBrUVeOcJ2UU8qXnljVUetcP4/6zT1nZLJpj/jhmeK+dis
	g63scx13XB/VTVMvSXKKQgf2V7ex4tT+V8bfR839xOOHeTEusKqw5oV+o2aGnpi2Vi3y
	PWsA==
X-Gm-Message-State: ALoCoQkNY5lcN1iIrlCuHqfQ+he0BFOjQWNhm4aNF3mwN6k/y/xORyHXZO0/rUFIR13KeY04fjnO
X-Received: by 10.58.117.71 with SMTP id kc7mr6025819veb.16.1380283362443;
	Fri, 27 Sep 2013 05:02:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 27 Sep 2013 05:02:22 -0700 (PDT)
In-Reply-To: <1380261147-21348-1-git-send-email-rongqing.li@windriver.com>
References: <1380261147-21348-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Sep 2013 13:02:22 +0100
Message-ID: <CAJTo0LZ0sm8Myz_P=XRBMpc1RnZGeFyf4fuNGq1txZg6-LSeqA@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-compat-units: do not create runlevel command
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
X-List-Received-Date: Fri, 27 Sep 2013 12:02:41 -0000
Content-Type: text/plain; charset=UTF-8

On 27 September 2013 06:52,  <rongqing.li@windriver.com> wrote:
> It seems strange that runlevel always returns 1, The comment says it is
> related to sysvinit, but if we enable systemd, sysvinit will not be
> installed. and we have created a link for runlevel to systemctl if
> systemd is installed.

Whoops, meant to fix that ages ago!

Acked-By: Ross Burton <ross.burton@intel.com>.

Ross

