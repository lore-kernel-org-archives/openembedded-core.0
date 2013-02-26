Received: from mail-ve0-f169.google.com ([209.85.128.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAImx-0004Ga-Ka
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 12:33:54 +0100
Received: by mail-ve0-f169.google.com with SMTP id 15so3325766vea.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 03:17:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=TYuDaxWu0hfgl82iHWwoIvYvr5cp25oA0dSa+jzfHHk=;
	b=FpibFgZGW8Godl4FWZr+SaCVc8yoaL/OcLOzovbuqgsnNpvGQ77kkQZBdAFY4/MaF/
	OvxKtanFb2ONzc+UKN+yrZ3I+K/8IWhPpjpLpQXx9L/q7IroTADyoAezyGJPzJdxUWtv
	8ji37roVBoJeCp6gzllAemEFwovbeeWyd9+RRGIi1li7UkGLOYDC4iHWrLv69xcTOBLe
	ths5Au6mLODPfYDPzKKBo/ylnzCPQBsyRbJ20iOQ+/4NJmGdIs/466Tw4YMpFQdnWhFJ
	A//gBBJc0Jq6cGdWzoDW6as6YbLHNZIdAyRWKUIvo1vc2F/IawZVloFlDij3Q10W/H+a
	KWgQ==
X-Received: by 10.58.155.99 with SMTP id vv3mr11471934veb.50.1361877440299;
	Tue, 26 Feb 2013 03:17:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Tue, 26 Feb 2013 03:17:00 -0800 (PST)
In-Reply-To: <20130225191033.GA3239@jama>
References: <1358782794-16860-1-git-send-email-ross.burton@intel.com>
	<20130225191033.GA3239@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Feb 2013 11:17:00 +0000
Message-ID: <CAJTo0LbSQ1SbuZ+4oyTNPDknrGjTmjm+66qEPpjH11YWJ=DuLQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQkgOHtfvksyz9Wr6K3WYxw5KNaGX6yBYOfBtqHUivGejikHplss8SQsWW6zEFdNobMsFxq7
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] site: add x86-32/64 alignment values for at-spi2-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 11:33:54 -0000
Content-Type: text/plain; charset=UTF-8

On 25 February 2013 19:10, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Jan 21, 2013 at 03:39:54PM +0000, Ross Burton wrote:
>> This package isn't yet in oe-core, but GTK+ 3.6 depends on it so will be here at
>> some point.
>
> Anyone working on updating at least arm site? This still blocks
> at-spi2-core merge to meta-oe.

FWIW, I'm planning on proposing GTK+ 3.6 to oe-core shortly so we can
enable Wayland, so these will end up in oe-core.  We'll *really* need
values for arm then ;)

Ross


