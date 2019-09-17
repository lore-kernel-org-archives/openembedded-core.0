Return-Path: <dbaryshkov@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id B24847F879
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 09:33:40 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s17so1272821plp.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 02:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=H0wxQBYWXNlSHeC5MTOCXDGDjdnRBNfXUBI3de71Ryg=;
	b=JIZMT0zzELzSWYQ8AKijd2tLm357O+WZuAcP+MzXmoMwdPEIMqqu0GgHYZoeXzA69M
	tC/b8DDna38dnHsgqg8Gr7gn9vCSXOYzW5eVE4n7rhZImhhS4mcD1Zmlp5s65fCdLcIS
	EbQskQhWJPc3pyF1Y1kFEQR6ugiVEcXYw690Q6KSDtoEXiq5yIG+JbSATd1fMDMxQfD6
	zNimYaLTwDq60XC9hGu2BOGl+zipW0YAxxaDIgD9QuqZy72Hg9vn/aGtSVRjJI6hdIDF
	GfCNvC6KXZ4YBd3tcu7GV4LJlwJMafirPB52yXLfaXvzKbIWJGgbpMgXVUYfbEw18NMh
	ARWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=H0wxQBYWXNlSHeC5MTOCXDGDjdnRBNfXUBI3de71Ryg=;
	b=tZW+tQLZBs289FfDFGMcNCCKCvLDjskrPHRpGLNCTorrZo+1QfsfuLUCjwWpfEo2um
	RrpxBKEn1mb09Tf2jItQSBdeT8p7AoadT1kg7UGBxDwJwXi1xCQIw70Mr7iIc6MnsSia
	ArYB+c88WFT4r2xKwLvK8jfxddKyDtCfJG+HHq3XtvMD3h7ri6eJ6dlciTi8TEaHgNpK
	xw3isTgMPmsHrxrjo7giCO9qmXf21y60wm2Q30yz5cTsXc4l0fFLO0a3sw+EOPzBVFOk
	drlrFCpzooWk+E/GGRkgBKIFAohiJUS+AKkElo3e3TaR8dLpVr+NEDy4Fnk9N0+Dd9kp
	xcLQ==
X-Gm-Message-State: APjAAAUbQ82iAzUtkoDsRKJ2xm0FzvexMmI0yiMHq7lMxnEGN9tYvmov
	gynqbWXJiCav4r+RWLk5t0qovYM2c6ioTVMSk54=
X-Google-Smtp-Source: APXvYqzv+imRFuKD1tcpvAfneQ8OquqVrzbIYRwEj40HFVllwvynFMmLMQGLqHNAibHa8AXBPXlmo23JCJNX9B/yjjo=
X-Received: by 2002:a17:902:76c1:: with SMTP id
	j1mr2695300plt.270.1568712821609; 
	Tue, 17 Sep 2019 02:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190913154434.29908-1-dbaryshkov@gmail.com>
	<23aa15d10f0bfb0cc558caa5dd84991f465dba4a.camel@linuxfoundation.org>
In-Reply-To: <23aa15d10f0bfb0cc558caa5dd84991f465dba4a.camel@linuxfoundation.org>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Tue, 17 Sep 2019 12:33:27 +0300
Message-ID: <CALT56yNwveFV09w6x0Lit0sFOZ8v3cc9_2u09mkko0-kkpzEtg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/9] uefi.bbclass: add bbclass holding configuration for UEFI applications
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
X-List-Received-Date: Tue, 17 Sep 2019 09:33:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 17 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3. =D0=B2 01:17, Richa=
rd Purdie
<richard.purdie@linuxfoundation.org>:
>
> On Fri, 2019-09-13 at 18:44 +0300, dbaryshkov@gmail.com wrote:
> > From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
> >
> > Create new bbclass defining common variables for all UEFI-related
> > packages (bootloaders, test applications, etc).
> >
> > Signed-off-by: Dmitry Eremin-Solenikov <
> > dmitry_eremin-solenikov@mentor.com>
> > ---
> >  meta/classes/uefi.bbclass | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >  create mode 100644 meta/classes/uefi.bbclass
>
> I really want to get away from the proliferation of bbclass files we
> have. Wouldn't this make more sense as a .conf file?

Moving configuration to .conf file might make sense. I even can
implement anonymous function as per-arch override. However there are
still functions like efi_populate_common() and
efi_iso_populate_common(), which can not be moved to .conf file.

Would you prefer separate uefi.conf file and uefi-bootloader.bbclass files?

> The anonymous function could be done with overrides, or an appropriate
> function from lib/oe/.
>
> I appreciate we don't use conf files so much but we need to start
> somewhere and I think this is a good candidate for it.

--=20
With best wishes
Dmitry

