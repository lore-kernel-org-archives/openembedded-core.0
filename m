Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 43C3B60132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 08:03:16 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id nt9so1469575obb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 00:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EXYsBDCmvr1wySQSkYvjX5TbhmfarbBLX4Qv+7HMdyc=;
	b=k88UFKPS6EkUiEoZxj9q+wZpqqpaN4Hom5+Fk+nsCqtPnbzEIKEfYlfrTIiyIJffGw
	f1mYjc5GMPFqTtPOWQOGkXjDJcIRQ2zWiEVZRl0lePFwNPkPk2ERY9YHxtBHqcgfcVON
	EDJjsjGRqRQO/fC811+VU9QVY1bUzOaO9ihXYBlQFUZCdvSZ6eQGFyL2IUnVAH4DSFD5
	d/TgvKX5vhHNhGpjeaZtD8D/T5icpHm/QsKmM3CfgFWkkuAFWQcPlftt0E0QUm5DdrbV
	NS9gMVaE0L/A0XMhM1koBD7taQ+ac350q0FGjStEB1v0xSATvZCKbTire3a09saBPlem
	M7vg==
X-Gm-Message-State: ALoCoQkbOujKt1AFN0hgziE6hpOe1cO5Rn6ZotL42guMZzq8u9nnrymF3baACRgG2nVrQ5C64VbZ
X-Received: by 10.202.195.199 with SMTP id t190mr2716296oif.105.1422604997973; 
	Fri, 30 Jan 2015 00:03:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.116.167 with HTTP; Fri, 30 Jan 2015 00:02:57 -0800 (PST)
In-Reply-To: <54CB3932.2090308@windriver.com>
References: <1422435425-20620-1-git-send-email-pengyu.ma@windriver.com>
	<CAP71Wjyba6f0VpKMFJkOs21KPFdtX_ScR3E=jtJTit_mkaN0cA@mail.gmail.com>
	<54CA05D4.6040404@windriver.com>
	<CAP71WjwH+Z6Ys+vLQ66Agr07HrDNzVmy1q5NFgLXzdwCK5L=+A@mail.gmail.com>
	<CAJTo0LaxjO4nX9fWWQN-e0EgTSt6RRc9U-DovdQFY5+z7tMLmw@mail.gmail.com>
	<54CAE393.2020605@windriver.com>
	<CAP71Wjxk0XFr5L6YL55GBUeGkx0q+dyh1fw245qi7O7j7gJE9w@mail.gmail.com>
	<54CB3932.2090308@windriver.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 30 Jan 2015 09:02:57 +0100
Message-ID: <CAP71WjwCEkOzO0Xdz0emhSk0j3Fi3o9SH-AbEuP=Jawp7ioQig@mail.gmail.com>
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
X-List-Received-Date: Fri, 30 Jan 2015 08:03:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 30, 2015 at 8:56 AM, Pengyu Ma <pengyu.ma@windriver.com> wrote:
> Understood, but there are 2 version mesa_xxx.bb and mesa_git.bb.
> Is there any reason why keep two versions?

right. this is indeed a good question. I am not sure what the
'semantics' of the _git.bb recipe really is. In my minds the _git was
supposed to point to development branch, or -rc release... looking at
history it seems we keep it in sync with the other mesa recipe.. so i
am not actually sure why we do that.. maybe someone else can answer.

> If I updated mesa_xxx.bb to 10.4.3, it will be the same as mesa_git.bb.

yep, like it is today...

