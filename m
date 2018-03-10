Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 38831788F0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 02:55:48 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id a63so7097989wrc.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 18:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jc+kE1tZ3P3W82K5zmHCSwHQ345LpU40tw9q3ZQeNd8=;
	b=GmNgpmSNvOhtt4K97Qjy0apzz845Qh70E4fLOYYtR8Us8rdjctg4VMHkNbaL5uZm2s
	R0v868d/5vQzVtehntGfAvMbE6c2IK2EwmHuOPjtlkpwemSPowQzZ7jIRocqdNHWMvfw
	3fXuFJg4esv/q2homBEAEPuFONI3xYy3R2IVkqGaiptDZIsQYbPAQQ8Uj0MzDV8cx3vF
	QifWAUOHFnLo1W3zEL3vSIT9pVm0HxolJpHzbG6zcMvV2dtLbX6IhYa2ZjGCXKfErZDD
	NjNLjPLxH+b4LGb9dRb445borfe6LWcc54jTSxcIBJ1Zw2EwOoQjB2ZzvN6EVU++4jDe
	xVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jc+kE1tZ3P3W82K5zmHCSwHQ345LpU40tw9q3ZQeNd8=;
	b=EKvyS+fURRj+miFMmy3nXdkVIfFKGS+PlOpSp8rfHY5EYufWfvwPxZdFn7JQnNJi7e
	EKmJsKlB3yfkO5mgfjvw26TZrk2FrVjM0pKZBxEk8JcAwILIYHMWullcC6GuxPfaAX8T
	Dc+clpY//q9vp1hc8NgLhrrnc72/2IA/ErKlG7CdsDf+dodGgj+7I7DuUH/63/YJE0Ti
	x+6PG7YGN/Ju3YowMc6KqYCVuczLN4OcdRBRRioxmqgufHjdees/ER+pyt9/MGE16VDg
	lpX/2I1R5LxtKLOC7R02wqryG28R/5ex6TspeclIfEuLF6bnuBgHmMXOPT92MdEhji0r
	UTbw==
X-Gm-Message-State: AElRT7EnJr3q1cFSo7YhyaEngVSn6qtJzGFAV/ck9NCCjfL1OD8ktKQA
	UEnJay1C11Vk53k/RjGYDbQw+kB7x0S+VFUUJzE=
X-Google-Smtp-Source: AG47ELvuNGfmqBz1OuptSC1a6dpQ5uwmKQZJluCSJd6Y2Ds+0h1CmmZZe/BFsaaLv1UnPdF5PRP7l+P3zVGIbzkJNDE=
X-Received: by 10.223.161.10 with SMTP id o10mr489528wro.60.1520650549840;
	Fri, 09 Mar 2018 18:55:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.65 with HTTP; Fri, 9 Mar 2018 18:55:49 -0800 (PST)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B64C66B28D@ORSMSX112.amr.corp.intel.com>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1sqVAhoAK-Op+fg+kkA2HvH3h_acvEN=qckH3A5-tJEF8A@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B64C66B28D@ORSMSX112.amr.corp.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 9 Mar 2018 18:55:49 -0800
Message-ID: <CAJ86T=VUgB7mWM7mrSGpHPipWy5v6bir3Puz6Wz2C7QAD2cJ3g@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2] gcc6.4 upgrade
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
X-List-Received-Date: Sat, 10 Mar 2018 02:55:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 9, 2018 at 6:25 PM, Bystricky, Juro
<juro.bystricky@intel.com> wrote:
> This was morty upgrade, which did not have those patches to begin with, I did not remove them.  The patches were not in rocko either, in the end I got them from master  (gcc6.4 was eventually removed completely),
> Backporting of ARM specific patches was not the objective. ( I was not aware that 6.4 had an ARM specific regression which broke the pi3 builds).
> Long story short, all patches should be there now, please review them, see the commit message for more details.
> I'll make sure all other gcc6 upgrades contain the ARM patches as well.

Comparing my morty branch (with update to gcc 6.4 by backporting
incremental gcc updates from master) and today's morty-next (which
updates gcc 6.2 -> 6.4 with a single commit) the only differences are:

 - My branch lacks all the new x86 specific patches (OK, since they
are appearing here first)

 - Today's morty-next is lacking one patch, which was added to oe-core
master as a backport (from gcc master) to gcc 6.3:

  http://git.openembedded.org/openembedded-core/commit/?id=d2631f45a057c53797b7ba657662f35f66a2b04e

I don't have any strong opinions on the patch, but presumably it fixed
some issue Khem was seeing, it still applies cleanly to gcc 6.4 and we
have it in rocko so on balance I'd say it should probably be in morty
too.

Overall this looks great though and I'm very happy to see gcc updates
landing in the release branches. Thanks Juro!

