Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 969A860223
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 13:25:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p9so5245767wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 05:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=d3LTRIYyJxiuD/DptiWDodu2BsRasms8PaUPtFStv/M=;
	b=SspPb2GaohTuU5lELesFaujvHHsOwCc+C+AvFLOPxe1b4/d23w0iTIhb2R9YDUnoVs
	IwR2SuhCt157GtK0SEEuXQgEFiuOtF4gKKiuiuJpMRCupaOO0/XX/Tv8iJUxmogwHh7b
	ktyvTOkkU/0U2U9yxOrKCD+ZYknWtA+9iCEjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=d3LTRIYyJxiuD/DptiWDodu2BsRasms8PaUPtFStv/M=;
	b=Tx1uL0K4Mqbq6P8yrFzIZkbwcw0tizZPGVBo0spAKyiQGyFH3hFWxpuowKORPHQ8yw
	fOI9Pxls4mnZrLbeHwwES7/ufNNy1jF8R3hphwNlI+Jfx5N0bj/qjGIOxvSn+KmSCYF5
	PQOffUUe7Fi0dMSoOvI34ekgvDOH9VhdkkrJoUoRyvRiPFO1v1yozowkQ36Tum2Um11U
	v0IVMiGQtOLqC3t3JhEd4+Bqjoni3hegzX2zVD4S9xeJjNXjnYsdY1pR6RQJTFaFLPnc
	e9cOROMkQ+TKyApSKqfu2NRRUNzc7mxAz6oYOYhBwZDgUxNUqyIlxJknRBKq1buAaMdf
	PBoQ==
X-Gm-Message-State: APjAAAXSjz5gLcnRwprTxIml/w5OplSdN/xm4+YRQLQd2Zfd0Uq5OR0M
	3MYYM+1LL89PKeKA5wZNs4zOBg==
X-Google-Smtp-Source: APXvYqxaeqaHicy/G8rewDnABFSBvyGhJZSm8FxwenqZuVjnKC0GTRWjj8NY4M5S0yGw8ZD9gM8UHw==
X-Received: by 2002:a7b:c1d0:: with SMTP id a16mr4443244wmj.175.1581168328048; 
	Sat, 08 Feb 2020 05:25:28 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w13sm7588990wru.38.2020.02.08.05.25.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 08 Feb 2020 05:25:27 -0800 (PST)
Message-ID: <6403172746ac0772f8c6d0f55838bebe5368e1e8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 08 Feb 2020 13:25:20 +0000
In-Reply-To: <20200130045446.44017-1-alex.kiernan@gmail.com>
References: <20200130045446.44017-1-alex.kiernan@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [RESEND PATCH] rootfs-postcommands: Remove spaces before ; in -ROOTFS_..._COMMAND
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
X-List-Received-Date: Sat, 08 Feb 2020 13:25:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-30 at 04:54 +0000, Alex Kiernan wrote:
> With spaces in ROOTFS_POSTPROCESS_COMMAND attempts to remove elements
> using ROOTFS_POSTPROCESS_COMMAND_remove causes parse failures of the
> form:
> 
>   bb.pysh.sherrors.ShellSyntaxError: LexToken(COMMA,';',0,0)
>   followed by:
>     LexToken(TOKEN,'write_image_test_data',0,0)
>     LexToken(COMMA,';',0,0)
>     LexToken(TOKEN,'set_systemd_default_target',0,0)
>     LexToken(COMMA,';',0,0)
>     LexToken(TOKEN,'systemd_create_users',0,0)
> 
> Removing the spaces between the function name and semicolon allows
> the list to parse correctly.
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
>  meta/classes/rootfs-postcommands.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

This does sound like you're working around a bug in shlex :/

Cheers,

Richard


