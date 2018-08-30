Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5BC7918A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 08:11:39 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id b14-v6so3854441vke.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 01:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JkkFRneyk0wgH5Z1uVUPPTlxf5zMIcuICgj2AOxYYe4=;
	b=dY52d65h946uVsCBtqb31PwwCTRvY8Ckt4nOESxbNr4oELsfQqMPGJkK2eQDYKGeh6
	seZicYJmPGbCEXawEyogQq3dzFutrHk7jdDA0fCx+8a8thZS+/DmdIjeIJsCaHu7RouC
	ZlmoVuQts03z6HJw2NmSQwBnKzeNGJ/bAybuSoI+jL9NMYmgEg2yw94HvwQdrpy5b1x7
	ZyLewih2bYc5QS2+qFgbiRA0bgemYqgWyF+luEaCzuE/On7PwT1ql+b4w8FsHWIaVRUR
	GvBd7B1hbkOhehge5bpFKyOAyn9gChGR1CJVcfxmZNHG2XhMIiVFfmAcoO3ICd/W3fEG
	9fZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JkkFRneyk0wgH5Z1uVUPPTlxf5zMIcuICgj2AOxYYe4=;
	b=s2tANIUmay4IFt7iwsnh9DF1AlJlix5GHDvvdkXbJZ1QqnavLGYYhACjvEW2c8p667
	ke2KFFwfdJMAQLxMmdlQu8JJAxCYWvR1eMx1MZ7A1NU3QtGG57M+g6Igwam6RaqOewfw
	3ZTjDdlXIeeZhTFxTa9w+TN0I7iqBP74RwHmP6N0HTtRio7J7Y2tMk+ECjvZgopdOutW
	uXqqolB1aGQaxhGHY4voudzcUXEaGTqzuVN22pgCcCCAWpAftIp1FzxOJNO+2fzIdaAI
	k2GO8o1JPIzwIsGh6as7mCjsjxglQOppZ9awILWSQINVvsS+Aqm2JIgBS9vtsw2Kr7Z8
	lSbQ==
X-Gm-Message-State: APzg51ARAMbxFawZm+lEpLiNhRaETKdDB9MY4CGiE6OiKNtU5NNJUjFj
	NkiWHL61HHEK3r5V16phoBHY4Auq/D+nMyPgo1Fze8W/T2A=
X-Google-Smtp-Source: ANB0Vda9BglhuwaOvFun58Mxsx5+cxOxrKHfUpSsIJwVb/R5rulKfH6wbjZJ0nHPtzw0CrBsPvh17z+hYvKtkDb7uBI=
X-Received: by 2002:a1f:e847:: with SMTP id
	f68-v6mr6114261vkh.31.1535616700313; 
	Thu, 30 Aug 2018 01:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <1535583563-7807-1-git-send-email-texier.pj2@gmail.com>
	<CAO5Uq5S685HkwZJHtkHHWJ4yUJ+zLVytBC9UOuikQrNKpPC4mQ@mail.gmail.com>
	<CALRtUquhTxV0uCqWsMp9a+jkJoKcHWQko_2KW8HoDJeKbaRPuw@mail.gmail.com>
In-Reply-To: <CALRtUquhTxV0uCqWsMp9a+jkJoKcHWQko_2KW8HoDJeKbaRPuw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 30 Aug 2018 09:11:29 +0100
Message-ID: <CAO5Uq5TR6fWDWY6W+9Un9aB5Rjis5TUfck8O0Sra3tX0-BydDA@mail.gmail.com>
To: texier.pj2@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-fitimage: Fix no reg property warning
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
X-List-Received-Date: Thu, 30 Aug 2018 08:11:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pierre-Jean

On Thu, Aug 30, 2018 at 7:27 AM TEXIER Pierre-Jean <texier.pj2@gmail.com> w=
rote:
>
> Hi Alex,
>
> Le jeu. 30 ao=C3=BBt 2018 =C3=A0 07:58, Alex Kiernan <alex.kiernan@gmail.=
com> a =C3=A9crit :
>>
>> On Wed, Aug 29, 2018 at 11:59 PM Pierre-Jean Texier
>> <texier.pj2@gmail.com> wrote:
>> >
>> > The DT specifications demands a unit-address of a node name to match t=
he "reg"
>> > property in that node. Newer dtc versions will throw warnings if this =
is
>> > not the case.
>> >
>> > Fixes the following warnings:
>> >
>> > | <stdout>: Warning (unit_address_vs_reg): Node /images/kernel@1 has a=
 unit name, but no reg property
