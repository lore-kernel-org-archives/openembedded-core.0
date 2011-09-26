Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R8Ask-0005NB-I4
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 15:06:02 +0200
Received: by bke11 with SMTP id 11so5875792bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lWICLXccDzyUgAQ5fKQ2IUsM/hwpsmznSjC8Gkia51o=;
	b=k3CF5VjerHxw0Y2PbVyjpzuV+xGTVVRAQdYp+V7t4+QsiBwbW2hmscxI7Ga1TvVqJX
	xcqwXyWBo/7OV1x83h6zsHw2Q5NgI4I+s0P7Ad8pJhDxReJLX5OZBg0ENbn+Mla4KqPC
	+l7RumSMk9bRraTUfGepsrrI9Tf+Sz6vPlXs4=
MIME-Version: 1.0
Received: by 10.204.139.20 with SMTP id c20mr4680009bku.218.1317042038085;
	Mon, 26 Sep 2011 06:00:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Mon, 26 Sep 2011 06:00:38 -0700 (PDT)
In-Reply-To: <1317041232.26109.38.camel@ted>
References: <CAP9ODKpF7hQQmB7YWE4RCWDbEfZwv8432KJrBmvpwe1u_SaCTg@mail.gmail.com>
	<1316734501.28323.18.camel@ted>
	<CAP9ODKqWLVrKRE+HT4k82f+BYdY96N_h581dp8u0AETWBTQV0w@mail.gmail.com>
	<1316799031.3125.3.camel@ted>
	<CAP9ODKoqywvZQyAJ=Jz8wh4hVoucJvo-QpyTZ_cpP8MhnEXb3w@mail.gmail.com>
	<1317029042.26109.29.camel@ted>
	<CAP9ODKqGJ+VxCf8kFcbeaMNwgneLpb-HU2eTpu8w_UM1p-5A6g@mail.gmail.com>
	<1317041232.26109.38.camel@ted>
Date: Mon, 26 Sep 2011 10:00:38 -0300
X-Google-Sender-Auth: tSkOvcsN_rdXbc5-9jNWUyNx97E
Message-ID: <CAP9ODKoSX94UiB7aNs2E51A76hWrNBKcAECH_xtgX_sutvWkAg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Branch management for OE-Core release
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
X-List-Received-Date: Mon, 26 Sep 2011 13:06:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2011 at 09:47, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> To illustate the problem, if a change is needed in two different release
> branches you'd commit to both and then cherry-pick both into master?

No, I'd merge it into master.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


