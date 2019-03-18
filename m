Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD137C762
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 14:00:46 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s15so1815252wra.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 07:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=9tgfNE8nq1vNB2r6Uw4b21/Fe4K4KTuTAmO/WfBuow0=;
	b=h+XRW2ZYI3hlVTg/TxMsgavFypvwIN10wNOmOBigFgoM/uaZYpb3aFPOf6Nk8V/7jf
	bNDD7+WJpMy1V31de1q6coi2kok9QiDoWVsFUt0ta0MkXEa1SB+5q9uDtEukCZjoFcR1
	ypHRi5XKluNylwxY2BJv1hk36xkq5iVzd81nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9tgfNE8nq1vNB2r6Uw4b21/Fe4K4KTuTAmO/WfBuow0=;
	b=gVgqmI5UCI9FOrGxWIsvHbLyGrlPBC8poJU5ubHEOkzcqbEEXGOGBM1ufD4ovLkPWR
	94fPqA7i+/vAhXdHyscdx7a49R5S37gu7rtisb78vKuVE9LLKGsU2+4xFjHN3yP/K+6F
	ZJ//2pqegzKVLp4hUZqsIvrS4lU6L/O1Fcw7tPW9PpCX0bPTvJUsIcuigCLFFxgho4s3
	9HiWrT0Bfhajr3i5csvDae8FC0mczAPl2XDWhPQHCz/iXgbBPUH39PSFrr4SVLtAWJiD
	GJ19dWfAQnbRuZ7+qNfDxpf78xsMFoQQKbskF8MijP6HtZIhU86925k/XmSkSpE3Rl6p
	5zDg==
X-Gm-Message-State: APjAAAV3AXmaIxlTjCLs++PpjIyUFmiekdjjMjz3SbSZdMBL3P9V0JTC
	bb0U/yFETOfomK7jj5g8Bubtug==
X-Google-Smtp-Source: APXvYqz34h7Esy8QSAv8DrRpRgjXoRoFHIzL673ihE945PugYb4W9D+hSyYoQVEJYQUyT/eMdy88+Q==
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr10596477wrn.242.1552917647297;
	Mon, 18 Mar 2019 07:00:47 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q10sm8403329wrr.75.2019.03.18.07.00.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Mar 2019 07:00:46 -0700 (PDT)
Message-ID: <a4bbe97737049688cff93e4da243c112e6e79052.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fabio Berton <fabio.berton@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2019 14:00:45 +0000
In-Reply-To: <20190315212140.9597-1-fabio.berton@ossystems.com.br>
References: <20190315212140.9597-1-fabio.berton@ossystems.com.br>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Eric Engestrom <eric.engestrom@intel.com>, Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 1/2] mesa: Update 18.3.4 -> 19.0.0
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
X-List-Received-Date: Mon, 18 Mar 2019 14:00:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-03-15 at 18:21 -0300, Fabio Berton wrote:
>   - Patch 0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch
>     was applied on commit e68777c87ceed02ab199b32f941778c3cf97c794.
>   - Refresh all patches
>   - mesa 19.0.0 deprecated the use of autotools and we need to add
>     --enable-autotools flag. For details see mesa commit:
>     e68777c87ceed02ab199b32f941778c3cf97c794
> 
>   The complete change log can be found here:
>     https://www.mesa3d.org/relnotes/19.0.0.html

This failed pretty much everywhere, e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/407

I think it will be too late to get this into 2.7.

Cheers,

Richard




