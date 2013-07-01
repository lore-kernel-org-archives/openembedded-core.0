Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0086A5AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 14:51:45 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id i3so3676568vbh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 07:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=KNpea2xtWICqE3LIT45AlguoQC63yp25evtsVr6gV88=;
	b=GlOI56Bmrbe/AqLA8rizxbievR/uOr3VTHJNoWF1WnFwcXKohOWmFoyXgIACtQWsrF
	cXTFBnAvQsiq2iUZBAV+DuYZhtgIHd17PNqFhnNkle/6wotqoxKMO4rnndjEFj3JT6cd
	bw7LpUlusKfE8qlrkGnZu243rJ3OKDQsyiG2ggKCWTbplombFHZVBF4cmeP91IFrIdO2
	Z0lwdpA5fZ+5KP8u6GW2RAhuwASYnYB5jeS8fZDq51v0kRPAT34fbUGCDQ0BRPljLavW
	/LgB7jSAXrD8PxTMQQ48S5c2nY3mxykehV+9PoSqjg0dEG9aHGbz99FjGLcyput/bTyb
	bPhg==
X-Received: by 10.58.219.232 with SMTP id pr8mr9735991vec.80.1372690306659;
	Mon, 01 Jul 2013 07:51:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 1 Jul 2013 07:51:26 -0700 (PDT)
In-Reply-To: <2ee8976b4ad482eafb186deba9a14fc52f6dc8cf.1372674367.git.mihai.prica@intel.com>
References: <cover.1372674367.git.mihai.prica@intel.com>
	<2ee8976b4ad482eafb186deba9a14fc52f6dc8cf.1372674367.git.mihai.prica@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Jul 2013 15:51:26 +0100
Message-ID: <CAJTo0LbWDHqUoaks86RrGMSnKyN+fw-cxShpFpr=DT-sOGbvxQ@mail.gmail.com>
To: Mihai Prica <mihai.prica@intel.com>
X-Gm-Message-State: ALoCoQmiv8emht9mp/09sRuu38rcmkP1HyC1olvEQaP9BHvUL1POHwWeK4Z5lDh4byoO6VoJbF7/
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] insane.bbclass: Added QA warning for shipping /usr/share/info/dir
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
X-List-Received-Date: Mon, 01 Jul 2013 14:51:45 -0000
Content-Type: text/plain; charset=UTF-8

On 1 July 2013 11:31, Mihai Prica <mihai.prica@intel.com> wrote:
> /usr/share/info/dir should be generated at install time in a postinst.
> Added QA warning to check at build time for this file. The warning
> is disabled by default.

Patch is good but why don't we enable this by default?

Ross

