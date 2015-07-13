Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0572C75874
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 21:00:38 +0000 (UTC)
Received: by oiab3 with SMTP id b3so144377230oia.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 14:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6jQ7Hv5ZdTGfrXkhHvbbGXbILXo8LheVr2xq/g5ksiw=;
	b=hnH8sIakc020i9afViUHiUJLQ8IukoqSSR9EjxqEMUNygcMEo6zkfc3bjexn6rViY/
	JKPudF6XpEXpO1Z0nT0g24AbvGEg0Y8yTCK0eLCHLnb9Ak7fnjnl5mx8RBlmb1o44Cfi
	L/t6s0watl0rpDaNP2uuP5vI/z+9C818xVgn7hIuGLMKApy2PdLBA3vR0dAGqteBOHKe
	4i3ul7d/33silNPdx7t3HzmBK9FZlNmTSLEv+2Vgf6KbAY0I6WIrNxohrDadfn1laWtD
	Gn/vHRo/aNe1mOAe5s3GuHsQGsR1km8iOOasb9S9DPG7EP3lr1yZCRYaAuR+CQvcuabH
	IGMQ==
MIME-Version: 1.0
X-Received: by 10.182.87.36 with SMTP id u4mr31996916obz.50.1436821238486;
	Mon, 13 Jul 2015 14:00:38 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Mon, 13 Jul 2015 14:00:38 -0700 (PDT)
In-Reply-To: <1435887942-20254-1-git-send-email-armccurdy@gmail.com>
References: <1435887942-20254-1-git-send-email-armccurdy@gmail.com>
Date: Mon, 13 Jul 2015 14:00:38 -0700
Message-ID: <CAJ86T=UxwAkS2Lw81FGaXvqbd6KecCr9dMYHcTVK4Kf7P+-Rfg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] refresh busybox defconfig
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
X-List-Received-Date: Mon, 13 Jul 2015 21:00:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 2, 2015 at 6:45 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> The oe-core busybox defconfig file is based on busybox v1.20.2,
> therefore any new configure options introduced in busybox v1.21.x,
> v1.22.x and v1.23.x take on default values when the oe-core defconfig
> is run through busybox v1.23.2 'make oldconfig'.
>
> This patch series just refreshes the oe-core defconfig file, it does
> not try to 'fix' any options for which the upstream default may not be
> ideal for oe-core (if such cases exist, they should be addressed in a
> separate commit).

Ping.

Are there any issues with this?


> Andre McCurdy (4):
>   busybox: merge login-utilities.cfg into defconfig
>   busybox: re-order defconfig to align with busybox 1.23.2
>   busybox: remove CONFIG_FEATURE_VI_OPTIMIZE_CURSOR from defconfig
>   busybox: refresh defconfig for busybox v1.23.2
>
>  meta/recipes-core/busybox/busybox/defconfig        | 158 +++++++++++++--------
>  .../busybox/busybox/login-utilities.cfg            |  13 --
>  meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 -
>  meta/recipes-core/busybox/busybox_git.bb           |   1 -
>  4 files changed, 98 insertions(+), 75 deletions(-)
>  delete mode 100644 meta/recipes-core/busybox/busybox/login-utilities.cfg
>
> --
> 1.9.1
>

