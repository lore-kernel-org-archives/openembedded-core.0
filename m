Return-Path: <ngompa13@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 428B971AB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 05:05:13 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id 1so9548948qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Nov 2017 21:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PkwbbS2lO5gal+OZhB9n/RCgqK1kSRm/iL1Qr7TLp8I=;
	b=O1IC7FZ0tuqZ2HWGdHHN+iKJoVQGR2+27xYed/AlxcuoutyV+9yN2nDg1tGxrZYZ25
	gTwhUCye9TmH6gVt5nNEp0LOqUAH6MAeEMxtw++j/nGxieEmtWQ1gcIp8D3XYQTvGaDV
	Dbnjj8tcPFa9d8zi9bq5EbtwRhhQCNiOMXqG6Qjfyyce29+fpTgODYiGvTQYauZ2HoR+
	vzHwI/sKJPir9eCP2wl1su3ZpPg4eOFke0zebWzMzko+V7NDZWT+80DVuKVlCgiroG3H
	hktZIq3Mq4XjAk0ekfPv8lZviGrcjF1l9EIMbmOIn+ca5ZKukiaHiwT1Iti9LaByhB2i
	18dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PkwbbS2lO5gal+OZhB9n/RCgqK1kSRm/iL1Qr7TLp8I=;
	b=VlYUSjxLfVcbGHeP1nspj9PQRFbhnepltfZ6DVF5NAZwoO3jWdauW9RUgURgCGqNZH
	KyndA5yorYv+Mabp8aaTEuiBBPumXvZpv8YOzVwcfNIscFwqyX92sgaW853fXBx1We11
	jDJQyaldM60BS6Qy+yhvOdsyD79j6bSXOJFt5t3l+bDOybnPAo/O8wfdCZzLMm7Tr8sE
	WkdahN7EjtCKM2QDWHONvOT4vD1DKivvPEn4iSKOm0H//IanycRr7NnRquKmpXu0GWkP
	/LK+lUExgvIM7/d0ZgzX9asVMJs4lIahKgbiAvH3qVFqZAnEdTjoi2ZexZqyrZVsBjzk
	2fRQ==
X-Gm-Message-State: AJaThX4Q93cNPdJTbBFN26ZPyxUte4j8DHytlRGDt7xOzjLQvCpZZTKh
	rQQ8Kl2M07a7kty+5+QS3uVCKNH5DdpfRsthYCte+rpS
X-Google-Smtp-Source: ABhQp+QgPvjQGG1aoBYyJpirEB/kg8mtUqu4Vrd2YvTgTDftq3AF4yD8Om3mC8D/0JWthcGm3lxjNf56Pny+KsBF5q4=
X-Received: by 10.200.48.54 with SMTP id f51mr20834826qte.39.1509944714907;
	Sun, 05 Nov 2017 21:05:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.41.130 with HTTP; Sun, 5 Nov 2017 21:04:34 -0800 (PST)
In-Reply-To: <CAP9ODKqpb2nGy9M55g44Onm6Bub4nZ8xKQv4A+LEuoqtkwtRPQ@mail.gmail.com>
References: <20170930180655.25134-1-otavio@ossystems.com.br>
	<20170930180655.25134-2-otavio@ossystems.com.br>
	<7738c857-3635-f56f-45fd-cd7d5b5eb82e@linux.intel.com>
	<CAP9ODKqpb2nGy9M55g44Onm6Bub4nZ8xKQv4A+LEuoqtkwtRPQ@mail.gmail.com>
From: Neal Gompa <ngompa13@gmail.com>
Date: Mon, 6 Nov 2017 00:04:34 -0500
Message-ID: <CAEg-Je_s1xCS1zMWNeLZtXyvHWhOUAyxWk5SS36BqEHZomc6Gw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] lib/oe/package_manager.py (rpm): Allow use of non-signed feeds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Nov 2017 05:05:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 1, 2017 at 6:01 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Sun, Oct 1, 2017 at 4:39 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> On 09/30/2017 09:06 PM, Otavio Salvador wrote:
>>>
>>> When we wish to use the package feed for local development, it does
>>> not uses GPG signed feeds by default but dnf does. We need to
>>> configure the GPG signature check out so it works out of box.
>>>>
>>>> @@ -551,7 +551,7 @@ class RpmPM(PackageManager):
>>>
>>>           if self.d.getVar('PACKAGE_FEED_SIGN') =3D=3D '1':
>>>               gpg_opts +=3D
>>> 'gpgkey=3Dfile://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' %
>>> (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'),
>>> self.d.getVar('DISTRO_CODENAME'))
>>>           else:
>>> -            gpg_opts =3D ''
>>> +            gpg_opts =3D 'gpgcheck=3D0\n'
>>>
>>
>>
>> Again, 'gpcheck' option has nothing to do with verifying signed package
>> feeds. NAK.
>
> Oh really? so tell me why it fixed my error?
>
> Without this patch I need to use:
>
> dnf install --nogpgcheck <pkg>
>
> and it is sub-optimal as I did not enabled signed support.
>

This logic is kind of dumb, but basically, this is how this works:

gpgcheck - controls pkg_gpgcheck and repo_gpgcheck. With gpgcheck=3D1,
DNF defaults to pkg_gpgcheck=3D1 and repo_gpgcheck=3D0, but if gpgcheck=3D0=
,
repo_gpgcheck is forced off.
pkg_gpgcheck (not currently working)
repo_gpgcheck - enable repo_gpgcheck, this is default to 0 (thus, disabled)

At some point, this needs to be fixed in libdnf and dnf so that the
options are saner...



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