>> > | <stdout>: Warning (unit_address_vs_reg): Node /images/kernel@1/hash@=
1 has a unit name, but no reg property
>> > | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5=
d27_som1_ek.dtb has a unit name, but no reg property
>> > | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5=
d27_som1_ek.dtb/hash@1 has a unit name, but no reg property
>> > | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5=
d27_som1_ek_pda4.dtb has a unit name, but no reg property
>> > | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5=
d27_som1_ek_pda4.dtb/hash@1 has a unit name, but no reg property
>> > | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5=
d27_som1_ek_pda7.dtb has a unit name, but no reg property
>> > | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5=
d27_som1_ek_pda7.dtb/hash@1 has a unit name, but no reg property
>> > | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5=
d27_som1_ek_pda7b.dtb has a unit name, but no reg property
>> > | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5=
d27_som1_ek_pda7b.dtb/hash@1 has a unit name, but no reg property
>> >
>> > Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
>>
>> This strikes me as a bad idea... it breaks existing boot
>> configurations as it changes the name that has to be selected by
>> U-Boot.
>>
>
> Thanks for your comment,
> In fact, this patch is based on https://patchwork.ozlabs.org/patch/844054=
/
>

That just patches the docs... if no one was using this code, I'd not
be arguing about it. But with this change I can't upgrade my kernel
without also updating my bootloader, and if I update my bootloader I
can't then rollback (or in reality I'd have to accommodate both
formats).

If there was say UBOOT_FIT_IMAGE_SEPARATOR which was set so that you
can pick your separator, that'd work for me. I guess the only question
is what you default to - I'd argue it's a breaking change so should
stay as '@'.

