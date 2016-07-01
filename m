Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9FCFB60124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 17:51:01 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id v190so16603804vka.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 10:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=5EP+QkG0WOnNfungJQ57ZKAkntnsVwcSv/TCXhW4oa4=;
	b=XBSnY5rmoubqTwt+/l+UMd6uXK7o9YRP4XfjuMoWVFQiYw+pBzJC38TuwUIFOZBIwg
	e3fGxzHYmPhtkg7eRJ9loeyLVpZsMHKd/m6izmVyGRg27e/n10uFYt85LPWEEGgFFUXJ
	RzmLj3v239nHDTkvGU83Jc5rZCcet8HnNTIb+QSqvaT1S4CvL7vgYYcbs1HnU1KCTHlw
	0kyfY5f3AugKPtyW9BzTuL5RmJBe+E1kWtL+B7gE4aMrfrdz9HJPjiG5jhqeIq1hBbhS
	mMHNEo8Vw+aPO0YvoifmAcZjmF8nUgFhiLZsNm1+ZsKvXfnyNKDVj/O1xqDTge6qL4KD
	o8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=5EP+QkG0WOnNfungJQ57ZKAkntnsVwcSv/TCXhW4oa4=;
	b=SubwIUC2Yhv23tOy1VJKrI7zpORcOCyVRBJFm+FeBwak8AwsmVh4z7/9yfR+GtC0Qn
	iqsY+SzhgV5mLSjuaOAtq6P3svxQcnCJrDMEdswJ5Z1ZW2Hn3WqdeLvFH7uAMelC7Axz
	1VaN5ZXV6nZdITPpCMREeKar1+eyuo9kXE4V+TEaan16M6hanP7R8AYAVj63Qx5kgy+W
	Wz2DuHL3Qop4D+3zD3J4ekE8Tfmh6PjBp+rKRXeD+Q+PH+03QoZfjb051PZlkZh5wjkv
	0I9dW8cDQZrAmjLe1NtlN4QJDkx4K0VE7RG8lnsO41PnAu5By2hs8TEjB28Y7j2ZSPsa
	5tbg==
X-Gm-Message-State: ALyK8tJJ47qKjwTV6L0vQJANb8PKKPLp0N9R/pd3z5CoKVpKE4wWbERNxlTbpsK0k1S/OQ==
X-Received: by 10.31.199.6 with SMTP id x6mr10454198vkf.17.1467395461152;
	Fri, 01 Jul 2016 10:51:01 -0700 (PDT)
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com.
	[209.85.213.50]) by smtp.gmail.com with ESMTPSA id
	a67sm2402674vke.16.2016.07.01.10.50.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jul 2016 10:50:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f50.google.com with SMTP id m127so102922788vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 10:50:59 -0700 (PDT)
X-Received: by 10.31.161.81 with SMTP id k78mr10134111vke.122.1467395459368;
	Fri, 01 Jul 2016 10:50:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Fri, 1 Jul 2016 10:50:58 -0700 (PDT)
In-Reply-To: <25bb70f088ffb603e1f389b7657c1fbf3f2871bb.1467378176.git.patrick.ohly@intel.com>
References: <cover.1467378176.git.patrick.ohly@intel.com>
	<25bb70f088ffb603e1f389b7657c1fbf3f2871bb.1467378176.git.patrick.ohly@intel.com>
Date: Fri, 1 Jul 2016 14:50:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo=BAgtk8iUbSgcOVh4+uVW-SBuEri6f8MkRH2qXfpVSw@mail.gmail.com>
Message-ID: <CAP9ODKo=BAgtk8iUbSgcOVh4+uVW-SBuEri6f8MkRH2qXfpVSw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] meta-ostro-fixes: initramfs-framework: add retry loop for slow boot devices (like USB)
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
X-List-Received-Date: Fri, 01 Jul 2016 17:51:01 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 1, 2016 at 10:53 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On some hardware platforms (Gigabyte, qemu), detection of USB devices
> by the kernel is slow enough such that it happens only after the first
> attempt to mount the rootfs. We need to keep trying for a while
> (default: 5s seconds, controlled by roottimeout=<seconds>) and sleep
> between each attempt (default: one second, rootdelay=<seconds>).
>
> This change intentionally splits finding the rootfs (in the new
> "rootfs") and switching to it ("finish"). That is needed to keep udev
> running while waiting for the rootfs, because it shuts down before
> "finish" starts. It is also the direction that was discussed on the OE
> mailing list for future changes to initramfs-framework (like
> supporting a "live CD" module, which would replace or further augment
> mounting of the rootfs).
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>

Agreed but please split the rootfs in another module; so we don't
force it to be included. The e2fs can rdepend on it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

