Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0A0B170F28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:23:43 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id q108so3952330qgd.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 07:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yFhuItUjukGu0ZASjkhrvf5foU8ZaIr7y+zYFLimH1Q=;
	b=DxvLGt3GijM1iUa398nNosmigxNasu66+TEDP3lDwqeQIDnCICgOm9QuCwLzLAQgN8
	s8Q6PKndX13zmlnlwGVLma6VZWjNSZHs1/aqxt9oFhwzO0rk9p9kzAbqG14FY9BVqJnR
	2fWqdyOs/f5joWBEFxDiPUZYLClEuNP5wRfkP7Sbz91rTy3W3taVMkTIrkCv/M047UGN
	A7uo7iOEc5KWIV0kT7LVXzmhTjKgEvGxPStFLLIaQShVZsePloUWiC04c5ES6ICsSflP
	DS2sNN3a0S+fakB2ASXvc98IMyXyFkiBzRVATQu19ED4huFXtmM0tZXQ0TB3/kUlKagC
	LLPQ==
X-Gm-Message-State: ALoCoQnWi7m9zfGViXCLRLqWGVme6K3BPWPpjDYgzMyjGZgO+TpHud/DEPu1nB4yk1jBRZkfVcjO
X-Received: by 10.140.97.247 with SMTP id m110mr37227423qge.80.1410791025210; 
	Mon, 15 Sep 2014 07:23:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 15 Sep 2014 07:23:25 -0700 (PDT)
In-Reply-To: <1410776160-23885-1-git-send-email-jackie.huang@windriver.com>
References: <1410776160-23885-1-git-send-email-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Sep 2014 15:23:25 +0100
Message-ID: <CAJTo0La5gLNDcuwj3TawqphFg2N-a74=nDH_DL7u-crY09KPSw@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcrypt: Fix ARM assembly when building __PIC__
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
X-List-Received-Date: Mon, 15 Sep 2014 14:23:52 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 11:16,  <jackie.huang@windriver.com> wrote:
> +++ b/meta/recipes-support/libgcrypt/files/libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch

This is missing upstream-status/signed-off-by tags.

Also, Andrea said:
> Instead of patching 1.6.1, wouldn't it be better to update to libgcrypt_1.6.2 ?

No, we've feature frozen now, so a backport is appropriate.

Ross

