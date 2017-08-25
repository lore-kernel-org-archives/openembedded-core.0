Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 797636FF73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 18:48:04 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o76so334608wrb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EDAiX216f7a7WHKUjJKv+sr1chOyMOEh1+jLUhQDbyk=;
	b=feeMdLW8wOFE5w7WuizwyA/xkO76thP/ksca9l3H8Ocv9rudmpfOW9E0qyHWmIltH9
	ndfH32IhmdxMeEMqPq6FEOHkRkMcIpvVh8GgqmAMaAZ6QQJjXnQbizjvP5ZFezIVjIY+
	8IzMv5dwdr58vm6uAmDmkAmH1tjxP5PEK5ueCCTa3VSY+M4XqgyiUPHTzGpg7KITgT0h
	KFpn6yB0MsbH6GQMArWTRF75LBeRh2DGh8XT9Z5Kkk7dr53eUeRgyZiFjz7j+6aRJpTL
	UsIc0nfJmQA8EAMZOrEAlTJzo1G3qIhP0eEbe3xgwHD2aMTtcW8yfbpVC3T4WEB7B6f8
	VT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EDAiX216f7a7WHKUjJKv+sr1chOyMOEh1+jLUhQDbyk=;
	b=jrylfI8cNsPwOo98HAnSRIKjfkzP0Gc2i69NNw+PD9lnuUuMC949Lg6uXp9klANeQd
	8A4xPcILm5xr9eB4roe+Ekapl0v5ZDLsSmNDtH6xUgCPWK/bbxQp9QwBn4eVHnpptreQ
	Dh3FTku3FlusQZhs17N47sl83sJbhPRAxEqm2OjRbqlxMLEhTr+Fv8XkGMDK0bcC7ouV
	3OWR1bjZRLAByRE0eltm3gmIt70CxteswzC/k0ApOL9bUGfR5Ywe+TrM1zcL+9F47NCX
	sZnROt8qsm3R7Ci0tTsg+biQEE0MQCZU3K3WD2rqxWZZurkBejrmQ8+YT2R8ZqQl0+1M
	mo1Q==
X-Gm-Message-State: AHYfb5hxWE8oob4703vT34dUMqVQuYnwNC8VONUVXW5Us9UuWjNvQe1G
	9WWkQQ0S03CbBJaesQ/to+FKnSu3rg==
X-Received: by 10.223.175.8 with SMTP id z8mr7268498wrc.16.1503686885251; Fri,
	25 Aug 2017 11:48:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.169.70 with HTTP; Fri, 25 Aug 2017 11:48:04 -0700 (PDT)
In-Reply-To: <17938e56-c1d0-5316-0263-b954006f9015@ge.com>
References: <20170824053753.36121-1-jose.alarcon@ge.com>
	<CAJ86T=Uip8WChxD_q_jWxCPPmUqw87yJLyn5F29ztbJfMpVMOQ@mail.gmail.com>
	<17938e56-c1d0-5316-0263-b954006f9015@ge.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 25 Aug 2017 11:48:04 -0700
Message-ID: <CAJ86T=VczP+UyDTzRb8zcRreNVp7Ez43cfDquh2ysKy_fqGnFw@mail.gmail.com>
To: Jose Alarcon <jose.alarcon@ge.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: EXT: Re: [PATCH] libinput: remove obsolete touchpad patch
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
X-List-Received-Date: Fri, 25 Aug 2017 18:48:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 25, 2017 at 12:09 AM, Jose Alarcon <jose.alarcon@ge.com> wrote:
> On 24.08.2017 20:45, Andre McCurdy wrote:
>> On Wed, Aug 23, 2017 at 10:37 PM, Jose Alarcon <jose.alarcon@ge.com> wrote:
>>> This patch was a temporal workaround needed with 4.1 kernels.
>>> Remove it.
>> OLDEST_KERNEL is still set to 3.2.0
>>
>> How can you be sure nobody is using 4.1 ?
>
> That's a good point!
>
> I didn't know about this variable. I believe we should not integrate
> this change.
> I will resend it once OLDEST_KERNEL is set to 4.2 or bigger.

The original patch has been merged to master so a second patch will be
needed to revert it.

