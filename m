Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbEUz-0006cy-OF
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 18:54:10 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so177669pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 09:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=OTJrI3Bad2S3+L+UbSzZ/cOx9GhXMVBJXrLkILgBp24=;
	b=abkXxUc1W2DDOnennz5rtqeXWF7kg1mQ/VDMjaQxpJBwXAu+APH4CpoAeECt6hnvQM
	WrCQxkTUvHHSA1iQ0/JhzPh0GbEGHkT4i93Z89P7e9Rywd2Eh/3Rg2hWBdwmQM4Jzshr
	9ZfFiC6SI3pKU3VMhK13FN1YvF8ATUAHWh7TAm5VTqR1dYVhK2qdoxLlE0+vFATbXJIZ
	TvJSMS6wUBswV9vdLDNLexhqkOYYnX69geTCIfF0x0wAc4B8fyQulh1XFbLERAKYqIz/
	0s03k1ggTK4UXgIfjGGJ81KTCVeXUOJEka6mU5TI0IhHPvzc8wY7e4AqwUullEVTqNJJ
	vobg==
MIME-Version: 1.0
Received: by 10.66.76.73 with SMTP id i9mr19277968paw.17.1353519603924; Wed,
	21 Nov 2012 09:40:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 21 Nov 2012 09:40:03 -0800 (PST)
In-Reply-To: <1353511391-60570-1-git-send-email-bjst@enea.com>
References: <1353511391-60570-1-git-send-email-bjst@enea.com>
Date: Wed, 21 Nov 2012 15:40:03 -0200
X-Google-Sender-Auth: VwGYS6zQahoBoToG9UG4nreo9i0
Message-ID: <CAP9ODKoHjubL9ghcXwE-2z6Us7mRvAFRwbf+up+EmqnLxuaDWQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Bj=F6rn_Stenberg?= <bjst@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] RFC: ptest for danny
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 17:54:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2012 at 1:23 PM, Bj=F6rn Stenberg <bjst@enea.com> wrote:
> These patches are against the "danny" branch.

Please base it in master branch as danny is now stable and this is a
new feature which might include regresions.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


