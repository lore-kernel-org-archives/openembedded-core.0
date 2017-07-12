Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6F4627808D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:38:13 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id r103so32025457wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 05:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=rBsgDoGlfQVXntOQdqCz9D2mvJBGcAmB10Qad/xL5No=;
	b=FQTI1SU3SZr6CfeEQVW9uNYDQ8QN9X7Z7bZkIvZ/lVFWH8B4WbuhV784YrYln2e/vX
	Le62rLzI+4qTZziMJd1BQpA6RvUKm+TjXmjr7Y0DeqrTml2Hc0eKIdezPslFZkEnt6wV
	+ANwNaG2uPdQT8y7oXJSAG3nsFyqV+JnIXxGJO1HbNWwv4LlA8eautV/fEx9Rnh9tjpg
	jSZbZ6W1SAA1SoeVK5QO7WNH+v8QLuiWaSh8H8sLtJvOu5mzKNEQb/I+k29eNpYSab7p
	RcTTV5l6bcKGWhOzSi5sCtpjuLil3+6dc+wXPIEyrXasH7AleZTUwzi68AQOtb20BhUA
	UTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=rBsgDoGlfQVXntOQdqCz9D2mvJBGcAmB10Qad/xL5No=;
	b=huIarfrTl612th8CqPhsednQqdk7XqWjbM2PUw+QGgOybDbprm/LCjmXPzVtqTSAOS
	11c8CiiKhvZO/zZy29Vxy7Rsn4PwbyAXuXTQkSjKQR3dj52fMGIkRZmdepc6RDgYLPD7
	zKZOMLPzsfib2cDftx7NL/7ssrYs3ClWYwehz7Dml6rapBfsJm3qvgp4Mh/n//6DQSTP
	m4VGVyCSlxhZc6TM8ka1BwiVTJ7zWhwb+dAaEjiCkwqgibkNHQ8dBUvJGuy0wprZdu5C
	1u4k7FnCHHSxurGfOQmJWxaKqpFws5nAjEoE1TwsEmhpqgow5ygxOFHUpIX8rMi/cpu5
	xeIg==
X-Gm-Message-State: AIVw111Bv8nK16Alw+1Am/hMiOPgZneHLMdlAjvUa6idNQcszlpPqxy1
	xyL2cOFs/wZSZcKGwC8=
X-Received: by 10.28.228.85 with SMTP id b82mr2536267wmh.65.1499863094416;
	Wed, 12 Jul 2017 05:38:14 -0700 (PDT)
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com.
	[209.85.128.172])
	by smtp.gmail.com with ESMTPSA id q2sm3026065wmg.3.2017.07.12.05.38.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 05:38:13 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f172.google.com with SMTP id r103so32024506wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 05:38:13 -0700 (PDT)
X-Received: by 10.223.139.218 with SMTP id w26mr2672131wra.206.1499863092931; 
	Wed, 12 Jul 2017 05:38:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.73.84 with HTTP; Wed, 12 Jul 2017 05:38:12 -0700 (PDT)
In-Reply-To: <4cddc1cd5182c742c1c6ceafcf122928b21a1a02.1499860838.git.jussi.kukkonen@intel.com>
References: <cover.1499860838.git.jussi.kukkonen@intel.com>
	<4cddc1cd5182c742c1c6ceafcf122928b21a1a02.1499860838.git.jussi.kukkonen@intel.com>
Date: Wed, 12 Jul 2017 09:38:12 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqbPi8idV_0BBPUm0PrV3RG9nMKfVJxCCHX70B3H4G+gg@mail.gmail.com>
Message-ID: <CAP9ODKqbPi8idV_0BBPUm0PrV3RG9nMKfVJxCCHX70B3H4G+gg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: Avoid installing khrplatfrom.h when not needed
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
X-List-Received-Date: Wed, 12 Jul 2017 12:38:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 12, 2017 at 9:11 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> Fix the conflict between mesa and userland (when former is used to
> provide GL and letter used to provide EGL+GLES) by not installing
> khrplatform.h header when its not needed.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

It is fine; if Andrea could test it would be good.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