> /Pierre-Jean
>
>>
>> > ---
>> > Changes in V2:
>> >         - rebase on master
>> >
>> >  meta/classes/kernel-fitimage.bbclass | 32 ++++++++++++++++-----------=
-----
>> >  1 file changed, 16 insertions(+), 16 deletions(-)
>> >
>> > diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kerne=
l-fitimage.bbclass
>> > index a4d7aca..3d7800a 100644
>> > --- a/meta/classes/kernel-fitimage.bbclass
>> > +++ b/meta/classes/kernel-fitimage.bbclass
>> > @@ -109,7 +109,7 @@ fitimage_emit_section_kernel() {
>> >         fi
>> >
>> >         cat << EOF >> ${1}
>> > -                kernel@${2} {
>> > +                kernel-${2} {
>> >                          description =3D "Linux kernel";
>> >                          data =3D /incbin/("${3}");
>> >                          type =3D "kernel";
>> > @@ -118,7 +118,7 @@ fitimage_emit_section_kernel() {
>> >                          compression =3D "${4}";
>> >                          load =3D <${UBOOT_LOADADDRESS}>;
>> >                          entry =3D <${ENTRYPOINT}>;
>> > -                        hash@1 {
>> > +                        hash-1 {
>> >                                  algo =3D "${kernel_csum}";
>> >                          };
>> >                  };
>> > @@ -145,14 +145,14 @@ fitimage_emit_section_dtb() {
>> >                 dtb_loadline=3D"load =3D <${UBOOT_DTB_LOADADDRESS}>;"
>> >         fi
>> >         cat << EOF >> ${1}
>> > -                fdt@${2} {
>> > +                fdt-${2} {
>> >                          description =3D "Flattened Device Tree blob";
>> >                          data =3D /incbin/("${3}");
>> >                          type =3D "flat_dt";
>> >                          arch =3D "${UBOOT_ARCH}";
>> >                          compression =3D "none";
>> >                          ${dtb_loadline}
>> > -                        hash@1 {
>> > +                        hash-1 {
>> >                                  algo =3D "${dtb_csum}";
>> >                          };
>> >                  };
>> > @@ -170,7 +170,7 @@ fitimage_emit_section_setup() {
>> >         setup_csum=3D"sha1"
>> >
>> >         cat << EOF >> ${1}
>> > -                setup@${2} {
>> > +                setup-${2} {
>> >                          description =3D "Linux setup.bin";
>> >                          data =3D /incbin/("${3}");
>> >                          type =3D "x86_setup";
>> > @@ -179,7 +179,7 @@ fitimage_emit_section_setup() {
>> >                          compression =3D "none";
>> >                          load =3D <0x00090000>;
>> >                          entry =3D <0x00090000>;
>> > -                        hash@1 {
>> > +                        hash-1 {
>> >                                  algo =3D "${setup_csum}";
>> >                          };
>> >                  };
>> > @@ -225,7 +225,7 @@ fitimage_emit_section_ramdisk() {
>> >         esac
>> >
>> >         cat << EOF >> ${1}
>> > -                ramdisk@${2} {
>> > +                ramdisk-${2} {
>> >                          description =3D "${INITRAMFS_IMAGE}";
>> >                          data =3D /incbin/("${3}");
>> >                          type =3D "ramdisk";
>> > @@ -234,7 +234,7 @@ fitimage_emit_section_ramdisk() {
>> >                          compression =3D "${ramdisk_ctype}";
>> >                          ${ramdisk_loadline}
>> >                          ${ramdisk_entryline}
>> > -                        hash@1 {
>> > +                        hash-1 {
>> >                                  algo =3D "${ramdisk_csum}";
>> >                          };
>> >                  };
>> > @@ -269,39 +269,39 @@ fitimage_emit_section_config() {
>> >         if [ -n "${2}" ]; then
>> >                 conf_desc=3D"Linux kernel"
>> >                 sep=3D", "
>> > -               kernel_line=3D"kernel =3D \"kernel@${2}\";"
>> > +               kernel_line=3D"kernel =3D \"kernel-${2}\";"
>> >         fi
>> >
>> >         if [ -n "${3}" ]; then
>> >                 conf_desc=3D"${conf_desc}${sep}FDT blob"
>> >                 sep=3D", "
>> > -               fdt_line=3D"fdt =3D \"fdt@${3}\";"
>> > +               fdt_line=3D"fdt =3D \"fdt-${3}\";"
>> >         fi
>> >
>> >         if [ -n "${4}" ]; then
>> >                 conf_desc=3D"${conf_desc}${sep}ramdisk"
>> >                 sep=3D", "
>> > -               ramdisk_line=3D"ramdisk =3D \"ramdisk@${4}\";"
>> > +               ramdisk_line=3D"ramdisk =3D \"ramdisk-${4}\";"
>> >         fi
>> >
>> >         if [ -n "${5}" ]; then
>> >                 conf_desc=3D"${conf_desc}${sep}setup"
>> > -               setup_line=3D"setup =3D \"setup@${5}\";"
>> > +               setup_line=3D"setup =3D \"setup-${5}\";"
>> >         fi
>> >
>> >         if [ "${6}" =3D "1" ]; then
>> > -               default_line=3D"default =3D \"conf@${3}\";"
>> > +               default_line=3D"default =3D \"conf-${3}\";"
>> >         fi
>> >
>> >         cat << EOF >> ${1}
>> >                  ${default_line}
>> > -                conf@${3} {
>> > +                conf-${3} {
>> >                         description =3D "${6} ${conf_desc}";
>> >                         ${kernel_line}
>> >                         ${fdt_line}
>> >                         ${ramdisk_line}
>> >                         ${setup_line}
>> > -                        hash@1 {
>> > +                        hash-1 {
>> >                                  algo =3D "${conf_csum}";
>> >                          };
>> >  EOF
>> > @@ -333,7 +333,7 @@ EOF
>> >                 sign_line=3D"${sign_line};"
>> >
>> >                 cat << EOF >> ${1}
>> > -                        signature@1 {
>> > +                        signature-1 {
>> >                                  algo =3D "${conf_csum},rsa2048";
>> >                                  key-name-hint =3D "${conf_sign_keynam=
e}";
>> >                                 ${sign_line}
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> Alex Kiernan



--=20
Alex Kiernan

