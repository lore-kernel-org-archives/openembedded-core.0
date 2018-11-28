Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id E2D136D120
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 10:59:25 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 32so23067898ota.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 02:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=2azsDBBYTx88zVkOKIsqdHkWYgApGj5mAGe6OdGUxLw=;
	b=Txvo8hhUaWiRTR26pl8YNNaUC0jvjCiAYACxsbKElG4sIoqXqR6JDQoICRwi3FxuxC
	SOx4cgW+GSz2XBAE4mXMztfXV0U9ItRTW20r/0EbVzQ/oRNiPgQ9asVIpGXkEgro9gr+
	zKjq8YqjXBzPt8ko/rL3vk9MkfyRHgkPiNoNOO9on2Wq/tPCkZBa1SUOAg4zWnGhzxEU
	3v/3F59BzK9Bm93mYpa95FHQRdIU233ISkd3mWMGm773sGOE5WhVbsOerI8QLKPm56DE
	DN93NNEkWwhlaQZdcEO4J2bV4OG1cnlT5Nw/wy6pfYh9gU2UfonGviKnuV4HTqZTIuOP
	yGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=2azsDBBYTx88zVkOKIsqdHkWYgApGj5mAGe6OdGUxLw=;
	b=YeEJ8f3gGVRh/fk3p2OzsMKYQiEf56vlE4zxo86UAU1h19kLH8kbyvZIbbyK2hxdWa
	6j56R/Brte3ze2wAzQAIBX7pT26USj+/pgt5YTPebast+HWjBq5zI4HfFZJXUPy8QXv9
	MQYURJZmZfVEaSxtFidECAgCrZi5Q4ixfBlWVHjDFfE5s/Pfa08tkhvj06RXbNva2BIG
	jt2tseKya3qb9J+Xl7fztrHYQ2pRkckPkYounF/FODWl1dAJo3zyfWNO+Xw1NyA7lKMW
	nUKpwCnmRA5cBcn65n3BfWjLJBviCH7drUueyqIBzQmX54I84OOZTKV882+0Cdmu75j0
	yCbQ==
X-Gm-Message-State: AA+aEWb12lpAo9YAaPrTD6klntbWkMguwYv+EsZy4SbAcQtuB9gmkVPy
	XJRgSUl/AEsDVgY7U6QJ5dZsEsZzNz//Ww==
X-Google-Smtp-Source: AFSGD/VZRxwLebe4Hi+U2/3JS4Z4H4C1seCjFY5LX11EB/2fkmm2IVxGnbOXHGuplMr6bSRqfIfUog==
X-Received: by 2002:a9d:2062:: with SMTP id n89mr19332671ota.244.1543402766466;
	Wed, 28 Nov 2018 02:59:26 -0800 (PST)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com.
	[209.85.167.180]) by smtp.gmail.com with ESMTPSA id
	b18sm1923738oii.51.2018.11.28.02.59.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 02:59:24 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f180.google.com with SMTP id i6so10549248oia.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 02:59:24 -0800 (PST)
X-Received: by 2002:aca:4208:: with SMTP id p8mr3267788oia.331.1543402764203; 
	Wed, 28 Nov 2018 02:59:24 -0800 (PST)
MIME-Version: 1.0
References: <20181127191255.39052-1-abrodkin@synopsys.com>
	<CAP9ODKq2NRaMcW3nY-cs-uBuKBG3xx7sAuzBoZtRheo-jz+7CQ@mail.gmail.com>
	<CAP9ODKo+3XpTqsVpUB3s2OhUuV2039J-RefKOBvDNVABQB18+w@mail.gmail.com>
	<33b52a810fe1248322362e401b7138024caca0cc.camel@synopsys.com>
	<CAP9ODKpJ83gkrLfcAxVo9VonZbAyLcYvrV-5taX7yTJyM4w4kA@mail.gmail.com>
