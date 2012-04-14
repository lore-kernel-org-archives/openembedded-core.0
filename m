Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SJBUG-0003cN-56
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Apr 2012 00:30:32 +0200
Received: by qao25 with SMTP id 25so3153855qao.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 15:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=xetnYErv/LiZIK3diB41taAoZYDXQOyChUOdKoYxAgA=;
	b=iucIlAhsrVtTsxoCGozuHKrvDKkm7P2nWLlf9PuSy3+LY+L6Czkk8CGa159p5ayfH+
	/gGvknDg+Ko8oUxFiiPa0LhFDMwbdE/tVLG/ubdDbmfhwAdAJ9u8VvWZ14fpnwmKziZj
	FHSkbnJUc9Ck1+j4YYdlfdiEthDgd9XM97aoONb6sQFBYBSRY0zb6wxpNOsyqRyN2cKQ
	WcR0Jr6k0QsTeWXvKYoZ7qDkk9/+P04dKBaOEnkpvNB7CtvOHf9/Kt/X+KZb1WpSDwlx
	G5pA9OMFptKX/wMWKiadCgskZ5o7KQGE4Tdp9YB5i5VxBFQ3PLONfa07Zr0zXngqxgXE
	Vx4g==
Received: by 10.224.212.2 with SMTP id gq2mr8818294qab.41.1334442068889; Sat,
	14 Apr 2012 15:21:08 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Sat, 14 Apr 2012 15:20:48 -0700 (PDT)
In-Reply-To: <1334424684.8545.3.camel@ted>
References: <1334424684.8545.3.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 14 Apr 2012 15:20:48 -0700
X-Google-Sender-Auth: bMY-KR8QzJ0AxrX_4knzMZT04oc
Message-ID: <CABcZANk2u452F=XdUKngEbaFih8mxLK2Q7PMmDQvwUOH=C7-tA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: update-alternatives: Fix for compatibility with multilib recipes
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
X-List-Received-Date: Sat, 14 Apr 2012 22:30:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 14, 2012 at 10:31 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> =C2=A0def update_alternatives_after_parse(d):
> + =C2=A0 =C2=A0if bb.data.inherits_class('native', d) or bb.data.inherits=
_class('nativesdk', d):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return
> +

Not an issue, but wanted to point out we have a utility function for
this sort of thing, for future reference. bb.utils.inherits(d,
'native', 'nativesdk'), iirc.
--=20
Christopher Larson


