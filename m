Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB11745BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 23:58:00 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id s17-v6so1652397vke.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 16:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Oj1I3DzVfpLJtizjZvwXF8T+UACb74AbJuGPFzHWuTo=;
	b=OwkAmhXwzHQrlHPV4d6NUsJGSho8xkuZLxK/AoFWXaUchCgB/VqfP6jTTwaepf0IjS
	mfDNP8UIfzSSqcli52we5dDvGS3g7dfaszm1qGgBeWicMy30Hr7zfPce52yqrQLqso1v
	IDFWieaQUw1pR7C4HYDdztll4a5SN20tlqYQXdyNiZyV7A01vWfe5qG0pHj8+u+2iYR3
	QaJK8ple9i3oVjCAIsGpSTWEBwyPV8Xi6y7YbAmKZVYwIcAHOOGS2VL8Lro0joOfdO6g
	rHNAct7COp8NShCnj8GvkPCaMgmtmI614zj6Du6T/yutbx7VcCgY5de5L2/XM/cpDEe6
	BHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Oj1I3DzVfpLJtizjZvwXF8T+UACb74AbJuGPFzHWuTo=;
	b=VGxeKnwTfAEALJjWvQ2iPAuPGbgn8zmXC/UtA49EW2futBzD22ZdDtOZeO4U7rf3qB
	gzfzmBdXQ6s116xlao1nK/r6NqoO+hVkX2EBxHELHutfKgSq7xt0eawXgudXgewJKzk5
	NKkVUzVKgKmhX0IrdIBxV2TXyyFIHidsoRXM2qYogB2Y8mcaGK9OrkFhkRf8tOSFmdFT
	rXpR2Qhk2+dLhUyVrOSqjXxL2NR2S5mxE6itWvCCQAzR/6kvHs9RyeifFKVuoBbSkGxM
	GwZ4+iutXfntDxc9eKhkRR2+12QrgHxZLpWO0BtNzAnDdKBHvvtLzrMfOSmWFGLoSBUF
	i/yw==
X-Gm-Message-State: AOUpUlGBhgfTSNlizFFFPN8VHP6AJfy40t4HvOv9Stn66dxK43IZj56k
	BxQB5+leNcRVO3x5cI2FNGHg8ZXUVolCrRvJKyo=
X-Google-Smtp-Source: AAOMgpddPpImG7I+m/mbI5Bf+r5gRTwgasDsPJXPsA4rp1ToRfgNyzb/JgsNHzSbZMuJOq59+Nw8D8/bOcxBcDeUkB0=
X-Received: by 2002:a1f:10ce:: with SMTP id 75-v6mr2522166vkq.83.1532649481246;
	Thu, 26 Jul 2018 16:58:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 26 Jul 2018 16:58:00 -0700 (PDT)
In-Reply-To: <CAJTo0LajamOMF5TsuMZo+sBRLr=AqWYJUJPnifZUME=rKrO48g@mail.gmail.com>
References: <20180726135835.17632-1-adrian.ratiu@ni.com>
	<CAJTo0LajamOMF5TsuMZo+sBRLr=AqWYJUJPnifZUME=rKrO48g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 26 Jul 2018 16:58:00 -0700
Message-ID: <CAJ86T=VQ_Qk0TOhHRiZ0SThgZ8-HZOTz6L5JXD4K2ut+7tbWFA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux.inc: add fallocate only for class-target
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
X-List-Received-Date: Thu, 26 Jul 2018 23:58:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 26, 2018 at 4:34 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 26 July 2018 at 14:58, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>> Because the util-linux_2.32.bb recipe explicitely disables fallocate
>> for nativesdk triggering build warnings:
>
> Does anyone know why util-linux disables fallocate for nativesdk and
> native builds?

Seems to date back to this commit:

  http://git.openembedded.org/openembedded-core/commit/?id=17f3c548caf4adec37c3bbb139aa6b3900419794

  +# fallocate is glibc 2.10, fallocate64 is glibc 2.11
  +# we need to disable it for older versions
  +EXTRA_OECONF += "ac_cv_func_fallocate=no"
  +EXTRA_OECONF_virtclass-native += "--disable-fallocate
--disable-use-tty-group"

