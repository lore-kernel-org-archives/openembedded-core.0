Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by mail.openembedded.org (Postfix) with ESMTP id C28797D363
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 12:17:04 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id j10so5035240otq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eu0h6kkE0DSyozBF+rE+1XjKT0+8k+nL+XPleadqP9M=;
	b=QRyg4RxX248SbT+gsmAyc1bvTBdE0PHw9Aqj9BEov55Z/T0JSUrawyAFPikBwfO7fA
	BLto7IGn8seqevn0RcqJzK+D6aZKPgFkggx4Gli4A9LRDgPt1YUKFMmWCCniwKtyI7qa
	kInqF6wPSySlewBfgAzJ/Jn75NzlSy7AnRLosSlV+10un9AR76tFDMOjeYtGEGH/fX2i
	fXl1Qhpl8pO95+NmHxO030D5oGIMp9T3HRK/f0joL7r6uwxN3QFVcGIfzi46JpwOGyk7
	/M9HcuYRX68kj0sG8FPOHXty2To+70r2uSrPBYUBHrgah08avXeqwcdAcElQSGige989
	YNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eu0h6kkE0DSyozBF+rE+1XjKT0+8k+nL+XPleadqP9M=;
	b=eab37z83Pnuqzjb+Oov1W4vaKTXvtU36zYemXVcnAlMoxCSVaINtw3y8YYFX/aVfPl
	qcjwrjutR8UI5vgpC9wyq4wScnVyQnvvnkM/g0TkbtFltLM1l2K3P2dWbMm+VcCRk4fO
	YwFp9Q6LfL4wp9TzOTmmmsbfoJp3h/brkX+2pw5bMTXG4aGKDnfMGKLGfdrwpim6i4Td
	AiCEelayBdOKhMPiNuxs64Gpfh/FAvGfGmZVIDWFxtEYGnLg3ghWlP7DHT5qO8BvaiZn
	eSRFlX43N9jLedIqiLlfmBGUyp4hFjrtkh+MVtEJCgQAPDKJzrijg1INXZ+022h9GtRw
	mU6w==
X-Gm-Message-State: APjAAAV27Tp9vssCSoX4JO2P+qWQNz7hQQ/HySptRnrP8XaOqY50FgIy
	kGEGMfYEAOWGW+45tT0G/hSLmfiNoGas1jzlNFk=
X-Google-Smtp-Source: APXvYqzMHAcRBdETRWaN+eoTROP0lzlnTota+3+K5HxX0NddRPm4FgekcprWZawhwdTsQ7c8Ik4GzRJiH9QWQfuTvJc=
X-Received: by 2002:a05:6830:16d3:: with SMTP id
	l19mr30719964otr.92.1554985025736; 
	Thu, 11 Apr 2019 05:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <1554995545-20943-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CANNYZj_rYwg3Y5uDxKiwzJZrzMsmjLCNXOU2TMpgmB5Ydgt2sw@mail.gmail.com>
	<60b0b95f4227efd2be7ac7908b92aa08243de396.camel@linuxfoundation.org>
In-Reply-To: <60b0b95f4227efd2be7ac7908b92aa08243de396.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Apr 2019 14:16:54 +0200
Message-ID: <CANNYZj9UUBV1=RWTpwco1wGqctacKrPNRkjMCB-naCWAMUJW=w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dnf: Enable nativesdk
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
X-List-Received-Date: Thu, 11 Apr 2019 12:17:04 -0000
Content-Type: text/plain; charset="UTF-8"

Presumably to be able to put dnf into SDKs?

Alex

On Thu, 11 Apr 2019 at 14:05, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-04-11 at 13:19 +0200, Alexander Kanavin wrote:
> > On Thu, 11 Apr 2019 at 08:13, Zheng Ruoqin <
> > zhengrq.fnst@cn.fujitsu.com> wrote:
> >
> > > +RDEPENDS_${PN}_class-nativesdk += " \
> > > +  python3-core \
> > > +  python3-codecs \
> > > +  python3-netclient \
> > > +  python3-email \
> > > +  python3-threading \
> > > +  python3-distutils \
> > > +  python3-logging \
> > > +  python3-fcntl \
> > > +  librepo \
> > > +  python3-shell \
> > > +  libcomps \
> > > +  libdnf \
> > > +  python3-sqlite3 \
> > > +  python3-compression \
> > > +  python3-rpm \
> > > +  python3-iniparse \
> > > +  python3-json \
> > > +  python3-curses \
> > > +  python3-misc \
> > > +  python3-gpg \
> > > +  "
> > > +
> > >  RRECOMMENDS_${PN}_class-target += "gnupg"
> >
> > Do not copy-paste large chunks like this please. Assign the
> > dependencies to a variable, and use it where needed.
>
> Its worse than that, those are target dependencies, why would nativesdk
> need them?
>
> Cheers,
>
> Richard
>

