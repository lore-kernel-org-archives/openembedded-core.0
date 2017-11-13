Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id DA79F78693
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 19:30:43 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id r128so12044280oig.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 11:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=VDGqrV23QCb2nm1Oa09SY+taIL4KVwNL20YeAavsZo0=;
	b=WsyaRdnYJNA7pb5AqiLkRq7wNLDkmqETeNJ1eW5eqPosIlbxL3seEZu/QP360w4tyh
	N1p6PLbCLFZbbZQ5whkJyQLuLYSvn+wYe4ZnPQ/6Do/BaKm6WVJHrSispmLkraCPMTlI
	IOzh1/PgjUQ+haY8n0EziLRHvLVNv19sM2QapN6YEw2T7ittW1oFM6XNZrILUEXkgyLZ
	ddYLMR0mQw7g0jr0kbk1prQpzFHoUi9UdzBeP4U8qiD+j+0cZFyeSYe++uAT21XW3rTp
	YhIX75NffY9hpvGJnBVQ6yT/Rb44w8BvnzEILQcUV2C1vU4kJu143kJxsU2opmyqWej6
	n4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=VDGqrV23QCb2nm1Oa09SY+taIL4KVwNL20YeAavsZo0=;
	b=d2wzILI0k8Z4AjKq0WIRmFZtlbB2BhktlKvEKbvO+ED4O3+qiErpQ2fEHu4vutqbJZ
	M0NdmPGshU9wayR2Qq0rHOJRu0O644/nJZlYKEU1nEG1tAhnmSnP1yejyLYURt0lTeS9
	xMqCjUAJ5IVi54yXk9SZMpBnMl2WH//OziEy/jdbxUsUinQRUA6jOuy+jR2NnINLM2kq
	gc1EdW+LAUSRUyBVlt14nllICwUb+wK85PCji6KyN1PtoTUXqdyDzMhjU1RKm4CskA3s
	JphxJ9oqsLJCdh37fdfGwyc7UvVtg3yaG4RvXarRuXXYMMEov/5476Rq/uMeAPcomYgQ
	04sw==
X-Gm-Message-State: AJaThX5U/0XyzipdFkOBUzPd+PHYK6fhO3zvmdg5H3vfEEu9LMvDuWWA
	EWdXBVpJ0S4blGioyG3pjSjtBgDJ
X-Google-Smtp-Source: AGs4zMaEJT2MzzEGr9tSq/ZflUeSBDCA/o9bQFa0vy+F+zR9cIRRk21cp1m/LkcPxpWeyxczvUWjoA==
X-Received: by 10.202.213.129 with SMTP id m123mr5940868oig.187.1510601444581; 
	Mon, 13 Nov 2017 11:30:44 -0800 (PST)
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com.
	[74.125.82.177]) by smtp.gmail.com with ESMTPSA id
	a45sm5030157otj.73.2017.11.13.11.30.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Nov 2017 11:30:43 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f177.google.com with SMTP id j29so11188531oth.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 11:30:43 -0800 (PST)
X-Received: by 10.157.4.65 with SMTP id 59mr1220702otc.364.1510601443156; Mon,
	13 Nov 2017 11:30:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Mon, 13 Nov 2017 11:30:42 -0800 (PST)
In-Reply-To: <1510594546-27018-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1510594546-27018-1-git-send-email-richard.purdie@linuxfoundation.org>
Date: Mon, 13 Nov 2017 17:30:42 -0200
X-Gmail-Original-Message-ID: <CAP9ODKquk8Cf-chkGCRTpPurE+ABQZgzgAs=3M4hp0qV5NMWug@mail.gmail.com>
Message-ID: <CAP9ODKquk8Cf-chkGCRTpPurE+ABQZgzgAs=3M4hp0qV5NMWug@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu.inc: Drop rng-tools
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
X-List-Received-Date: Mon, 13 Nov 2017 19:30:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 13, 2017 at 3:35 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This was included to allow hwrng to feed data to /dev/random. Since the
> kernel does this itself (confirmed by the recent kernel Kconfig text change
> , code inspection and local testing), we can drop rng-tools from these
> images.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This is still needed for QEMU ARM.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

