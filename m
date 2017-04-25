Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6E677ABA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 23:22:06 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id 110so42427143uas.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 16:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=siDAvD8XZ0spT55JPC9ZXgN1EtBxJUw1KYvpsSIZ3go=;
	b=bqvDb2OGRWlUcG3P9H/iJ58Al3l5CiH9fs3wHEnq6zQBZIoFJDc9maUfhKinQ/yfw5
	F0yZwVIh8ghW8P9Pe9xcaEw4AuyLABSlkGB+n4aowgHhJKrO3YEELFHA6w00rcU746c9
	0izmmmXTn70yCbmc2jf1bzHVEbkX6lP7S+5a9sMhbh0HTXKmRs5MmtBsY78g+6shTz+7
	DUTJRjR+uqV/OwIMyh7gIxhRjVxU5+AgxDF54HKwTV2FF3ShPp/A8wy24jEPtxjVKy6B
	ZjKO7kM7jzupyD2p7f0dRE3QXY51tAKcBJw/2hn3kO3WZZ85QDkKL8pt0hwRJnS+YL46
	yVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=siDAvD8XZ0spT55JPC9ZXgN1EtBxJUw1KYvpsSIZ3go=;
	b=NjBJ1UEsmU9qX868Ximvi+fqjAsWKJDaW0braF/LglqVo+MJbFi3TDoiclrx2KgLyR
	jUOiddU3lI24RWXPe2estbkiakwx7Al0eWLbiL0dMwxq2PG7oOnq+yGTsgZeZxJQNoJT
	lVJEMpliNfptqMFOrSjfrbDLam7lPSRrWkVOMRWpsg9XQ8+voQOBLgp8RxgQpvv+D7hz
	6f9qNgUo77I/4eca4x1/lJRoCJU1bBP50x5Ph/oV4tTnmc4iID8+Pc2kj3MTYIgrbLs4
	2ZS0P2bTnRsKpSlcaeTXrJZCb/CCY+cj2l5m9emWNW4PFZY1qo2V9iDA/xqzbByI7ttl
	dyfw==
X-Gm-Message-State: AN3rC/5MI4M5Sr+Jo0HPd1Y97ncZ4/VCAjmlf/xDDF+CJimAt635/bXi
	Z7IgqgyfcSXmwA6T8LCrVgJwmgJ7eQ==
X-Received: by 10.176.24.223 with SMTP id d31mr18128378uah.140.1493162527508; 
	Tue, 25 Apr 2017 16:22:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.65 with HTTP; Tue, 25 Apr 2017 16:22:07 -0700 (PDT)
In-Reply-To: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 25 Apr 2017 19:22:07 -0400
Message-ID: <CAHUNapRY94uC0W2Z0Y3GCfMSer5HjOW9AWoe_vc3m3MarxG+0A@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Reproducible binaries
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
X-List-Received-Date: Tue, 25 Apr 2017 23:22:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 25, 2017 at 2:14 PM, Juro Bystricky
<juro.bystricky@intel.com> wrote:
> The variable defaults to "0" (do not
> build reproducible binaries) in order to minimize any potential
> regressions. (Once the reproducible binaries code is mature enough,
> it can be set to "1".)

My guess is that people would prefer security over reproducibility.
Maybe we need more consensus for the default value going forward?

