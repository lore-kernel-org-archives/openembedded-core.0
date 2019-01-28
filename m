Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
	[209.85.167.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7C074813
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 17:19:02 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id i6so13667060oia.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 09:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6GWM5VjHNTNkwzdzGEiidEl0ykvF1M12z/f8QMWI0nA=;
	b=CynqNKxsicGMsM73kItkROFJiYVsAy/J+J5PFgYVrPLVwnj0hGnjif+pDGWrbAXxSN
	BzLsdf/V+/ZzDxvhuHAZgmYGNDpygBbQ11sZEhVFAwLXWw/2xlFRJM4SiZYeE/l6oZ+Q
	ZJsD1XJLWrAZN0wxwJGJwJdfpFsKz/DvLoXQ6jgxfDM9n8/erwV7l7SYLbCmdau8sU+X
	UYU6v6m6gs72yjaBLVEAShBCTlHRMcEBQ0Ae6FrBDYtjSEvKVeg9nt1/51rpw6QqK7Tz
	uAs26OYm+wz98GOUdlrilJv/dbmVnI/3tFQ0XJNZUVZ46FoHQMT35q9TYpj6wF89pdS9
	i+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6GWM5VjHNTNkwzdzGEiidEl0ykvF1M12z/f8QMWI0nA=;
	b=GaVW48KSbVgUXBC9lEX+qOU4LERueuMUW0Ig35KGmbigmNbbgac+ZHRZdlz+fgUXkJ
	fd1Fl2hmUjLfZ/rpeZZsWUMB27WAasBfVhvc3Z82Q5scbaWfoNczpJRlQc20febwa49z
	CepvgRGfHIsdqQJvTRsB6R1ZIdqG7omq74IiRtMB1lYCp1X7w/2dwYlp2bQSqxW1KSzP
	zTnARWvZr8tm1Ek0XeVfvSJIzhAJEf2j0Hx2Kty+FnkYQlhXT7NaJu1eTGZ1/9BH4L5d
	2rXBRMhZvNaW0Tj4Ch9TnMy9fhF+0roOjZfEDyyvwsYmKXVIrAZu0mGdY559kurvG432
	XZiA==
X-Gm-Message-State: AJcUuke9f49/zIp6XoPfPa31TyImXtYPPynS45yknSN+g2p1SxEAVnXU
	cnnYqWE/03Dapbvl4iharet9/E3nbI2n/R3GX4jODg==
X-Google-Smtp-Source: ALg8bN7+bhBXMbMCvz5ttnGAfWv2E7Ugh7Gv9g3aWul2+falWAzvmYO+//2Vw7O240PSTj3/bG8VWsuVHLB3MiNaVjY=
X-Received: by 2002:aca:4b8f:: with SMTP id y137mr6860560oia.132.1548695943486;
	Mon, 28 Jan 2019 09:19:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1548679462.git.alex.kanavin@gmail.com>
	<e5725a863ac3f610e91c0f242eb7b10307250be6.1548679462.git.alex.kanavin@gmail.com>
	<CAMKF1sprbVTsOW6PH+CTGb7gRr7yOEh6fmMvQLS5+y98R+8S2g@mail.gmail.com>
In-Reply-To: <CAMKF1sprbVTsOW6PH+CTGb7gRr7yOEh6fmMvQLS5+y98R+8S2g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Jan 2019 18:18:52 +0100
Message-ID: <CANNYZj9F21i2zWNN1TMLXoxA2pb=rh-a87YdwseBno5AUsD10A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 24/24] vte: allow building vte-native with gcc 4.8
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
X-List-Received-Date: Mon, 28 Jan 2019 17:19:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jan 2019 at 17:54, Khem Raj <raj.khem@gmail.com> wrote:
> Its fine but it would be good to know what the error it.
> > +-                GdkRGBA color{bg_color};
> > ++                GdkRGBA color = bg_color;

Sadly I lost the specific error message, but it was basically not
recognizing the above syntax.

Alex

