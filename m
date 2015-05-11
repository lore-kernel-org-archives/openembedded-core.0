Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id D2D006013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 06:54:55 +0000 (UTC)
Received: by layy10 with SMTP id y10so86662921lay.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 23:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Biv2AWHh64pt6jW8ojsiIbvG/fvWvmWVPObLzUNGKMY=;
	b=hGDdCYw/nswP9LMurOEip2F+flFin7F4nV1bbSIPKXdgv0NO77Sx3/TQx5LoGACiva
	Iv17o91iJVrcYZNNzq6kLynAFIL47BK35Mssfyhl8JIaVrV9dMGyqUU6PbfzHHHZ9ToL
	U2xrYaoUd4EJJETMmrMIvoGoZ+sQDyCpLTHOnt5U0ZRsXkoGOImNt7btAV3Q161kZVa9
	E/7VJ92OCrOCrx/VMUNVpRkim1+WemxjWdPn7ajW4R9g4tvUZoGHu4A+jMZhjCECGdmz
	IvbCfaKGjH886ZIwQ2OcvwaKMkzFUv41JyRHxhdRpQO4acVGPqZixzW61i/2Gg0EmFRf
	JwBQ==
X-Received: by 10.112.119.163 with SMTP id kv3mr7053511lbb.101.1431327296755; 
	Sun, 10 May 2015 23:54:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.27.15 with HTTP; Sun, 10 May 2015 23:54:36 -0700 (PDT)
In-Reply-To: <1431208810.30971.2.camel@linuxfoundation.org>
References: <1431097454-28641-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAJ86T=UDg+yZPgsuuNXqV0ZENMTAatbnx1qk1LxscwTfN0ndkg@mail.gmail.com>
	<CAP9ODKqyMGSov5FpbWkwN5cqVrHdCmP5ZeHB31+2Q6vhQB-YJQ@mail.gmail.com>
	<CAJ86T=W2chZiZXvey7oeuisVYTEHkukKMQ5jFioZaA9HFY+vFQ@mail.gmail.com>
	<1431208810.30971.2.camel@linuxfoundation.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 11 May 2015 08:54:36 +0200
Message-ID: <CAPybu_3mTRdhPpN7Y3x33E=L2i0hy-rpCXTZmoqaZpXL=O1sBA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gstreamer1.0: convert GSTREAMER_1_DEBUG to PACKAGECONFIG
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
X-List-Received-Date: Mon, 11 May 2015 06:54:59 -0000
Content-Type: text/plain; charset=UTF-8

Hello

On Sun, May 10, 2015 at 12:00 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

>
> GSTREAMER_CONFIG = ""

= or ?=

> PACKAGECONFIG ??= "${GSTREAMER_CONFIG}"
>
> then setting GSTREAMER_CONFIG = "debug" could do what you describe if
> there really is the demand for it.

Shall I send a patch to fix it also on plugins?

Thanks

-- 
Ricardo Ribalda

