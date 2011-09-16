Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R4ahY-0007S1-3V
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 17:51:40 +0200
Received: by wwf27 with SMTP id 27so4215880wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 08:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=sgZXlNGwGJXZ/yzQ3cTY7n7yARnwmnnX2B6s2kPnBeU=;
	b=k3VkFmwgLGiSyJA9waZw0PtvCfJSIw92qtGLOGzzrW3Le+ceXmh9/oDDqd9Z9Q/1e4
	/wO/tuGfDDd+yaRWWOMLZY0Smf5uQFfv2olta+3wmifHQ+5vorNuTXDESE5SU9BrpznV
	OrdGW7XiAmFm9gxweeACpByI2VA0c5YXD34RY=
MIME-Version: 1.0
Received: by 10.216.24.93 with SMTP id w71mr2224062wew.30.1316187982629; Fri,
	16 Sep 2011 08:46:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.138 with HTTP; Fri, 16 Sep 2011 08:46:22 -0700 (PDT)
In-Reply-To: <1316186907.2384.90.camel@elmorro>
References: <1316186907.2384.90.camel@elmorro>
Date: Fri, 16 Sep 2011 12:46:22 -0300
X-Google-Sender-Auth: Ppa9rTLl_8JPwiyLPUb7u8xNU0c
Message-ID: <CAP9ODKo_==2QE5Xw2wtT_jjE8D-tf03PzPunL+zqF=F2v0Kv8Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: fix spurious 'installed but not shipped' warning
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
X-List-Received-Date: Fri, 16 Sep 2011 15:51:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 12:28, Tom Zanussi <tom.zanussi@intel.com> wrote:
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

I've seen this very ofthen in our internal images so this is a very welcome=
 fix.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


