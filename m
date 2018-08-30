Return-Path: <texier.pj2@gmail.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD1D74616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 06:27:20 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id h4-v6so5668286edi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 23:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c/KDC39eheqXSoFUzi6ODjRZn+0+UsFORXQ/V7xCz4s=;
	b=usIomwdHTFG6hTRl5CFPAr8zaY2GBko0kQ2FJwidU8h8i1goXQezm/jcTOsS4C+xYz
	RmUpuJ8R2/TgWFLXIqcpznFJPf9jnvQ3HnFzUZlDJZb3FxTKSCFokP5sPhmnvY/yTWdr
	g8JvaH+Zc7utcWTkg3DzFr0iCXK7AILsxQ7hrwjn7FODupqNHOaI9f233kp8KyfOb2jv
	pONB2PQWLrT9IJpAapj176UQLiyLhZRhvEL8OlnJqrAkumcdW4SK1u76wlSv/8OYzpcg
	RrncCEA14mwyVcweFAaomt6wvDzn3L/vtJUZEzFMuXqeJCldVaUt3rs6ziB9HkNwETHH
	1yAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c/KDC39eheqXSoFUzi6ODjRZn+0+UsFORXQ/V7xCz4s=;
	b=uZN0THleGKJjVk33lHSnR4b3lKGmyNYhRBH8woelPGjuX52JrNlEYNwMsdbctlpbkv
	IPUu5pgtWf8E7XTr6+BdeFDYJ/k1zmVr0K2l8XFHmBdTWGfIhQnVbk0/386ucUlEyp02
	1BcayMHPsuMFNwR6xOV32iXPYTVTNmGXmM7nUzHwq1hLEFC1kLRtL+nmlxEZbJlRzALs
	P/Uu7iUX3EtlaRxlBDQOGDC2b27BV6+GZQ5qBCZP7O/valf/QObkppjTicM63qXgYgdF
	7hCkfv75CMu4vVRx2H8YC6tZCCtcaoNJPzxceLu117aXiD6JwKREaUv4l0OEjvjhNSqe
	o53w==
X-Gm-Message-State: APzg51CJqBM4m+fS2Xprn2lOXMIjvpIVV4TQT1Zjwnc8mvrPBBRo2fV/
	JeD/ts5+XG3Rtg1fn1qHmnySWQuiXZMyuV1273efIg==
X-Google-Smtp-Source: ANB0VdaVa23DalcjD/FzgmOKMzvbIla+2SakGjTWu4kq6UOj2LJ3ViaTtDJjp234h8yeHYTfwNu46yIf/e3WS3fOhA8=
X-Received: by 2002:a50:8646:: with SMTP id
	6-v6mr11192460edt.259.1535610440999; 
	Wed, 29 Aug 2018 23:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <1535583563-7807-1-git-send-email-texier.pj2@gmail.com>
	<CAO5Uq5S685HkwZJHtkHHWJ4yUJ+zLVytBC9UOuikQrNKpPC4mQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5S685HkwZJHtkHHWJ4yUJ+zLVytBC9UOuikQrNKpPC4mQ@mail.gmail.com>
From: TEXIER Pierre-Jean <texier.pj2@gmail.com>
Date: Thu, 30 Aug 2018 08:27:10 +0200
Message-ID: <CALRtUquhTxV0uCqWsMp9a+jkJoKcHWQko_2KW8HoDJeKbaRPuw@mail.gmail.com>
To: alex.kiernan@gmail.com
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
X-List-Received-Date: Thu, 30 Aug 2018 06:27:21 -0000
Content-Type: multipart/alternative; boundary="000000000000d9671c0574a12ad0"

--000000000000d9671c0574a12ad0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Le jeu. 30 ao=C3=BBt 2018 =C3=A0 07:58, Alex Kiernan <alex.kiernan@gmail.co=
m> a
=C3=A9crit :

