Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9047B74D38
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 13:45:25 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m129-v6so6922811wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2018 06:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=i5VKzkRcmV0jbAYo+LhjDe0yxLhz5B1R8xHwL/7OM3U=;
	b=lFlS9sdxISbVFhm1vVaNiLfi9gxtqWcptTw11VRBAxy2BDXQ84wEUmHnL+tc0DzVsQ
	yoX2VQErS9SWk187nRed1S+EF367xMgvhJ9EbBDDHRy8qPnfXTy1zOooWhxL7JSicUEi
	9txGoPf9HgG7nki8Gq3Ae9cr+9+qaGgbdPCjvQxFUuDYp0xb35D9XlJMNoicD8SSB+Ju
	0W9V3T83yTH3CCv9o8HeU0ajZsXxRdobfFEeGT9NYcz4HQu5n5vBEdI65YW8YgaCnVId
	lI6auquNZET49N8tWosuxRnhtPbkvKERDACYK6puFHnUMFnGceE3F8Uq6bDcfWDDU0c6
	a8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=i5VKzkRcmV0jbAYo+LhjDe0yxLhz5B1R8xHwL/7OM3U=;
	b=cNjYhktYZAEpdIqiNs6zzEhB2u2tfMBHo2fxp/v8Cih87vDEgRifldc5GbV5jZ+ghH
	e417D1n8lVmLcpNJSwz3ZMKqTlsUo46eLpxLI2drm5qTFclPmcOkCKZ6x9yoh8MkmRTk
	AaYHeSJeQ06jeivO+KrT/d4e2HEU/tYoVdprKOSXfzK6xWUe0QbA5sr2l99uRwRYBkfe
	1JtJGlNaGsYgzmyIfFCk6NtDZYK9grYHY3fasxpMFwlt/78GE9m/0YEPeQoFeOURyui5
	LsJ42xrznvmu6hJiBop5tmQYIPnQJqFllRS3xaIzwUflT4KgkmUwRAY0F+W7uNwpd5Xe
	dfiw==
X-Gm-Message-State: ALKqPwdUY502k7W5mNhBqC7GIEH4IOXV+8AMUEWiEdxqx9PsSMQilWs+
	BYIXxZKGZSDUnrygmFtdJZe3p5mkHtM=
X-Google-Smtp-Source: ADUXVKKkXuIeeazV3c2ZffBNzx8q9AgGBvwj0GqrUSqnVyyZhUOJtbGpIYmFIPcJZa9l7OYmYxp8Iw==
X-Received: by 2002:aa7:d819:: with SMTP id
	v25-v6mr17416397edq.61.1527947125845; 
	Sat, 02 Jun 2018 06:45:25 -0700 (PDT)
Received: from ?IPv6:2a04:ae08:1403:ff00:489:7961:466d:7cf7?
	([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	x42-v6sm1876227edx.73.2018.06.02.06.45.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 06:45:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
References: <20180601221440.29992-1-dev@sashko.rv.ua>
	<CANNYZj8VhXbaD93SpM130mx4v4b1Hjfr7fe8F30g+MR-+FaQxw@mail.gmail.com>
Message-ID: <d9184760-664e-9d92-b607-53511e8bb1c1@sashko.rv.ua>
Date: Sat, 2 Jun 2018 15:45:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8VhXbaD93SpM130mx4v4b1Hjfr7fe8F30g+MR-+FaQxw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] chrpath: fix SRC_URI
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
X-List-Received-Date: Sat, 02 Jun 2018 13:45:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 02/06/18 07:24, Alexander Kanavin wrote:
> 2018-06-02 1:14 GMT+03:00 Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com>:
>> -SRC_URI = "https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz \
>> +SRC_URI = "https://src.fedoraproject.org/lookaside/extras/chrpath/chrpath-0.16.tar.gz/2bf8d1d1ee345fc8a7915576f5649982/chrpath-0.16.tar.gz \
>>              file://standarddoc.patch"
> It's better to stick with debian, the tarball is still available
> through ${DEBIAN_MIRROR}:
> http://http.debian.net/debian/pool/main/c/chrpath/chrpath_0.16.orig.tar.gz
>
> Can you also investigate the other instances of alioth, namely shadow
> and minicom please?
>
> Alex

This is a subjective statement. Having mirrors is great, but having a 
working SRC_URI in the recipe and mirrors five times great: I have seen 
both original source and the mirror being inaccessible for a period of 
time multiple times.

