Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 690DA6D89C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 17:49:33 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id lh4so3853887vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 09:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FNvwY5c/C1082/qyh7DGAmozjaUKlG+S9YpMVYOH1I8=;
	b=ewDYIWdxqnD4kX5Xw2p6g4cM0bxIZQ98OSkmtlDaWke77PfSSCfO9OZInbof7OSnJA
	qVrXy2ExsYXrtrDlebE/zvpkGurIapUKlCKTZYsQkf6ydL/KnAytCiCBG4TNoDZY3fkz
	dXpKhQD+oEVN4ChrHiSJEFoFvH/c0oUyWTJkwcdQe3rN+VqofxfiTzTT8piC0Sc1OPAQ
	ZKrrvHYvtH1eEJlSAtpTKwXyed/DidzeS/Jk6IA1qsI1g7xc3Y53bvdOHRgvGa2K313v
	hGjH7O6SjLG8LG6Ndi3+eqTTgrNmM+wgSORUWO/odKV1YAFm0qij0DO3mTl8zYY38AB6
	aH7w==
X-Gm-Message-State: ALoCoQnapXAPimDkaemy/SG3AwJs1JRr84tB7lN/CJL78n73X1LV3mKUTwUA1xeh57lKSQrOJVL3
X-Received: by 10.220.164.202 with SMTP id f10mr2271736vcy.25.1384796974777;
	Mon, 18 Nov 2013 09:49:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 18 Nov 2013 09:49:14 -0800 (PST)
In-Reply-To: <528A5182.2080601@mlbassoc.com>
References: <1384796370-8899-1-git-send-email-ross.burton@intel.com>
	<528A5182.2080601@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Nov 2013 17:49:14 +0000
Message-ID: <CAJTo0LbugHFzpFCCBgj5EJbtBFxkc9ckt-mEaJ+sbnxd8kFu_g@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] combo-tool: simply branch/commit validation logic
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
X-List-Received-Date: Mon, 18 Nov 2013 17:49:34 -0000
Content-Type: text/plain; charset=UTF-8

On 18 November 2013 17:42, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2013-11-18 10:39, Ross Burton wrote:
>>
>> Simply the branch/revision logic by using git-merge-base.
>
> Did you mean 'simplify'?

Yes. :)

Ross

