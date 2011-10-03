Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RAnQz-0006l5-Pl
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 20:40:14 +0200
Received: by bke11 with SMTP id 11so5726749bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 11:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=f434okxGy4ercqfhmPGYpnM6cSkrGWI8cFuyknKSgHI=;
	b=H85c/nbOLe32s+Qt6FouuIP/db68woeIKDyd4TWbp6FjuuO8+sJMZHTfkYfztfXjN8
	8yDYkiLpparpQjbthRhsRnFRAzBPlBAUQAw1PvoTxMCePucpXroS4I3p59c4rpDrqYvb
	ra9jSkpBltUVAfmEthREyg6LHi+Ipz75C4KYc=
MIME-Version: 1.0
Received: by 10.204.128.203 with SMTP id l11mr151809bks.270.1317666880780;
	Mon, 03 Oct 2011 11:34:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Mon, 3 Oct 2011 11:34:40 -0700 (PDT)
In-Reply-To: <j6cq5j$snr$1@dough.gmane.org>
References: <CALT56yPoAbv43D_CGsGHMjr+eQxhNUJAW_Ryznoi7Tz8tb7THA@mail.gmail.com>
	<1317653702.13337.4.camel@phil-desktop>
	<j6cq5j$snr$1@dough.gmane.org>
Date: Mon, 3 Oct 2011 15:34:40 -0300
X-Google-Sender-Auth: ZIz2UOSknU02_KmifYw-RY-tfFg
Message-ID: <CAP9ODKqPjnXJm_Ax9_w5B415NnqX_YDsbkT4J=L9a7Gmj4Bzvw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] .la files cleanup
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
X-List-Received-Date: Mon, 03 Oct 2011 18:40:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 3, 2011 at 14:06, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> On 10/03/2011 06:55 PM, Phil Blundell wrote:
...
> I see... Then I'd drop some local patches dropping .la files and just pus=
h
> them into -dev packages.
>
> RP, is that suitable for you?

Isn't a post install hook with:

find ${D} -name '*.la' -exec rm '{}' ';'

All we need?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


