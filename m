Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R5h7X-0007Np-Jz
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 18:55:03 +0200
Received: by bke11 with SMTP id 11so25630511bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 09:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=12doXRbAi7+nmA4rH4C8Rc/YV7PT8pX/AjVpjdXVLDA=;
	b=G3m6UXXrIHYldN+zFAxsFdhGtmti+wAha3ReZzb7/7nDorio/+weKjhb/klDS8gm/y
	7FciX0ngl2huyHhjfj51iCWSZHcyJP3YGq2NghJNUecm7zYrIIG19fjio1Ni3o9csVWr
	jCmfksv2CbtL1EnCF2lY46NZDe8w8tV7XzdPo=
MIME-Version: 1.0
Received: by 10.204.139.20 with SMTP id c20mr784752bku.218.1316450987374; Mon,
	19 Sep 2011 09:49:47 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Mon, 19 Sep 2011 09:49:47 -0700 (PDT)
In-Reply-To: <b1f7bdfc28f0197596b2e362e01c75e1152fa971.1316441889.git.paul.eggleton@linux.intel.com>
References: <cover.1316441889.git.paul.eggleton@linux.intel.com>
	<b1f7bdfc28f0197596b2e362e01c75e1152fa971.1316441889.git.paul.eggleton@linux.intel.com>
Date: Mon, 19 Sep 2011 13:49:47 -0300
X-Google-Sender-Auth: WgCmoYj-KMRVArTE5CoFlqIfqOI
Message-ID: <CAP9ODKrbMfPb9kMJ3b3Lw9=BsFYvB9XiaRTMvVDuEYmW3s_A-g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] scripts/combo-layer: fix still overzealous regex in default hook script
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
X-List-Received-Date: Mon, 19 Sep 2011 16:55:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2011 at 11:20, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> In the previous fix to this hook script (OE core revision
> e7aae45414e4597e9244f86a81fbc940f73785c8) a start-of-line (^) marker was
> missed, so if a commit had no Signed-off-by line but it contained an
> inner patch that did, the inner patch was modified causing a "corrupt
> patch" error.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Tested and this works as expected :-) Thanks by fixing it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