> On Wed, Aug 29, 2018 at 11:59 PM Pierre-Jean Texier
> <texier.pj2@gmail.com> wrote:
> >
> > The DT specifications demands a unit-address of a node name to match th=
e
> "reg"
> > property in that node. Newer dtc versions will throw warnings if this i=
s
> > not the case.
> >
> > Fixes the following warnings:
> >
> > | <stdout>: Warning (unit_address_vs_reg): Node /images/kernel@1 has a
> unit name, but no reg property
> > | <stdout>: Warning (unit_address_vs_reg): Node /images/kernel@1/hash@1
> has a unit name, but no reg property
> > | <stdout>: Warning (unit_address_vs_reg): Node
> /images/fdt@at91-sama5d27_som1_ek.dtb has a unit name, but no reg propert=
y
> > | <stdout>: Warning (unit_address_vs_reg): Node
> /images/fdt@at91-sama5d27_som1_ek.dtb/hash@1 has a unit name, but no reg
> property
> > | <stdout>: Warning (unit_address_vs_reg): Node
> /images/fdt@at91-sama5d27_som1_ek_pda4.dtb has a unit name, but no reg
> property
> > | <stdout>: Warning (unit_address_vs_reg): Node
> /images/fdt@at91-sama5d27_som1_ek_pda4.dtb/hash@1 has a unit name, but no
> reg property
> > | <stdout>: Warning (unit_address_vs_reg): Node
> /images/fdt@at91-sama5d27_som1_ek_pda7.dtb has a unit name, but no reg
> property
> > | <stdout>: Warning (unit_address_vs_reg): Node
> /images/fdt@at91-sama5d27_som1_ek_pda7.dtb/hash@1 has a unit name, but no
> reg property
> > | <stdout>: Warning (unit_address_vs_reg): Node
> /images/fdt@at91-sama5d27_som1_ek_pda7b.dtb has a unit name, but no reg
> property
> > | <stdout>: Warning (unit_address_vs_reg): Node
> /images/fdt@at91-sama5d27_som1_ek_pda7b.dtb/hash@1 has a unit name, but
> no reg property
> >
> > Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
>
> This strikes me as a bad idea... it breaks existing boot
> configurations as it changes the name that has to be selected by
> U-Boot.
>
>
Thanks for your comment,
In fact, this patch is based on https://patchwork.ozlabs.org/patch/844054/

/Pierre-Jean


