Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id AE7D4796EC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 18:07:22 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id 8-v6so22344969oip.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 11:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ATG5Uh1/MPMgke/VlA4aBZBSZuGKt0aMBxHyMZJmls0=;
	b=R26QdqOIMdJoB8mf9Y/P4CIXi88hlxIa2k8FBCLxEU/BerMMJd0J4R8ahXpkek0Uj0
	y1UVRyLt9dFxp0wp01W4Du19hTxEpt8ehp9QEbCb3J+lbMjomifr1Dfzx6I7Sw4BG/+4
	eNT69miJD2N1mAIU4ldI8hh2iSnnIec651IqtlLY/3VkSHkRVIP8ao0ehJjdlLC7MAgw
	BG5W0UdlfYbRgH1vo7bsSlN9gEQoUWwHs/KTlB4ZHXr1BvRoDEw9bFmYgh6NkfW3floZ
	K46FYfjbzgk3xJq5OLR/1WTRWxZsO8fSjVsbExr7PB/wWcMs01K4+SsOsNmA7BCOOnfv
	gFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ATG5Uh1/MPMgke/VlA4aBZBSZuGKt0aMBxHyMZJmls0=;
	b=HOrIlRP7jKWVbIgIfWzxgcNnLp1mUUQHrXyLLc1oipvoM3OjjgswfsoBAZHqCG9yBY
	Sk6yL+ZK3Uptfe3+gybvtSN2DT6LOtfuDz4iuiMlkNhzXV6YTF0Cgyr/l7wqWDWA/+oG
	z6kfiThMQrnnTtDPvHPbPqZiDou2KJg0gI3m2cJY2wSpQviF3Tatme9cUtshXYZ+VJnr
	Nwt2YcDWdKQJxAP5XrsEaN4hw6g9jQPCVhrH4qbmpJMQzzHDaQNyHfe04m0PhDZ29eMg
	Y9a3DuLPRcE7XsWB//2kR2A+2hkPrmOHd5sVGqNkVcpAkmOojf6ckOER4NGF7hIXp04T
	UuAw==
X-Gm-Message-State: APzg51BNiGovwEX96ypVosR/E9oyxCmXQKqIs2jjtdY1FxXaauxOlKzR
	vyi/q+TEOxqx+9q+jzGhGbA8YCbvtZVuRklN6j42og==
X-Google-Smtp-Source: ANB0VdYyivxjxRTeLahseKU1oMePBZHC+T4EKfOeOSotsgrZ5Ue8SR0VEeRBQKuj7gUkDTGzIRBXHA5xnrDsTj5CkOg=
X-Received: by 2002:aca:c74d:: with SMTP id
	x74-v6mr3743792oif.97.1536257243795; 
	Thu, 06 Sep 2018 11:07:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:385d:0:0:0:0:0 with HTTP;
	Thu, 6 Sep 2018 11:07:03 -0700 (PDT)
In-Reply-To: <CAMKF1so6CnZzfYsNDymQbH+R_v60XCgEJfuDQ2jcRf7PqY0caQ@mail.gmail.com>
References: <20180906150727.24915-1-ross.burton@intel.com>
	<CAMKF1so6CnZzfYsNDymQbH+R_v60XCgEJfuDQ2jcRf7PqY0caQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Sep 2018 19:07:03 +0100
Message-ID: <CAJTo0Latyi50tJ+kz+efA-j2ADRgBejj7bXuBrrsCbMt2MYz6w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: disable LLVM on x86
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
X-List-Received-Date: Thu, 06 Sep 2018 18:07:22 -0000
Content-Type: text/plain; charset="UTF-8"

You can fiddle a packageconfig in a bbappend already.

On 6 September 2018 at 18:24, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Sep 6, 2018 at 8:07 AM Ross Burton <ross.burton@intel.com> wrote:
>>
>> Whilst turning on the LLVM drivers is a honourable goal, the performance impact
>> is *huge*.  Instead let specific BSPs turn it on as required.
>>
>
> Can we turn this into a variable so we can add it in a bbappend ?
>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-graphics/mesa/mesa.inc | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>> index dd626d9f00c..5afd0db4b7d 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -48,9 +48,6 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
>>                    "
>>
>> -PACKAGECONFIG_append_x86 = " gallium-llvm gallium r600"
>> -PACKAGECONFIG_append_x86-64 = " gallium-llvm gallium r600"
>> -
>>  # "gbm" requires "dri", "opengl"
>>  PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
>>
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

