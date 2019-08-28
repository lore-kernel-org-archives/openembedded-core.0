Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id F0A947F168
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 18:13:20 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id s25so291139uap.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 11:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2u907weMQZ2OJ0es41QOLU6O3LKHK/mWxFxD6XccLXw=;
	b=VkY5VWVl9Qslg4YP+vqRod4IFuD7g1Zq+A20lUiRxw7peEV2LKiCaLUFd3ox31PXgs
	WF5wez/KiqWWQdjh2weug6d+LXAF0kcbXuKSl93FaV7r6nZXqqRDi4TbRpMRo/uCEuST
	4EX7ebYybRI54c3pATS5Th7ilMUK7vQ5KYKr3dPvh7Rsmho9EQKInEDCiFqKEmtocgzR
	5bjHUgz5rrwQtT2PeXwdUBIsNgbRpb3UkfwruecRrYWvI4PSTchk0TQPEZfnYndEd3rp
	Jg2RvTJC2V9TuLjmHl6DnojuFd3GfWShB3Gakb/tr/lvhHJj86DtgcHSpVounNey5X4e
	zr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2u907weMQZ2OJ0es41QOLU6O3LKHK/mWxFxD6XccLXw=;
	b=ZoRSF/kv4HTSUMHGQQ8El1ltPi0N6eaAGKxhjjowDUfN4Ya0YGbncyUrhvDXP63jQs
	fPEQTM/MKlHmKcoD6X3RNJGwt+G7OnvCgGSX0wy8yiiWBJJj4HfH6HF+dtKBDlUxJuaR
	5D44WglMfki+qc+2PjWcedPsdsz+/ATJvkQlQ19n1TseGPcrM3tVKAKg8WkOkrzJDQkc
	qZ+cJxgMH317dvtF92+8AGv/Xk5+TDCYEQuoKFvsdVMUABh/M0T1jTNP6189XjF/jEK8
	jaymqDVEKWZ0Ijap3dzi0jIkksrHkkZAZU5G/KxbGbPD3T/W8rG1+t7U/wjoKkx4pWTt
	yFjw==
X-Gm-Message-State: APjAAAUWO/Vx1SKM8efie85kP+gvk55LX9f9+KgG4bM7tCQY8RLAF1QM
	US0YkmskdS7dJ2Csu5BKM1/4dFmu2/ZHPY/aOEk=
X-Google-Smtp-Source: APXvYqwECTKmng4bgS3JBmWN5oXeeBV2uKTwh2wrBV+2EQX5tZ7Idbpxp4W8PBEwZfrXEC42Y8K2tLokfBWpy396PIo=
X-Received: by 2002:a9f:224f:: with SMTP id 73mr2667776uad.48.1567016001661;
	Wed, 28 Aug 2019 11:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190828092115.12773-1-christophe.priouzeau@st.com>
In-Reply-To: <20190828092115.12773-1-christophe.priouzeau@st.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 28 Aug 2019 11:13:10 -0700
Message-ID: <CAJ86T=Vzs2X4icDoVdsysWNMeb9gB5B1reMfE8CsZTLBCf5AMg@mail.gmail.com>
To: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] common-licenses: update BSD-2-CLAUSE license text
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
X-List-Received-Date: Wed, 28 Aug 2019 18:13:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 28, 2019 at 3:05 AM Christophe PRIOUZEAU
<christophe.priouzeau@st.com> wrote:
>
> Using the generic BSD-2-CLAUSE license as specified on
> https://opensource.org/licenses/BSD-2-Clause

Fixing these kind of issues has been discussed before. I think the
consensus was that a wider ranging cleanup is needed. The thread
starts here:

  http://lists.openembedded.org/pipermail/openembedded-core/2018-June/270475.html

> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
> ---
>  meta/files/common-licenses/BSD-2-Clause | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>

