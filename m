Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6mIy-0003Aw-Jv
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 19:43:54 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 10:31:27 -0700
Received: by obblz20 with SMTP id lz20so1552817obb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 10:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=LnweXxZic83ldU9nK3m7npsD30HQYlPbP+aTUrAvatQ=;
	b=jSptCayQ7SxEa6kAnAc9dQOFiXikV8D6gYBLdozH850WDy5/USgDptn8+UoaTm1+yn
	UdaJ+rLb98B97sw2vXSBPksYWu9/mP2lF/mOeDRgEuFgAfPEYKUQ3oZuHsVGS+Eevr+W
	pwqkkIleS8hJ+2lQlSAg6TGRkyQ4BHrne77mxUW6eNanb89RffKkm9NrEBfEBS7s/2ay
	3gxrTfmOwWYeqR2cZHjPZziTKHAT25ek84EegCz/nDQCMhGJ56N3TinwOV1/jE/lheiU
	SQnGxw2fxGsKyMB7qTGgAaSB73mWag7YjlnseL7Spf7mflXyRk2UO19zWjYpAcyUnNrW
	KSMA==
Received: by 10.60.28.162 with SMTP id c2mr2096424oeh.3.1346261486638; Wed, 29
	Aug 2012 10:31:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 29 Aug 2012 10:31:06 -0700 (PDT)
In-Reply-To: <4976204.OdG2Ohk3KU@helios>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Aug 2012 18:31:06 +0100
Message-ID: <CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQlqUiLEslvxkQ9dNGhzV9+/YrBfuTRE9HS2EkNX3i3fK9u4ZBKUsjQL8qyZOsMCMnshjy7p
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Wed, 29 Aug 2012 17:43:54 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2012 18:01, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> Well, the TSC as a group is still keen on supporting it last time it was
> discussed (a few meetings ago) as Koen mentions.
>
> Surely this specific situation is pretty easy to solve for everyone using a
> postinst which is able to apply some logic - i.e. if the file is on a separate
> filesystem then cp the file, otherwise symlink it.

Sounds like a lot of extra work when the choice is fairly clear.
Either we don't support split file systems and mandate initramfs for
network boots, or we do our best to support it.  With a decision on
that the choice of cp vs ln is obvious.

Ross


