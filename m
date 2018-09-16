Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id F044774A35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 09:18:39 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id k14-v6so10521558edr.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 02:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=LB9ggrBf4NCpb+o97VdJ0NV7WVf7xB/ipWCcB7JgK14=;
	b=r6lEOjAlxvjERxZ4Xj9WtZkXnPxIddcz0q1Aws8+dqsWAMok7MZ7D9o9J2e/qLHrXB
	NO/vkmqvhKzYHJi3Fl4nZ5uNDb0WMxYlfvwvZS4bsACQCqUkqBKTVZZN3c8OiZvSbuds
	QrAypmpWKK9UytHlzRyWErYzHYxU8y1Zmm7LHPVVbBfaG/H8y1ggcN5wPDekRq/uOnKr
	Xcvt0Pdp7BvlOQmDt/1E7rl3vCvBOtyvHy9a5fLWuYVNJaNDtUWPDoxAiJ0Y53ZYcat2
	Hskic2H3wziUydg32oR/E45xG/5wBnWyMQq/eXS/BRwa/5dD/qSNYZdqoA9nFECdqYHU
	jVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=LB9ggrBf4NCpb+o97VdJ0NV7WVf7xB/ipWCcB7JgK14=;
	b=bylcqYSn2k6QYEiPNlq0JKLNLRnj7YVbcB0GWAHGW803czOmJidWgVtnsSqWs6uOZk
	3j61R0DlSGbQy97gZghVsiPzpLJyoNodb3k9+ScgQuh8vNhqhKOLFlvLcg10rm2tpUOB
	32+RCmQdCS2m3P/moyGkOWZNmO596EkE0Qw4pZx/lgpoJdOSdz+CkjtLNCwEoGGtJtOW
	bkOCmGIlIyEbzPfYss3gZh37tntwvvdnivF9MxT7oe2/PvnnXqHb7htLH+ytMAeTk3IU
	cnJoBShu6PJvlG4wWBbTDrv1ihWFKJ4MwYBAci1gAEuI2csYjWO9INF8tMZSD+wI0bxW
	gCjA==
X-Gm-Message-State: APzg51CuEX15lRzObgeMbbNwTYzea9umgabXm2fYpRBdFN1vglQJpl9K
	rjrq/G8wfwFwLFptjDDFrQ/OcA==
X-Google-Smtp-Source: ANB0VdYFwEzwoQnqC8C62HkoCbZaPxSSdx1g7KrcHMGyC+ZWY58muoQk8tWK0dE0ieU4Gh/ooyFWvQ==
X-Received: by 2002:a50:d75d:: with SMTP id
	i29-v6mr34500688edj.17.1537089520227; 
	Sun, 16 Sep 2018 02:18:40 -0700 (PDT)
Received: from [192.168.2.5] ([145.132.74.106])
	by smtp.gmail.com with ESMTPSA id
	j10-v6sm5769364ede.5.2018.09.16.02.18.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Sep 2018 02:18:39 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Leon Woestenberg <leon@sidebranch.com>
X-Mailer: iPhone Mail (15G77)
In-Reply-To: <CAO5Uq5S43E3cXUSEVJP8-dKtuqR-XaqrN+6fhHfy6QESLRh7_w@mail.gmail.com>
Date: Sun, 16 Sep 2018 11:18:38 +0200
Message-Id: <AB33E724-81C2-43BC-8169-6100CABAA375@sidebranch.com>
References: <1536616603-9502-1-git-send-email-leon@sidebranch.com>
	<CAO5Uq5S43E3cXUSEVJP8-dKtuqR-XaqrN+6fhHfy6QESLRh7_w@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Sun, 16 Sep 2018 09:18:40 -0000
X-Groupsio-MsgNum: 116313
Content-Type: multipart/signed;
	boundary=Apple-Mail-AB769C63-4E40-4849-95A1-B270BBDB8F7E;
	protocol="application/pkcs7-signature"; micalg=sha1
Content-Transfer-Encoding: 7bit

--Apple-Mail-AB769C63-4E40-4849-95A1-B270BBDB8F7E
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alex,

