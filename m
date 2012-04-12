Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SINia-00030g-G4
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 19:22:00 +0200
Received: by vbbfr13 with SMTP id fr13so1705739vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 10:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NjFC85MNiHmIQZSb/5GnnAmmeEmUVvrOkawKmWGCaNk=;
	b=UbC9oXYjYT0p1vZ2VrNxLB4ypltb4HEkbRuXUcjE1s8Suk8oJhT05KaHLBR1V4sjtj
	gslHKsKMG3IVKrcaUN2mcl4+aZkv0vRqy+phScWjdmkexHmYUhbv7OU5CPyd2CKcZYXi
	Hn4SwzvngkL+qmkq9E6ekCbMdbVjrlS+BNADMNfXLe04QKIDldzF9Ovm0WNWX7z0aG2F
	K71Y+QJH6ufO4MKCjzrZW24XMFk2MLalzXTSflsvtFDCB+HVOyadIa9twPs6uemhmLtE
	w/Q6KUJlphVy1zcD6BXNI81xH4+i2dykjdizbL+J6Lb8pdavBJ5RmgAs7fqd2NsmIQis
	Ctzw==
MIME-Version: 1.0
Received: by 10.52.31.42 with SMTP id x10mr1353641vdh.33.1334250759725; Thu,
	12 Apr 2012 10:12:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.2.195 with HTTP; Thu, 12 Apr 2012 10:12:39 -0700 (PDT)
In-Reply-To: <CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
Date: Thu, 12 Apr 2012 14:12:39 -0300
X-Google-Sender-Auth: QrBrdqxzM9XqReHEr19nQk0H_FA
Message-ID: <CAP9ODKqQVkXJcb1F_dxS3eapYn0GQ=ZFOKdQjrO3FvP+pWSB2g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Thu, 12 Apr 2012 17:22:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2012 at 13:55, Khem Raj <raj.khem@gmail.com> wrote:
>> I'm still a big fan of using 'yoctoproject-1.2' as substring for tags an=
d branches. The objections I heard to that didn't make sense to me, but I s=
ee this as a purely technical matter where others see it as something diffe=
rent :)
>
> I think that string is fine as long as its just for yocto but I think
> for OE-Core we are going to do a General release
> so tagging that with something yocto project will be very confusing
> unless we plan to do different releases of OE-Core for general
> availability
> and yocto project. I dont think we have bandwidth for that. And since
> poky repository makes a copy of OE-Core metadata it can be tagged in
> yoctoproject specific tags
>
> since OE-Core is at center of all layers I would propose that other
> layers when tagged contain OE-Core's release tag in their own tags
> name
>
> so something like <layer-tag>-<OE-Core-tag its targetting>

I agree; yocto tag ought to be check in yocto git repository. What we
need is to have an OE-Core release at same time.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


