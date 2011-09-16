Received: from mail-wy0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R4c0A-0001fQ-8w
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 19:14:58 +0200
Received: by wyh21 with SMTP id 21so4138191wyh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 10:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pD8hMrNapAcVfF5b99I/6jcd9BBr4851foetZIZbbuI=;
	b=vd+jOnqBKaN0Pi2/o36iPED7ZwThHvEOhgcf1iy6GksuRSmMJLIesg90Gen2Jd1YHX
	XXWbZaN0A8lgagE1ow1hSAqginmByeLXfhQ635gHCN9T29NPaTnAUR6hNtoLW0K+XV+k
	IK8s51dDpq0k0Mn6DEfi8xu99k1HC336DP3Ho=
MIME-Version: 1.0
Received: by 10.216.188.65 with SMTP id z43mr1488753wem.15.1316192985269; Fri,
	16 Sep 2011 10:09:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.138 with HTTP; Fri, 16 Sep 2011 10:09:45 -0700 (PDT)
In-Reply-To: <1316192238.20858.45.camel@ted>
References: <CAP9ODKqCg-GOR-HLcuXzrgCVM2tt0anUCTeAEVoqGVFVG4YkEQ@mail.gmail.com>
	<1315925099-9259-1-git-send-email-eric@eukrea.com>
	<1316192238.20858.45.camel@ted>
Date: Fri, 16 Sep 2011 14:09:45 -0300
X-Google-Sender-Auth: VGyTgIqBQF2O7DjuRqjROmwzY2M
Message-ID: <CAP9ODKqMuGzcwz=fBWnLU+zx9rSCCk0fus=pbXwye1hjRH_wFg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] qt4: fix generated sdk
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
X-List-Received-Date: Fri, 16 Sep 2011 17:14:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 13:57, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-09-13 at 16:44 +0200, Eric B=E9nard wrote:
>> - qt4-tools-nativesdk : actually the qmake binary which gets installed
>> comes from the native recipe. This patch fix this problem by laucnhing
>> configure twice : once to compile qmake using the right toolchain for
>> nativesdk, and a second time using the native qmake to compile all the
>> other tools for the nativesdk. Then we install the right qmake.
>
> I was reading through this and wondered why we can't this use the qmake
> from the qt4-tools-native recipe?

With mine qt.conf patch (not yet sent) this ought to work fine.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


