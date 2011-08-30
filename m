Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QyMkB-00017s-FH
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 13:44:39 +0200
Received: by bkbzu17 with SMTP id zu17so4890190bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 04:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5bcUu0sAh/6hOTLFBZBNXMLNEcj0QyoX1CrVJvqQto4=;
	b=sYPbMpm1J0R5BRKCF4wxO7ABEnkD22U1vvcPFdyE7E/gsqJFm7xoKluOWd4zo1Zjqa
	HMfxcuaWKbdW+JBTFwuhWGQQ65/4EzOGGtgydOuHWcyhw7D+Qbh3cyz30VA/ll4vtSzb
	eRT47ilcvqyDImDyhBHuCGW0bquvLd9jLVVig=
MIME-Version: 1.0
Received: by 10.204.148.154 with SMTP id p26mr23422bkv.160.1314704384730; Tue,
	30 Aug 2011 04:39:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.156.217 with HTTP; Tue, 30 Aug 2011 04:39:44 -0700 (PDT)
In-Reply-To: <1314694200.19905.105.camel@phil-desktop>
References: <CAP9ODKoi8==q2w__QkHm_PhkC-iWYnS5MCA5F+W_SdsTTXuBjQ@mail.gmail.com>
	<1314694200.19905.105.camel@phil-desktop>
Date: Tue, 30 Aug 2011 08:39:44 -0300
X-Google-Sender-Auth: Nli4ysaoOZuK7NeJcAwzEcSr6iU
Message-ID: <CAP9ODKrON8oBsAr3d7WJbhZffPNq7K=JjyWZs0v05qa_iycbDg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Fail to build of clutter
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Aug 2011 11:44:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2011 at 05:49, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2011-08-30 at 00:42 -0300, Otavio Salvador wrote:
>> Hello,
>>
>> With today's tip of OpenEmbedded-Core, Clutter fails to build as can
>> be seen bellow:
>>
>> | checking for CLUTTER_DEPS... no
>> | configure: error: Package requirements (cairo-gobject >=3D 1.10 atk >=
=3D
>> 1.17 pangocairo >=3D 1.20 json-glib-1.0 >=3D 0.12.0 gdk-pixbuf-2.0 >=3D =
2.0
>> gl libdrm x11 xext xfixes >=3D 3 xdamage xcomposite >=3D 0.4 xi) were no=
t
>> met:
>> |
>> | Requested 'json-glib-1.0 >=3D 0.12.0' but version of JSON-GLib is 0.10=
.4
>
> It sounds as though you have picked up an erroneous version of json-glib
> from somewhere, maybe meta-oe. =A0The version in oe-core does appear to b=
e
> 0.12.4 and I'm not seeing that failure in my builds.

Oh, indeed.

> Did this just stop working for you recently, or is this the first time
> you tried to build it?

Yes, it is the first time I tried to build it (at least intentionally)

I have prepared a patch to remove it from meta-oe. Will post it soon.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


