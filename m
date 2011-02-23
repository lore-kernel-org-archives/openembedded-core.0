Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PsMDS-0002pR-8h
	for openembedded-core@lists.linuxtogo.org;
	Wed, 23 Feb 2011 22:25:46 +0100
Received: by fxm8 with SMTP id 8so4042534fxm.6
	for <openembedded-core@lists.linuxtogo.org>;
	Wed, 23 Feb 2011 13:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=deoKqnK+XqCGDkoe3aOm1bvMpkGlsUFrEW+noPoR9fA=;
	b=G45/BYz1FribIzqKQjYJz6l/h3h8miZdu19SKj/v9+4wR/PvcpKMcGyntNldwE1tsr
	JKtrMYYrzAAJgrVUmRa9peZ5u3v8kP32b3FPKAGN5PF7L5iyy+26C4IsWQF1Ydcr9G9a
	fkUnXh/qnnH7rlxaeoJJPIdmZjxtKv/21CXmA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=FJgaAMsIoG3Ebgt5E9oSmb5CI58PHXkT9Q2P9vxKliSwHAyJYhduL4rTRB8VsI5NdN
	PjZ8NKFx1QsIlla6r3xlc4a2X4lHI/zjdoqAtGrMMVR2SmFh0BOrzOs8Ir44WSZqoJQJ
	vJnIcHmaljodeY+KB5ZA0UU5j0VXXBWYZtiFg=
Received: by 10.223.73.202 with SMTP id r10mr6043431faj.133.1298496222983;
	Wed, 23 Feb 2011 13:23:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 23 Feb 2011 13:13:13 -0800 (PST)
In-Reply-To: <693076A5-4B2C-4DE8-AC16-10C856FE403D@dominion.thruhere.net>
References: <AANLkTimVvB5r=SDrXMaGu=6sNHWX5PPj1cn+Suqpmv-q@mail.gmail.com>
	<693076A5-4B2C-4DE8-AC16-10C856FE403D@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Feb 2011 13:13:13 -0800
Message-ID: <AANLkTi=x5Y0O-5mhP8Xm3d60x7U=OESNS2v3Yc_u+DtR@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: openembedded-core repo goes live
X-BeenThere: openembedded-core@lists.linuxtogo.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.linuxtogo.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.linuxtogo.org>
List-Help: <mailto:openembedded-core-request@lists.linuxtogo.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Feb 2011 21:25:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 23, 2011 at 12:17 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 23 feb 2011, om 20:42 heeft Khem Raj het volgende geschreven:
>
>> Hello all
>>
>> openembedded-core is live now. You can clone it by
>>
>> git clone git://git.openembedded.org/openembedded-core
>
> Thanks!

thanks Koen for pointing out the cgit thing. So now its available on
cgit as well for web viewing.

http://git.openembedded.org/cgit.cgi/openembedded-core/


>
> If you checkout the oe-core branch of the angstrom setup-scripts[1] you can build console-image for the yocto machines and some TI machines (beagleboard, hawkboard, pandaboard, etc).
>
> For people not using those setup scripts, have a look at http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/commit/?h=oe-core&id=03810d5813044a17731c2da6bbc627c7292033a8
>

I will try that

> regards,
>
> Koen
>
> [1] http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.linuxtogo.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