> On 15 Sep 2018, at 19:45, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>=20
>> On Mon, Sep 10, 2018 at 10:57 PM Leon Woestenberg <leon@sidebranch.com> w=
rote:
>>=20
>> kernel-fitimage.bbclass replaces an occurance of "fitImage" in
>> KERNEL_IMAGETYPE_FOR_MAKE by an image type that is buildable for the
>> architecture (such as zImage). The kernel-fitimage.bbclass packs that
>> image as sub-image in a flattened image tree image (fitImage) and
>> deploys this fitImage along with the image tree source file (.its).
>>=20
>> kernel-fitimage.bbclass does not alter KERNEL_IMAGETYPES, which thus
>> also contains "fitImage", which kernel.bbclass will also deploy
>> redundantly with different naming.
>>=20
>> The result is a dual deployment with slightly different naming,
>> each with a set of symlinks.
>>=20
>> The solution chosen is to have fitImage deployment be handled by
>> kernel-fitimage.bbclass, and have kernel.bbclass ignore fitImage
>> types during deployment.
>>=20
>> Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
>=20
> This looks completely plausible, but the two "FIT" images that are
> installed aren't identical... after this I end up with no FIT image
> and only a bare image in the deploy dir.

What was in your KERNEL_IMAGETYPES? Did it at least contain =E2=80=9CfitImag=
e=E2=80=9D??

> Digging into it, the logic between the two classes is a bit odd... in
> the case of a non initramfs build, the fitImage is actually installed
> here.

If =E2=80=98here=E2=80=99 means kernel-fitimage, then I=E2=80=99ld say ALL v=
ersions of a FIT image containing AT LEAST a Linux kernel are installed by k=
ernel-fitimage.

> The one that's installed in kernel-fitimage is the bare
> linux.bin, but named fitImage-...

which is totally broken. If you want the bare kernel binary (which naming de=
pends on architecture, so it should NOT be hard-coded to linux.bin anyway), y=
ou would need to specify that type *also* in KERNEL_IMAGETYPES, next to =E2=80=
=9CfitImage=E2=80=9D.
>=20
> I'll send a patch reverting this and removing the other one as I'd
> agree that it appears to have no purpose (and if you did want it, I
> guess you could list it in KERNEL_IMAGETYPES).

I=E2=80=99m sorry I cannot follow what this and the other one is, and it. Le=
t=E2=80=99s first understand all cases correctly.

Regards, Leon
>=20
>> ---
>> meta/classes/kernel.bbclass | 18 ++++++++++++------
>> 1 file changed, 12 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index b57832c..1f69091 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -669,8 +669,11 @@ kernel_do_deploy() {
>>        fi
>>=20
>>        for imageType in ${KERNEL_IMAGETYPES} ; do
>> -               base_name=3D${imageType}-${KERNEL_IMAGE_NAME}
>> -               install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deploy=
Dir/${base_name}.bin
>> +               # kernel-fitimage class deploys fitImages, skip here
>> +               if [ "$imageType" !=3D "fitImage" ]; then
>> +                       base_name=3D${imageType}-${KERNEL_IMAGE_NAME}
>> +                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}=
 $deployDir/${base_name}.bin
>> +               fi
>>        done
>>        if [ ${MODULE_TARBALL_DEPLOY} =3D "1" ] && (grep -q -i -e '^CONFIG=
_MODULES=3Dy$' .config); then
>>                mkdir -p ${D}/lib
>> @@ -687,10 +690,13 @@ kernel_do_deploy() {
>>=20
>>        if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" =3D=
 x1 ]; then
>>                for imageType in ${KERNEL_IMAGETYPES} ; do
>> -                       initramfs_base_name=3D${imageType}-${INITRAMFS_NA=
ME}
>> -                       initramfs_symlink_name=3D${imageType}-${INITRAMFS=
_LINK_NAME}
>> -                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}=
.initramfs $deployDir/${initramfs_base_name}.bin
>> -                       ln -sf ${initramfs_base_name}.bin $deployDir/${in=
itramfs_symlink_name}.bin
>> +                       # kernel-fitimage class deploys fitImages, skip h=
ere
>> +                       if [ "$imageType" !=3D "fitImage" ]; then
>> +                               initramfs_base_name=3D${imageType}-${INIT=
RAMFS_NAME}
>> +                               initramfs_symlink_name=3D${imageType}-${I=
NITRAMFS_LINK_NAME}
>> +                               install -m 0644 ${KERNEL_OUTPUT_DIR}/${im=
ageType}.initramfs $deployDir/${initramfs_base_name}.bin
>> +                               ln -sf ${initramfs_base_name}.bin $deploy=
Dir/${initramfs_symlink_name}.bin
>> +                       fi
>>                done
>>        fi
>> }
>> --
>> 2.7.4
>>=20
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> --
> Alex Kiernan

--Apple-Mail-AB769C63-4E40-4849-95A1-B270BBDB8F7E
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Disposition: attachment;
	filename=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIFNTCCBTEw
