Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
	[209.85.210.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7B46B463
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:48:20 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id 32so19358335ota.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 00:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g3dhaVbNuOmUT5+wFlMOqYu3cK+pI3VY4+8x9+jfmdo=;
	b=GJ1/fxC6V9P9DLLjxJOZ8HGSl5BJrJwd+JPvhS7TPKRRELO6ebRmBW9ROUlt/dBWAj
	1GWKmv3GKqJqqNTU97vJqUQfY8x2xhElvyl+yqlAK1YuKUofYAQOYmkDqzqYfCIqp04l
	wk+/z8i25xm9Ud4dFinlTh7z+BL0f04xp8bgpsvmW+0mbh/xYr+5dGA6GRfRQ3Dga1n6
	f7LYf8d+tFgPLak5rRrF+3yu3g50HIgpb7vP/0qYZwWrSdInaaILX8FpmoYRouBu1FnY
	oT14qN+BKMngPj67Hl7XQ7mtjRPWlCd8I+lQ2UP7dBSSTKQRS9peqmH5hACuxG34SIIk
	jf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g3dhaVbNuOmUT5+wFlMOqYu3cK+pI3VY4+8x9+jfmdo=;
	b=TGFlXsrXDFGMb5UNWDkRvtdRR9ebIWYv0R3pbRWo6/U7DtHouNNNKN1+WrIQVM795a
	PMKOJn6w/1thFU2KjkM8rFEtMj6GMq/t7/lbvQ/4fHVnLXSuXTJjoLTtq5kMf6t/9vv+
	f1vHc11SQORQ3K3Rs+03dOUH2E+fpWjzmAkrbRQe//WX7FnVdMP7mweKuRU5O2udjaqT
	ms5tZBlXfj8b6h7mrSpTHJeWSUKuofB9uvCuHW/OpNHCbQLBt7QZWyA9Z4I9/cXnUiCh
	Mnj0H76JpeDIcHUciV/+pNwZI7Y3kMG806U2T9cfD0V/rQKRCGjnZQzYWimmPp8AfQtq
	LW/w==
X-Gm-Message-State: AA+aEWY/kRp/R9ceKEjELJwx+h/4XoZK/HOO7bL0mINuNtxsL8He2Mhr
	oCDBBGtooGy1WbwlgcKujGFPLLAFMkwVWKku+EQ=
X-Google-Smtp-Source: AFSGD/WdpndvdRa0K3UYKbYyLAbDbxG6OPLbq1HbzAtEOTh2ybEVNXLx0ZLTI5duylJKP0uy9oNHzAzasjX3qDCOKzM=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr17133238otl.12.1543308501556; 
	Tue, 27 Nov 2018 00:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
	<CAMKF1sqst3bNey6Gwf2bTa_oKOVrFjKsWcPcM4sbAYTp3SxA3g@mail.gmail.com>
In-Reply-To: <CAMKF1sqst3bNey6Gwf2bTa_oKOVrFjKsWcPcM4sbAYTp3SxA3g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Nov 2018 09:48:09 +0100
Message-ID: <CANNYZj_H=i+Oa9JKaXaAVW6_vy-9o5YgDOHE76g1Q9L5=K5Jog@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/16] gobject-introspection: update to 1.58.1
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
X-List-Received-Date: Tue, 27 Nov 2018 08:48:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Nov 2018 at 23:29, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Nov 22, 2018 at 7:42 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Also, change default meson option to building introspection files
> > (previously they were not built by default).
> >
>
> I wonder if this is causing
>
> http://errors.yoctoproject.org/Errors/Details/202291/
> http://errors.yoctoproject.org/Errors/Details/202280/

"Could not find GIR file 'Gee-0.8.gir'; check XDG_DATA_DIRS or use --includedir"

This file is coming from libgee - it has the necessary file, but does
not install it for some reason.

Alex

