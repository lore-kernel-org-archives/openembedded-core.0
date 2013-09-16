Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA3C6C850
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:16:05 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id g17so2740290vbg.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=f4l9rRMfLrHFsnC5Wxr2fTe7iiBndLem8fLcFMP28gI=;
	b=kFMayhosBi1G7xCEUK+xG2anw3/CLsN4qn2TdSMhsRa8T4LlobE3Fn7sNDpIdiwsnd
	hOPqy5bQGeuYZRwPpg9D7FrNLS5u+71z1m26CzidP0blh5roMFC/12BY4E1mrnd8iSwN
	t+AByKjBffhiM7dcJiWmNLuddvC6q+HTz8DiwAag+pHZMYyQREgJYLztnoiu+FhXkLsQ
	kHVJJRE5ERC3Yonx6IHzctg4h3ItF+kMwAg/Gb4TWaY/pmVfe/BzNGeiy1Pg1MFrxqaX
	C+V3qG+9wxFMHCus6w8vBFnkfoEhM4ubpIhnbmM7AUe4uKOJ8nzdV0k62b9o1qxotKQ/
	2VXQ==
X-Gm-Message-State: ALoCoQmSEf2pTawmwHUlqmlPpN2nxTw9l5Anp+aDRb3KOkH9hbFwLooxIL635SXxjtWktZZqCwen
X-Received: by 10.52.231.5 with SMTP id tc5mr38124vdc.36.1379322966907; Mon,
	16 Sep 2013 02:16:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Sep 2013 02:15:46 -0700 (PDT)
In-Reply-To: <5236C833.30002@windriver.com>
References: <1379319989-9475-1-git-send-email-ross.burton@intel.com>
	<5236C833.30002@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Sep 2013 10:15:46 +0100
Message-ID: <CAJTo0LYqh0+TY8hgv4NufumF_uu6c_sVSG5=Eyf2b=FNe+FRhA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] transfig-native: remove, nothing depends on it
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
X-List-Received-Date: Mon, 16 Sep 2013 09:16:08 -0000
Content-Type: text/plain; charset=UTF-8

On 16 September 2013 09:58, Robert Yang <liezhi.yang@windriver.com> wrote:
> Is there a specify reason that we need to remove it ? transfig
> provides fig2dev which is used for building the documentation,
> for example, gstreamer and libtheora may use fig2dev.

Considering nothing depends on it, clearly not in stock oe-core.
Presumably you have some patches to enable the documentation builds
and add the missing dependencies?

Ross

