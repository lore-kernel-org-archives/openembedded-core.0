Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHHdB-0000IK-UV
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 18:07:37 +0200
Received: by bkat8 with SMTP id t8so5292995bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dJ+TET9K4/H0+eB39KdsxSsY+3XZihGFc+E49/obqe0=;
	b=Ue4Zd0yCy6R0sDrwXqsWsngxL/bOVhq9DDytoHWNbl6ykDP+h/asBklqLsQRUq0xVg
	5QTjx4fzCYDCvNpXQqGULJ52OXxjFyUPABdadD16fzfBGC0oqjU1uG30slzy4ePIwmhD
	NdGSafI1uo0CcDGZ4+FovCyFO0FN51J4Z3uDc=
MIME-Version: 1.0
Received: by 10.204.136.152 with SMTP id r24mr11172929bkt.5.1319212901083;
	Fri, 21 Oct 2011 09:01:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Fri, 21 Oct 2011 09:01:41 -0700 (PDT)
In-Reply-To: <4EA18712.4050904@windriver.com>
References: <cover.1319206126.git.otavio@ossystems.com.br>
	<908ef7747e3391af158b7edb9f2b420b0016a7af.1319206126.git.otavio@ossystems.com.br>
	<4EA18712.4050904@windriver.com>
Date: Fri, 21 Oct 2011 14:01:41 -0200
X-Google-Sender-Auth: jH9CzoCrJ4lhKzoB0UQrG6XYVN4
Message-ID: <CAP9ODKpRww9C9z5H=xNPjCbS6YoGr6SVLg8HN2SnJ+jRYoSj2w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] base-passwd: move initial criation of group and passwd to preinst
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
X-List-Received-Date: Fri, 21 Oct 2011 16:07:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 12:52, Mark Hatle <mark.hatle@windriver.com> wrote:
...
> Any opinions from folks if this is even halfway reasonable for us to cons=
ider?
>
> (I'm guessing with some anon python code we could probably load in the
> passwd/group files, place them into a variable and use the variable to em=
bed
> them within the preinst -- keeping the contents out of the recipe.)

I like this idea but I'd prefer to have this merged before it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


