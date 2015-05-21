Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 498F6607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 12:58:22 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so107556664pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=AV6pwAN1lrpf9Ki3x4joP9OCu0V/ExviblMVWN3sjDc=;
	b=UH1M49yZkywACH2hgXq9CrxOC3XI22krgVbV3kcIygIrwCr3mC8X9poSN1eWO2U0JE
	nxU9w8cgErGSk4x7sIYPRMC+R/6xM2FysAeO72xtXWOnkWr1WlZz/n2O0wmThShfZU9b
	dKFMz2dPUOhnHVFbBTP9JM/3DqBwmImFKEQ88X3/W6edUpjqkD3u85UybhtRl6QQx7uq
	46i8tr1I3QJddVDY+Or5IkIYBwWj0yQP8lMH4N9p0L87z0msz8gEIjxk6G4cwgUG2dNG
	mcf3Aw/A4BI0H3zO4RsM8MwLP6+vywmkW8j3q6gS1dxiCvMyhI287dSZHdAvebQmSI87
	J7Wg==
MIME-Version: 1.0
X-Received: by 10.66.233.132 with SMTP id tw4mr5361881pac.80.1432213103928;
	Thu, 21 May 2015 05:58:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Thu, 21 May 2015 05:58:23 -0700 (PDT)
In-Reply-To: <1432212136-26396-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432212136-26396-1-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 21 May 2015 09:58:23 -0300
X-Google-Sender-Auth: _54igAqoZBXnVpqOlqURJcP7f8A
Message-ID: <CAP9ODKoJfyaJQ6xbS5xFd_Ns8SRsBD52-YO3SqjrURsj=fXiXA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: make buildable for x11-less environments / update to latest version
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
X-List-Received-Date: Thu, 21 May 2015 12:58:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2015 at 9:42 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> * Make glx part configurable by PACKAGECONFIG enabled by 'x11' distro fea=
ture
> * Major upstream enhancement is using pkgconfig for egl. This should make
>   those egl implementations happy that require compiler extra options for=
 their
>   egl headers.
>   Example: meta-fsl-arm/imx-gpu-viv sets -DLINUX (and others) in egl.pc. =
These
>   are mandatory for proper builds.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Thanks for looking at this. This seems to solve in a very robust way
the meta-fsl-arm issue and also to leverage the recipe quality.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

