Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SCeDl-0000PW-83
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 23:46:29 +0200
Received: by qcso7 with SMTP id o7so300425qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=RrPMzYlQFRF6UYkZCWhgtQJchVgPc4+QFPkRRyVhb2o=;
	b=BiHZO1wcqYZcP6HxPW/Z4ceP79elHxutlXy1LeYoIpmsysUEtz7r63VpRujltbKhC2
	+P62HpidV7ibLcVoljIO52lJEBODTIERZh7eXN0KQiJd2zWIMF2VdWus+3zhGiNOutGJ
	WQHqzWXi/w7bayLzEdxur7ZGER6WNWrnt5Arn7NY05AUEfPFZ6UrmMtmPvlVw6xJQmAj
	2fVHxoVT2PYH3PbeYTubIsFO5M22Tv/UvOgmu1a6zS+uirabO6h0ugPYBvbFhrAEFzwb
	/XiEWxYsYpZ+WaudoP8I/579Hl4jFlz0XxsVi3yScpVCLhIuExYBJrxfZSfzRTVhGd3E
	PYSQ==
Received: by 10.229.135.145 with SMTP id n17mr10545149qct.105.1332884246016;
	Tue, 27 Mar 2012 14:37:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Tue, 27 Mar 2012 14:37:02 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1203271728430.7513@oneiric>
References: <alpine.DEB.2.02.1203271728430.7513@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 27 Mar 2012 14:37:02 -0700
X-Google-Sender-Auth: Ew-3QSSwJAEnJ86KxFIdgsGz5_s
Message-ID: <CABcZANk4BpGAj_yM8JLPPJcT+9XeP2DcwJVdjXq-u5ZdAdOGeg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: verifying all necessary OE-related software on your dev host
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
X-List-Received-Date: Tue, 27 Mar 2012 21:46:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2012 at 2:33 PM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
> $ git clone git://git.openembedded.org/openembedded-core oe-core
> $ cd oe-core
> $ git clone git://git.openembedded.org/bitbake bitbake
>
> the only thing a beginner might want to do is check that the dev host
> has all essential S/W for OE work. =C2=A0i know that's documented in the
> yocto QS guide here:
>
> http://www.yoctoproject.org/docs/current/yocto-project-qs/yocto-project-q=
s.html
>
> is there any automated way to check for this? =C2=A0is there any OE/bitba=
ke
> equivalent to "please check that all necessary commands are
> installed"?
>
> =C2=A0is there anything else at all that a user might want to verify
> before starting to build their first image? =C2=A0 nothing leaps to mind,
> but i just want to make sure i'm not missing anything.

The sanity bbclass checks for most things already, at least if you get
past the initial setup and can actually run bitbake :) Which doesn't
require much, other than configuration and python 2.6 or newer as
'python'.
--=20
Christopher Larson


