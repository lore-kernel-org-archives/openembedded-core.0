Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFA0FF8868
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 14:18:36 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46401.1777299511861524831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 07:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WhAc7Z+N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.177, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-466ec4c6846so3323993b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 07:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777299511; x=1777904311; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FqHySTFRmMyGnMHMcmus86si6rtFAIeSGj/acxXlVPw=;
        b=WhAc7Z+Nlj60JF9xmBtwwc+J2n1ymdmXmR7dXZSlvixEgXpLe/QNXLM/fkT18B2XG2
         mQPVvfZGa+jKzwlW8COaYe9iJsUPvpxP74FFstslkIdg5eTWYHhEXvVXLCFLYu5j4W0g
         C4mGiP8wViEFw+K8uI8acPqBoGm3E61+9a+DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777299511; x=1777904311;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FqHySTFRmMyGnMHMcmus86si6rtFAIeSGj/acxXlVPw=;
        b=NqY7qJ0gtpN1sg+8c3zcjQQGyUI7fW7yCKRRDNwcbXN/UqhILjV3mvQHgyOCoEajuJ
         h9/5oDAKR9JW1bQBQJURdFGAV9Q1wg9u/RBgZ4oK3F8c8GGYuYQIkSAGp7DX2vnQajYi
         97UyEXtwwnKtNln0O6HzyR11j7Aw4nTq0wUwsLli9EGgEi2+hI+eQbgYBMkJiDjY2EuP
         COJw/zHdIhTvDP7qKva7XHO8z2eBX7NjEeYjS+LkqBFoETV+MtogdRrr7x7n2FEK0SZb
         6VSaIj7JTRwJ4Jel3BqOP8PXWqi1M7bH80dB3WxZwypL8ND+64rJXV/01Lna1ojR70Yb
         rjrg==
X-Gm-Message-State: AOJu0YxfG7IcbzU2Mm53+sx5c+5n8SnZGQ0xBqT17aF7NrRLXLyY3try
	xeuqP8ZJQcLZWcWjdrIgwRqAgGrJ9OuVTG85BdRZKvQtyh53KD8pzwwoaPzsaOH7g009f/QP/OL
	CzFVGWuU=
X-Gm-Gg: AeBDietGiahdL8Z0x16b52FUd7XTkz96EByeSG8YD+tGsgpOo//8AtF52/HmmqOK2fT
	1bTZzMmZ98jlsuhenuLAqWhCHVlXVZcSKRZ3CsbNRDNzJ9d1RGxZhlzISgSdRrQ3GJ3q0pDNx15
	1ZyzEJqN4032adUnQ+9GuEUbIkQTAyOplIEwLzwuA+KQPtAWAOSEq1mHymlfYkblTqUmB9glTed
	ZFbBcehTe2Tlj8idrtsT6OjcVYeHm126Hrvg+G9jX3mVniaX7U+OXprR+oVzWdnNCAHcoDIYej3
	HffwWAidpQHP4TP6BsiIi9wk8LjSReyU1QWs/l8k+/eqDoIK5def1QTxiFgemYzWbitaauViQ8S
	sxyIBrudsQB9hd4sKVrxqBc1tMZukfY2KQKn962yDdQIjJmgKjptKiNCYvM1dRrD8Vyg9ZqDdJ8
	NIKd+7teZe/Scjsu/HWUAe6zFa/3Knh3I3quldUWD9ysgtgROALKN24SvurL30gtlP5qTqoXAKb
	DbnEaKXUcr5dvC5euGKiquLTxjT1+10DK9Wfg==
X-Received: by 2002:a05:6808:181b:b0:467:462b:ab0 with SMTP id 5614622812f47-4799c91783bmr24460747b6e.2.1777299510796;
        Mon, 27 Apr 2026 07:18:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:90d5:aef4:c08f:dc6b? ([2001:8b0:aba:5f3c:90d5:aef4:c08f:dc6b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4799fc19273sm20900248b6e.0.2026.04.27.07.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:18:30 -0700 (PDT)
Message-ID: <15cda9868b5b4b0c3e28029103d8cf4090bc5a23.camel@linuxfoundation.org>
Subject: Re: gnutls p11-kit in oe-core/master-next
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2026 15:18:28 +0100
In-Reply-To: <20260427101228.GA57248@francesco-nb>
References: <20260427101228.GA57248@francesco-nb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236015

On Mon, 2026-04-27 at 12:12 +0200, Francesco Dolcini wrote:
> in master-next commit 3f2f565af755 ("Revert "gnutls: Enable p11-kit
> by default"")
> is not reverting just commit d8c97e06c385 ("gnutls: Enable p11-kit by
> default"), but it is also reverting commit e9f12f64279c ("gnutls: Add
> p11-kit for native builds").
>=20
> What's the plan there? Is this wanted?

No, it wasn't and wouldn't have merged. I've replaced it with the
correct thing.

master-next was a bit of a mess when we focused on the main release,
sorry.

Cheer,s

Richard

