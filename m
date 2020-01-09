Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 758517FEF4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 22:14:34 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q6so9070435wro.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 14:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=vQRWTN6ybxMO0YWGzkKnJGXxFmBiHwnd8J7oYuRv+DE=;
	b=GuzF77X7U54rVGtcVO/6KrUn5iWKhZPm1JIUHliG08mKPitoJyqJ/Da0VvsviLeukW
	crNQqYZ7UNAJhdDbIUrXt/rfB3RS+F7Y8KRfykzYByuNekkHh1HhRWKY22uK35Qc8vUR
	RuIElmSENeagRLIUVI61miRpgPnR09xx4Ae+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=vQRWTN6ybxMO0YWGzkKnJGXxFmBiHwnd8J7oYuRv+DE=;
	b=Na0O1P3NEzBFRY7uJK6p5uEdmQHJObP3EKunUjcFqIv5dyBYZZTxzEAzSL5CRbueSN
	L84Ll1foNJrq3yHmeri85K6r37yaTEpX154x+/mXsQJy+WbektdhCId8h97eQl9WUnF/
	kJ4bHGteqkO+ZKSpfTVk+2/4+/b1nKpPrRCf+sKDYSoDYUryTLfSaZ4PbpjwFCowffof
	QNQA36h2VrHcQ8qFospqVoXJz9LoSuuZrjQD4hvSBKroGhR+Y1R9JQrmWebY62b9AsGj
	4LCHs5SEYzr51vLNDc7SfZ7ovKwkwQRpLG7i7JHARgq8Mf6kiTZY7ivPcYPHleEYIkZ+
	4YhQ==
X-Gm-Message-State: APjAAAWoip2DtnesltkbxZxQPnypT76IdhbwCBTXboE5heKvUCsQE9+q
	QmZ3MINjr3GOrA5jDM5clmIU0Q==
X-Google-Smtp-Source: APXvYqzcbdiSzOuH9c5IlJhAKXtYDBjaTDyl3TPfk8pTHc+Gh0d+6OtVp77KoYj/XMbF6OhuVkzOwA==
X-Received: by 2002:adf:ee82:: with SMTP id b2mr26055wro.194.1578608075203;
	Thu, 09 Jan 2020 14:14:35 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y139sm4625893wmd.24.2020.01.09.14.14.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 14:14:34 -0800 (PST)
Message-ID: <bdc3d78fb086561f839d8a6a41d2ed336ef5a793.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, =?ISO-8859-1?Q?Andr=E9?=
	Draszik <git@andred.net>
Date: Thu, 09 Jan 2020 22:14:33 +0000
In-Reply-To: <CANNYZj96gxDZnxLKzEZUy+qehNQirO87hrUeKOR9KCrPmnWsOQ@mail.gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-5-alex.kanavin@gmail.com>
	<492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
	<CANNYZj-=HOtgRiTh9xcnt9Q7c+gcm-Le26dfJeY0f3+Pt2HQsQ@mail.gmail.com>
	<8f8e989f2e630df2fcbee68f1ea18034549e069d.camel@andred.net>
	<b264b9d4f20106585d8a3daa6da6652f6ec90873.camel@andred.net>
	<CANNYZj96gxDZnxLKzEZUy+qehNQirO87hrUeKOR9KCrPmnWsOQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/28] python3: update to 3.8.1
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
X-List-Received-Date: Thu, 09 Jan 2020 22:14:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-09 at 20:49 +0100, Alexander Kanavin wrote:
> The problem is, I couldn't reproduce this locally at all. Random
> glitch?

No, its happened on multiple workers and there should be a pattern, we
just don't understand it yet :(. I don't have ideas right now although
the build user is 1000 on many machines, 6000 is a minority.

Cheers,

Richard


