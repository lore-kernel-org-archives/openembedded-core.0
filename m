Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id EC7CD60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 14:25:02 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y7so15909079pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 07:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=vn/fEJRusvEl701pZlGBwTn27vFTDCBEyHGrj0mTWtA=;
	b=0h5tL1atREIHs8eRer4Ddi1pjmFIKnps0zge4pXVf9oib7XQ7HexlAOkN2afadPCRM
	bg4+4u3RuLbezOPeWCcI1KTlQQZg8PHm9iOo78fJ1Codde63EyBDDANih6DEh64iygWR
	tEno40bFDbLhnzS+D5AjUnrnyb+2WWT+dCNaMQJ8AjAWJUICQvdaRvlfCg/xqzgnNgHQ
	49srwLg535JNtMc85Laa1BLzx0AhWElGEFDe0q5xReBEQtLLiAclh3GdXpEWQFeyD1Yo
	JCOhnpKNrf+kVIGZKfklik90fXkxpwH1zHkFiXkYwNKv6Fa6oxtuoKQBT2h4TgLx0GM3
	pA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=vn/fEJRusvEl701pZlGBwTn27vFTDCBEyHGrj0mTWtA=;
	b=V+zJrMo60bMhkNz+9vTDdDs8Ob8VeZfmwpCTxwJhT+sQEW4Bddojmi0FFRdFyayBrM
	oF/O4e1q6IqQhVSrVdmb8PfkKNElCZ0iuZXXGfZIGTjnItsLZ2UbVfpDeeKobzhxDKtp
	/M7im4r+zV/O0f+Veruy+AxpKowiK4ktPMHJO2uWbhWzWL4EXnyguGAvCYe8TIM4WuKr
	I8XrI2l6IaQrbL5p+I8rcA9L1TTO0YedjkA99hlnTldKRWdPiVVE0UFGrNrbkurDjkZi
	+H+8dWNBV/aYdiKwsUHJeqHcwOnx7280hEn9P3dV7gR3kjibJ7KoifrZjD2KLfkGIEjm
	dzCQ==
X-Gm-Message-State: AOPr4FUveAimxoW+dt0wOddS3vdRzb6DIbe0XB7+vrWUZ1IZN9U28Zx04dBEyiDXar1low==
X-Received: by 10.98.55.133 with SMTP id e127mr44795704pfa.81.1463408703444;
	Mon, 16 May 2016 07:25:03 -0700 (PDT)
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com.
	[209.85.192.174]) by smtp.gmail.com with ESMTPSA id
	e184sm47873988pfe.14.2016.05.16.07.25.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 07:25:02 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f174.google.com with SMTP id 206so68543727pfu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 07:25:01 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.78.132 with SMTP id c126mr45437258pfb.129.1463408701497; 
	Mon, 16 May 2016 07:25:01 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Mon, 16 May 2016 07:25:01 -0700 (PDT)
In-Reply-To: <1463405655-14271-1-git-send-email-tom.hochstein@nxp.com>
References: <1463405655-14271-1-git-send-email-tom.hochstein@nxp.com>
Date: Mon, 16 May 2016 11:25:01 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo3WfvCH7H+0HA-yCpOnTxuK5RaN6kWr=pJwW0ODGWS+A@mail.gmail.com>
Message-ID: <CAP9ODKo3WfvCH7H+0HA-yCpOnTxuK5RaN6kWr=pJwW0ODGWS+A@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Add OpenVG demos to support wayland.
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
X-List-Received-Date: Mon, 16 May 2016 14:25:03 -0000
Content-Type: text/plain; charset=UTF-8

Hello Tom,

On Mon, May 16, 2016 at 10:34 AM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>
> Upstream-Status: Pending
>
> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>

This is a good catch but the patch to the recipe is missing.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

