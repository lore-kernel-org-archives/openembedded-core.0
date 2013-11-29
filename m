Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mail.openembedded.org (Postfix) with ESMTP id 68E646A596
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 12:05:10 +0000 (UTC)
Received: by mail-vb0-f46.google.com with SMTP id i12so6524943vbh.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 04:05:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=J/U2pYnmJecatfu286XQ30ZH00RWc5zkmbB5+6pGdAs=;
	b=dqMoke2p8iB49Xo6CSFZ7B/7nr/30OLbXxfZ7UrpwyKn9M4NEKv7ZapEc6YfCYagMF
	N/YNWg+5ICQPX0MUs+AJZE4iQMb97Skp0waBjnRSCA2w7wx0eOcD57aLDPfjMIxVw6jI
	0C367dlWurJGjPaxh4mMTW5SCvpw5VvibjLyraoagGhkevuFM0fcurmXMrIKn5SaDA6h
	w8VbwFAGQTQjSMRpV65o4zJXm+PaOKZmAWKzzJDTrX/EyAm0MZnyAZJeeI2M2NiWzAfr
	6QXsNuFEdXjEKlk/yiwS3wpX24wrYd1oiTkusLHe5PTAVbz43WTiGDEzrr6oL8jMeb4z
	ooBg==
X-Gm-Message-State: ALoCoQlKSU20aIlj+Ps1jW6v4+oCVTV9KL7q6NOWTim8LIo4JzUIThfeLxNZ/mqZx2N0FHinRKYX
X-Received: by 10.52.28.6 with SMTP id x6mr985328vdg.3.1385726709132; Fri, 29
	Nov 2013 04:05:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 29 Nov 2013 04:04:49 -0800 (PST)
In-Reply-To: <b47acc0003f5c8d6e963da9edcf910951bcbe7be.1385725803.git.Qi.Chen@windriver.com>
References: <cover.1385725803.git.Qi.Chen@windriver.com>
	<b47acc0003f5c8d6e963da9edcf910951bcbe7be.1385725803.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Nov 2013 12:04:49 +0000
Message-ID: <CAJTo0Lbcs4d8q+ujMAsaais9vDjJ9iSh=1B_fyf7_tpHLV8xjw@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: add busybox_git.bb recipe
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
X-List-Received-Date: Fri, 29 Nov 2013 12:05:10 -0000
Content-Type: text/plain; charset=UTF-8

On 29 November 2013 11:56,  <Qi.Chen@windriver.com> wrote:
> +PREFERRED_VERSION_busybox ?= "1.21.1"

A better long-term solution is to set DEFAULT_PREFERENCE="-1" in the
git recipe itself.

Ross

