Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3ucY-0000Yz-RU
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 20:55:43 +0200
Received: by bke11 with SMTP id 11so1755692bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 11:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LGkBP3bVem7MK8SFhqQEzOtg2Gw3YuEKQ+jUBopzOCQ=;
	b=twCUg5vwyu0fwidNB7CbHU5tn+n4ahvSc2NN6+7F4nsA62oETdPcXQR4kxD4Ne4kmQ
	yJ1wqrAy1fwqBdx6UrWfi7Elq45FmYdygRLOaVoxYoQCkQi2iAOesrZHrentBncCgQ2e
	9XuwnbICxNHqwnzmaG54GC+u+zn1vsHT8N0oM=
MIME-Version: 1.0
Received: by 10.204.136.25 with SMTP id p25mr104508bkt.249.1316026230691; Wed,
	14 Sep 2011 11:50:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 11:50:30 -0700 (PDT)
In-Reply-To: <1316025872.26879.2585.camel@elmorro>
References: <1316025872.26879.2585.camel@elmorro>
Date: Wed, 14 Sep 2011 15:50:30 -0300
X-Google-Sender-Auth: lsOPbLMQf7sBL3r6tIVzNxvbnjg
Message-ID: <CAP9ODKqmo=eo8ckd5qom4YZbwtNz1C_hBW5phhELrS6SKvL-BA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] initramfs-live-install: add support for grub2
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
X-List-Received-Date: Wed, 14 Sep 2011 18:55:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 15:44, Tom Zanussi <tom.zanussi@intel.com> wrote:
> grub2 needs a different set of install steps from grub 0.97. =A0This
> adds them to init-install.sh and adds an install-time check that
> determines which version is being used and which steps to use
> depending on the version of grub selected.
>
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


