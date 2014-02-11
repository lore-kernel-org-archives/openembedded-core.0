Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6BC6E91E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 20:38:01 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id ii20so12307313qab.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 12:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1GFJtn611cQx3fCSrDQ2JAK8LVBREyoKLGe8oNwndBU=;
	b=GMPyo/ZRyKiwZNlZ8AwxCvedq/PRvX8rwwFqImCy6YcUnvJNLyjBkA7DHvXR79QGa+
	UmNFcmcG2ZLU/mx+dvELCw0h7ESJqYqRiYwZpoiz4wJYtftr8mGRCC2PMtYATJK2Rs91
	8YX7CG4rsR5iRwWdaf0xJB1Dnwtim/chbSrmL1TUrsXlN8wuVCTwTg50m+bIAvziXSHq
	CKUwSfFfERMRkyWaCdCPeKM4SPsAmpcfp+aY6/mXqUbshdUKtKnXTerKkE9tgBAKmWSF
	HQaLJvU8tiQdF5lzODqQtOvPTsgP3GQY91GcXl/NGYS0y1XnYipErSIn8nHP+WoF3X2S
	KLGQ==
X-Gm-Message-State: ALoCoQnzSmm7gtjlqFfMMFmbL9ZOmRsalBvN/W3KAUusNgs0NSOcdz825QqctmeHmmglK40Uy+bU
X-Received: by 10.140.106.225 with SMTP id e88mr57091884qgf.66.1392151081364; 
	Tue, 11 Feb 2014 12:38:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Tue, 11 Feb 2014 12:37:40 -0800 (PST)
In-Reply-To: <20140211201014.GB3776@jama>
References: <1392142093-9057-1-git-send-email-valentin.popa@intel.com>
	<20140211201014.GB3776@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Feb 2014 20:37:40 +0000
Message-ID: <CAJTo0LaDUDtXbM2SH7cx60RONutwDHWxdWPwNYUU3owKGYxAEQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade to 9.2.5
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
X-List-Received-Date: Tue, 11 Feb 2014 20:38:02 -0000
Content-Type: text/plain; charset=UTF-8

On 11 February 2014 20:10, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Feb 11, 2014 at 08:08:13PM +0200, Valentin Popa wrote:
>> tested on qemux86, genericx86 for core-image-sato
>> and core-image-weston.
>
> Does it resolve
> http://lists.openembedded.org/pipermail/openembedded-core/2014-January/088727.html
> ?

That was certainly the intention of the sed.  Not convinced it should
happen there though as that will mean if you change DISTRO_FEATURES
the old value will remain in the file.

Valentin, can you change the sed to happen in do_install_append()?
Ideally we should be considering ${S} to be read-only so that rebuilds
work.

Ross