In-Reply-To: <CAP9ODKpJ83gkrLfcAxVo9VonZbAyLcYvrV-5taX7yTJyM4w4kA@mail.gmail.com>
Date: Wed, 28 Nov 2018 08:59:12 -0200
X-Gmail-Original-Message-ID: <CAP9ODKp9vM9jzLt9HQNO8JoS4OEROXVq0MytWytoci3-7GZ4bQ@mail.gmail.com>
Message-ID: <CAP9ODKp9vM9jzLt9HQNO8JoS4OEROXVq0MytWytoci3-7GZ4bQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	linux-snps-arc@lists.infradead.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-tools: Improve build preparation
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
X-List-Received-Date: Wed, 28 Nov 2018 10:59:26 -0000
X-Groupsio-MsgNum: 118685
Content-Type: multipart/mixed; boundary="00000000000081adb2057bb7752d"

--00000000000081adb2057bb7752d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2018 at 8:58 AM Otavio Salvador <otavio@ossystems.com.br> w=
rote:
> On Tue, Nov 27, 2018 at 6:49 PM Alexey Brodkin
> <alexey.brodkin@synopsys.com> wrote:
> > On Tue, 2018-11-27 at 17:52 -0200, Otavio Salvador wrote:
> > > On Tue, Nov 27, 2018 at 5:30 PM Otavio Salvador <otavio@ossystems.com=
.br> wrote:
> > > > On Tue, Nov 27, 2018 at 5:13 PM Alexey Brodkin
> > > > <alexey.brodkin@synopsys.com> wrote:
> > > > > Even though we're not going to build here real U-Boot binary
> > > > > it is still required to "configure" U-Boot to get get to the
> > > > > tools building.
> > > > >
> > > > > We used to use "sandbox_defconfig" for that purpose but
> > > > > since U-Boot v2018.11 it started to cause problems [1] due to [2]=
.
> > > > >
> > > > > So to have less dependencies let's create super minimalistic
> > > > > configuration which is good enough to allow us to run "make tools=
".
> > > > >
> > > > > [1]
> > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__errors.yoct=
oproject.org_Errors_Details_202185_&d=3DDwIBaQ&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=
=3DlqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=3D6GBkAGgxs4IOh0rJ4joj36Xu=
kb_msE_tdIIJQXh8Gbg&s=3DvuvAMfkM9WIKHek7mwuwSjWKKpUcKJ-zCcKypEfxCuw&e=3D
> > > > > [2]
> > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__git.denx.de=
_-3Fp-3Du-2Dboot.git-3Ba-3Dcommitdiff-3Bh-3Da4958a71017fb142542f977c843c5fc=
e769fc6ea&d=3DDwIBaQ&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3DlqdeeSSEes0GFDDl656eViX=
O7breS55ytWkhpk5R81I&m=3D6GBkAGgxs4IOh0rJ4joj36Xukb_msE_tdIIJQXh8Gbg&s=3DGN=
4U6Of_hi-W_5CEu3RvRUIVEjgaNwnK8CarkwIly4Y&e=3D
> > > > >
> > > > > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > > >
> > > > To allow extended use, we need to enable CONFIG_FIT_SIGNATURE
> > > > otherwise we won't have the support.
> > > >
> > > > See:
> > > >
> > > > # MXSImage needs LibSSL
> > > > ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_ARMADA_38X)$(CONFIG_ARM=
ADA_39X)$(CONFIG_FIT_SIGNATURE),)
> > > > HOSTLOADLIBES_mkimage +=3D \
> > > >         $(shell pkg-config --libs libssl libcrypto 2> /dev/null ||
> > > > echo "-lssl -lcrypto")
> > > >
> > > > If you do that, we can likely rely on this and avoid some extra too=
ls
> > > > packages (for example on meta-freescale).
> > >
> > > Looking at this, I am wondering if folowing wouldn't be a generic
> > > solution capable of upstreaming:
> > >
> > > diff --git a/configs/nativetools_defconfig b/configs/nativetools_defc=
onfig
> > > new file mode 100644
> > > index 0000000000..be69bdf43a
> > > --- /dev/null
> > > +++ b/configs/nativetools_defconfig
> > > @@ -0,0 +1,3 @@
> > > +CONFIG_SYS_TEXT_BASE=3D0
> > > +CONFIG_FIT=3Dy
> > > +CONFIG_FIT_SIGNATURE=3Dy
> > > diff --git a/tools/Makefile b/tools/Makefile
> > > index 3c0521f655..e916d0cebb 100644
> > > --- a/tools/Makefile
> > > +++ b/tools/Makefile
> > > @@ -124,7 +124,7 @@ fit_info-objs   :=3D $(dumpimage-mkimage-objs) fi=
t_info.o
> > >  fit_check_sign-objs   :=3D $(dumpimage-mkimage-objs) fit_check_sign.=
o
> > >  file2include-objs :=3D file2include.o
> > >
> > > -ifneq ($(CONFIG_MX23)$(CONFIG_MX28),)
> > > +ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_FIT_SIGNATURE),)
> > >  # Add CONFIG_MXS into host CFLAGS, so we can check whether or not re=
gister
> > >  # the mxsimage support within tools/mxsimage.c .
> > >  HOSTCFLAGS_mxsimage.o +=3D -DCONFIG_MXS
> >
> > So do you think there's a room for improvement in my patch for OE?
> > Or before we get a missing part for tools/Makefile there's nothing more
> > to be done in OE?
>
> You could use this attached patch (marking as Pending as it is still
> RFC). It allow us to drop or 'mxsboot' recipe on meta-freescale, for
> example.