> > ---
> > Changes in V2:
> >         - rebase on master
> >
> >  meta/classes/kernel-fitimage.bbclass | 32
> ++++++++++++++++----------------
> >  1 file changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/meta/classes/kernel-fitimage.bbclass
> b/meta/classes/kernel-fitimage.bbclass
> > index a4d7aca..3d7800a 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -109,7 +109,7 @@ fitimage_emit_section_kernel() {
> >         fi
> >
> >         cat << EOF >> ${1}
> > -                kernel@${2} {
> > +                kernel-${2} {
> >                          description =3D "Linux kernel";
> >                          data =3D /incbin/("${3}");
> >                          type =3D "kernel";
> > @@ -118,7 +118,7 @@ fitimage_emit_section_kernel() {
> >                          compression =3D "${4}";
> >                          load =3D <${UBOOT_LOADADDRESS}>;
> >                          entry =3D <${ENTRYPOINT}>;
> > -                        hash@1 {
> > +                        hash-1 {
> >                                  algo =3D "${kernel_csum}";
> >                          };
> >                  };
> > @@ -145,14 +145,14 @@ fitimage_emit_section_dtb() {
> >                 dtb_loadline=3D"load =3D <${UBOOT_DTB_LOADADDRESS}>;"
> >         fi
> >         cat << EOF >> ${1}
> > -                fdt@${2} {
> > +                fdt-${2} {
> >                          description =3D "Flattened Device Tree blob";
> >                          data =3D /incbin/("${3}");
> >                          type =3D "flat_dt";
> >                          arch =3D "${UBOOT_ARCH}";
> >                          compression =3D "none";
> >                          ${dtb_loadline}
> > -                        hash@1 {
> > +                        hash-1 {
> >                                  algo =3D "${dtb_csum}";
> >                          };
> >                  };
> > @@ -170,7 +170,7 @@ fitimage_emit_section_setup() {
> >         setup_csum=3D"sha1"
> >
> >         cat << EOF >> ${1}
> > -                setup@${2} {
> > +                setup-${2} {
> >                          description =3D "Linux setup.bin";
> >                          data =3D /incbin/("${3}");
> >                          type =3D "x86_setup";
> > @@ -179,7 +179,7 @@ fitimage_emit_section_setup() {
> >                          compression =3D "none";
> >                          load =3D <0x00090000>;
> >                          entry =3D <0x00090000>;
> > -                        hash@1 {
> > +                        hash-1 {
> >                                  algo =3D "${setup_csum}";
> >                          };
> >                  };
> > @@ -225,7 +225,7 @@ fitimage_emit_section_ramdisk() {
> >         esac
> >
> >         cat << EOF >> ${1}
> > -                ramdisk@${2} {
> > +                ramdisk-${2} {
> >                          description =3D "${INITRAMFS_IMAGE}";
> >                          data =3D /incbin/("${3}");
> >                          type =3D "ramdisk";
> > @@ -234,7 +234,7 @@ fitimage_emit_section_ramdisk() {
> >                          compression =3D "${ramdisk_ctype}";
> >                          ${ramdisk_loadline}
> >                          ${ramdisk_entryline}
> > -                        hash@1 {
> > +                        hash-1 {
> >                                  algo =3D "${ramdisk_csum}";
> >                          };
> >                  };
> > @@ -269,39 +269,39 @@ fitimage_emit_section_config() {
> >         if [ -n "${2}" ]; then
> >                 conf_desc=3D"Linux kernel"
> >                 sep=3D", "
> > -               kernel_line=3D"kernel =3D \"kernel@${2}\";"
> > +               kernel_line=3D"kernel =3D \"kernel-${2}\";"
> >         fi
> >
> >         if [ -n "${3}" ]; then
> >                 conf_desc=3D"${conf_desc}${sep}FDT blob"
> >                 sep=3D", "
> > -               fdt_line=3D"fdt =3D \"fdt@${3}\";"
> > +               fdt_line=3D"fdt =3D \"fdt-${3}\";"
> >         fi
> >
> >         if [ -n "${4}" ]; then
> >                 conf_desc=3D"${conf_desc}${sep}ramdisk"
> >                 sep=3D", "
> > -               ramdisk_line=3D"ramdisk =3D \"ramdisk@${4}\";"
> > +               ramdisk_line=3D"ramdisk =3D \"ramdisk-${4}\";"
> >         fi
> >
> >         if [ -n "${5}" ]; then
> >                 conf_desc=3D"${conf_desc}${sep}setup"
> > -               setup_line=3D"setup =3D \"setup@${5}\";"
> > +               setup_line=3D"setup =3D \"setup-${5}\";"
> >         fi
> >
> >         if [ "${6}" =3D "1" ]; then
> > -               default_line=3D"default =3D \"conf@${3}\";"
> > +               default_line=3D"default =3D \"conf-${3}\";"
> >         fi
> >
> >         cat << EOF >> ${1}
> >                  ${default_line}
> > -                conf@${3} {
> > +                conf-${3} {
> >                         description =3D "${6} ${conf_desc}";
> >                         ${kernel_line}
> >                         ${fdt_line}
> >                         ${ramdisk_line}
> >                         ${setup_line}
> > -                        hash@1 {
> > +                        hash-1 {
> >                                  algo =3D "${conf_csum}";
> >                          };
> >  EOF
> > @@ -333,7 +333,7 @@ EOF
> >                 sign_line=3D"${sign_line};"
> >
> >                 cat << EOF >> ${1}
> > -                        signature@1 {
> > +                        signature-1 {
> >                                  algo =3D "${conf_csum},rsa2048";
> >                                  key-name-hint =3D "${conf_sign_keyname=
}";
> >                                 ${sign_line}
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Alex Kiernan
>

--000000000000d9671c0574a12ad0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGkgQWxleCw8ZGl2
Pjxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciI+TGXCoGpl
dS4gMzAgYW/Du3QgMjAxOCDDoMKgMDc6NTgsIEFsZXggS2llcm5hbiAmbHQ7PGEgaHJlZj0ibWFp
bHRvOmFsZXgua2llcm5hbkBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5hbGV4LmtpZXJuYW5A
Z21haWwuY29tPC9hPiZndDsgYSDDqWNyaXTCoDo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9
ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0
OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPk9uIFdlZCwgQXVn
IDI5LCAyMDE4IGF0IDExOjU5IFBNIFBpZXJyZS1KZWFuIFRleGllcjxicj4NCiZsdDs8YSBocmVm
PSJtYWlsdG86dGV4aWVyLnBqMkBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj50ZXhpZXIucGoy
QGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4NCiZndDs8YnI+DQomZ3Q7IFRoZSBEVCBzcGVj
aWZpY2F0aW9ucyBkZW1hbmRzIGEgdW5pdC1hZGRyZXNzIG9mIGEgbm9kZSBuYW1lIHRvIG1hdGNo
IHRoZSAmcXVvdDtyZWcmcXVvdDs8YnI+DQomZ3Q7IHByb3BlcnR5IGluIHRoYXQgbm9kZS4gTmV3
ZXIgZHRjIHZlcnNpb25zIHdpbGwgdGhyb3cgd2FybmluZ3MgaWYgdGhpcyBpczxicj4NCiZndDsg
bm90IHRoZSBjYXNlLjxicj4NCiZndDs8YnI+DQomZ3Q7IEZpeGVzIHRoZSBmb2xsb3dpbmcgd2Fy
bmluZ3M6PGJyPg0KJmd0Ozxicj4NCiZndDsgfCAmbHQ7c3Rkb3V0Jmd0OzogV2FybmluZyAodW5p
dF9hZGRyZXNzX3ZzX3JlZyk6IE5vZGUgL2ltYWdlcy9rZXJuZWxAMSBoYXMgYSB1bml0IG5hbWUs
IGJ1dCBubyByZWcgcHJvcGVydHk8YnI+DQomZ3Q7IHwgJmx0O3N0ZG91dCZndDs6IFdhcm5pbmcg
KHVuaXRfYWRkcmVzc192c19yZWcpOiBOb2RlIC9pbWFnZXMva2VybmVsQDEvaGFzaEAxIGhhcyBh
IHVuaXQgbmFtZSwgYnV0IG5vIHJlZyBwcm9wZXJ0eTxicj4NCiZndDsgfCAmbHQ7c3Rkb3V0Jmd0
OzogV2FybmluZyAodW5pdF9hZGRyZXNzX3ZzX3JlZyk6IE5vZGUgL2ltYWdlcy9mZHRAYXQ5MS1z
YW1hNWQyN19zb20xX2VrLmR0YiBoYXMgYSB1bml0IG5hbWUsIGJ1dCBubyByZWcgcHJvcGVydHk8
YnI+DQomZ3Q7IHwgJmx0O3N0ZG91dCZndDs6IFdhcm5pbmcgKHVuaXRfYWRkcmVzc192c19yZWcp
OiBOb2RlIC9pbWFnZXMvZmR0QGF0OTEtc2FtYTVkMjdfc29tMV9lay5kdGIvaGFzaEAxIGhhcyBh
IHVuaXQgbmFtZSwgYnV0IG5vIHJlZyBwcm9wZXJ0eTxicj4NCiZndDsgfCAmbHQ7c3Rkb3V0Jmd0
OzogV2FybmluZyAodW5pdF9hZGRyZXNzX3ZzX3JlZyk6IE5vZGUgL2ltYWdlcy9mZHRAYXQ5MS1z
YW1hNWQyN19zb20xX2VrX3BkYTQuZHRiIGhhcyBhIHVuaXQgbmFtZSwgYnV0IG5vIHJlZyBwcm9w
ZXJ0eTxicj4NCiZndDsgfCAmbHQ7c3Rkb3V0Jmd0OzogV2FybmluZyAodW5pdF9hZGRyZXNzX3Zz
X3JlZyk6IE5vZGUgL2ltYWdlcy9mZHRAYXQ5MS1zYW1hNWQyN19zb20xX2VrX3BkYTQuZHRiL2hh
c2hAMSBoYXMgYSB1bml0IG5hbWUsIGJ1dCBubyByZWcgcHJvcGVydHk8YnI+DQomZ3Q7IHwgJmx0
O3N0ZG91dCZndDs6IFdhcm5pbmcgKHVuaXRfYWRkcmVzc192c19yZWcpOiBOb2RlIC9pbWFnZXMv
ZmR0QGF0OTEtc2FtYTVkMjdfc29tMV9la19wZGE3LmR0YiBoYXMgYSB1bml0IG5hbWUsIGJ1dCBu
byByZWcgcHJvcGVydHk8YnI+DQomZ3Q7IHwgJmx0O3N0ZG91dCZndDs6IFdhcm5pbmcgKHVuaXRf
YWRkcmVzc192c19yZWcpOiBOb2RlIC9pbWFnZXMvZmR0QGF0OTEtc2FtYTVkMjdfc29tMV9la19w
ZGE3LmR0Yi9oYXNoQDEgaGFzIGEgdW5pdCBuYW1lLCBidXQgbm8gcmVnIHByb3BlcnR5PGJyPg0K
Jmd0OyB8ICZsdDtzdGRvdXQmZ3Q7OiBXYXJuaW5nICh1bml0X2FkZHJlc3NfdnNfcmVnKTogTm9k
ZSAvaW1hZ2VzL2ZkdEBhdDkxLXNhbWE1ZDI3X3NvbTFfZWtfcGRhN2IuZHRiIGhhcyBhIHVuaXQg
bmFtZSwgYnV0IG5vIHJlZyBwcm9wZXJ0eTxicj4NCiZndDsgfCAmbHQ7c3Rkb3V0Jmd0OzogV2Fy
bmluZyAodW5pdF9hZGRyZXNzX3ZzX3JlZyk6IE5vZGUgL2ltYWdlcy9mZHRAYXQ5MS1zYW1hNWQy
N19zb20xX2VrX3BkYTdiLmR0Yi9oYXNoQDEgaGFzIGEgdW5pdCBuYW1lLCBidXQgbm8gcmVnIHBy
b3BlcnR5PGJyPg0KJmd0Ozxicj4NCiZndDsgU2lnbmVkLW9mZi1ieTogUGllcnJlLUplYW4gVGV4
aWVyICZsdDs8YSBocmVmPSJtYWlsdG86dGV4aWVyLnBqMkBnbWFpbC5jb20iIHRhcmdldD0iX2Js
YW5rIj50ZXhpZXIucGoyQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPg0KPGJyPg0KVGhpcyBzdHJpa2Vz
IG1lIGFzIGEgYmFkIGlkZWEuLi4gaXQgYnJlYWtzIGV4aXN0aW5nIGJvb3Q8YnI+DQpjb25maWd1
cmF0aW9ucyBhcyBpdCBjaGFuZ2VzIHRoZSBuYW1lIHRoYXQgaGFzIHRvIGJlIHNlbGVjdGVkIGJ5
PGJyPg0KVS1Cb290Ljxicj4NCjxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj48
ZGl2PlRoYW5rcyBmb3IgeW91ciBjb21tZW50LDwvZGl2PjxkaXY+SW4gZmFjdCwgdGhpcyBwYXRj
aCBpcyBiYXNlZCBvbiA8YSBocmVmPSJodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3BhdGNo
Lzg0NDA1NC8iIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Bh
dGNoLzg0NDA1NC88L2E+PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4vUGllcnJlLUpl
YW48L2Rpdj48ZGl2PsKgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHls
ZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0
LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KJmd0OyAtLS08YnI+DQomZ3Q7IENoYW5nZXMg
aW4gVjI6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgLSByZWJhc2Ugb24gbWFzdGVyPGJyPg0KJmd0
Ozxicj4NCiZndDvCoCBtZXRhL2NsYXNzZXMva2VybmVsLWZpdGltYWdlLmJiY2xhc3MgfCAzMiAr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLTxicj4NCiZndDvCoCAxIGZpbGUgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pPGJyPg0KJmd0Ozxicj4NCiZndDsg
ZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9rZXJuZWwtZml0aW1hZ2UuYmJjbGFzcyBiL21ldGEv
Y2xhc3Nlcy9rZXJuZWwtZml0aW1hZ2UuYmJjbGFzczxicj4NCiZndDsgaW5kZXggYTRkN2FjYS4u
M2Q3ODAwYSAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL21ldGEvY2xhc3Nlcy9rZXJuZWwtZml0aW1h
Z2UuYmJjbGFzczxicj4NCiZndDsgKysrIGIvbWV0YS9jbGFzc2VzL2tlcm5lbC1maXRpbWFnZS5i
YmNsYXNzPGJyPg0KJmd0OyBAQCAtMTA5LDcgKzEwOSw3IEBAIGZpdGltYWdlX2VtaXRfc2VjdGlv
bl9rZXJuZWwoKSB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgZmk8YnI+DQomZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgY2F0ICZsdDsmbHQ7IEVPRiAmZ3Q7Jmd0OyAkezF9PGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAga2VybmVsQCR7Mn0gezxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGtlcm5lbC0kezJ9IHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgZGVzY3JpcHRpb24gPSAmcXVvdDtMaW51eCBrZXJuZWwmcXVv
dDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRhdGEg
PSAvaW5jYmluLygmcXVvdDskezN9JnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgdHlwZSA9ICZxdW90O2tlcm5lbCZxdW90Ozs8YnI+DQomZ3Q7
IEBAIC0xMTgsNyArMTE4LDcgQEAgZml0aW1hZ2VfZW1pdF9zZWN0aW9uX2tlcm5lbCgpIHs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29tcHJlc3Npb24g
PSAmcXVvdDskezR9JnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBsb2FkID0gJmx0OyR7VUJPT1RfTE9BREFERFJFU1N9Jmd0Ozs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW50cnkgPSAmbHQ7JHtFTlRS
WVBPSU5UfSZndDs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgaGFzaEAxIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBoYXNoLTEgezxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBhbGdvID0gJnF1b3Q7JHtrZXJuZWxfY3N1bX0mcXVvdDs7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyBAQCAtMTQ1LDE0ICsxNDUsMTQgQEAg
Zml0aW1hZ2VfZW1pdF9zZWN0aW9uX2R0YigpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBkdGJfbG9hZGxpbmU9JnF1b3Q7bG9hZCA9ICZsdDske1VCT09UX0RUQl9MT0FEQURE
UkVTU30mZ3Q7OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGZpPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgY2F0ICZsdDsmbHQ7IEVPRiAmZ3Q7Jmd0OyAkezF9PGJyPg0KJmd0OyAtwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgZmR0QCR7Mn0gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGZkdC0kezJ9IHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgZGVzY3JpcHRpb24gPSAmcXVvdDtGbGF0dGVuZWQgRGV2aWNlIFRyZWUgYmxvYiZx
dW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZGF0
YSA9IC9pbmNiaW4vKCZxdW90OyR7M30mcXVvdDspOzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0eXBlID0gJnF1b3Q7ZmxhdF9kdCZxdW90Ozs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXJjaCA9ICZxdW90OyR7
VUJPT1RfQVJDSH0mcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGNvbXByZXNzaW9uID0gJnF1b3Q7bm9uZSZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJHtkdGJfbG9hZGxpbmV9PGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaGFzaEAxIHs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBoYXNoLTEgezxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhbGdvID0g
JnF1b3Q7JHtkdGJfY3N1bX0mcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07
PGJyPg0KJmd0OyBAQCAtMTcwLDcgKzE3MCw3IEBAIGZpdGltYWdlX2VtaXRfc2VjdGlvbl9zZXR1
cCgpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBzZXR1cF9jc3VtPSZxdW90O3NoYTEmcXVvdDs8
YnI+DQomZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgY2F0ICZsdDsmbHQ7IEVPRiAmZ3Q7Jmd0
OyAkezF9PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2V0dXBAJHsyfSB7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2V0dXAtJHsyfSB7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRlc2NyaXB0aW9uID0gJnF1b3Q7
TGludXggc2V0dXAuYmluJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBkYXRhID0gL2luY2Jpbi8oJnF1b3Q7JHszfSZxdW90Oyk7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHR5cGUgPSAmcXVvdDt4ODZf
c2V0dXAmcXVvdDs7PGJyPg0KJmd0OyBAQCAtMTc5LDcgKzE3OSw3IEBAIGZpdGltYWdlX2VtaXRf
c2VjdGlvbl9zZXR1cCgpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgY29tcHJlc3Npb24gPSAmcXVvdDtub25lJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBsb2FkID0gJmx0OzB4MDAwOTAwMDAmZ3Q7
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnRyeSA9
ICZsdDsweDAwMDkwMDAwJmd0Ozs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBoYXNoQDEgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGhhc2gtMSB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFsZ28gPSAmcXVvdDske3NldHVwX2NzdW19JnF1b3Q7Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCiZndDsgQEAgLTIyNSw3ICsyMjUs
NyBAQCBmaXRpbWFnZV9lbWl0X3NlY3Rpb25fcmFtZGlzaygpIHs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqBlc2FjPGJyPg0KJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGNhdCAmbHQ7Jmx0OyBF
T0YgJmd0OyZndDsgJHsxfTxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJhbWRp
c2tAJHsyfSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmFtZGlzay0kezJ9
IHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZGVzY3Jp
cHRpb24gPSAmcXVvdDske0lOSVRSQU1GU19JTUFHRX0mcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRhdGEgPSAvaW5jYmluLygmcXVvdDskezN9
JnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
dHlwZSA9ICZxdW90O3JhbWRpc2smcXVvdDs7PGJyPg0KJmd0OyBAQCAtMjM0LDcgKzIzNCw3IEBA
IGZpdGltYWdlX2VtaXRfc2VjdGlvbl9yYW1kaXNrKCkgezxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjb21wcmVzc2lvbiA9ICZxdW90OyR7cmFtZGlza19j
dHlwZX0mcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgICR7cmFtZGlza19sb2FkbGluZX08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgJHtyYW1kaXNrX2VudHJ5bGluZX08YnI+DQomZ3Q7IC3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBoYXNoQDEgezxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGhhc2gtMSB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFsZ28gPSAmcXVvdDske3JhbWRp
c2tfY3N1bX0mcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIH07PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0
OyBAQCAtMjY5LDM5ICsyNjksMzkgQEAgZml0aW1hZ2VfZW1pdF9zZWN0aW9uX2NvbmZpZygpIHs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBpZiBbIC1uICZxdW90OyR7Mn0mcXVvdDsgXTsgdGhlbjxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbmZfZGVzYz0mcXVvdDtMaW51eCBr
ZXJuZWwmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzZXA9JnF1b3Q7
LCAmcXVvdDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGtlcm5lbF9saW5lPSZx
dW90O2tlcm5lbCA9IFwmcXVvdDtrZXJuZWxAJHsyfVwmcXVvdDs7JnF1b3Q7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBrZXJuZWxfbGluZT0mcXVvdDtrZXJuZWwgPSBcJnF1b3Q7
a2VybmVsLSR7Mn1cJnF1b3Q7OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGZpPGJyPg0K
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGlmIFsgLW4gJnF1b3Q7JHszfSZxdW90OyBdOyB0
aGVuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29uZl9kZXNjPSZxdW90OyR7
Y29uZl9kZXNjfSR7c2VwfUZEVCBibG9iJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgc2VwPSZxdW90OywgJnF1b3Q7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBmZHRfbGluZT0mcXVvdDtmZHQgPSBcJnF1b3Q7ZmR0QCR7M31cJnF1b3Q7OyZxdW90Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZmR0X2xpbmU9JnF1b3Q7ZmR0ID0gXCZx
dW90O2ZkdC0kezN9XCZxdW90OzsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBmaTxicj4N
CiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBpZiBbIC1uICZxdW90OyR7NH0mcXVvdDsgXTsg
dGhlbjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbmZfZGVzYz0mcXVvdDsk
e2NvbmZfZGVzY30ke3NlcH1yYW1kaXNrJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgc2VwPSZxdW90OywgJnF1b3Q7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByYW1kaXNrX2xpbmU9JnF1b3Q7cmFtZGlzayA9IFwmcXVvdDtyYW1kaXNrQCR7NH1cJnF1
b3Q7OyZxdW90Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmFtZGlza19saW5l
PSZxdW90O3JhbWRpc2sgPSBcJnF1b3Q7cmFtZGlzay0kezR9XCZxdW90OzsmcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqBmaTxicj4NCiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBpZiBb
IC1uICZxdW90OyR7NX0mcXVvdDsgXTsgdGhlbjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNvbmZfZGVzYz0mcXVvdDske2NvbmZfZGVzY30ke3NlcH1zZXR1cCZxdW90Ozxicj4N
CiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2V0dXBfbGluZT0mcXVvdDtzZXR1cCA9IFwm
cXVvdDtzZXR1cEAkezV9XCZxdW90OzsmcXVvdDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHNldHVwX2xpbmU9JnF1b3Q7c2V0dXAgPSBcJnF1b3Q7c2V0dXAtJHs1fVwmcXVvdDs7
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgZmk8YnI+DQomZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgaWYgWyAmcXVvdDskezZ9JnF1b3Q7ID0gJnF1b3Q7MSZxdW90OyBdOyB0aGVuPGJy
Pg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZWZhdWx0X2xpbmU9JnF1b3Q7ZGVmYXVs
dCA9IFwmcXVvdDtjb25mQCR7M31cJnF1b3Q7OyZxdW90Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZGVmYXVsdF9saW5lPSZxdW90O2RlZmF1bHQgPSBcJnF1b3Q7Y29uZi0kezN9
XCZxdW90OzsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBmaTxicj4NCiZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqBjYXQgJmx0OyZsdDsgRU9GICZndDsmZ3Q7ICR7MX08YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJHtkZWZhdWx0X2xpbmV9PGJyPg0KJmd0OyAtwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgY29uZkAkezN9IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBjb25mLSR7M30gezxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGRlc2NyaXB0aW9uID0gJnF1b3Q7JHs2fSAke2NvbmZfZGVzY30mcXVvdDs7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJHtrZXJuZWxf
bGluZX08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAke2Zk
dF9saW5lfTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCR7
cmFtZGlza19saW5lfTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCR7c2V0dXBfbGluZX08YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBoYXNoQDEgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGhhc2gtMSB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGFsZ28gPSAmcXVvdDske2NvbmZfY3N1bX0mcXVvdDs7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0O8Kg
IEVPRjxicj4NCiZndDsgQEAgLTMzMyw3ICszMzMsNyBAQCBFT0Y8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzaWduX2xpbmU9JnF1b3Q7JHtzaWduX2xpbmV9OyZxdW90Ozxicj4N
CiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXQgJmx0OyZsdDsgRU9G
ICZndDsmZ3Q7ICR7MX08YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBzaWduYXR1cmVAMSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgc2lnbmF0dXJlLTEgezxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhbGdvID0gJnF1b3Q7JHtjb25mX2NzdW19LHJzYTIw
NDgmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGtleS1uYW1lLWhpbnQgPSAmcXVvdDske2NvbmZfc2lnbl9rZXluYW1lfSZx
dW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAke3NpZ25fbGluZX08YnI+DQomZ3Q7IC0tPGJyPg0KJmd0OyAyLjcuNDxicj4NCiZn
dDs8YnI+DQomZ3Q7IC0tPGJyPg0KJmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXzxicj4NCiZndDsgT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0
PGJyPg0KJmd0OyA8YSBocmVmPSJtYWlsdG86T3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPk9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc8L2E+PGJyPg0KJmd0OyA8YSBocmVmPSJodHRwOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlPC9hPjxicj4NCjxicj4NCjxicj4NCjxicj4NCi0t
IDxicj4NCkFsZXggS2llcm5hbjxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj48L2Rpdj48
L2Rpdj4NCg==

--000000000000d9671c0574a12ad0--
