Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9A771A70
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 01:45:13 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id t8so446606vke.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 17:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BTvqM6b+P4xL5s28EBBcisKyTdbs9fDDT4Ga/UkMLzg=;
	b=VTvUCh1Nq86LLldukzAhrq5oVpEwL8voq08f3hotZMMXENJPekwnEXTSKmWCCSymWB
	WS2ifWxnumDA9oaav5w8UMMhxtJPh//yGcwf81sMaIdA52BJ9eqdMFuOtk0ZN9O8Wr7e
	HhDPFcaxULqZmzFeH4WGi6vqeoNSlsAVSUhaPXjUWzNQ683FafgRrGEcBrI5n6p0ILvz
	+9ai12nF7zXUnzfb9WYtURtIIsr1hpJF/3RSejm0kL4Nuh3N90fnVkPYLx3wlFyj/8xw
	+OGK6F4OG9t3Bdp6RqquzTmCknCtpck1dmH7yrABeePedyKnsNkeP5VRtEoCcachJqAM
	1cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BTvqM6b+P4xL5s28EBBcisKyTdbs9fDDT4Ga/UkMLzg=;
	b=I2mHbkGcPWlmupX6GqakEXMF2R4p0n5na5dq/p6X2qu580hihqVfz0akGRA+4zYGce
	+55Oq7+DlcYF2AqvZQBKwifcrHf5oBlVFgboqcc+4fLW+AGFNU3jv0qXI1dTk9mLecKt
	lchHzNUmXhOAqe7A7zOJu5aa0tUOd6firtgWxCykvxlyKZYOwEpxav6mezA9xFZ1i747
	5IsRrNACb6H6Bixhgb93v5ivPNhXXNROVEwQ4fYhtRY9IA6aLtTIG+G0av1RI96wh4QZ
	jAA8OAN2B7ANo67m9jGlQl3M1WRGuXgaA/QIjtjG3GTDnHmc+geSbqeHDIuOCCUbI9gs
	+rLA==
X-Gm-Message-State: AIkVDXJhmBVsebRkXp3hAEICVo2FxA+XUvcqqRuHIPP+3DAUCOiLBNaQjMe3JpTPFm6rI+VkO4MJ1HbNt6v8oA==
X-Received: by 10.31.197.196 with SMTP id v187mr5513327vkf.84.1486086313810;
	Thu, 02 Feb 2017 17:45:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Thu, 2 Feb 2017 17:44:43 -0800 (PST)
In-Reply-To: <1485556151-9063-1-git-send-email-armccurdy@gmail.com>
References: <1485556151-9063-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Feb 2017 17:44:43 -0800
Message-ID: <CAMKF1sp+=6Ot3q5PkQN9Cqv95EGPCK5RQ11EkvhGCrTqo9atHA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] replace USE_LDCONFIG with ldconfig distro feature
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
X-List-Received-Date: Fri, 03 Feb 2017 01:45:14 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 27, 2017 at 2:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Andre McCurdy (2):
>   bitbake.conf: replace USE_LDCONFIG with new "ldconfig" distro feature
>   systemd: check "ldconfig" distro feature when setting PACKAGECONFIG
>
>  meta/classes/package.bbclass              | 5 +----
>  meta/conf/bitbake.conf                    | 2 +-
>  meta/recipes-core/glibc/glibc-package.inc | 9 +++------
>  meta/recipes-core/systemd/systemd_232.bb  | 2 +-
>  4 files changed, 6 insertions(+), 12 deletions(-)

This changeset looks good.

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

