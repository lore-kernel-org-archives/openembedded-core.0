Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6E760132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 07:52:18 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id a3so33482608oib.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 23:52:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TgHoGZGQuo3F7xaNaYPfh1zb2RLi+CPoWvtWjgvmi5o=;
	b=KRUho8ceSQsntZHIsRGhePplNOjYkh/6U1XJKp+dkeOZiM9A38mGuwbHIsJnR2k6Sf
	PAGlm18i3zCElqvgChHssANi6tzvJ/s79V9cuCAnsicyeAUpZUQWjLcQWynAQgmh7LmR
	MbHxzPNDuSm6ShWqQBapYdbudGvCSoiVp1sctWpSiIlpj4+V0WobA5cLlN1vSCDxDGyb
	IgH0bd1dYrTUG0cGyqVaeWhGSjTJ3soC1a+llSSunCSAaZ4VbWdKzLePmOJIocpqkowR
	pQDJIZ6ynacnKLr3GrBUEPb3obY+SPe0hS5TVFeaerXrJ0NaxxO2d9rlf96pSnt7Lbb8
	Z0wg==
X-Gm-Message-State: ALoCoQmwi+xqDC26pS1Xti/clVLxdsAN5v+XrrlmI0lmPxeY74RWk4e0iCwxDwpX0jlrgCbk/jnk
X-Received: by 10.202.60.66 with SMTP id j63mr2724976oia.83.1422604339719;
	Thu, 29 Jan 2015 23:52:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.116.167 with HTTP; Thu, 29 Jan 2015 23:51:59 -0800 (PST)
In-Reply-To: <54CAE393.2020605@windriver.com>
References: <1422435425-20620-1-git-send-email-pengyu.ma@windriver.com>
	<CAP71Wjyba6f0VpKMFJkOs21KPFdtX_ScR3E=jtJTit_mkaN0cA@mail.gmail.com>
	<54CA05D4.6040404@windriver.com>
	<CAP71WjwH+Z6Ys+vLQ66Agr07HrDNzVmy1q5NFgLXzdwCK5L=+A@mail.gmail.com>
	<CAJTo0LaxjO4nX9fWWQN-e0EgTSt6RRc9U-DovdQFY5+z7tMLmw@mail.gmail.com>
	<54CAE393.2020605@windriver.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 30 Jan 2015 08:51:59 +0100
Message-ID: <CAP71Wjxk0XFr5L6YL55GBUeGkx0q+dyh1fw245qi7O7j7gJE9w@mail.gmail.com>
To: Pengyu Ma <pengyu.ma@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] mesa: Upgrade to 10.4.0
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
X-List-Received-Date: Fri, 30 Jan 2015 07:52:22 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 30, 2015 at 2:51 AM, Pengyu Ma <pengyu.ma@windriver.com> wrote:
> mesa_git bb will keep sync the latest version 10.4.3, that's why we keep
> both _git and 10.4.0.
> Now all all the version of xorg-video-intel, libdrm, and xserver-xorg are
> the same with Intel Graphic stack 2014 Q4.
> So mesa_10.4.0 will make a stable and verified solution here,
> and _git version will make the latest version here.
>

i think you missed the point. you cannot justify the need for 10.4.0
because it is the 'prefered' Intel version. the policy is that we
provide in OE-core the most recent stable releases of upstream
components. when/if I need a specific version of mesa (or anything
else) for my project, i have a recipe in my own project layer, but
OE-core is agnostic to that.

now, if a specific version of mesa is known to be broken, upstream, or
in very special circumstances, we might want to not use it... but that
isn't the case here, especially since both Ross and I are asking you
to upgrade to 10.4.3..

if you don't submit 10.4.3, someone else will anyways. and actually i
have submitted a libdrm upgrade yesterday which is likely to be merged
soon..

cheers
nicolas

