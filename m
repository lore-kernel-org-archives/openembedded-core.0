Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6A05060AE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 03:12:31 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u25so36489669qkk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=O+EdPWLgF2khGMgcALsX8fi9IZ3UnOTCYhYUoww8Ak8=;
	b=xqjLGdLXNPOcqa/Csv9ChGGLBQ3/sOk5QeixBQnad6E5cg1p+ig/RqNO5zpxIAmZQy
	b5Zmiv5Y8c4sDd0wuz88AyYCBfQnwOAnJ4vc6VdW97J1TOtidiht4/YcI1NZvhVLwogU
	bokcL0yALuK/x0mQ8a4dZC34OJs0Qng7k7Kra4crv9hGQopsSYLtfVQb1YEMJgcjvkiQ
	+8b1WxQaoPSz7p3Zujph6BpISS07/jvSVcLakgGtU3RU27j0vAvBduFe920Xz1xyx/UW
	+GwwuLUWhxfwE/iZ0UDwQym3WIUxONwhI6TQeRjXsi86eZaxwrm4rMrI9dT5VlOzaCi4
	NCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=O+EdPWLgF2khGMgcALsX8fi9IZ3UnOTCYhYUoww8Ak8=;
	b=Sr4dqTrT0LZicEhd+IrN3FjHW3zVm6D1o8eDVggWwuyU55S3qKaqN97NF6Y6r16Yw+
	AzIWS69p+G9K6d2QEzaSP/kGgOuPxZQaSleghg9r4fKuALJRfsDz1KXjIP7iRk+ZyiUQ
	Q6FjV4+ql6fySmzhY/PLqVeIyzT39PWFPdl13qao1FoP/gbXFwGAjQSCRlWndJQLNKJb
	bZCBpOYImPtsrDVPmdL52+0TCOSTKmueHqBY+E5IcjsH7Jmv17T9onzLVsnV3e2gVzmI
	t4tUMti3+PoMbSoDlf5hZh4KXlTL/SdHAnltmQ3qI5WB09JWYPeCT+PpB4Wh0PbQY+WW
	oq/Q==
X-Gm-Message-State: ANhLgQ2L1Hon+SQTQb5J8nobyvozWFRC15XwQCL9MBsHBJxtazoSFweb
	6zwX9L1RfqbpWUof4ScvjydvR3Bqym0BMA==
X-Google-Smtp-Source: ADFU+vv3YBuMii0RtGrG/1TcA/BMkby180vtuVTDFzA48kvwr/a4mS8eE1lD+KeqiUzPRVApQ0YR/w==
X-Received: by 2002:ae9:edc4:: with SMTP id c187mr2086827qkg.369.1584501151837;
	Tue, 17 Mar 2020 20:12:31 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com.
	[209.85.219.53])
	by smtp.gmail.com with ESMTPSA id m19sm3311285qkk.1.2020.03.17.20.12.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Mar 2020 20:12:31 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f53.google.com with SMTP id c28so12142120qvb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:12:31 -0700 (PDT)
X-Received: by 2002:a0c:ed34:: with SMTP id u20mr2243578qvq.226.1584501150706; 
	Tue, 17 Mar 2020 20:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
	<20200317152303.4600-9-alex.kiernan@gmail.com>
In-Reply-To: <20200317152303.4600-9-alex.kiernan@gmail.com>
Date: Wed, 18 Mar 2020 00:12:19 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoH5vfgAzF3hsH90qWAymd_o7J5BGZrfCpBSsM4e59v5w@mail.gmail.com>
Message-ID: <CAP9ODKoH5vfgAzF3hsH90qWAymd_o7J5BGZrfCpBSsM4e59v5w@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 08/11] systemd: upgrade v244.3 -> v245
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
X-List-Received-Date: Wed, 18 Mar 2020 03:12:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 17, 2020 at 12:30 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Refresh patches for v245, enable userdb by default. Update musl patches
> for additional missing stdlib headers. Add musl patch to avoid gshadow.

Please move this commit as the latest one for multiple reasons:

- all previous patches are fixes
- most could eventually be backported
- they could be merged earlier while the upgrade is under test

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

