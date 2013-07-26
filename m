Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id 27FC86AE6E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 15:43:33 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id f12so1321058vbg.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 08:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=HIKo8h4Q3K0nZkqy7cIJl+1IWTEa5KyLiIB8ZnTNQ08=;
	b=NbdJn3axWwBeGP7mNsoqJ5S+5om8eX6f72Yvn1SImAzoiOOJD9ajrFGZJb5T5U6Rah
	8NUyVqynnQShvNWpNCvcIL9wMCbTU8LK9yp1qucvriyAkqwW8HlTwVYSL/x68mmrLg1h
	xHnkAe/x2UEBbc5fxfT2dJ6+DK0zEyL1WLoZ7nSMY4hCG3ElsDXWJ870OUomRzx1mvBg
	y098Bwox/j6o+9oV8Ue0hFCyhm2DO8UdU1/qELbwsee7HwFbIs5/9/d4Q5iOCQA1G8Fl
	CHhJNWfq6O0flHmbdsWhsWC4CReRn1tr+bgzBn2Qdzf+krh2ZAxfY9NFjUcsTsjyY0k8
	Z6GA==
X-Received: by 10.58.76.130 with SMTP id k2mr20490244vew.24.1374853413679;
	Fri, 26 Jul 2013 08:43:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Fri, 26 Jul 2013 08:43:12 -0700 (PDT)
In-Reply-To: <1374842117-24504-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1374842117-24504-1-git-send-email-jukka.rissanen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jul 2013 16:43:12 +0100
Message-ID: <CAJTo0La=jviu71MdU_1FTtHOyS-p4M5DMsWZ10Ni2v5jqZqs1w@mail.gmail.com>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
X-Gm-Message-State: ALoCoQlPmGzsh3NlpXDA5e5FmFoApdHyVPFlZSUV+HcNzmculzIKjQB35MP2mjRFEF/R+8Ky7cuQ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] ofono fixes
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
X-List-Received-Date: Fri, 26 Jul 2013 15:43:33 -0000
Content-Type: text/plain; charset=UTF-8

On 26 July 2013 13:35, Jukka Rissanen <jukka.rissanen@linux.intel.com> wrote:
> Patch 1 enables systemd support which was missing from the ofono
> recipe.
>
> Patch 2 moves bluetooth enabling from .bb file into ofono.inc so
> it needs to be done in only one place.
>
> Patch 3 enables test scripts which are very useful for getting
> cellular contexts up and running.

All looks good, thanks Jukka.

Acked-By: Ross Burton <ross.burton@intel.com>

Ross

