Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RRmNT-0003Zv-FP
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Nov 2011 15:58:47 +0100
Received: by bkbzs2 with SMTP id zs2so4524883bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2011 06:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KN1xWiadq6cdzxU07nnzUM+qwSulc/FAbKdeskArogA=;
	b=qjA3HqErrmYyY0z/siDfXgEMNhd5tHKrrXza9ZNoC2WtSiNERkjT3ScPJ1L5c9RXAA
	UkcsPXD427y9nSu0uIELG9KwhriISxZrS5cWxmslxTCqobhS1jkeuJ1TzSCxorL/PieT
	kukHsEu6rcsMdMlClFW+gv1rfYxrpDrz+qUhE=
MIME-Version: 1.0
Received: by 10.204.130.65 with SMTP id r1mr7700054bks.27.1321714335218; Sat,
	19 Nov 2011 06:52:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.26.143 with HTTP; Sat, 19 Nov 2011 06:52:15 -0800 (PST)
In-Reply-To: <1321647555.9657.5.camel@elmorro>
References: <cover.1321634793.git.tom.zanussi@intel.com>
	<8b14562502b9ccb4f72807a051e5b195ca31a25c.1321634793.git.tom.zanussi@intel.com>
	<CAMKF1sobZc0XAprRePk9jAswGVxzpO-i9Z+4HpOOrKbgfUZDmw@mail.gmail.com>
	<1321647555.9657.5.camel@elmorro>
Date: Sat, 19 Nov 2011 12:52:15 -0200
X-Google-Sender-Auth: vllJ9s7uxgsCKUat3ex4AOK_iAI
Message-ID: <CAP9ODKrj+hCK22Xp-vTV1D1jJiyF=kFNNsAvR_8a3YaRTDCPHQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ia32-base.inc: new include file
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
X-List-Received-Date: Sat, 19 Nov 2011 14:58:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 18:19, Tom Zanussi <tom.zanussi@intel.com> wrote:
...
> So was I right back then, or is there another place I should be putting
> this?

This might be made shared in meta-intel to avoid having this
information duplicated between all machines but it doesn't fit oe-core
IMO.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


