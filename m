Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0471865D00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 00:15:58 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id s140so126096621qke.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 16:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AvJQPMBIj28cQdm7Ika0jlU+aIYpkLIY7hKPfR1xrTs=;
	b=VhVUVuEtANFGVM0qz8GmgniiAgWkY6NmkZdSDyVd/siTs8ZbwJdj7GWc2zN+JTxh9F
	DiVHtZhnH36av0SEFG79FDaN1kaNNA3tCaOdbC+LXARNyo2D1jb3gkUKN7KItu5kafgJ
	GipCXjNOKryhmmsmW0yRp9ZzmM/rDw23jigjJSMVd14Qc1ey9LOs++LOe4TWdYluWtXC
	wYSb1rAkRzTTN1BmdRFRwYAssiZMjfq7FtW+NsatC1EmC+XZZniWsmCsXdvO1LMK2zgJ
	ITRFrYh9WfO/qH6OO/TRHto7MLtKkCP0NTsbX9sztpnsBti3FPk1ejIjL0J/MugjIVvb
	ouWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AvJQPMBIj28cQdm7Ika0jlU+aIYpkLIY7hKPfR1xrTs=;
	b=DrXeeqeHKbUXbVNYonw8DJnS3CAeSP+qvi5Wi5RQVtW4/G1Gp90T1eRssA+gWu040V
	dZdmOs3pBk/GptKbfqcy6dRrcbINazORVkOCKoQ0THqCvBLSmhNLLnYY/1hjuEPR3u7R
	W9z2nNvcwZQE2bfqHH4GQsHxxg55q3jbOwB2fhsI81L4dFKP7oitCAmqZHxSaT5DU0df
	AgiLHbiOHRarApDWXxLulVikZN51fuUQpNOqllAjSR9PYh3qg93Sfll5s/z5k6KVm2yp
	OLRMvShjpssGFDpcXXK4Epzi/Mmw51zQho0wsMqtitrkPnIMC4oMSv7t6ppW5tLpviDN
	XVnw==
X-Gm-Message-State: AIkVDXJhGv622vF0jaiDX2WF2UewpH1MKydhSPdGq/xHN+OzwCFcGS4l89WwNikfTUBcjeNl40glE1cvrzHdNK01
X-Received: by 10.55.106.193 with SMTP id f184mr460346qkc.36.1484698558751;
	Tue, 17 Jan 2017 16:15:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 17 Jan 2017 16:15:38 -0800 (PST)
In-Reply-To: <CALbNGRT+hHsE6M1iZwoMqkFTCOTd81K5PaEeH6KrqSZk=P0b9A@mail.gmail.com>
References: <1483300393-10174-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRT+hHsE6M1iZwoMqkFTCOTd81K5PaEeH6KrqSZk=P0b9A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Jan 2017 00:15:38 +0000
Message-ID: <CAJTo0LbCrng5j+KCCJXS9gBjNWY6--CHx6g6HbOEPahE+bRAqw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] alsa-lib: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Wed, 18 Jan 2017 00:15:59 -0000
Content-Type: multipart/alternative; boundary=001a114ff8c231c1910546535217

--001a114ff8c231c1910546535217
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Apologies, queued locally.

Ross

On 17 January 2017 at 22:30, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:

> Ping on this series + follow up
>
> 'alsa-utils(-scripts): fix compile on build machines with
> python-docutils installed'
>
> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114ff8c231c1910546535217
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Apologies, queued locally.<div><br></div><div>Ross</div></=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 17 January=
 2017 at 22:30, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"mailto=
:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@googlemail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ping on this ser=
ies + follow up<br>
<br>
&#39;alsa-utils(-scripts): fix compile on build machines with<br>
python-docutils installed&#39;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Andreas<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114ff8c231c1910546535217--
