Return-Path: <claus.stovgaard@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 562157FA2E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2019 15:40:35 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id c14so11096696wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Dec 2019 07:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=Or+kNOeaqN7zdQZOwzDGgHfJq1JgARC83LOXZVMtFUQ=;
	b=ZOA8f4OxyfLmdhnhb6JJ2SePIp9YjNGYJPKlxrwPFQtqbTNlP/38e6yOxd9CG/Td5M
	yw6ycF8oeTI9+k/kJQj4zEvDP9ATyg2SQTtFzyK4SK2TKeaqsq375VNT9MI1JNXTa4jQ
	L+YCIPqsT5+3XSUHRIVd4GtKvLxKhaXJuir1vk+5gLQguT4qm+AytHQnqrs2dphbo270
	MW4rwzfXu4jVNaMf6eJJbt7Nv5pC2UZXmzOLMm6cYQf4xexLW3uVVU1gpWo9zV+i573v
	bmafYiJrb2Vtg0gjqTb+RN1SNknRmi/+VTxtdx4xtQW1KfNHECrt1lVNSdszUggOiOhy
	2rDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=Or+kNOeaqN7zdQZOwzDGgHfJq1JgARC83LOXZVMtFUQ=;
	b=WTXv1Cq3qZPX+7HDj2VRcwmoO4wvhsxw+XiYqNgZQNpae6bhovQnLTvFhKiV3GfDr7
	y7OcmGTht/2REXfN5BZ6J69cxv5jalAy9F60apoEKNSugNc83FH/YgzSnDEfG9SL/5Vj
	LabiIpn2X8BHnr2sMsYG7gah9z4sB+iBPDxkTYnlmC4YMzjJsGBHxQOnMYpvir9mDyxJ
	nZ0aMrI77VwRPQqaq05ctTcjXJ8g27u5Cgt5KL0JL0pl7v2u9ZG+b075tlU1wzKsTR3Q
	I69BIuvNSsFbpG/AyFAqj57YvUNnEYa7kJmH6pDAQ4aRWBV3axB1c5rhJmNnqJ47VhF9
	wysg==
X-Gm-Message-State: APjAAAWL9Pi9/4lRBg7k+Rz/4JYchd3zlO834w7KdXEo5rDh9chijzUi
	fuG8nqBMnGRR12Lbc7+3hPvZxOh6
X-Google-Smtp-Source: APXvYqz+HorjBmbSCLwKIrkLuWXi9kU4pjAiaicLUjXNefkq0mAPM6rmNQ8zkuWKfby+IYr1CwI8YQ==
X-Received: by 2002:adf:dfc9:: with SMTP id q9mr17133675wrn.219.1575733235354; 
	Sat, 07 Dec 2019 07:40:35 -0800 (PST)
Received: from [192.168.1.60] (0126800801.0.fullrate.ninja. [2.110.44.75])
	by smtp.gmail.com with ESMTPSA id
	a127sm7487130wmh.43.2019.12.07.07.40.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 07:40:34 -0800 (PST)
Message-ID: <8746d8e88a538d8abede3a76718fd594ca895af0.camel@gmail.com>
From: claus.stovgaard@gmail.com
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Sat, 07 Dec 2019 16:40:33 +0100
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Subject: connman dependency of readline
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
X-List-Received-Date: Sat, 07 Dec 2019 15:40:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

I am starting to use Yocto / OpenEmbedded, where I was looking into
using ConnMan as network manager.

Though I was wondering about the readline dependency.
Looking at the recipe 
https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-connectivity/connman/connman.inc
it is set to always depend on readline in the DEPENDS variable, even
though as far as I know it is only the connmanctl which depend on
readline.
In EXTRA_OECONF the --enable-client is hardcoded.

The client is though not included in the image unless you also add
connman-client.

So I am thinking on creating a patch where I create a
PACKAGECONFIG[readline] like bluez5, as I would not need the client and
will need not to include readline because of GPLv3.

I guess email is the prefered way for patches compared to github pull
requests?

Instead of my idea of creating as PACKAGECONFIG[readline], is there a
better way so it is only included if connman-client is used, instead of
just connman?

Have a nice weekend.
Claus Stovgaard






