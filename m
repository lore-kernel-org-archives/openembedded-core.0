Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SHwsO-0001Ey-4g
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 14:42:20 +0200
Received: by vcbfl13 with SMTP id fl13so629709vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 05:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Op6r3KJKVirK2ESSwiAQzJDCiOg9TbaBudr49RZqQnA=;
	b=fQ+E/EHZSdkIgj/DmZr9Cq1GywkvBkqBsTQYnISFN/qgvDga7/P56fR5Vc83/yF5YE
	poreRVpy5/fSQYOjABajD1Jy4Wz4kQjxw17aOhP8OiQ/xEoO4yQbzt3U6MHCn9jtUWeC
	N0luR2/DIezhXwt2VG/Qfe32Ei+MQwfzuGFTpnSNZEX7vbycRy+xon9FWjUKL/cKgSVm
	yjIBmRsN0v5JUjkSD0pLL4n4qz65DInZS0k6rIK8y7b0/D3Mrn2Z2XTrSM7Gg+FmcVun
	Zn54PvEwJeB9+f4g3XBYmUb7fxwvyCqCgQUPYNWacUaPGF/cLNhc30M2tqCS6zSVWyPd
	/A4Q==
MIME-Version: 1.0
Received: by 10.52.31.42 with SMTP id x10mr6185319vdh.33.1334147580995; Wed,
	11 Apr 2012 05:33:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.2.195 with HTTP; Wed, 11 Apr 2012 05:33:00 -0700 (PDT)
In-Reply-To: <1334139691.10826.144.camel@ted>
References: <cover.1334114318.git.otavio@ossystems.com.br>
	<1334139691.10826.144.camel@ted>
Date: Wed, 11 Apr 2012 09:33:00 -0300
X-Google-Sender-Auth: ozKyEoGeQrPoqET6HfkfV9cVjyk
Message-ID: <CAP9ODKpBmR-5sfFu4Cps7YAxNdWPOfOKfT9thU-Em+Gw_AjoUw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Important fixes for rc3
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
X-List-Received-Date: Wed, 11 Apr 2012 12:42:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 11, 2012 at 07:21, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> A typo fix is not high priority for -rc3. Sending patches which you then
> request me to manually fix up for -rc3 is a bit of a joke.

The typo I agree and I can resend the patch but I didn't because it
was 1am here and I was falling sleep. If you check, this patch were
send long time  ago and not received any comment.

> I'm actually seriously considering reverting the recent connman version
> updates since they've totally broken connman-gnome and all the UI
> connman integration. I appreciate this would upset some people so we're
> going to try and fix connman-gnome but I'm not happy to be in this
> position at this point in the release cycle. The test scripts are the
> least of my worries to be quite honest.

Yes; I agree this is unfortunate but connman last version has fixed
many issues, specially regarding hidden wifi management (the main
reason we wanted to update to it at O.S. Systems). Another important
point is that its API is mostly stable now and putting a 1.2 with
previous API will force rework from any user using it when 1.3 is
released so this is not the way to go IMO.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


