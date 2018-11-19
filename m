Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC0A6C416
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 21:01:04 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id m15so183443itl.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 13:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jGDDnPQFnSOzyrdit7PRxtZTKrx4IzbBJa6Uw5YLSog=;
	b=sJt3A7EfnZ47WARqKR+4KVloe6vzDbrSVB4PWZpWE/SjHjy2PW/xP6uhyiRZ5ThN9D
	1O4YE5Nbv49jqU0Vb2hd1AwQO+S7lZDYf6+3bNyYgS3fXGBbFllB9PtcyMeAWNHZb5oI
	itylt+k4DxHpLYlMd2pL7DCtjF+3+GAXy9Q+hLEigi5QPNsKHxfl58+wjgwlEQzy+S0q
	v3L0JDrR0CAF80Vf6tOYCbOYU+K8lbhPLSHdxteeps5K8IuwVg3YJ+bO+vjCJ1m0jk6n
	9dkZa7+Kwj1ja+8RYtbqwNSTqJhh0c1pjvthTwm8EbbknWdGMcLfXEYG6bHQbb1gBPY/
	MK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jGDDnPQFnSOzyrdit7PRxtZTKrx4IzbBJa6Uw5YLSog=;
	b=N/zG3+svW9x0HbJyZY7GWK8gRe9a1usj8r/7J280JWrH9ys/rqkmc1zf9Xh/KaaeWo
	v1WkqZ04VS0CZ1CQrElpm3SOhxCgVqZ08ycOEK64iReUv09vvPJsboJ3aPv4KJUv4s0a
	cbgbHb3OZ7Y1zpU+wLN8W3Gka6JY39J9CSTOU5e9PeV41P9FmVz65z3KtczrqL2Q/UUP
	drjdLksQz2VjCydb3EEMhhTx82gZFaP90qQbz7IAQbjZzqp1lEwgYQWUG9hP8FQwiHRo
	NSqxLiw178qpycPb1goGkuccKaLM/B/vhZQxfcv7gkwKbqozh9f3fC0gJH50Py8uSh9L
	dAww==
X-Gm-Message-State: AGRZ1gKK0eNL+MIahADDqxDPOX7YpgKHubzHdj2OeWMKIGlXhnfKVCpT
	U1o/JnE2xQBbbtSRki7HMi5lra40eMi8lRNYF8jGyQ==
X-Google-Smtp-Source: AJdET5djqPrnSjxKGoT0lqjU1R1PtsS/kjRpKCKiWtibbDsN55P55Bwq7RybWq0/0hDXiRd4dc+JgFHLI411gYeEYOs=
X-Received: by 2002:a02:9c53:: with SMTP id h19mr21846121jal.31.1542661265258; 
	Mon, 19 Nov 2018 13:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20181119150810.94381-1-alex.kanavin@gmail.com>
	<20181119150810.94381-4-alex.kanavin@gmail.com>
In-Reply-To: <20181119150810.94381-4-alex.kanavin@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Nov 2018 21:00:54 +0000
Message-ID: <CAJTo0LZzskmV28oTScik==irT8tTcjni+u4r_1rnj2r-ADXJVA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] librepo: update to 1.9.2
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
X-List-Received-Date: Mon, 19 Nov 2018 21:01:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Nov 2018 at 15:09, Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> -DEPENDS = "curl expat glib-2.0 openssl attr gpgme"
> +DEPENDS = "curl expat glib-2.0 openssl attr gpgme libxml2"

packages/corei7-64-poky-linux/librepo/librepo: RDEPENDS: removed
"expat (['>= 2.2.6'])", added "libxml2 (['>= 2.9.8'])"

So presumably expat isn't needed as it didn't make it to RDEPENDS?

Ross

