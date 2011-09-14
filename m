Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3ofj-0007aj-5A
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 14:34:35 +0200
Received: by bke11 with SMTP id 11so1418746bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ldD2mgydSXEik9IrCwPmLliZwRWziTo/Qo0Eka+D8sc=;
	b=At0CEHwFOlkKYUzhTg+ELI0bnJ0tmQdu0YKshPr/g6p215LzzKrOG0cdHo3YkZKP0Q
	s2Scf6O1O3gR8O8CLIGgMxXb4zbKEMSg+1ND3KD1h1zjM2x1B7lKLH5GnHawkLKhMOmW
	fMhL794p+n6eBqJu9/Zr87Q9KFAaM8A2vnDbc=
MIME-Version: 1.0
Received: by 10.204.146.155 with SMTP id h27mr2499167bkv.353.1316003362991;
	Wed, 14 Sep 2011 05:29:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 05:29:22 -0700 (PDT)
In-Reply-To: <1315978772.26879.1860.camel@elmorro>
References: <1315978772.26879.1860.camel@elmorro>
Date: Wed, 14 Sep 2011 09:29:22 -0300
X-Google-Sender-Auth: _5BqWmErqw1-xVhymSRpjkstdYA
Message-ID: <CAP9ODKpo=03auDk6kmjiQguKh5UCPpU8be0capTbsgkgmG9u3g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] initramfs-live-install: add a version for use with grub2
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
X-List-Received-Date: Wed, 14 Sep 2011 12:34:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 02:39, Tom Zanussi <tom.zanussi@intel.com> wrote:
> grub2 uses a completely different set of install steps. =A0These are
> contained in a 2.0 version of init-install.sh, which is tied to grub2
> (1.98) and a 2.0 version of the initramfs-live-install recipe.

Please avoid Poky, OE-Core and like while interacting with user since
this will force people to fork the script. Try to avoid branding as
possible.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


