Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1A577BD2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:33:03 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id t139so3663748wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eqHmoxF40XYl7STfILgZce2LpknSyejtOF5INgLORB4=;
	b=alG5MRYdmi5+Ir2XdFoIgPyZxAUhGfdRZ+HcRysVKixSrHIy59s5hbyOB+uBFExjTi
	pokWQrf09pSgL2SnuglpOz/NNczgkmuqDwXVWyUuKiTrkMkNEVtvnjRUsFHQ6t7HaBxs
	p6nK1q6TjEle1hSiBcQFp9KWhIG9OZAP4oMvIfT8rNMJXr3yzZWNAnFOf+b1zVuwHynn
	dL51gcTL8Tvn8VbMgu0OtplAoKt+v0jUuKhlLtPb3xIyjcJoRJev2qo/wvsf+CR25fJp
	fKjODmFEUE2kLBhjqgDThHaT6twHUbn83rXS9waudtgqbV9p96xl9dtP+OcDj8dNSK1A
	vTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eqHmoxF40XYl7STfILgZce2LpknSyejtOF5INgLORB4=;
	b=A/a0/o57hnTyobsY0jJBSmQn0lXYUiVOj4CB23/wnOid6AuuPNv7AKAllSbYPndDHl
	I9pN16JrtAi6ePaNcqNPS+3LqPMvZfVDxsB+ZfxGVWRtz/7Hkf/HekG2gwvudNH3kImT
	atv5guo/5enSpKKf69Ac6tN9fItEDu+3EPYZ/3Js0ejtKVN5PI3MO/5KX/1/cK7xNOJF
	fb0lbyKoVkTtsV2+Gsm2bmp8gNij51NSyRGQ9kKtVXGFTppp+hwoixcGdLN60GpCpFnu
	IlXsqVXe5BbSEOysR2yfzyt3razmLNIyMPVwjpwePIqcvi6V8bRrYsIKUhNn3qD8sQ5Z
	EQVw==
X-Gm-Message-State: AJaThX7i84khYvfwyinVeCW1pc4dVchRboUkEFzvh0LVIWCe02T0lW1i
	bTY4/vPCrn9MrNI45zD0pB5xkEoMrVdHcV/Om+w=
X-Google-Smtp-Source: ABhQp+SJb+E+hlX/EJ/iyQK+YePO5mC2qTP40Tybn1SfrMdWe3jxIx920KyWXh2PQx4iyRjX8wjkSH+TSYLdlMiu1U4=
X-Received: by 10.28.19.73 with SMTP id 70mr20564wmt.87.1509737585001; Fri, 03
	Nov 2017 12:33:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Fri, 3 Nov 2017 12:33:04 -0700 (PDT)
In-Reply-To: <1ce560f5-8efb-1058-7c51-ece82f8d16e4@linux.intel.com>
References: <1509440578-173066-1-git-send-email-zhixiong.chi@windriver.com>
	<4903a7b3-5039-9b7c-9372-37f10d555b9c@linux.intel.com>
	<59F846E4.3050003@windriver.com>
	<CAJ86T=UnT5woKyTFC82_O0kycoqPufavbOvduRXy4_9F0hWS4Q@mail.gmail.com>
	<1ce560f5-8efb-1058-7c51-ece82f8d16e4@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 3 Nov 2017 12:33:04 -0700
Message-ID: <CAJ86T=VDtYf0mQkZeVhuXsW7P7tfN3AmZ6JbJqCXmD+OkHWpQg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: CVE-2017-13089 and CVE-2017-13090
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
X-List-Received-Date: Fri, 03 Nov 2017 19:33:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 3, 2017 at 2:03 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/02/2017 10:29 PM, Andre McCurdy wrote:
>>>>
>>>> Update the master to 1.19.2 instead please.
>>
>> Patching 1.19.1 does have the advantage of creating a commit which can
>> easily be cherry-picked into rocko (and pyro, which also uses wget
>> 1.19.1).
>
> Yes, but this is coincidental. If the versions wouldn't exactly match,
> cherry-picking would not be possible.

Of course. But in cases where the same fix can be shared between
master and stable branches I think it makes sense to try to do so (or
at least not actively block doing so).

>> Master should certainly update to 1.19.2 but doing so in two steps
>> might be appreciated by the stable branch maintainers.
>
> When fixing CVEs, the yocto branches should be considered separately, and
> patched all at the same time by the same person.

Difficult in practice since we don't have a security team etc who can
bypass the normal flow of patches into the stable branches. It also
places an extra burden on anyone proposing updates for master that
happen to fix CVEs if they need to simultaneously create fixes for
stable branches too.

> For master, updating to
> latest upstream release without the vulnerability is the best, as it lessens
> the load on people who have to keep master up to date.

Agreed. Question is just whether (in special cases such as this one)
to make the update in master as a single commit or in two.

> For stable branches,
> it depends. If the upstream maintains a stable branch themselves where cves
> and other bugs are fixed, I think we should trust that rather than backport
> patches.

This is a more general topic. Although version updates in stable
branches is not something we do now, personally I think it's something
we should at least consider. Sometimes it makes more sense to trust
upstream than to cook up our own solutions. For anyone using OE to
actually ship a product, it's far easier to do security audits etc by
checking package versions than reviewing a long list of patches. The
counter argument though is that we just don't have resources to make
case by case decisions and a blanket policy of never updating versions
in stable branches keeps thing simple for the stable branch
maintainers.

