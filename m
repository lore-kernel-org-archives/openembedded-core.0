Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id 81EB86B1F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 10:56:50 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id e12so1916049vbg.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 03:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=gWEqjYMaZKAa3tqx/Jl/ZS1rtAeSubzBJBr8JaHIFQQ=;
	b=YEAhoEwocNOsAO/V0xW/Et6K24kpOp505zvfANoNWA56y4dn0N0NUEbEjZgmDCA8sW
	tjACG45WrP7L502nCGlLgMnCHpGi/YAFe8PtmtTId5TfGBgHpYXgcSWsYjDugce1pYEg
	bDY6D6NOK0w883Z1NRwsprX49iSDHz9u9NCoZIhSQ7NMadmvowO7FRphU8cMw7q8rg2f
	9Hv2ap0g0tjpDxU24XEBOcL5+2JecBaOVHWpcFGOSCNh59Z3euBlXIBF5/TxXh9sj9CA
	5niWHcdn8Gvg28Jb8RrBlbHs+EfT3ZFlKa3cU7IOhI8tmxE3BvptGJviViYxzO5KvNAr
	EONQ==
X-Received: by 10.221.27.8 with SMTP id ro8mr276692vcb.46.1375354610844; Thu,
	01 Aug 2013 03:56:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 1 Aug 2013 03:56:30 -0700 (PDT)
In-Reply-To: <CAOMwXhNbDzsi4=mBb+0=iqdxafnAezRsMvJbG1dPetCTMEhJQQ@mail.gmail.com>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
	<CAOMwXhNbDzsi4=mBb+0=iqdxafnAezRsMvJbG1dPetCTMEhJQQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Aug 2013 11:56:30 +0100
Message-ID: <CAJTo0LYPD48S3rjYPfh5HPyeuzxrx=ZiJOguz5doxjd2r3PAXw@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
X-Gm-Message-State: ALoCoQk+HVqE7b6JDg+TTs7a5OWJCKXsSgKZ33VKYKYSAQU9ZdegSUyAorFTeCYWnt57iOMChUZq
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] u-boot: state the MACHINE when skipping u-boot
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
X-List-Received-Date: Thu, 01 Aug 2013 10:56:50 -0000
Content-Type: text/plain; charset=UTF-8

On 1 August 2013 11:50, Laszlo Papp <lpapp@kde.org> wrote:
> Speaking of gerrit terms: I would prefer that you didn't submit this.
>
> I would like it to be more specific. If it cannot be more specific, it
> should provide further information to get more specific information. Note,
> machine configuration can be the command line as well, so this would still
> be vague.

It cannot be more specific without dumping the entire machine
configuration, which won't help because a variable is *not* set.

By "machine configuration can be in the command line" do you mean
MACHINE=foo?  And if so, why does that mean the statement is vague?

Ross

