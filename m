Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id C191D6B19D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:06:50 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id jz10so2544717veb.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=krtpay58kE20oFrZS0UuOsUlWbHT0OkziJfp0wWFEQQ=;
	b=ATnroCdHbWwccD4vT+VoB9WEn8YMgEbA/sHhnVb7VuIYPfv+1SzUP0wsB/1J8SAboR
	9rURf6ZKRVrZbUm5A2DG8DV3UdYUaj4VisVbOyB1qe87Y9CaomqhfNjIlJpy/6vUdOGj
	khrUvqvXhteDJgaomQAYwb2R3GC0XNIhlex5EoAq7Op/AXuCA+1LMb0DA7D9QvvB1VKa
	73w4wpGL8eUa1gJE3bpg8CFm9RdIoQ851EI3DMUp/cUMwFDEM8ZvYw+CKEApxqeRVQWe
	3Ol+P1hEITWg7WtTwbwfTJ+drKgOc98Y0sTcMjo5Pnt8o3R4j4TB0tgNuKU+HLHoAHVM
	8NAg==
X-Received: by 10.52.164.227 with SMTP id yt3mr3400613vdb.107.1374156411353;
	Thu, 18 Jul 2013 07:06:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 18 Jul 2013 07:06:31 -0700 (PDT)
In-Reply-To: <1374157097-20939-1-git-send-email-net147@gmail.com>
References: <1374157097-20939-1-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2013 15:06:31 +0100
Message-ID: <CAJTo0LY1toVb25hCGB2_1FeFCdSbQjOYc9Q6TAP3svDZsRqYoQ@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQkrOeHlJKm+kf8iT628W2V6HrWjNvt9PZsCOGceqYR++QTVctYJfmLumo0z0j6C4jQ5igdT
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: update git recipe to 9.1.5 release
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
X-List-Received-Date: Thu, 18 Jul 2013 14:06:51 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2013 15:18, Jonathan Liu <net147@gmail.com> wrote:
> +           file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \

According to Martin when he upgraded mesa_git to
5a925cc5504575c22dbb7d29842d7fc5babcb5c7 that patch was merged
upstream, and as it is only available in mesa-9.1.3/ even if it
applied it won't be found.

Ross