Now... with patch...

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--00000000000081adb2057bb7752d
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-tools-add-a-generic-config-for-native-tools-building.patch"
Content-Disposition: attachment; 
	filename="0001-tools-add-a-generic-config-for-native-tools-building.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jp125azx0>
X-Attachment-Id: f_jp125azx0

RnJvbSA1NzMxY2FmZDgzNTI4ZjJkNzk0NzZlNjI0MWYyMmQ3ZjI2MThhMzY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPdGF2aW8gU2FsdmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29t
LmJyPgpEYXRlOiBUdWUsIDI3IE5vdiAyMDE4IDE4OjE0OjExIC0wMjAwClN1YmplY3Q6IFtQQVRD
SF0gdG9vbHM6IGFkZCBhIGdlbmVyaWMgY29uZmlnIGZvciBuYXRpdmUgdG9vbHMgYnVpbGRpbmcK
T3JnYW5pemF0aW9uOiBPLlMuIFN5c3RlbXMgU29mdHdhcmUgTFREQS4KClRoZSBtb3RpdmF0aW9u
IGZvciB0aGlzIGlzIHRvIGFsbG93IGRpc3RyaWJ1dGlvbnMgdG8gZGlzdHJpYnV0ZSBhbGwKcG9z
c2libGUgdG9vbHMgaW4gYSBnZW5lcmljIHdheSwgYXZvaWRpbmcgdGhlIG5lZWQgb2Ygc3BlY2lm
aWMgdG9vbHMKYnVpbGRpbmcgZm9yIGVhY2ggbWFjaGluZS4KCkVzcGVjaWFsbHkgb24gT3BlbkVt
YmVkZGVkIC8gWW9jdG8gUHJvamVjdCBlY29zeXN0ZW0sIGl0IGlzIHZlcnkKY29tbW9uIGVhY2gg
QlNQIHRvIGVuZCBwcm92aWRpbmcgdGhlaXIgc3BlY2lmaWMgdG9vbHMgd2hlbiB0aGV5IG5lZWQK
dG8gZ2VuZXJhdGUgaW1hZ2VzIGZvciBzb21lIFNvQyAoZS5nIE1YMjMgLyBNWDI4IGluIG1ldGEt
ZnJlZXNjYWxlCmNhc2UpLgoKVXNpbmcgdGhpcywgd2UgY2FuIHBhY2thZ2UgdGhlIHRvb2xzIGRv
aW5nOgoKJDogbWFrZSB0b29scy1vbmx5X2RlZmNvbmZpZwokOiBtYWtlIHRvb2xzLW9ubHkKClNl
cmllcy10bzogdS1ib290ClNlcmllcy1wcmVmaXg6IFJGQwpTZXJpZXMtY2M6IEFsZXhleSBCcm9k
a2luIDxhbGV4ZXkuYnJvZGtpbkBzeW5vcHN5cy5jb20+ClNlcmllcy1jYzogUGV0ZXIgUm9iaW5z
b24gPHBicm9iaW5zb25AZ21haWwuY29tPgoKU2lnbmVkLW9mZi1ieTogT3RhdmlvIFNhbHZhZG9y
IDxvdGF2aW9Ab3NzeXN0ZW1zLmNvbS5icj4KLS0tCiBjb25maWdzL3Rvb2xzLW9ubHlfZGVmY29u
ZmlnIHwgMyArKysKIHRvb2xzL01ha2VmaWxlICAgICAgICAgICAgICAgfCAyICstCiAyIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGNvbmZpZ3MvdG9vbHMtb25seV9kZWZjb25maWcKCmRpZmYgLS1naXQgYS9jb25maWdzL3Rv
b2xzLW9ubHlfZGVmY29uZmlnIGIvY29uZmlncy90b29scy1vbmx5X2RlZmNvbmZpZwpuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5iZTY5YmRmNDNhCi0tLSAvZGV2L251bGwK
KysrIGIvY29uZmlncy90b29scy1vbmx5X2RlZmNvbmZpZwpAQCAtMCwwICsxLDMgQEAKK0NPTkZJ
R19TWVNfVEVYVF9CQVNFPTAKK0NPTkZJR19GSVQ9eQorQ09ORklHX0ZJVF9TSUdOQVRVUkU9eQpk
aWZmIC0tZ2l0IGEvdG9vbHMvTWFrZWZpbGUgYi90b29scy9NYWtlZmlsZQppbmRleCAzYzA1MjFm
NjU1Li5lOTE2ZDBjZWJiIDEwMDY0NAotLS0gYS90b29scy9NYWtlZmlsZQorKysgYi90b29scy9N
YWtlZmlsZQpAQCAtMTI0LDcgKzEyNCw3IEBAIGZpdF9pbmZvLW9ianMgICA6PSAkKGR1bXBpbWFn
ZS1ta2ltYWdlLW9ianMpIGZpdF9pbmZvLm8KIGZpdF9jaGVja19zaWduLW9ianMgICA6PSAkKGR1
bXBpbWFnZS1ta2ltYWdlLW9ianMpIGZpdF9jaGVja19zaWduLm8KIGZpbGUyaW5jbHVkZS1vYmpz
IDo9IGZpbGUyaW5jbHVkZS5vCiAKLWlmbmVxICgkKENPTkZJR19NWDIzKSQoQ09ORklHX01YMjgp
LCkKK2lmbmVxICgkKENPTkZJR19NWDIzKSQoQ09ORklHX01YMjgpJChDT05GSUdfRklUX1NJR05B
VFVSRSksKQogIyBBZGQgQ09ORklHX01YUyBpbnRvIGhvc3QgQ0ZMQUdTLCBzbyB3ZSBjYW4gY2hl
Y2sgd2hldGhlciBvciBub3QgcmVnaXN0ZXIKICMgdGhlIG14c2ltYWdlIHN1cHBvcnQgd2l0aGlu
IHRvb2xzL214c2ltYWdlLmMgLgogSE9TVENGTEFHU19teHNpbWFnZS5vICs9IC1EQ09ORklHX01Y
UwotLSAKMi4xOS4yCgo=

--00000000000081adb2057bb7752d--
