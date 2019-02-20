Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
	[209.85.210.41])
	by mail.openembedded.org (Postfix) with ESMTP id EE4657CA97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 11:56:42 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id i5so39632318oto.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 03:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=etbpQltrtS8672aBQ1G9baxDQbs/lRCih6ejpkfmOS8=;
	b=iPvZsu7WI0dwWG52ry7kG/T+PRQoBL0rNtmeyqFIgao3q0lnVhXAQJ0CAZFnL+3/ij
	mKNpb+mrtUy7+4YLtaj0bGriGJ22aLb1ZQ07OGLKMwv1nJbFXDywnTER9ZN+VmqL8N/U
	heorlUPiqaN26Isoezt38a0fy+O/nxKKEawM1z739lYz/II1G1eFp3Ez0EyhTBPXkFmO
	Wl4ggv3Nrcut00a6gGGA4C1IGk3zguHec8Eke0gAe9gfL1dg4PvMsuyrxvBiDUmEnOSo
	Gl/8ChgXN0jP3BIsxYt7TvMnTq7sksrWf/GYIxmnjVDP1nkIp6QMkRkIHPjlc3Rv0PJf
	gt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=etbpQltrtS8672aBQ1G9baxDQbs/lRCih6ejpkfmOS8=;
	b=T5O/MeXSfE07C2wDBd12GtJI7fJZoIbi2hwka/crhUNRY4t9aHPrSZX4LdY9cVLXMg
	gLOIs/hfpBAaX3MOlbNf8wgmzquzyP+SJwPq0fJmxgvGOQm7UCPi7t7g8t/u+l/Jyr0A
	n4TWpaEDCbxhyB6a4r9CHERB2X1pehAOpEU8x3cxrOEG5CPrJwqmnRcyN7fRWzufiSvM
	5Murks+jYCyptfIKGAWJ7e1LQKtpbQc4BXJ2HxgQ6FpSFVboxUyPJjCS3jSzSYuk4ShX
	pCEeePMvu1WNNAk0F4j+ywn4nIVoYC3YWjONC8dOFPJ972+I5TiUELn5wCycedXreuYe
	0iEA==
X-Gm-Message-State: AHQUAua2Su/pY6/b23lF9rXUlWIu+fDCZii4WQpSsybF9u7NyhWh8QUQ
	CLGSgI/OID4cN9vWAWLwlHCe7/pEvh+T4g==
X-Google-Smtp-Source: AHgI3IZiQzRUKpQkgro2yG7CTN4nN418VoDQVYiR0giH1aBmiV/50WvTPM7ubyl9n7qp0mZ1HnYxPA==
X-Received: by 2002:aca:ac82:: with SMTP id v124mr5801997oie.17.1550663803251; 
	Wed, 20 Feb 2019 03:56:43 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
	[209.85.210.45]) by smtp.gmail.com with ESMTPSA id
	d11sm6288158otp.18.2019.02.20.03.56.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 03:56:42 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f45.google.com with SMTP id m1so39685939otf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 03:56:42 -0800 (PST)
X-Received: by 2002:aca:54c5:: with SMTP id i188mr5843929oib.16.1550663801557; 
	Wed, 20 Feb 2019 03:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20190219165906.14377-1-fabio.berton@ossystems.com.br>
	<CAMKF1souMyUMczQ+-s_+W2Tomi=Q-7dj7Us1bwQ23rDS5CPx=Q@mail.gmail.com>
	<CANNYZj9Abo0ZeUVq7jgkHLc6rENns=GptXNHq9eN-j_rJ20noA@mail.gmail.com>
	<bd16855764cfba4d700e2be8c8ea7cecbf2dec9e.camel@linuxfoundation.org>
In-Reply-To: <bd16855764cfba4d700e2be8c8ea7cecbf2dec9e.camel@linuxfoundation.org>
Date: Wed, 20 Feb 2019 08:56:28 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq+MoA6w7e4E=U4Ak6=KjfejBtx+WHmXPmx5mh53cV_HA@mail.gmail.com>
Message-ID: <CAP9ODKq+MoA6w7e4E=U4Ak6=KjfejBtx+WHmXPmx5mh53cV_HA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH v2 1/3] mesa: Update 18.1.9 -> 18.3.4
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
X-List-Received-Date: Wed, 20 Feb 2019 11:56:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 20, 2019 at 4:58 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-02-20 at 08:52 +0100, Alexander Kanavin wrote:
> > I guess xrandr needs to be in X11_DEPS, this was added in the
> > original
> > mega-patch, but overlooked in the split version.
>
> There were failures all over the autobuilder from this as well :(

Please provider the links so we fix them.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

