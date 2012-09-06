Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9fG9-0006UQ-AG
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 18:48:53 +0200
Received: by wgbdr1 with SMTP id dr1so1487734wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 09:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=w5nrbQtFM80dHRZ47puDx6inLyBDXhWv7ooET2Rtm3Y=;
	b=Nd9WyqDn+dn5X7taCcmKE267yvGcbP9nj07BB1P4T1NJzLVKCvOjX3VH9MNS8aQz+Z
	C5cXiW9Rn6kIgf5W8eAF8arZlyO2f9lDXBL3YZ+8qmVEizXmamboAgOhu8KuhRIFVP9s
	yUAeaYkXbenEQiMcHNLSURXKtdvwPckOLFrLH7s8BC0uFNpRAHL88c96ghpDRw4e/w4+
	2D+E9l1dI52mNX/aSOww7QwVIvVZ0pJVknbkO84r15GoT2nlb7zqNRLmGOjP4m92YkUK
	LvYg0eh+uSY8BrU0YBrfuFimoMdIyGH1AsfIc/FAbYY/q0vIitMbuLaGeFRYaveejjxk
	TwIw==
Received: by 10.216.136.227 with SMTP id w77mr1420070wei.111.1346949388696;
	Thu, 06 Sep 2012 09:36:28 -0700 (PDT)
Received: from ?IPv6:2001:610:612::4908:ca0a:f01a:394b?
	([2001:610:612:0:4908:ca0a:f01a:394b])
	by mx.google.com with ESMTPS id do5sm6873361wib.10.2012.09.06.09.36.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 09:36:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5048CB07.9000502@r-finger.com>
Date: Thu, 6 Sep 2012 18:36:24 +0200
Message-Id: <F306EB1F-FA67-405C-A2FA-FFDE18572811@dominion.thruhere.net>
References: <CAK18fxEb3gjEEwhvN-du3eJvgUVCbjXU2Ag4kicFFDt6xra6og@mail.gmail.com>
	<CAJTo0LYmPf0g_qv6X+8MefjzfWr4gsr33SaszHsG82PiGg+oEg@mail.gmail.com>
	<644855E8-7D63-45DC-B072-B9A9893058F3@dominion.thruhere.net>
	<CAJTo0La9-QHoWJB2v82C2tiM2XFwgHzsP1zda+Duqe_3uTwByw@mail.gmail.com>
	<5048B526.4050501@r-finger.com>
	<C92CD2AA-A842-454E-9C14-FCA5FC683DAB@dominion.thruhere.net>
	<5048CB07.9000502@r-finger.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQnpZZX2rmKJUm6mFEx6SO8KuD4mxOKpGSEeGglNCUjGcYUUcB9YXK+rwn83CVvM5swGbSOA
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [yocto] opengl / libgl / libgles
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
X-List-Received-Date: Thu, 06 Sep 2012 16:48:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 sep. 2012, om 18:10 heeft Tomas Frydrych =
<tf+lists.yocto@r-finger.com> het volgende geschreven:

> On 06/09/12 15:50, Koen Kooi wrote:
>>=20
>> Op 6 sep. 2012, om 16:37 heeft Tomas Frydrych =
<tf+lists.yocto@r-finger.com> het volgende geschreven:
>>=20
>>> On 06/09/12 14:51, Burton, Ross wrote:
>>>> On 6 September 2012 14:25, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>>> It's not automatic, but you can do something like this:
>>>>>=20
>>>>>       =
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3D23b02134
>>>>>=20
>>>>>       RDEPENDS_${PN} =3D "libGL"
>>>>=20
>>>> Ah, interesting.  I'm not entirely keen on the manual dependencies =
but
>>>> that's certainly a step in the right direction.
>>>=20
>>> Is there much that actually links against libGL / libgles? Things =
like
>>> cogl dlopen() these these, so you have to manually specify the =
RDEPENDS
>>> anyway. Just thinking this could be less of an issue than it might =
appear.
>>=20
>>=20
>> xbmc is one
>=20
> The problem is basically the mesa package, right? If the mesa package =
is
> split so that the mesa libGL parts are provided separately from the =
more
> generic parts, and any GL bits, mesa or otherwise, are only built as a
> specific machine feature, then we will never have any GL bits in the
> non-machine part of the sysroot, and will always be dealing with the
> correct, and only, libGL. Packages that link directly to libGL would
> also be machine specific, but if we are talking about a hand full
> things, this is not a major issue. Or I am missing something?

No, that is pretty much exactly what I proposed earlier for mesa.=20

> Ross, I think it gets unnecessarily complicated if you start thinking =
of
> it in the terms of hot-swapping libGL at runtime the way desktop =
distros do.

In theory it should work :)

regards,

Koen=


