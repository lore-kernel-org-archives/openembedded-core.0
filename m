Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 905FD7CF98
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 09:36:16 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f10so1537522wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2019 02:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=COC6yW/CBpJP8WArRy/y8QoY94uUfu2DxlEuXr/TH3Q=;
	b=Il0yNAwRuMYF1W3x5cVPKi00QaxvV+vbI2tEvuP+DYq1GJWijbvTRpTMHs+pxXM5vT
	wuH5+mop52DZXpm/HBEdlrp5CDG1+/roRT1mI4HNNAhWDQYNozO3ThkHy4E/s7DWL0Ui
	C7Cfrsdgncny5+ZsSSDZQeSYtyUEQpOEYgTc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=COC6yW/CBpJP8WArRy/y8QoY94uUfu2DxlEuXr/TH3Q=;
	b=bH9KccWtoPuNFdHjzpD9fE4frMOdoosr/mnaOI3KteMOPUt0t/YzNl6wBNq4ZGcq/p
	Blq+dJgTP1R9sKOGVcjrvQ+PGd6Egp7KP1oih6LwotCCn+RC2Xxcv6tpVZFz73jndl4f
	SbTIwWm1kgox/+grezpBzeMX5vKnPhz4U7sq2EN1iPZa+OLlG3ytzW1TR17CMgJXfaol
	8q+9hH3oAhk5RY9rJtRtH3oJ4t0oy/saXFav28m50MBkB/c1CDJwD+lOFUg21gmR+X4/
	8F7GnAZzM+tYjV7Q+XpqxhrXTu0TKibVJNhzbR0QMzQvftZtaotAvZJV46Hc+Vb/8wXD
	QTGQ==
X-Gm-Message-State: APjAAAVhJuaGNqnk36syJcs1E2DIP+RF9FxAWdbEfhRgLDlm8l7fDO51
	YclmRQNT4Fw3HAjDFlBz6GnjMw==
X-Google-Smtp-Source: APXvYqwptF28a3YzJ29Hu1chK1LZ3gciKaSSLlfyzx+HwltDvNL1TFvOUJWjll0yFJkCJl/8+qG2og==
X-Received: by 2002:a1c:ab06:: with SMTP id u6mr2271432wme.125.1559727377230; 
	Wed, 05 Jun 2019 02:36:17 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	95sm38879190wrk.70.2019.06.05.02.36.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 05 Jun 2019 02:36:16 -0700 (PDT)
Message-ID: <ef60eca274a65752ac9e094d7ee5e9d29cf49f6e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jun Nie <jun.nie@linaro.org>, Haiqing.Bai@windriver.com, 
	openembedded-core@lists.openembedded.org
Date: Wed, 05 Jun 2019 10:36:15 +0100
In-Reply-To: <CABymUCMUGWxQ-CXJmjrjHMBzuOHgSHFw7Mz0QMxKVJibjTSqxw@mail.gmail.com>
References: <CABymUCMUGWxQ-CXJmjrjHMBzuOHgSHFw7Mz0QMxKVJibjTSqxw@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: make-mod-scripts: Add nostamp flag on configure task
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
X-List-Received-Date: Wed, 05 Jun 2019 09:36:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-05 at 16:56 +0800, Jun Nie wrote:
> Sorry for start a new mail for I just register to mail list and
> cannot
> reply original mail.
> 
> Maybe below change to meta/classes/kernel.bbclass is acceptable
> because rebuild of make-mod-scripts is triggered only when kernel is
> already cleaned for this case.
> 
> do_clean[depends] += "make-mod-scripts:do_clean"

Yes, this could be a solution...

Cheers,

Richard


