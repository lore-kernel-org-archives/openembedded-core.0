Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4D86C45E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 15:19:37 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id i26so1868153lfc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 07:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=nG4zDwNQuZCYa0ko0rkmUcXXO1LkiolJ9W6/H4/Xxjg=;
	b=Eu9sCQnRttGpbQygAHP+88flnuFVrVj+hRaVusmpKFa92M+pu85kkTV4gKHelxqtrs
	IgmBdKsDBG5R1Z9v2XrC8e5DlhvhBLlP0jRDX4yUe5jnFYTrWXsnv+3MmbJM0QXOpixt
	Zr+SguS1MviPUNu7hjg9LYzZZ7Sq9jRBx/2tIf/aGFYo1AATvj4DWaa8bfqPOmqHwaqe
	5vKL1MezUuW8YG15ebWcCTQj94VBkeIw9zRWLMkmGzVTvvYpACVlekcazmQtq36218w3
	To3OrmM2Y11KJFrgpJLIYesAto/giZrzwTBNcY0CtOL6X19A6eOWOIs/qoWy0tBW7J37
	O5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=nG4zDwNQuZCYa0ko0rkmUcXXO1LkiolJ9W6/H4/Xxjg=;
	b=m5EpP5CxPh/Eh4KKS3yLq/6Ybvsmt1y5KoPyUOYsdRX+2hwh4xYDR8AFU8bic2rJO1
	NTguM+0tZESQHWbgWgEUUvOi/ybLbobap+/0hj0wn33rmd0BP/OVsYH2pfZ2XmHs9PY8
	YasIvoYehfz8K6JoTrCH2UKtIJ5S3gMlMYjJKcx+qWL9f8X6AQ0BhzCbkgqM/E3hs6F5
	4v4unBX1S/X8c5FOlZR6pMxV99PMqW7yzxJhqA8PY34gCDhTt8ATj7coMqkqSJwercZE
	IIVmHTbT2dDv0ZmT43D7FOts4mpWofyywrkylNcQc1H4vx09HXl+XgtxSziuWX3Ym7Rt
	LLKQ==
X-Gm-Message-State: AA+aEWZwKiKwWHQhorWXzRBWwPj2aVVCkoys8ke6+SdxiuIunDKaytIM
	LnKwfR1vtVnd1cCFe4yXShzvo+LaUqzG09Vt3CdkYvfrXo4=
X-Google-Smtp-Source: AFSGD/X8GttRQYwSCLM9a5U1jOg9U3FKmKFFnapWjvNxCl7MQp6S87To8AhwXBfYh9GopVxenjSTuhIexbPHYShIp78=
X-Received: by 2002:a19:7013:: with SMTP id h19mr7344652lfc.147.1544714377638; 
	Thu, 13 Dec 2018 07:19:37 -0800 (PST)
MIME-Version: 1.0
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 13 Dec 2018 16:19:20 +0100
Message-ID: <CAPybu_0YGwMPD1N4kfN0KUb6snAowee6MfN2+tJNVaHqrUddrA@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Multiconfig and native recipes
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
X-List-Received-Date: Thu, 13 Dec 2018 15:19:38 -0000
Content-Type: text/plain; charset="UTF-8"

Hi

I have a setup with 3 multiconfigs

If I try to build:
bitbake  multiconfig:*:erlang-native

Bitbake executes 3 tasks on the same workdir
tmp/work/x86_64-linux/erlang-native/

which of course crashes. Is this expected behaviour? a bug? I have a
wrong config?

Thanks!


-- 
Ricardo Ribalda

