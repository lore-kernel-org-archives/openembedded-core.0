Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id DCF946EF9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 20:19:05 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so1524650igb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 12:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eWdLbTwk6sGaX4g/zrnklXgztAN2bwZUM0w20hIGbzg=;
	b=enrsbIxbzQAVTJs75DhuBthnPTfJRSI5kDu2NvX0Y8z4xN+zkKgpQbR2E1Cvs281Fz
	OuNsqt8SrK6QBFzVCBstUsCD50+Ww0EY6dFwW+T4C8ZvjYCYILHpxfycYac/q3wS0cc/
	amQom71x9vDs9NFYpEMXzsvD0xdFzv1fARzcH0NKs+eeVb6dcpQrpOuUQkoRaYYtqyk1
	oov+Z+g3egVLGEzeYZ6udzsPPl01jSyd4tmmDcuPZ/6sFytbU2sGmPPoH8b6OxZOR7a9
	XoqdCpGjwmeJNUHC3Rt2xZogj/sPrGiDZLIYknwaCCBsYYHgzXagWvxahm0zVSx+37Xa
	X8Sw==
X-Received: by 10.50.20.100 with SMTP id m4mr4520605ige.17.1392409146567; Fri,
	14 Feb 2014 12:19:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Fri, 14 Feb 2014 12:18:36 -0800 (PST)
In-Reply-To: <CAMCfZKEJJdCgCdhHHa_944+adDA2h6sBR9b9nwL=gTpy+dUPJQ@mail.gmail.com>
References: <CAMCfZKE1+RDpEE8HehL_GDp2WxrVWjpjVL0Fb94Y_729Zi0A=w@mail.gmail.com>
	<CAMCfZKFBnmFip9qdUxjf60F_T5yBBEUfENULR_Bxt_b+Hso77g@mail.gmail.com>
	<1392334278.14081.26.camel@ted>
	<CAMCfZKEJJdCgCdhHHa_944+adDA2h6sBR9b9nwL=gTpy+dUPJQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Feb 2014 12:18:36 -0800
Message-ID: <CAMKF1sqQQQD82FeRg_hgK-Q5=VQDPArpJrz7wUxe8kGy7KNe=A@mail.gmail.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qte-4.8.5 missing libQtUiToolsE.a on toolchain
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
X-List-Received-Date: Fri, 14 Feb 2014 20:19:06 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 14, 2014 at 1:57 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
>
> On Thu, Feb 13, 2014 at 9:31 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> Well, if you build static binaries you need the staticdev packages. By
>> default we assume people tend to use dynamic libraries and the SDK is
>> therefore setup that way.
>
>
> Richard,
> Looking at qt4-embedded build results it just produces the static library
> for QtUiToolsE and file ./lib/libQtUiToolsE.prl point to a static library.
>

then package the needed static library in -dev package. Now its not
recommended practice however sometimes
exceptions are made but I would recommend to check first if its an
oversight/bug in QT5 to not generate a .so
for the given library or it could be a architectural need to have it
static either way some clarification is needed
before this change is made

> As soon as I'm not a Qt expert, I don't know if its possible to generate a
> shared library for uitools. And googling for it I couldn't found any helpful
> information.
>
> Regards,
>
> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br
>
> /*long live rock 'n roll*/
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

