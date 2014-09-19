Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 38EB1714CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 14:14:41 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id f51so2732451qge.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 07:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hzJ1ol3oG6gAN6lidt7mnX3egJrJbagcoO+655kHm5g=;
	b=ioVocJ5DTDv/OSnuiANa2yd0f33f0Gtf7A35R0exy6UvPLTkBHpyE+wgLla8xe09MN
	k++4xM2m1FNulF/qoyxkz74b2JILreyLRovxdikIJnxoVvmqLcJZYjDgSiiDa0ZteBzl
	jgevmuPReRgGMNr3pfREdARVtwVCGLnnaVToHjT9y24Wk4jNLa1SR8EP2htItvkBkNc8
	s7mbk11nho2fVAG3ddoh1VBVrTzqv2XFiY7mG+PJxFsGaBJT8qwWxulAukmknar4N09/
	eCYqPvZEkd3WDO/957ifFP+eK1kAhavRVE0hOqn+SsFcF69DEV3gkBu5xs32iffBZR7r
	yadQ==
X-Gm-Message-State: ALoCoQmVQRWhZzEDXdvrtgHD9NHvPzq/oP1asiaznCWZM81fpce9s6ajTihLZlarop/jHfP9ci4b
X-Received: by 10.224.79.139 with SMTP id p11mr728689qak.93.1411136083012;
	Fri, 19 Sep 2014 07:14:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 19 Sep 2014 07:14:22 -0700 (PDT)
In-Reply-To: <541C389C.90202@windriver.com>
References: <CAKuL1XT+=AYT_LVveVWOO2qqoiLwCbi6fP0j_b+xq3aMN7jdSQ@mail.gmail.com>
	<CAJTo0LZZQMBBKRcxpfbOMC2KUWw5ffp=RdBOyymi-wfaq2UL3g@mail.gmail.com>
	<541C389C.90202@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Sep 2014 15:14:22 +0100
Message-ID: <CAJTo0LaGKTk=ubSRrv5wsW2eN9qxMOQsB2sKXuRXJUBujym=-g@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	harsh jain <harshjain32@gmail.com>
Subject: Re: Recipe file of Python 2.7.4 of later version
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
X-List-Received-Date: Fri, 19 Sep 2014 14:14:45 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2014 15:07, Randy MacLeod <randy.macleod@windriver.com> wrote:
> Also Kai (CCed) is going to maintain an aarch64 branch on:
>   http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-contrib
> Kai, let us know when your branch is available; hopefully that
> will be early next week.
>
> This branch will be continually rebased on master over the next
> month or so and then merged to master after 1.7 is branched.
> Patches welcome. They should be submitted here on the oe-core
> list with an aarch64 tag in the subject line and CCing Kai please.

Great news, thanks Randy and Kai.

(did you mean poky-contrib instead of linux-yocto-contrib?)

Ross

