Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 778D17CFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 09:44:11 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id f6so10355886iop.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 02:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=A0KodTfXcSKdfLL7/RY+uskwPwAHEmFMf5kbv5vbG3s=;
	b=FDLd/uGDRkVt/vkyyXY1ekxqPIQG8xHgCJYDwpRsInOY9dT8PNMFTvH2v/oEA2RfWc
	3sXCUJg4b7mE6qeoKWz/u/j+dxC8G1NgLkOWquBJo0gBveiwbMI1Usbf+yq1vhfnNKlq
	xwtJxbgLZ2ooSci1l30zlq/UbVL2KabebOywULVD2AQmo2MHGj1YPmt88m0RX3kgihq4
	I7JRPL2QWx7kuAC2yhCPgQu72xkBL/bG1V0Ck8wEa5uoT9XvqFmTuZ18jCGR99D4JpCy
	21w5VRohGIbkKVKskepTW7StgE66zF1L0oSFwRWaCg0Sn1V09FvZ0KQzHtRdtlhd+C3E
	RgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=A0KodTfXcSKdfLL7/RY+uskwPwAHEmFMf5kbv5vbG3s=;
	b=ayhGzqNlZu7+3lapbwHsO3UD6pIqLsvraWqYvwCsCFfCrmOAK7poDx2TS8eunAmWyt
	Wf3t47W3K3upZcDMOJZ7T3Auwr/SHQ6CnkybO7AkPT7DQcwnSOj7WCgk94DpFhbudu05
	8fdY2ckPLveLUC8Tk3cjSVi0JPz/rs2LW52t4GhR0JvNkCA7d0/YoSha44tDbGehFY1e
	kNE0o4tAnDUSfVzL9zyMLVhg+ayp6q34222zcti3qKO3e3eDrQBy61qd18sA+ik7DUjc
	dCaNNDw9IGoX9gG0U0QbiPNG+hCqy/9kDYx5loRbcLTYawozfZYXbxWAq0haWWIoLLhf
	DcMQ==
X-Gm-Message-State: APjAAAXWpYwtQmgVpJ+M8dAFQWpcimFm9kvbtHtalWk8CQr/4OEzeYs+
	O5iArvyKvywohMqV9+nMGJBPaFMlvFncEUeL/Ig=
X-Google-Smtp-Source: APXvYqxCPjUzu0X1SdvfxyVNAVdgbmp6/9DVnFFiUBgLKUNAXerk15z7du+Sl9nV/wemfpOOKHRxB1XZ7SPr7eCq4tg=
X-Received: by 2002:a6b:440b:: with SMTP id r11mr12831999ioa.48.1554198252535; 
	Tue, 02 Apr 2019 02:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190401222843.31010-1-schnitzeltony@gmail.com>
	<51102B42-911B-4DAD-AB62-7C56061ADCA6@gmail.com>
In-Reply-To: <51102B42-911B-4DAD-AB62-7C56061ADCA6@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 2 Apr 2019 11:44:00 +0200
Message-ID: <CALbNGRTGZupL36OYuxmhjQhB32cKZMLp4-qRnYPrzijC59ZLOA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-networking: remove PACKAGECONFIG for gnutls
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
X-List-Received-Date: Tue, 02 Apr 2019 09:44:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2019 at 9:35 AM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> This option was re-instated in 2.60, can you add a comment to the recipe =
please? So that when it=E2=80=99s upgraded, gnutls is again optional.
>
> Alex
>
Since I don't see that meson configuration warnings make it into
warrier: Wouldn't it be better to update the glib recipes to 2.60 on
master to avoid back and forth?

Andreas

