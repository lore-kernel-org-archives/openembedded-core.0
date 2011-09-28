Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R90Rp-0005AT-1P
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 22:09:41 +0200
Received: by bke11 with SMTP id 11so8730430bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 13:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=MpZBGa+/rTeEBJSaa0+Z2i3odbcUK/lpZTlEiZbPX6g=;
	b=THNDtUoN2XI2tXB9/EsIevp+0PbpRBO3OGTjXcd4zfJ8usZwNPoVd+su7QB+Lq87oj
	OVRlXuc34M9PX3gBsi2CqAnofd2UzweKCI1x6ww3pkM35yGtIYosF134mhAiBwYxVPJH
	e58ySahqbDAv0zZPx5Ij4TgQm3ePxZNUYQkNg=
MIME-Version: 1.0
Received: by 10.204.139.20 with SMTP id c20mr6899894bku.218.1317240253187;
	Wed, 28 Sep 2011 13:04:13 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Wed, 28 Sep 2011 13:04:13 -0700 (PDT)
In-Reply-To: <1317239461.12332.55.camel@ted>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
	<CADkTA4NxfSaEinraLQMsLT4ZWQKOPAZ76uNujFXg0zSrRvVnFA@mail.gmail.com>
	<0E901391-C9FC-48AE-88A4-C1064E57376E@dominion.thruhere.net>
	<1317221697.12332.13.camel@ted>
	<89CD0BCB-1457-4C76-87BA-5ED03454C343@dominion.thruhere.net>
	<1317239461.12332.55.camel@ted>
Date: Wed, 28 Sep 2011 17:04:13 -0300
X-Google-Sender-Auth: 9BqyR35N5rjUxf2W76Ko3sQZ3hg
Message-ID: <CAP9ODKopjm-bJY3WJriMiQDtwZcsOWeqZkqnm7F2PwiZvWY0bg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
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
X-List-Received-Date: Wed, 28 Sep 2011 20:09:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2011 at 16:50, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> This patch improves the current situation and I don't foresee the
>> autoPR code working soon
>
> Which is why we need to switch to that model and shake out the issues
> sooner than later. Enough is enough with the PR madness and we need to
> get to grips and fix it.

I fully agree this is the way to go but this doesn't mean we ought to
hold this patch until all this happens. This patch allows the removal
of the kernel.bbclass from meta-oe so reducing the delta between
oe-core and meta-oe.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


