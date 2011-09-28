Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R8twH-0005Y5-S5
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 15:12:42 +0200
Received: by bke11 with SMTP id 11so8245496bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 06:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TLXv7eUZw/LCvknF5s/6ydkSRP7R06RlvXVf4v1Aib8=;
	b=WsBZOxDBzoJZ3KbQ+47aBLK/ysEggY3KxPnrg+JtAispgX5363V2C0P1xWu4Cjp9Ni
	6bcsFZx6+wuHSXgW0A26D/IYm/2cYfl4jS9+GFptL5kQ/swxt/ZyjVFMvnFKuuMMM3Uy
	DV/dYzvM55sLww48UiWsWGlc6/u1T+JVYHrwM=
MIME-Version: 1.0
Received: by 10.204.130.138 with SMTP id t10mr6049429bks.10.1317215235343;
	Wed, 28 Sep 2011 06:07:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Wed, 28 Sep 2011 06:07:15 -0700 (PDT)
In-Reply-To: <4E830EA4.5050002@mentor.com>
References: <4E830EA4.5050002@mentor.com>
Date: Wed, 28 Sep 2011 10:07:15 -0300
X-Google-Sender-Auth: gBRhL97r7nh6QIFpYSEbfGXRqqI
Message-ID: <CAP9ODKrCYRX-BMVZ4Z2z43NtrN8KGWusPunsA5szg8J_3jVxXg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: adding extendable extra variable to root path
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
X-List-Received-Date: Wed, 28 Sep 2011 13:12:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2011 at 09:10, Andrew Gabbasov
<andrew_gabbasov@mentor.com> wrote:
> Introducing a hook variable for various .conf files to add
> extra path elements to cmake. For example, it can be used
> in external toolchain conf file to add ${TOOLCHAIN_PATH}
> to cmake root path search.
>
> Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


