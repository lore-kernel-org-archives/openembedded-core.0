Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SuQ2M-0003Xv-LA
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 17:31:38 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 26 Jul 2012 08:20:06 -0700
Received: by obbuo19 with SMTP id uo19so2463509obb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 08:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=Q2zuMrw1QnPQynP95F/PjGvxP5TUKq0Rs5/n9sslRgE=;
	b=DRj9A3E+mY3tqLizAlcN5ndvZXIIvOaPK23hBOVrfU1BIRbFmPuSeyMD5NKZPtfT3s
	zRcUw//LoxPwMAGeyPjK90EfBT2o8CaI8hAS/zRQbp8Bd5VywdiVt5r7/Fy5D7VB+885
	443GaZ19aYS0w22EdR0RvqIisBj0FTJEDIs/PdrAyVp5wf0uRfA1a+cJtOE/yeexPvV4
	gNveJkU2BKC9192MPcX5vhc7lhbLbQxIUvCzXxiG9uFqkf+Y7edDA+NWKyv1wYUD3UA0
	BL5295WX4BhFr40vNtM7MxQw/vBGyusST9zGQ5kV+pFLKolcRwKXsZAFaiEwTU+1j1jS
	9DLA==
Received: by 10.182.51.37 with SMTP id h5mr42226734obo.35.1343316005517; Thu,
	26 Jul 2012 08:20:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.33.4 with HTTP; Thu, 26 Jul 2012 08:19:45 -0700 (PDT)
In-Reply-To: <1343315761-6314-1-git-send-email-schnitzeltony@googlemail.com>
References: <1343315761-6314-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Jul 2012 16:19:45 +0100
Message-ID: <CAJTo0La41DbcZMFm-T5dH-_u52ZA4rL7i2LsHs-NLfZX8Nz6nQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl/zpBTLW/jdsP5m9aEDSLXu4HQtCIcuO0moInioEOkQupUt5/YdDt2kagNo9Y2Wumqn6A0
Subject: Re: [PATCH] gtk-doc.bbclass: unbreak dependency-chain for native recipes
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
X-List-Received-Date: Thu, 26 Jul 2012 15:31:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26 July 2012 16:16, Andreas M=C3=BCller <schnitzeltony@googlemail.com> w=
rote:
> -DEPENDS_virtclass-native_append =3D " gtk-doc-stub-native"
> +DEPENDS_append_virtclass-native =3D " gtk-doc-stub-native"

Was this a typo on my part, or is there a semantic difference between those=
?

Ross


