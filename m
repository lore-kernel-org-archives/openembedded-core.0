Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RM0Mi-00019H-BM
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 17:42:08 +0100
Received: by bkbzv3 with SMTP id zv3so1294765bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oIzmXrD4LmmGVVUJvDSOdPsfL5+BEJ3Gxa+4FawxHVE=;
	b=iir8NSjvr2H9dz3/kcmJut/HCa6Kud0kgM1LLsbDvIMpV67NJiblyh0riMlvEWoX0i
	d5rYL9ew4zA77ja2ikMHa+P+YFWrJu1NfgBuHvc1iEO3W+Wx7v8BS0WBx5Xll8rtGBJC
	9OrxBgYO+yDCyOcjT+nIPuUOclmziHs7DbyNw=
MIME-Version: 1.0
Received: by 10.204.10.81 with SMTP id o17mr3449633bko.65.1320338156856; Thu,
	03 Nov 2011 09:35:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Thu, 3 Nov 2011 09:35:56 -0700 (PDT)
In-Reply-To: <CABcZANkh422mOBj38brHMuqRuvZB82NzyW3in56pzu5EcavK-w@mail.gmail.com>
References: <F930E711-421C-439B-AAA8-EEBA0371ED86@dominion.thruhere.net>
	<CACW_hTYqjsZzB2WRJ=EED4KGwqcGb2UVtKpKjZGNf-urO35G-w@mail.gmail.com>
	<CABcZANkh422mOBj38brHMuqRuvZB82NzyW3in56pzu5EcavK-w@mail.gmail.com>
Date: Thu, 3 Nov 2011 14:35:56 -0200
X-Google-Sender-Auth: upZUaemDFaS6apy7AfW9kYxPB2M
Message-ID: <CAP9ODKoLQUjJ0xAiN_a8qj=Nbn=VfmRMkeGPLpmJTz2NQABjug@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: serial-console: IMAGE_FEATURE, MACHINE_FEATURE or DISTRO_FEATURE?
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
X-List-Received-Date: Thu, 03 Nov 2011 16:42:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2011 at 15:59, Chris Larson <clarson@kergoth.com> wrote:
> On Mon, Oct 24, 2011 at 1:27 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2011/10/24 Koen Kooi <koen@dominion.thruhere.net>
>>>
>>> Hi,
>>>
>>> Otavio is cleaning up systemd in meta-oe to work with his initramfs set=
up
>>> and we stumbled onto a challenge that we'd like some more feedback on.
>>>
>>> The old sysvinit recipes always hardcode a serial getty into inittab,
>>> systemd installs a getty@<port>.service file instead. Otavio doesn't ne=
ed
>>> (or want) a getty on serial in his setup, but I need (and want) it on a=
ll my
>>> setups. So we agreed that it needs to be a feature :)
>>>
>>> I nitially suggested MACHINE_FEATURE, which Otavio implemented here:
>>> http://patchwork.openembedded.org/patch/13713/
>>>
>>> , but I'm having second thoughs about it and am leaning toward an
>>> IMAGE_FEATURE instead. Since this involves *_FEATURE and we want system=
d to
>>> move into oe-core eventually I'm moving the discussion from OE-devel to
>>> OE-core. Not much discussion has been going on, so I hope we'll get som=
e
>>> more feedback here. I'll try to buttonhole some more OE developers at E=
LC
>>> and report back as well.
>>>
>>
>>
>> Technically it is probably both.
>> I've seen embedded systems without a console. That seems to indicate a
>> machine feature.
>> Then again even if you have a console you might not want to enable it (e=
.g.
>> in order not to give the customer root access or even info wrt printk et=
c).
>> That seems to indicate a machine feature.
>> Probably the answer is inbetween: A machine feature HAS_CONSOLE or somet=
hing
>> like that and an image feature CONSOLE_ENABLED.
>
> That sounds analogous to
> MACHINE_FEATURES+DISTRO_FEATURES=3D=3DCOMBINED_FEATURES, but by image
> rather than distro?

I'd like to go ahead in fixing it in a way or another.

What solution show we take?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


