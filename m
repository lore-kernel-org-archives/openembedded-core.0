Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1REhlQ-0004Lv-9O
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 15:25:29 +0200
Received: by bkat8 with SMTP id t8so1968238bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 06:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=feEWbK/Na/nZCNmA7WPJAX6f5319/wXuD+U9SBql4bE=;
	b=XAFoVA7gmtXiSHLfp9izlNl3ai9iDHGqEbKIv673jx0Ch+5oqbcc46NxF2UzUNt5wz
	1drwvAoeLuyZeOD8MfEgGVMzA2LvjNDMo3jz41LAnzM6TXzCfAuJA9IEwFstLPp+9/D9
	noxeQ0XJG6RMkBO1duiyhuAHtiM9aFaqynl2s=
MIME-Version: 1.0
Received: by 10.204.135.65 with SMTP id m1mr6772471bkt.85.1318598383340; Fri,
	14 Oct 2011 06:19:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.138.72 with HTTP; Fri, 14 Oct 2011 06:19:43 -0700 (PDT)
In-Reply-To: <1318591756.23801.259.camel@ted>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<c30a13301850b76b1e7362b99322ffad72598612.1318505196.git.Martin.Jansa@gmail.com>
	<1318512243.23801.217.camel@ted>
	<20111013133221.GC28525@jama.jama.net>
	<1318514192.23801.229.camel@ted>
	<CAP9ODKp-CRpH0U7=k3inmg3gKqLFuHSUOA2JTc9+Jev+Op5p_Q@mail.gmail.com>
	<1318591756.23801.259.camel@ted>
Date: Fri, 14 Oct 2011 10:19:43 -0300
X-Google-Sender-Auth: 9tt17EUHHFF-e4CceEbGMeuzYCc
Message-ID: <CAP9ODKrN91FXYfxKXrLj-yJyS2ef+DqmA0n0xC0qwTuxSzApWw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core 14/20] mesa-dri: introduce MACHINE_DRI_MODULES
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
X-List-Received-Date: Fri, 14 Oct 2011 13:25:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2011 at 08:29, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
>> At least here it hadn't built i915 or i965 drivers.
>
> I think there is a slight change in behaviour as the architectures it
> would have built certain modules on used to get applied, now it doesn't
> as we're passing a fixed list. We need to fix this but it shouldn't be
> hard.

I am sorry but I didn't get what you meant.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


