Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 30E477723C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 17:41:08 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id kq3so8766435wjc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 09:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=QwqHAYu0wHC0Tj642zkLf0JsP0Snu435Y8UTnVE8mUg=;
	b=ev8uvJqwqAW54diKr0adH5EC2qo/SSdhVR+sa90zbzVNI9cMOX8QEN+surWftNdPpP
	fNyo8+FnFThv+Vdu187katCosxvpcXIYIEM7K1fQw9SguQzJM+T3ixlCH0NCRBwiwfLk
	bpH2Ws9wrNmhGlH/6DeBRHwn8mFjjOi56j3p7OQ83fJ4u1vX7pHpB2TfbZTMaKRwccTh
	pRd+48DiWUqVWHrlPrMbwbtXgSPJr7xzSxAHo7ihA3wceho+VYOcwZufPn5lTfeq5kIX
	1Xu/8xm5VdKIoUmayTjB26WJXoq+U/lzlpx4xwrfVevPluCBfV0T130Q4lMnsftQtksn
	zl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=QwqHAYu0wHC0Tj642zkLf0JsP0Snu435Y8UTnVE8mUg=;
	b=Ybm5KASdA6JKhfsmty9VDiBfXIr/RU6oRUvIJr9yDY8JzdvPYzhUOLLYGKSNcV/vhh
	1hrRPnXm8Hi/1IYNIyTXkD+mofl6qgFgViH9hMmGdZhop3TzMJovCyMIxEBvogzXJyh0
	N6dBCagXjb20tQW5iRjuJw6vkEanR/f6c6g9e1gF2BSS5uNzh11kZUw/S0DSliNIpCKX
	glLVziUbCs3vW5o8z+jhOoDuzzOTxXIlaC8sSxsbmZ2JJySF9zlms2IOzx9iBXDs2lp0
	JS5me25vz7B3sejQ/AFgQ0TdIAz7piq30cPDqEuzAYI6pljMY81DoNYAE56jOp83uyqA
	LXRQ==
X-Gm-Message-State: AIkVDXKOlyOErjODLIY9dtbEnxy8TXxkEz1l0xoC4Fl7E8uzrpXhp/eqmdmEX1ftlfVbDw==
X-Received: by 10.223.176.93 with SMTP id g29mr19743843wra.7.1485798068609;
	Mon, 30 Jan 2017 09:41:08 -0800 (PST)
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com.
	[74.125.82.44]) by smtp.gmail.com with ESMTPSA id
	w204sm19796924wmd.17.2017.01.30.09.41.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jan 2017 09:41:07 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f44.google.com with SMTP id c85so224387811wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 09:41:07 -0800 (PST)
X-Received: by 10.28.44.66 with SMTP id s63mr14205171wms.77.1485798067155;
	Mon, 30 Jan 2017 09:41:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.69.17 with HTTP; Mon, 30 Jan 2017 09:41:06 -0800 (PST)
In-Reply-To: <20170130162700.27969-1-fabio.berton@ossystems.com.br>
References: <20170130162700.27969-1-fabio.berton@ossystems.com.br>
Date: Mon, 30 Jan 2017 15:41:06 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrkFx4co_0gxTQpOj0HuG1H+O9DhL4GJFJ-8_e87QdNWQ@mail.gmail.com>
Message-ID: <CAP9ODKrkFx4co_0gxTQpOj0HuG1H+O9DhL4GJFJ-8_e87QdNWQ@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd: libbsd-overlay.pc: Set Cflags to use -I instead of -isystem
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
X-List-Received-Date: Mon, 30 Jan 2017 17:41:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 30, 2017 at 2:27 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> pkg-config currently only handles -I and -L correctly, but misses
> -isystem, so we need to do this workaround to fix this issue.
>
> There's a open bug in:
> https://bugzilla.freedesktop.org/show_bug.cgi?id=99516
>
> This appears when building lldpd and shows error:
>
> ERROR: lldpd-0.9.6-r0 do_configure: This autoconf log indicates
> errors, it looked at host include and/or library paths while
> determining system capabilities.
> Rerun configure task after fixing this.
> ERROR: lldpd-0.9.6-r0 do_configure: Function failed: do_qa_configure
>
> Change-Id: I83255b5952e19bb2f516b1186276cd03eb67eed3
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Also, this  should be backported to morty as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

