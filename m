Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RA4fe-0006uq-GB
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Oct 2011 20:52:22 +0200
Received: by bke11 with SMTP id 11so3293799bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Oct 2011 11:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ytwJOkUx1KvyH4yg0Cy+j6hfL4I67Kot/L/dN9M7/E0=;
	b=hc0OprqibYa3GeltrN/fEigCgeryenBob1a7q0HCSTT6JyyekHX6CX41Dzaa1fX/aR
	Gh3BAaKM93FXXZg2DvFZQM0RSXZa+LDvVe0OnUiMdAJyu/OzqggGrMzg7C6dIMkaE24N
	4B1ChcN376OqfYBhoh1iEq6l6uv/KL1rjBxdk=
MIME-Version: 1.0
Received: by 10.204.144.67 with SMTP id y3mr2938455bku.322.1317494811672; Sat,
	01 Oct 2011 11:46:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Sat, 1 Oct 2011 11:46:51 -0700 (PDT)
In-Reply-To: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
References: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
Date: Sat, 1 Oct 2011 15:46:51 -0300
X-Google-Sender-Auth: drsI9T5fWdZkQy0N2ZO7bCxBN5A
Message-ID: <CAP9ODKpWtBM4jD78p7oFKnJ12EjUamDkaVEsKKKs8M1pp03xOQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Improve handling of 'all' architecture recipes and their interaction with sstate
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
X-List-Received-Date: Sat, 01 Oct 2011 18:52:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 05:19, Martin Jansa <martin.jansa@gmail.com> wrote:
....
> =A0meta/recipes-support/hal/hal-info.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A01 -
> =A0meta/recipes-support/hal/hal-info_20091130.bb =A0 =A0 =A0| =A0 =A02 +
> =A0meta/recipes-support/hal/hal-info_git.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
...

Please use INC_PR for those.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


