Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2666011B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 15:14:22 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so119172091pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 07:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=E9plLjSoHP38BuUHxyzQzB1kOyJCYJlzUdxo8vbwKjQ=;
	b=047lJIYgmZYJgnpi2srwdN+EYVmptn8ZpmyzlyX5jWhO6Smn8hbyvEXFGUH7CBnhlE
	2ecZgSFjfmJwt2aJb1XXOY9HcvKvtLpYT4D3nxfKIxWes+7fhujTsOon7rcCjDQo5B3Z
	rZxXZwtjauHz1vdjyFmByONChT6sgDcdIbTzfOsNviTmvNQ/UI2WdSetuQOPF48igp1X
	lztKQG/tcmbFQXCypGoOPSliT5wYKV4h/IOIk7+8i7wpO66Ct8iC+xerBFa9zZAbg7p4
	h7c5953Sm0ItLVClMAtjrl2mDcwhxUsa5SBQhue5UZDnbEQ+0sVpuCHdt0bGE8/5PZFH
	Hfuw==
X-Received: by 10.68.184.132 with SMTP id eu4mr20063083pbc.122.1448032463240; 
	Fri, 20 Nov 2015 07:14:23 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:15fe:c5db:3fca:e46c?
	([2601:202:4000:1239:15fe:c5db:3fca:e46c])
	by smtp.googlemail.com with ESMTPSA id
	rc5sm5573802pbc.95.2015.11.20.07.14.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Nov 2015 07:14:22 -0800 (PST)
To: OE-core <openembedded-core@lists.openembedded.org>,
	"joshua.lock" <joshua.lock@collabora.co.uk>
From: akuster808 <akuster808@gmail.com>
Message-ID: <564F38CC.3030307@gmail.com>
Date: Fri, 20 Nov 2015 07:14:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: back port for Fido
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
X-List-Received-Date: Fri, 20 Nov 2015 15:14:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



can we get the following commit backported to Fido if it is not queued
up already?

bash: Disable custom memory allocator
05594f86366d97975501ffd84886d37f0c72e238

regards,
Armin

