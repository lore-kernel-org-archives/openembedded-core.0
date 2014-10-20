Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id A35A6601F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 14:30:27 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id q108so3593745qgd.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 07:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KfaqOtyXrf4hj8fPRFfaFpUxgkAbXFgAlv+YGKwSGpU=;
	b=AgvrAEohOrAmIsTvxtzu0vHR+bzYFx6k8nM2Vd9iwvIMhVhAgnTeXkJRpGSU5Z8VzG
	ObWvOwFsJqE7IMri3+ElQ7kNV3o6KrV8GURGNCx5NcNoXbkL/L/NvWPK1fZq89Tmoozo
	18vk/zBSspbND0u9vajfHIXMwuyiA+xPr/7RBh5e/Kun5clndVAc9i+psM3EGa8EPLR6
	3JB7upkxihFwDz3m0FKZWG4pF51pPj1gr/ECTGUxlSFenCbY+OZ0eNXPW2xLvTrrZdd/
	7+Nfa+oJFA6GsP94KHSnX6DTRp++/acWN1Yq8jCJ25Qj8RlH5oFevLtc5rWUAVek36jA
	vP8Q==
X-Gm-Message-State: ALoCoQkHcxlwzrKc9zdyiZMiRlckHmG5R8JF1+kqgvxbP0f7OudyOpnRqMA1a/Z3H2o3l6owue5u
X-Received: by 10.140.17.67 with SMTP id 61mr34064561qgc.59.1413815424885;
	Mon, 20 Oct 2014 07:30:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Mon, 20 Oct 2014 07:30:04 -0700 (PDT)
In-Reply-To: <1413554888-31319-1-git-send-email-drew_moseley@mentor.com>
References: <1413554888-31319-1-git-send-email-drew_moseley@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Oct 2014 15:30:04 +0100
Message-ID: <CAJTo0LZ_AHXgUwSUZp5_k-NcmEzOAcN9e-p=gPzsELsfE+LHag@mail.gmail.com>
To: Drew Moseley <drew_moseley@mentor.com>
Cc: arindam.nath@amd.com, Ravikiran_Polepalli@mentor.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] poky: daisy: grub: add cmdpath to grub configuration file
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
X-List-Received-Date: Mon, 20 Oct 2014 14:30:31 -0000
Content-Type: text/plain; charset=UTF-8

On 17 October 2014 15:08, Drew Moseley <drew_moseley@mentor.com> wrote:
> An issue was found where when yocto is installed to a hard disk
> from a live USB key, no matter what boot order was selected in
> the BIOS menu, the grub menu of the USB key would always show
> up. The issue was narrowed down to the way grub configuration
> file gets embedded into the standalone bootx64.efi image.
>
> The commit prepends ($cmdpath) to the search path for grub.cfg,
> thus making sure the UEFI environment itself sets this to the
> correct device path. This in-turn lets the grub.cfg of the boot
> device to be loaded.

Presumably this needs to go to master too?

Ross

