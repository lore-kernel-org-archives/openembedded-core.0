Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 04A5777B38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 15:10:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d79so5432892wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 08:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IhOYrXYNq6TW+Sxgp0Eyh1y2uljOoAtxISYi2+gKNzQ=;
	b=SU5okw2zsH+zVYguvgMmaDTLqevyk9s7ma+CrZP6APKRL60IYOSzor0QVBbiMfLpP6
	suStMPE8B3+Aam4tqGw2aY3YvQg5MEWAHnUTn8aj6JFhuTRi2oF3GF752OwcLgoc6hiC
	0OXiuLEHJZB9CK7c98Kv+OTFycu+dCWgeWPY2Nkn7WWGFi6Yb52HgUeFprkJI0J9d8cV
	YlsdVIT1aWm5GID6AieFdMcSyMOsFPGzL7nYRcEF+tLcJHCPvqq73cncEGpLP7a7OjrR
	oZQ8yzbYLM0gGQ7XX93/ePaGEGXOD/GZZl7CW3wpFSl1SY8wjnUnbj56kE8U9/5gVO4N
	4qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IhOYrXYNq6TW+Sxgp0Eyh1y2uljOoAtxISYi2+gKNzQ=;
	b=mrg4G9A6wYEm9Gw2/gQ/DLcUH63gZmYgcWYGmGAbKaezS0+w6x3D8BBFLv07l9PXUY
	rQj1q/0h8V1fMnEuPxCFeTehBYE1akxrH4sdAVjPPGDQB4ammrcwed0c+ZOye6jfKKng
	3z+9od8bbPxpcABHZXUwfuv6CyhYohvawlaeac+q6wPkgo00PduMrVO4uQiNBkayMt3X
	Z6DGkblokS97pu3Jhf49SbZrxmOnjJjXM1k+kP4wmwuCrCXGuDMFEahs8PNHW/Fzzibf
	nmpHvkQg1uD2B8XDEWuHM5hi8lBaaknyKM/9ixcz56jnwKx/TRZemoaUuy9zSSwFLu4V
	rfNA==
X-Gm-Message-State: AN3rC/7MFrUXoHM4FzBC2SO+yH7ZoK0gI8gzyUMf0gCKmm6aEw3tkqxt
	G2UuG7bjTeOp4LyN6FX2KpJqpU2SlQ==
X-Received: by 10.28.206.195 with SMTP id e186mr8025159wmg.37.1492787435754;
	Fri, 21 Apr 2017 08:10:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Fri, 21 Apr 2017 08:10:05 -0700 (PDT)
In-Reply-To: <CAJTo0LbOTv5iWYRt-cXLXnurgDE9uQikWUMAs7eHwu++OxU_yw@mail.gmail.com>
References: <20170421055501.16435-1-raj.khem@gmail.com>
	<CAJTo0LbOTv5iWYRt-cXLXnurgDE9uQikWUMAs7eHwu++OxU_yw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Apr 2017 08:10:05 -0700
Message-ID: <CAMKF1sp7RTWuQJ5QBpjBr-x0j-jQEOuMCFXm+wR+CFT_Go=Lzg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: Upgrade to 2.16.1
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
X-List-Received-Date: Fri, 21 Apr 2017 15:10:44 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 21, 2017 at 7:51 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 21 April 2017 at 06:55, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Drop patches that were backports or have been upstreamed
>
>
> This doesn't apply to master, can you recheck?
>

yeah I had forgotten to squash a prior patch. Resent a v2 now
> Ross

