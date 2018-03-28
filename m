Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id BA46E7198F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 15:24:04 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id h8-v6so3061714oti.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 08:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zAAowZ0vCrjLJxRqFeT2yhQGm5TQPI+dKqyltKj07DU=;
	b=oWXhztxnZS2lwScR+zar+bkR89cYd5DNryaSlA0uTNd9QSV/J8gWWHwlW+sdp4WMCA
	n0rgrB8i9E5kMp00nbmzBO4suSDRkihvPeV4vD74eUeE0+w2UknJqBcUbp0V7rLFFGlt
	B7WDifd+/zO0X33KgyaX4dvQ+gVwN2KuUpwE9hGUKQt+x5r7i8FBon3xqpp6V5hSVory
	nT+Feq8Ba7UmjE3p3sNB+oXzvxyq9OjBJSQyGT8T0/+NTDQ6kNQQdK7/s5LDQNtydw1V
	VmtKIRiowhSduK7Eijns+ZbaRWXQS785J+GAcWLTyPzUL9UuYJuzxVuE4sVtMXpdfshx
	mT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zAAowZ0vCrjLJxRqFeT2yhQGm5TQPI+dKqyltKj07DU=;
	b=OHbtI7/qpQ2EcEwwte8GU+SBjmCAyurCZ7rH5eNzQ25b//QYP+9fAAV0aIO7rcgiUL
	EdmV1FASG7GrXN2QBSEKS78y3V326qtG/7sdChalsdUZH1d43jSOOsD55BtPgmW7SCeB
	jgv9leZXbsQT9NpL+q7m7uX5x1JgyMC5IyvBpEnAkjELebv/eMGUTe1dmtr5FYCRESZn
	D8nFz0glFwaEqj3RVlIHIbzJrC5u/FBZAzs5UxziNeN9+3m+o1zwxc7FXnsl12OqUre5
	Y4jIcmY1lJxy6P2ncEG1y5Euu2mvSsNUtmmYo6hWLTxNhmsfBFmtBIdKeFMTJX3UHz18
	eYoQ==
X-Gm-Message-State: AElRT7GYR/7drwMPXlpA7w2dOVwjLUKlebA+qsuQwzsk20MTA9N91EzV
	bII1LK+VNwtJikpIUhNIXwvzQ+dKgtwyrQf1BEWxIw==
X-Google-Smtp-Source: AIpwx49fAvtWtN8Cut0pFbvIy9TPz3mfigtcIpkJIY5XpRdkOEMkxMy2dDrGsG9WE3FYGh+Og4xyiiKlAgbSatUuN+M=
X-Received: by 2002:a9d:281b:: with SMTP id
	m27-v6mr2407172otb.89.1522250645783; 
	Wed, 28 Mar 2018 08:24:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Wed, 28 Mar 2018 08:23:44 -0700 (PDT)
In-Reply-To: <3689ac97-558e-0d2a-5a91-4b25f9feb622@lucaceresoli.net>
References: <20180129174724.26768-1-niko.mauno@vaisala.com>
	<3689ac97-558e-0d2a-5a91-4b25f9feb622@lucaceresoli.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Mar 2018 16:23:44 +0100
Message-ID: <CAJTo0Lau2TQ0hyLjr3ts2gOM4BE4EnDyZF=a5nT438d9M7YdNA@mail.gmail.com>
To: Luca Ceresoli <luca@lucaceresoli.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Add comm to HOSTTOOLS
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
X-List-Received-Date: Wed, 28 Mar 2018 15:24:04 -0000
Content-Type: text/plain; charset="UTF-8"

Please backport the patch to rocko and submit it to the list.

Ross

On 28 March 2018 at 15:55, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Hi,
>
> On 29/01/2018 18:47, Niko Mauno wrote:
>> This mitigates following issues during u-boot do_compile() step --
>> otherwise, if comm is not available, they are quietly ignored:
>>
>>   .../scripts/check-config.sh: line 33: comm: command not found
>>   .../scripts/check-config.sh: line 39: comm: command not found
>
> In current U-Boot master (since [0]), the absence of 'comm' is not
> silently ignored but rather causes a build failure.
>
> Thus I think this patch should be cherry-picked on the stable yocto
> branches. Otherwise people using a post-2018.3 U-Boot will see their
> builds fail and will have to find out on their own how to fix it.
>
> [0]
> http://git.denx.de/?p=u-boot.git;a=commit;h=f69dce5081396a83b87d6df2693764b99466a18d
>
> --
> Luca
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

