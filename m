Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RWYui-0005La-OD
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 20:36:52 +0100
Received: by qaea17 with SMTP id a17so4878qae.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 11:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=yLW9duU6jUfLFjHfv+XZuwGKETj9dn4jdHtduUn1hcs=;
	b=B0+okRh1oxkps/tuFsH6tf8aphnl3Kxk8I9jSrmBqDUv8ugiBnbrGb4kkIw7r1Ffnw
	x1RdvMzk9dQV+rh43FJSyQXlC6B58BqMOmX+fSY3MKZmWbZ5R4L6bK/hSw6nxXZVCh8M
	444LGSZRPcz4OGLLT1jCJ9iYZoyItwuNCgSzQ=
Received: by 10.224.110.210 with SMTP id o18mr4374738qap.72.1322854206307;
	Fri, 02 Dec 2011 11:30:06 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.73.200 with HTTP; Fri, 2 Dec 2011 11:29:45 -0800 (PST)
In-Reply-To: <1322851144-6988-1-git-send-email-Martin.Jansa@gmail.com>
References: <1322844163.25960.10.camel@ted>
	<1322851144-6988-1-git-send-email-Martin.Jansa@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 2 Dec 2011 12:29:45 -0700
X-Google-Sender-Auth: zZhEnWf-Wsk7FaWfPmJth-i1SZk
Message-ID: <CABcZAN=FKqb74d57GuVPdHY4nT17nRNtR6LEqMrHn25REU5PuQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] bitbake.conf: add default PRINC 0 to be able to increment it
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
X-List-Received-Date: Fri, 02 Dec 2011 19:36:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 2, 2011 at 11:39 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =C2=A0meta/classes/base.bbclass | =C2=A0 =C2=A02 +-
> =C2=A0meta/conf/bitbake.conf =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A02 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index ea53498..fbcaefb 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -335,7 +335,7 @@ python () {
>
> =C2=A0 =C2=A0 # If PRINC is set, try and increase the PR value by the amo=
unt specified
> =C2=A0 =C2=A0 princ =3D d.getVar('PRINC', True)
> - =C2=A0 =C2=A0if princ:
> + =C2=A0 =C2=A0if princ and princ !=3D "0":

Could also do:

  if int(princ):

Or:

  PRINC[type] =3D "integer" # and:

  if oe.data.typed_value('PRINC', d):
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


