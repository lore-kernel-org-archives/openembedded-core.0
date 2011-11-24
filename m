Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <swaplinker@gmail.com>) id 1RTYlZ-0001Ih-1q
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 13:51:01 +0100
Received: by vcbfo11 with SMTP id fo11so2380814vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 04:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=M0t1yPZ6AUlTnALdIg26uwemqglkhW+IMmwezp0T6ng=;
	b=Xl5KLJhB1lAQhQjmOLQ/y54vU5ma6HWwbjm8iztBCVPrZvNm4kn4fGIXfuxWJwJmVj
	oR4OVAHa9gwTyYxEE+9wyNCD863K4jgu5eLoCZ+xupTrhgQV4QNX+8RYH2fG01vF5YbG
	sl/rY+kAIPgrXn3Kd+Y8R1HOKUaHZzdgwCxQ0=
Received: by 10.220.26.75 with SMTP id d11mr2299936vcc.9.1322138664160; Thu,
	24 Nov 2011 04:44:24 -0800 (PST)
MIME-Version: 1.0
Sender: swaplinker@gmail.com
Received: by 10.52.20.113 with HTTP; Thu, 24 Nov 2011 04:44:03 -0800 (PST)
In-Reply-To: <CAMKF1srTUc=V9-AV-+3bw3QrR747cK-kfYU4sYq+A04ASD06wA@mail.gmail.com>
References: <689a6fbace429988bf14f144e9a93dc828a7e7bf.1321391467.git.julian.pidancet@gmail.com>
	<CAMKF1srTUc=V9-AV-+3bw3QrR747cK-kfYU4sYq+A04ASD06wA@mail.gmail.com>
From: Julian Pidancet <julian.pidancet@gmail.com>
Date: Thu, 24 Nov 2011 12:44:03 +0000
X-Google-Sender-Auth: 2nzXQzDL_V5GQft-712onIqPh94
Message-ID: <CAKZ=5EV8Qwh0gzmW6mS+hZB7HpEgDWuscO7_mhDEVsCffWmP2A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: B29882@freescale.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Introduce multiarch DISTRO_FEATURE
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
X-List-Received-Date: Thu, 24 Nov 2011 12:51:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>> +def get_gcc_multiarch_setting(bb, d):
>> + =C2=A0 =C2=A0if 'multiarch' in bb.data.getVar('DISTRO_FEATURES',d,1).s=
plit() :
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.getVar('TARGET_ARCH', d, 1) in [=
 'i586', 'i686' ] :
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return "--enable-targets=3Dal=
l"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.getVar('TARGET_ARCH', d, 1) in [=
 'powerpc' ] :
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return "--enable-targets=3Dpo=
werpc64"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.getVar('TARGET_ARCH', d, 1) in [=
 'sparc' ] :
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return "--enable-targets=3Dal=
l"
>> + =C2=A0 =C2=A0return ""
>
>
> you forgot mips here
>

mips and s390 are not yet supported in the gcc version that OE is using.

--=20
Julian


