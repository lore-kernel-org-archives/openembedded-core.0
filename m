Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 940CF71B2F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 01:39:27 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id r190so83089553wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 18:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=25oS092b8kO0Tro4PoBIVF0RnkBb9lqYSMvapd9pZPI=;
	b=O3AjkzcksTdTiYXAxD6fehZYluTAZNDYmfEaNeA2giJURt5BzrdEGLwQR2OY7+DO10
	bHL0M/qr4osItTTvgs27De59rDRh0S4mZszByuliRm2ZRKFRkOROv3g+wYycT/8ePQYo
	8eAh9UYfURgu4ztQpaZe02KGNX4Pjn2aDXplxmpirHqjRYU3l63e8tjWSa3zSCChi12t
	K9KPhYMWzWSzWoLaYCFVso6cbvk7NFBgsPgHrdw2uBBKNOX+7bAzCg7/5/Pw5YFqqCIJ
	b1XUwE91Le00tVNWojNaFvEM/ssLIoGTyyhhlICZ4lvlrWajuoE9nVVCRDs2nE3PGclF
	hA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=25oS092b8kO0Tro4PoBIVF0RnkBb9lqYSMvapd9pZPI=;
	b=bdFM0NKbac7XpdS4vwcuUDOLzcjw5hnriY7OnVcFHvN5qHUflduJILhmneHSAZLCkG
	HcjpwOhr5LnD/AfaC9bNVhmEpO7h758ZGhgHnX1lebhBGJ2kSkijtebiYOyQGEyQWdSP
	5i9WeUTNIz5Do941Ngm+j5C/nGHxVsztpyNDP657OOcC5UN2wBi2eWwygH8xTuVaqW2c
	lTPt6rB4hdJg7F0I8sEFYD9ibJDnqKBAkMGzJ15nTEPXzfMk6Kpkp088KToylkkFrLVs
	7WvdpMHfBsUtBx2EgYdWBSweSePjpBy1OaKjDp3OZUifrFdOQs28ZbpPx13qE8bQu0iN
	7xvw==
X-Gm-Message-State: AN3rC/6TX2h8m8lVzkB/gu1RyK9K8AS+svX8BPLMq3YW+6AU7zkCnTq2
	8l8HdIIcCqOWgfaEx/qGRMFl7Md7ww==
X-Received: by 10.80.151.5 with SMTP id c5mr3122991edb.30.1493084368301; Mon,
	24 Apr 2017 18:39:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Mon, 24 Apr 2017 18:38:57 -0700 (PDT)
In-Reply-To: <CAJTo0LYL1QxkdLi6y=DKe7mMoHF8U34ZDzNbUKY1+or1xxrWyw@mail.gmail.com>
References: <20170421210948.2656-1-raj.khem@gmail.com>
	<CAJTo0LYL1QxkdLi6y=DKe7mMoHF8U34ZDzNbUKY1+or1xxrWyw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Apr 2017 18:38:57 -0700
Message-ID: <CAMKF1srYE2zaO3WGxqRExpx10zkyC8Gb+OnQ76TD8zt0Uam7yw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] grub: Fix build with gcc7
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
X-List-Received-Date: Tue, 25 Apr 2017 01:39:28 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 24, 2017 at 3:34 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Clearly there's some build difference between our configurations. Are you
> building grub-git instead of grub_2.00?  Should we delete grub_2.00 if its
> that old?  I'd say that it looks good for a new upstream 2.02 release as
> there is a 2.02-rc2 tagged just six weeks ago, but 2.02-beta1 was tagged
> three years ago...

yes saw that, fedora is already using 2.02-rc2, we will simplify
things if we are ready to take the plunge and be ready to release with
rc2 itself if final
release takes another 3 years.

