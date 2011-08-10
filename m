Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QrD9j-0003j5-4z
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 20:05:27 +0200
Received: by vxj14 with SMTP id 14so1148353vxj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 11:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=o6UHrIMJQzw0srQWvk+RH9t7F7ncMVRqxYz1B3Ro94M=;
	b=hVqtt9sVEUK8vpqbB0Wa0WXM6bf637JjIxnmGwI81z9zpb2Hzx1UoyrDAeMn66dE5d
	WVebH/fJV39SR3Y53xq/akB54AT2Un2lV8fux1k8PwDQrumwJS0TiXGb7Gd0cnUPO+E1
	h2bpl2HjHlP4FbmJ7Xt/ti5nh4Ez2kYVwLiD8=
Received: by 10.52.72.72 with SMTP id b8mr442786vdv.93.1312999256065; Wed, 10
	Aug 2011 11:00:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.112.194 with HTTP; Wed, 10 Aug 2011 11:00:36 -0700 (PDT)
In-Reply-To: <0C67B7D5-11F2-45F4-AD8F-F43F508CD784@kernel.crashing.org>
References: <0C67B7D5-11F2-45F4-AD8F-F43F508CD784@kernel.crashing.org>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 10 Aug 2011 11:00:36 -0700
X-Google-Sender-Auth: fDlFScVgdP0-cIlQSq6rYoVAJds
Message-ID: <CABcZANkd4HHvWTQmT-ti1ejedZ-7MmK_=dT8i0OnziGhe4SczA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: sscache signature?
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
X-List-Received-Date: Wed, 10 Aug 2011 18:05:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2011 at 10:51 AM, Kumar Gala <galak@kernel.crashing.org> wr=
ote:
> the yocto wiki references mentions a bitbake-diffsigs
>
> https://wiki.yoctoproject.org/wiki/Enable_sstate_cache
>
> but not seeing that. =C2=A0How can one compare signature or try and figur=
e out why a cache item isn't being reused between cfgs.
>

It's in the bitbake bin directory alongside bitbake itself.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