ggQZoAMCAQICEBiFfNjFoKh3iK1UZPIQ1iYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNVBAYTAkdC
MRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoT
EUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNh
dGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE4MDQwODAwMDAwMFoXDTE5MDQwODIzNTk1OVow
JDEiMCAGCSqGSIb3DQEJARYTbGVvbkBzaWRlYnJhbmNoLmNvbTCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAOW/MlYaqjBsCgks41RJm6ARAdqLWI3z3bbQ7GuCyNmFPn+UROVGIxPntzUr
PwZDJz59pmHoflIhbQgHIH38IkroxfjyN/2JH7mEfqpcGzvwav6bVgu3yd8qE3juUc/UvlE+2DUC
AzFj3rmtRmtpIk42B9aD7tMpMEz9o97S7qvnfkoEBcBzCkTQ5jwL6zXTXgN+p96ijOtHP1vkbbpX
y1+YZPMcZp5V9o46tOXFm3VYLyRqkmb0gbE6BwQevaDN/Yp8xHpSNAnWYEkhDE5gCirbYEnkliZT
G7swpqMsyLFXUrHuFoL90OaZhu+M7qpCPAcjsl7NVVUG+xgTvrW4pXECAwEAAaOCAekwggHlMB8G
A1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBRKJ+NJdwyriZOifcpHIGTS
F1qIqDAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAgBgNVHSUEGTAXBggrBgEFBQcDBAYL
KwYBBAGyMQEDBQIwEQYJYIZIAYb4QgEBBAQDAgUgMEYGA1UdIAQ/MD0wOwYMKwYBBAGyMQECAQEB
MCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5uZXQvQ1BTMFoGA1UdHwRTMFEw
T6BNoEuGSWh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0
aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYsGCCsGAQUFBwEBBH8wfTBVBggrBgEFBQcwAoZJaHR0
cDovL2NydC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1
cmVFbWFpbENBLmNydDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2RvY2EuY29tMB4GA1Ud
EQQXMBWBE2xlb25Ac2lkZWJyYW5jaC5jb20wDQYJKoZIhvcNAQELBQADggEBACA7m5k15RCPeDf4
5ti2arYdY0/NPY2Ge9GUoHWzpvNEyjnJ1X867im8hl1876Rz8f3P5EZvyOOpXz9MK6OHP+Fn9pVJ
+5ciIBXCNWQtUoQr1iy4Xxh6HWT3e8jToUkKnQpJ/Da9qSGCLFkIsmKxdHywxwB+9aUwMw4zus5a
G8oWCHVDTnEXJftuBXDvEHGj0Q2IfA6/TVQpes6bI0xUOQePgAlpsax0jbBZ8HAFyXVrjmu9LkuO
DT5iKiGBeeSpFcNPvCqAAcQv+oT6f1SBIPm2H2C0hlTVtqFNH4lesaOv2UaG8sdESR6jWsvts6wI
IhWZWYY65K/ketznMb0A7n4xggO3MIIDswIBATCBrDCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgT
EkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENB
IExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBT
ZWN1cmUgRW1haWwgQ0ECEBiFfNjFoKh3iK1UZPIQ1iYwCQYFKw4DAhoFAKCCAd8wGAYJKoZIhvcN
AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTgwOTE2MDkxODM4WjAjBgkqhkiG9w0B
CQQxFgQUlFFD0Giwzf29qCwH3q92S9j1ugAwgb0GCSsGAQQBgjcQBDGBrzCBrDCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEBiFfNjFoKh3iK1UZPIQ1iYwgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGXMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0
Q09NT0RPIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIQGIV8
2MWgqHeIrVRk8hDWJjANBgkqhkiG9w0BAQEFAASCAQDban16furkrNffH8XOh1kdluaV+Xys+1TD
D+uX+aiZ4RCKM3FrbDxKJ+EvtPFGrFWBqBTz9EThDItBqDrZnJ+Bj5E4N2qC36qdIM+OXKpra9fM
Koxd2VkSP8TkNroK2aY3+wHj2md63PsWm0q0ghGetPe6dgwRxNefbh5RAQuC2JYr+o7XRDLLNdM/
AL/6Cs3t9+BUNGt8z6S5lw/hQZjhCKId3gBz8WU7IO9JJIGW7svj9NPLmx1kGpRe6jvtRZUaolI6
SSvNsSgzZYBdKkSJ4hlrWlSr6lIIKcmz9/ysv11eeTVZiYl/zzUqyePGEUuIy4E7Y2pgegS859x+
6ZoHAAAAAAAA

--Apple-Mail-AB769C63-4E40-4849-95A1-B270BBDB8F7E--
