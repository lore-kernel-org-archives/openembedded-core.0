Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RHHiL-0000RD-VD
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 18:12:58 +0200
Received: by qyg14 with SMTP id 14so4464447qyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=w86bEE7lqddEVidTDqsgBhPpv3qoKT1EQDcep5oF97A=;
	b=HlE9s6I4o4ywcahl+Pm5YKQHBZcZIkMb7S15Uv+iTyuwWxPAnUAVR/cL1Du+W8jVyX
	KLHQp4VyZv59NAorVuHv35SgZCmDUrDlFyLJT3+O2qpERyD3BTR7eNX88pGzzQlWwdo3
	kK5y/JBnLT6ti5xiLKJkNBD4ZZ6cV5GimU4/w=
Received: by 10.68.74.4 with SMTP id p4mr28790869pbv.47.1319213224071; Fri, 21
	Oct 2011 09:07:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 21 Oct 2011 09:06:34 -0700 (PDT)
In-Reply-To: <20111021084840.GP3522@jama.jama.net>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<22ed6acc0a44d9bc0d6f7a2e800c039d77d75477.1319184832.git.Martin.Jansa@gmail.com>
	<20111021084346.GA20103@mi.fu-berlin.de>
	<20111021084840.GP3522@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2011 09:06:34 -0700
Message-ID: <CAMKF1soEYSZvnDKPTT+63r759mKV753wgXY2PuYU2rtii8KZLg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] libatomics-ops: force ARM mode
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
X-List-Received-Date: Fri, 21 Oct 2011 16:12:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 1:48 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Oct 21, 2011 at 10:43:46AM +0200, Henning Heinold wrote:
>> Hi,
>>
>> hm we should think of reworking this recipe now. Because since gcc 4.5
>> pulseaudio for arm can use the gcc internal atomicstuff and in oe-core
>> and meta-oe we have 4.5 or 4.6 only. The lib is
>> only needed for mips and it is still the old release, on cvs
>> is a much better version, which supports thumb too, if
>> remember correctly.
>
> Agreed, I've added this only because pulseaudio is now needed for
> gst-plugins and I wasn't able to build any armv[45]t images.
>
> But because I don't know much about pulseaudio or libatomics-ops I was
> hoping that someone who maintains them will fix it properly and this
> work around will be needed only temporary.

Would you have cycles to create a git recipe for it the git tree is here
https://github.com/ivmai/libatomic_ops/

>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


