Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id A1545707BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 13:06:22 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id q200so10278568ykb.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 06:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=UanUVCpATZuOEHHFJSgl7Cu2hTWLIhNTM8uBKrHKWX0=;
	b=iXRzMgzvAllJIzLF81cB3tGY/bIuPXfYia7wBZc4mT4cdZYlunQHadty2o86s3WS8C
	Z/H55BBLwNkrsFRkkQHU1/wkwCdgUEas/oQTsN6XMOYusY5OyyRILwfy7zJU4Z0pEWc/
	wG5eOJFVLl4/TgNOzPTrsIxz+F+iYUg2oyDdXWNNXJF2hN5vcWQ9sEdbM/3zXPH5QVgX
	EoTFEHc/QmF0CqZttirIXfpca3YgICRhFJKbZS/Sm/ODfRZryvr9X9qRsL775gXqg8oo
	jSwUyfuE/+eEjQaSCDDUYU40JA8KJQcv9ZAUP0PcJ+mVf98NCF7G4JI7mkQ9f8Rb6dnZ
	p1Dg==
MIME-Version: 1.0
X-Received: by 10.236.162.7 with SMTP id x7mr31673814yhk.6.1408971984071; Mon,
	25 Aug 2014 06:06:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 25 Aug 2014 06:06:24 -0700 (PDT)
In-Reply-To: <CAMKF1spfWfHpKV3bhqksSiw6LuuMa7POTnpp1ObTj2uUAEHadg@mail.gmail.com>
References: <CAP9ODKrHQz8yOnRy9c7E=6TOgbJuh1124uKiSPumTFdy9evpoA@mail.gmail.com>
	<CAMKF1spfWfHpKV3bhqksSiw6LuuMa7POTnpp1ObTj2uUAEHadg@mail.gmail.com>
Date: Mon, 25 Aug 2014 10:06:24 -0300
X-Google-Sender-Auth: zSvnPDWgx0PObCBW0uRE6Lah_eY
Message-ID: <CAP9ODKr11SsDWJp4ixCb+cm1B64xfzOEDHaxBeRn+R+tX0cnwg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: FTBFS: nativesdk-alsa-lib
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
X-List-Received-Date: Mon, 25 Aug 2014 13:06:26 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 24, 2014 at 8:39 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Aug 24, 2014 at 2:02 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
...
>> Does someone has a clue where to start looking to fix this?
>
> are you building out of sstate ? it may be that dependencies on
> nativesdk-gcc-runtime and nativesdk-libgcc and nativesdk-glibc are
> missing.

Yes.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

