Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
	[209.85.210.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4626C0EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 08:52:24 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id e80so8596026ote.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 01:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GJUVc8EMm3Y3tr5UF8nq/nLuOaQRs1huu+B3i9eFgiU=;
	b=auwylT04Yp7+V68L7viwbSwhX2+XWcgF0/iGtcQRxW2fBlLrMppbrz7cHjw6qG0eR1
	0nqd/tY3tDWr1CP+PehxkBSuFFNnmrmVL1H00CwzEQWH4SkSyDJJZAU+Pl4j8jSvGMhf
	CLMu6qr3JgtmwtxSVGhsNADh+uO6yd7bmnGRO8QePGM4sBjSYiyz/aOh2RzPwQUZb/e2
	qzhLH15kR+LRoKTc6CanXH6XMtx1cBZgQpETxUiEYUoLvfqVHvOEKFzj33u/VmKhbtU1
	/h0sOiIcTIezpiAZXP8G4ShT4R9vF1IJnSO8vttOKEmhDalABHnrshVGEh7GxK1tuVVK
	A8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GJUVc8EMm3Y3tr5UF8nq/nLuOaQRs1huu+B3i9eFgiU=;
	b=Ahq+Hw67i3Z//V6ypdf6iZyyrbbLhaERKeQDeYhAnsX3/BebAgxZDj3pWbdURJcRo9
	GazzvQ29s9rvrmXdA1jffsbRoCw3bsXsaw+q4Hzkt/V0TaFc5OnhXz/BeT1GBQc7Xq7W
	ZmYIWTF/ERuEMSvQMODvV40LWg8H5FBUzuIET5YcT9f4mxfWRmiHB3osUwk4u5UQiWfF
	4Qn9QcWAk29v4FgoZ4Z0faX59kC7NXhlPuEqTVBvqfC/MzE1UsW2b0xPW/fBkzZiKv4i
	PVooB6QtuPYPvhF6eSsVA1YTjbwfB1dlLFHCn8gyIuImAdPp615copRTrC6fWRd2WON/
	grZA==
X-Gm-Message-State: APjAAAXYEGce5I65O4I9eqRis7N7rcchVQAqwOK5WSkgxeRXb5UjjV3E
	yN67CtAXigNDgIZeK1CL1PxO/dGvyJhl2YEpjok=
X-Google-Smtp-Source: APXvYqxx3yq4uoOp9/U1J50HJ45Vlr8JaiWVm9ippa4iCcoS0Ukn4I67GVoxAsvG1P1bFFIXv8KPZfE+LCd9ud7bp6s=
X-Received: by 2002:a9d:630f:: with SMTP id q15mr10081461otk.153.1552899145109;
	Mon, 18 Mar 2019 01:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190318012212.16295-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190318012212.16295-1-hongl.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Mar 2019 09:52:14 +0100
Message-ID: <CANNYZj8PcEf0Dg61Bhzzo=+_typNMk6NSmAtK=YZGaLGs0ndPg@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] openssl:upgrade to 1.1.1b
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
X-List-Received-Date: Mon, 18 Mar 2019 08:52:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Mar 2019 at 02:20, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"

You need to explain what changed (in the commit message).
Try 'devtool upgrade openssl', it will make a diff of the two licenses for you.

Also, openssl10 needs a similar upgrade.

Alex

