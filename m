Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 68DCF7626C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 06:48:23 +0000 (UTC)
Received: by ioii196 with SMTP id i196so165822383ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Sep 2015 23:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8y+fSN/VcWKvxQoOphhl/Zff6MVSaWX1QSEkIKaO0ws=;
	b=n96N8t0OiMMXsb0mt/HtRfP9h08qwzc/TdYPY3VTP9xgNoVWO8bCMj/K6eySV38gTx
	RMZmQHsaQOUUWCmXfd5cAW8aODOZOIiXHSBz3MlC3sMjnmlgSRxYiduK4tJpD7xtmZ5S
	C5ahKMRE1JUaVbZzCFFRFyIA1HZkEwnWwUvcd1xAuQK3W6ZfYNon2zu9b+kGKkzJ7b61
	HpwnmFt7slK5UwBKrky6zEndQrDMge43FhQ2Gztp4Jl425N8X6cjNesr6SUiDkU7CNjE
	krWeDpTVUNQiMRKF28CWxHLUEUTY1wO62rBfYYrbJhgcCnbuAQifgQ9n7UAchm3IquN4
	izfQ==
X-Received: by 10.107.137.106 with SMTP id l103mr16591867iod.112.1443422903782;
	Sun, 27 Sep 2015 23:48:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Sun, 27 Sep 2015 23:47:54 -0700 (PDT)
In-Reply-To: <5608E1BA.2060301@pseudoterminal.org>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
	<1443390491-23728-2-git-send-email-dv@pseudoterminal.org>
	<CAMKF1srHAox4XZntPRCC-jzzZDwHtt46UC+ekahKE8s_YzXBpw@mail.gmail.com>
	<5608E1BA.2060301@pseudoterminal.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Sep 2015 23:47:54 -0700
Message-ID: <CAMKF1soj1rrFxCG1bQz=F7creT2KBd_SQUOQDXiRUSjq6NA7xA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] gstreamer1.0-plugins-base: upgrade to version 1.6.0
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
X-List-Received-Date: Mon, 28 Sep 2015 06:48:25 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 27, 2015 at 11:44 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> The other patches in the list above, however, need to be reworked to apply
> against 1.6.
> 0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch has been
> rejected by upstream,
> handle-audio-video-decoder-error.patch is under discussion.
> taglist-not-send-to-down-stream-if-all-the-frame-cor.patch hasn't been
> looked at yet by upstream.
>
> Since these no longer apply cleanly against 1.6.0, we anyway have no option
> but to delete them and wait until the authors reworked them.

hmmm, I would have preferred a conclusive situation where we know
exactly what they fixed and what we dont have when we drop them
somewhere in commit message, ideally they should be forward ported
along with recipe upgrades but its ok if you dont feel comfortable and
want to defer it to original submitters but then please CC the
submitters so they know whats needed of them

