Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sidebranch.openembedded@gmail.com>)
	id 1SuRwE-0005nK-Hh for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 19:33:26 +0200
Received: by lbol5 with SMTP id l5so1445842lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 10:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QTw6Y2IBqxooK2uq6gzls1htHAeFY+EDJv3IdHxsPF8=;
	b=LPuCDX28jET9W6+zlV7nyNvJTLVOYdbIJaXup+hZqLjDuiwazQ7ynTPO/mFReXCW8w
	F/VksIqhUS2b1FaZZh6ZRZJz30Re2J6wM8LGMUu1beyg0so+yBklf6nLNdTAv8J60Nxh
	YIAFnU0Y5s+KuBjQEpTOqYRJuZh4DB9MyltTAdQ2oIErHEv56NeBqrNJFGFQVZHuNirF
	Ubh9Vaabt7hPVK48PkChYF0j9INSnb+zquWh8ZCRkmga1Km9mn8UUN8OCx2XMQ0uTqKM
	aEJ//anlWbVt5e6ytINPl8mvjx9WeY8IqptL3pQFKskkYnGxk6gRsqpuNwYMHIhi/kg/
	6DSQ==
MIME-Version: 1.0
Received: by 10.152.148.169 with SMTP id tt9mr3022578lab.49.1343323315544;
	Thu, 26 Jul 2012 10:21:55 -0700 (PDT)
Received: by 10.112.37.225 with HTTP; Thu, 26 Jul 2012 10:21:55 -0700 (PDT)
In-Reply-To: <5f5ffa09c545046fc2e798494c61022574424645.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
	<5f5ffa09c545046fc2e798494c61022574424645.1343200454.git.sgw@linux.intel.com>
Date: Thu, 26 Jul 2012 19:21:55 +0200
Message-ID: <CAMvUbCwxD=W4sVhrGJHgedpBbdmmmtOZ_6mHqToUKTjEohFZ0g@mail.gmail.com>
From: Leon Woestenberg <sidebranch.openembedded@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 06/28] kernel.bbclass: fix external module building
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
X-List-Received-Date: Thu, 26 Jul 2012 17:33:26 -0000
Content-Type: multipart/alternative; boundary=e89a8f23455d0aa3b704c5bed58f

--e89a8f23455d0aa3b704c5bed58f
Content-Type: text/plain; charset=ISO-8859-1

Hello Saul,

On Wed, Jul 25, 2012 at 9:19 AM, Saul Wold <sgw@linux.intel.com> wrote:

> +       # Necessary for building modules like compat-wireless.
> +       cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
> +
>

Thanks, can we get this merged into the Denzil branch as well?

In general, how are commits selected for release branches?

Regards,

Leon 'likewise' Woestenberg

--e89a8f23455d0aa3b704c5bed58f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Saul,<br><br><div class=3D"gmail_quote">On Wed, Jul 25, 2012 at 9:19 =
AM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" =
target=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
+ =A0 =A0 =A0 # Necessary for building modules like compat-wireless.<br>
+ =A0 =A0 =A0 cp include/generated/bounds.h $kerneldir/include/generated/bo=
unds.h<br>
+<br></blockquote></div><br>Thanks, can we get this merged into the Denzil =
branch as well?<br><br>In general, how are commits selected for release bra=
nches?<br><br>Regards,<br><br>Leon &#39;likewise&#39; Woestenberg<br>

--e89a8f23455d0aa3b704c5bed58f--
