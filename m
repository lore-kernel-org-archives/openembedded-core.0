Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3txP-00085X-8G
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 20:13:11 +0200
Received: by bke11 with SMTP id 11so1721020bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=J6Xsu7bcBm6B/fiSQGshYasyjCln1xJRhuhLzIOBrn4=;
	b=JwkuLOyeniU24VIQfzfrOfKMh/Xs12yyZDhcqzNZ+cYlEQSkvtAtGy4f6P67CENfiD
	OH4X+Prx3VScwl66HYe48dQUwB1h2rvBSjgZPeq1fcT/LvU9M4+laMmYwdS2jARQ3Az0
	7Cpil314gQkJy49imSRMngSqrEejrrtFL8Znk=
MIME-Version: 1.0
Received: by 10.204.136.25 with SMTP id p25mr81233bkt.249.1316023680791; Wed,
	14 Sep 2011 11:08:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 11:08:00 -0700 (PDT)
In-Reply-To: <1316023315.26879.2570.camel@elmorro>
References: <1316023315.26879.2570.camel@elmorro>
Date: Wed, 14 Sep 2011 15:08:00 -0300
X-Google-Sender-Auth: 2fnvw32ZSsD03sPkxewR5vFzRG8
Message-ID: <CAP9ODKqkzNqqzzcMQdyty=bwsoGdw6voqCJtRXbgvowRP8-PNQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tom Zanussi <tom.zanussi@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Wed, 14 Sep 2011 18:13:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 15:01, Tom Zanussi <tom.zanussi@intel.com> wrote:
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


