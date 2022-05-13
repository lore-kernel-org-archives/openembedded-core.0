Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32358C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 18:41:39 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.1316.1652467291767807607
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 11:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IbJtbAH0;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id a21so10983848edb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 11:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=X9rdMBi3yQRoDpMcKewVk1Vy0lbAXeikxLOJv4FUuJA=;
        b=IbJtbAH0AI6LPwiU60ghRRdzSIxRzh/C4Hmrt+MvFMZb8GjDI5PahyHyu0Ql3WUyeg
         SPubn/X9XH4D9uaUkwJaTzQYyTq4jW0LOz8ilnagZ3oyA/FBgRtQpmgEllhd6z0x9L6A
         xmsReMjOH95gKFtU3dAcyL3qy8N1mNDj0Uu0w6X41YWKSnfIgvsGUUzPjmjC6iJfq+GS
         5mv/zx+23GpTGxY+RrNmka3zoRtL6LVpAkAOgqP+Q24JuHwrFP16AXc1v9Q0QaPIGExa
         6Kred0Ak4sq4uU7M1YBGGWYiY7SOf/3LWzxheU1KHN7fT73JIcR5QFJzfkoylnBc1qJD
         KabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=X9rdMBi3yQRoDpMcKewVk1Vy0lbAXeikxLOJv4FUuJA=;
        b=rgmg5yea97WUZyvc5CdXgSsXeGniwuacx4+w+2a9boAgSSvM2LMDxoXk3+BrURQHji
         kxNtFZa5P1pyksYmv7yb3VIThLSK3izQ1bU3CSh45LJUPt1LniSNxZsFGvbUDfb7+2W3
         +WeLpa0ZdAdbmxfTsMVezcmvJzmgSBpZ4LvP5Bw/FcpV2qElLFyhZ7ayGkZqJuM3vjKg
         /h8l7K9qYD2MC9MVCYgRp2ew3fDyKLensUY6AuP1kURk7xGBy5vg91vX8m1IhAIwDE9I
         IIIpZSp3Jk0Q1ANDKXpkdEdFtWXGlNwF9f4XGHQb2Bp096MNiWs5X0rC/ZipdiNRUmpD
         Purw==
X-Gm-Message-State: AOAM531EZ6h2l7EjAFN9p2PRYinTxKzE5ZJ+HvQ9NwPyfIMAWERNR9Xq
	FpOCtrMqa3+uxQO7vYEqHCg=
X-Google-Smtp-Source: 
 ABdhPJyrIPhMHn6Fb+PkzH96B6UIs+8jWMBAvLIYpfWSjAwWUOC7I2wpIcE7PzOoVq+4q+pMlUsrIA==
X-Received: by 2002:a50:fe1a:0:b0:425:e276:5adf with SMTP id
 f26-20020a50fe1a000000b00425e2765adfmr40643edt.284.1652467289952;
        Fri, 13 May 2022 11:41:29 -0700 (PDT)
Received: from smtpclient.apple (host-87-5-19-80.retail.telecomitalia.it.
 [87.5.19.80])
        by smtp.gmail.com with ESMTPSA id
 d21-20020a05640208d500b0042617ba63bbsm1240962edz.69.2022.05.13.11.41.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 May 2022 11:41:29 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3CFB6D88-363B-4C76-8F9B-D808AC224F4E";
	protocol="application/pkcs7-signature";
	micalg=sha-256
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [OE-core] [kirkstone][PATCH v2] openssl: minor security upgrade
 3.0.2 -> 3.0.3
From: Davide Gardenal <davidegarde2000@gmail.com>
In-Reply-To: 
 <CAOSpxda9-0Pi8FmAYdcpu1VuwiYQSqxaU4EcOym8V+QNyay3Sw@mail.gmail.com>
Date: Fri, 13 May 2022 20:41:27 +0200
Cc: openembedded-core@lists.openembedded.org,
 Davide Gardenal <davide.gardenal@huawei.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DA404446-EA2C-47E2-8B46-5410758856DC@gmail.com>
References: <20220513133521.904120-1-davide.gardenal@huawei.com>
 <CAOSpxdZ4qjcbjsvB8v8P7YtUr=0HSxHnrcbxAkYZHkRVK9PGrg@mail.gmail.com>
 <98AF0B2F-EA7D-4ED4-9B92-F4CDAE9A2196@gmail.com>
 <CAOSpxda9-0Pi8FmAYdcpu1VuwiYQSqxaU4EcOym8V+QNyay3Sw@mail.gmail.com>
To: Steve Sakoman <steve@sakoman.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 18:41:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165585


--Apple-Mail=_3CFB6D88-363B-4C76-8F9B-D808AC224F4E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I=E2=80=99m always glad to help :)

> Il giorno 13 mag 2022, alle ore 18:57, Steve Sakoman =
<steve@sakoman.com> ha scritto:
>=20
> On Fri, May 13, 2022 at 5:56 AM Davide Gardenal
> <davidegarde2000@gmail.com> wrote:
>>=20
>> I see, I=E2=80=99m sorry but I haven=E2=80=99t checked master because =
I=E2=80=99m working on kirkstone right now, next time I=E2=80=99ll do =
it.
>=20
> No worries.  If you don't catch it I probably will :-)
>=20
> BTW, I really appreciate your help with CVEs!
>=20
> Steve
>=20
>>=20
>> Davide
>>=20
>> Il giorno 13 mag 2022, alle ore 17:53, Steve Sakoman =
<steve@sakoman.com> ha scritto:
>>=20
>> On Fri, May 13, 2022 at 3:35 AM Davide Gardenal
>> <davidegarde2000@gmail.com> wrote:
>>=20
>>=20
>> This minor version include fixes for several CVEs
>>=20
>> CVE: CVE-2022-1292
>> CVE: CVE-2022-1343
>> CVE: CVE-2022-1434
>> CVE: CVE-2022-1473
>>=20
>> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
>> ---
>> Updates:
>> -v2 add kirkstone tag in the title
>>=20
>>=20
>> Actually, since master is also at version 3.0.2 this patch will have
>> to go to master first. I'll then backport it.
>>=20
>> In cases like this you should probably tag [master][kirkstone] so
>> Richard and I both take notice.
>>=20
>> Steve
>>=20
>> ---
>> .../openssl/{openssl_3.0.2.bb =3D> openssl_3.0.3.bb} | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>> rename meta/recipes-connectivity/openssl/{openssl_3.0.2.bb =3D> =
openssl_3.0.3.bb} (99%)
>>=20
>> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb =
b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
>> similarity index 99%
>> rename from meta/recipes-connectivity/openssl/openssl_3.0.2.bb
>> rename to meta/recipes-connectivity/openssl/openssl_3.0.3.bb
>> index a809666aa7..fd88ae807d 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
>> @@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk =3D " \
>> file://environment.d-openssl.sh \
>> "
>>=20
>> -SRC_URI[sha256sum] =3D =
"98e91ccead4d4756ae3c9cde5e09191a8e586d9f4d50838e7ec09d6411dfdb63"
>> +SRC_URI[sha256sum] =3D =
"ee0078adcef1de5f003c62c80cc96527721609c6f3bb42b7795df31f8b558c0b"
>>=20
>> inherit lib_package multilib_header multilib_script ptest perlnative
>> MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
>> --
>> 2.32.0
>>=20
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#165563): =
https://lists.openembedded.org/g/openembedded-core/message/165563
>> Mute This Topic: https://lists.openembedded.org/mt/91080703/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20
>>=20


--Apple-Mail=_3CFB6D88-363B-4C76-8F9B-D808AC224F4E
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCDWEw
ggXsMIID1KADAgECAhAZua6DiHKYOdyCpz+O9+pLMA0GCSqGSIb3DQEBCwUAMIGBMQswCQYDVQQG
EwJJVDEQMA4GA1UECAwHQmVyZ2FtbzEZMBcGA1UEBwwQUG9udGUgU2FuIFBpZXRybzEXMBUGA1UE
CgwOQWN0YWxpcyBTLnAuQS4xLDAqBgNVBAMMI0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9u
IENBIEczMB4XDTIxMDcwOTA4NDU0N1oXDTIyMDcwOTA4NDU0N1owJDEiMCAGA1UEAwwZZGF2aWRl
Z2FyZGUyMDAwQGdtYWlsLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAPOY6kcH
hhZIySmCFFosOe+SfI1xlKqhPlhXcx0EKmMYhQvI05SqOyJlvqOsouJffsGs/RQCjo4n+XiqlVbM
xAb4uLe8hQmTfNoDU8OOmod3SMANu5AshWZpvrS4lXR/RcF5bLmlOvr3NA0L0uivdfnZzuJxByZ4
VxTfp01c4KYxwR+OoSsRiJ73Bur9040YVA68PaMLaqGRPFhNBpWtjbUByv2prunNH2/ffam+2cF9
NMsWMA3bIj3jOjeiLlaFgA+s6T5qVAzP2u4iK+SkgBr2Y2SHZCaRWjL5kFySsw35iSYyh5rVN9iW
0RpRI57TY+x9bZhIDdjuk6QWEHJN1MMCAwEAAaOCAbowggG2MAwGA1UdEwEB/wQCMAAwHwYDVR0j
BBgwFoAUvpepqoS/gL8QU30JMvnhLjIbz3cwfgYIKwYBBQUHAQEEcjBwMDsGCCsGAQUFBzAChi9o
dHRwOi8vY2FjZXJ0LmFjdGFsaXMuaXQvY2VydHMvYWN0YWxpcy1hdXRjbGlnMzAxBggrBgEFBQcw
AYYlaHR0cDovL29jc3AwOS5hY3RhbGlzLml0L1ZBL0FVVEhDTC1HMzAkBgNVHREEHTAbgRlkYXZp
ZGVnYXJkZTIwMDBAZ21haWwuY29tMEcGA1UdIARAMD4wPAYGK4EfARgBMDIwMAYIKwYBBQUHAgEW
JGh0dHBzOi8vd3d3LmFjdGFsaXMuaXQvYXJlYS1kb3dubG9hZDAdBgNVHSUEFjAUBggrBgEFBQcD
AgYIKwYBBQUHAwQwSAYDVR0fBEEwPzA9oDugOYY3aHR0cDovL2NybDA5LmFjdGFsaXMuaXQvUmVw
b3NpdG9yeS9BVVRIQ0wtRzMvZ2V0TGFzdENSTDAdBgNVHQ4EFgQUiqeY/IEM07oIVIos/ACCcr6P
njQwDgYDVR0PAQH/BAQDAgWgMA0GCSqGSIb3DQEBCwUAA4ICAQByXme/hneEsW30qwk9NtxPo0jU
XVCtXGFS8vxZbtyzIQCK/3mJYzkAYQndhqz0s7RP3l+J9MkDXp01vVJurlMcgRCmIDEo2NOak/D1
kNj4qNk8QMJmb+E+VKlB4dW9+vghAO1AQb16C5lGQ9QWW+g4cGk58+IXR58kYJe3e4Os1NNZbC1O
8vPo4coKAWlJrABqDmfqMz2WJhjV9xlRZNf7jii1I+qLOScc+l4tIPmBj1NRt4JRmEKrzVG80NHv
vl1Wwb2DcFV/SHWvZ25SZSmzkNiU/KKuFjQcJYxRl03sbBULug6kN5G19vFsv3ci9bM8FtVCMvb4
Mi0c+rsaJFNwh0M/cVdCAY6qvBEB2haT4+YMAGR7MAnAw3YPt8MIOf83dcSC4st6KKni6M6SQbcp
C0QLSnsmTPcUu6ORkcf+OPPa4caPuCwyrXje2GUsCk3u49k5PQTuTB7Ax4UYhFRkBYl0Lq/pwHUE
ewMztjvdnwEvhmKVAH0pcu0hXqMowR6Xn+oOKgaxkP57RrfF06fCLIGJgIeuPO1VT26SCYV0zkZW
OnGXp1BebVCkxeMe5BFtsRCzDlJc+qDSQhbDhTgxSN4OXcZZGSi2a3eFsW+yexIYBGPGhMrzhOk/
k37cYmTEZRztTrFhb/3OhSAIodd191esnTBcWbanuKWWQ2RXxjCCB20wggVVoAMCAQICEBcQPt49
ihy1ygZRk+fKQ2swDQYJKoZIhvcNAQELBQAwazELMAkGA1UEBhMCSVQxDjAMBgNVBAcMBU1pbGFu
MSMwIQYDVQQKDBpBY3RhbGlzIFMucC5BLi8wMzM1ODUyMDk2NzEnMCUGA1UEAwweQWN0YWxpcyBB
dXRoZW50aWNhdGlvbiBSb290IENBMB4XDTIwMDcwNjA4NDU0N1oXDTMwMDkyMjExMjIwMlowgYEx
CzAJBgNVBAYTAklUMRAwDgYDVQQIDAdCZXJnYW1vMRkwFwYDVQQHDBBQb250ZSBTYW4gUGlldHJv
MRcwFQYDVQQKDA5BY3RhbGlzIFMucC5BLjEsMCoGA1UEAwwjQWN0YWxpcyBDbGllbnQgQXV0aGVu
dGljYXRpb24gQ0EgRzMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDt5oeWocGktu3C
QlX3Pw8PImBfE+CmQ4iGSZF5HBsvGlAP3EYB7va6OobMUWHvxA+ACHEpWq0YfNh6rRUlULOGcIpE
FtVf4nAiEvdQtiFQBmtWJSn3naoMHqpMvmwZ4lL0Xr1U9JHmTqkU3DuYcNNO3S+hYWDZpWQbeSGi
bNVeiJ4kY6JDh0fvqloK1BsuS3n2OgArPYGfAYtDjCvT2d+6Ym3kArHZjEcrZeBI+yVVnjPwbTSC
Kax8DtS2NP/CJ6RjpnRvuSwusRy84OdwdB71VKs1EDXj1ITcCWRZpkz+OhV6L8Zh+P0rmOSJF6Kd
HiaozfncURx4s54GFJNRGkx1DnCxcuL0NJMYG42/hrDYOjNv+oGWSEZO/CT3aaLSMB5wTbZKfcD1
R+tTanXD+5Gz5Mi15DTE7QH8naZjZxqqhyxL1KyuIgaVDxvQtPSjo5vTsoa09rn+Ui8ybHnvYO/a
/68OIQIHLGbUd2COnwm0TiZ3Jg/oYGxwnJPvU1nDXNcecWTIJvFF5qD2ppJH3HgJVVePUEOY1E4K
p3k0B8hdRdhMV5n+O6RCKCTFcZaESF8sELgdrqnCLPP1+rX7DA8pxZoX0/9Jk64EOsbfQyLIJlrr
ob2YS0Xlku6HisZ8qrHLhnkzF5y7O34xmatIp8oZ5c54QP+K5flnTYzWjuIxLwIDAQABo4IB9DCC
AfAwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRS2Ig6yJ94Zu2J83s4cJTJAgI20DBBBggr
BgEFBQcBAQQ1MDMwMQYIKwYBBQUHMAGGJWh0dHA6Ly9vY3NwMDUuYWN0YWxpcy5pdC9WQS9BVVRI
LVJPT1QwRQYDVR0gBD4wPDA6BgRVHSAAMDIwMAYIKwYBBQUHAgEWJGh0dHBzOi8vd3d3LmFjdGFs
aXMuaXQvYXJlYS1kb3dubG9hZDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgeMGA1Ud
HwSB2zCB2DCBlqCBk6CBkIaBjWxkYXA6Ly9sZGFwMDUuYWN0YWxpcy5pdC9jbiUzZEFjdGFsaXMl
MjBBdXRoZW50aWNhdGlvbiUyMFJvb3QlMjBDQSxvJTNkQWN0YWxpcyUyMFMucC5BLiUyZjAzMzU4
NTIwOTY3LGMlM2RJVD9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0O2JpbmFyeTA9oDugOYY3aHR0
cDovL2NybDA1LmFjdGFsaXMuaXQvUmVwb3NpdG9yeS9BVVRILVJPT1QvZ2V0TGFzdENSTDAdBgNV
HQ4EFgQUvpepqoS/gL8QU30JMvnhLjIbz3cwDgYDVR0PAQH/BAQDAgEGMA0GCSqGSIb3DQEBCwUA
A4ICAQAmm+cbWQ10sxID6edV94SAhc1CwzthHFfHpuYS30gisWUfWpgp43Dg1XzG2in3VGV7XrzC
CGZh4JM/XQWp+4oxmyV42Qjz9vc8GRksgo6X2nYObPYZzQjda9wxsCB38i4G3H33w8lf9sFvl0xm
4ZXZ2s2bF/PdqvrK0ZgvF51+MoIPnli/wJBw3p72xbk5Sb1MneSO3tZ293WFzDmz7tuGU0PfytYU
kG7O6annGqbU1I6CA6QVKUqeFLPodSODAFqJ3pimKD0vX9MuuSa0QinH7CkiPtZMD0mpwwzIsnSs
3qOOl60tIZQOTc0I6lCe1LLhrz7Q75J6nNL9N5zVwZ1I3o2Lb8Dt7BA13VFuZvZIzapUGV83R7pm
SVaj1Bik1nJ/R393e6mwppsT140KDVLh4Oenywmp2VpBDuEj9RgICAO0sibv8n379LbO7ARa0kw9
y9pggFzN2PAX25b7w0n9m78kpv3z3vW65rs6wl7E8VEHNfv8+cnb81dxN3C51KElz+l31zchFTur
D5HFEpyEhzO/fMS5AkweRJIzwozxNs7OL/S/SVTpJLJL1ukZ1lnHHX0d3xCzRy/5HqfK3uiG22LP
B5+RjNDobPAjAz2BKMfkF/+v0pzn8mqqkopQaJzEAbLbMpgQYHRCjvrUxxwjJyUFb2Z+40UNtMF4
MTK7zTGCA4UwggOBAgEBMIGWMIGBMQswCQYDVQQGEwJJVDEQMA4GA1UECAwHQmVyZ2FtbzEZMBcG
A1UEBwwQUG9udGUgU2FuIFBpZXRybzEXMBUGA1UECgwOQWN0YWxpcyBTLnAuQS4xLDAqBgNVBAMM
I0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEczAhAZua6DiHKYOdyCpz+O9+pLMA0G
CWCGSAFlAwQCAQUAoIIBvzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEP
Fw0yMjA1MTMxODQxMjdaMC8GCSqGSIb3DQEJBDEiBCBljmW4GOVHOT+BYOIni5+6vJdL6hdjqlh7
INur8S39CDCBpwYJKwYBBAGCNxAEMYGZMIGWMIGBMQswCQYDVQQGEwJJVDEQMA4GA1UECAwHQmVy
Z2FtbzEZMBcGA1UEBwwQUG9udGUgU2FuIFBpZXRybzEXMBUGA1UECgwOQWN0YWxpcyBTLnAuQS4x
LDAqBgNVBAMMI0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEczAhAZua6DiHKYOdyC
pz+O9+pLMIGpBgsqhkiG9w0BCRACCzGBmaCBljCBgTELMAkGA1UEBhMCSVQxEDAOBgNVBAgMB0Jl
cmdhbW8xGTAXBgNVBAcMEFBvbnRlIFNhbiBQaWV0cm8xFzAVBgNVBAoMDkFjdGFsaXMgUy5wLkEu
MSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRoZW50aWNhdGlvbiBDQSBHMwIQGbmug4hymDnc
gqc/jvfqSzANBgkqhkiG9w0BAQsFAASCAQAgVGi61A6ihUZ9m6WigqPjZOArfG9me4ZPbBzQG4Xi
mejrzXbnIdQzvwl5SkfPmAqpO8vqqNt23Xc/250M+wHvikQLhX0mfe4kdoRls7W5zK+3fNUPjG6N
queP8OwOEmewJsDbF6BpWBUlZE80qvTRPmwM2SwCxbq0mWmkjo1reOTT/TMQdboaC0UNjNxfFK3P
cRKveZEwk+UKnTmlwCOLEgge6Bhr/9u2hlSL4bL9IRu3wTqwhW2gHCKyzU091ypMOCfaX80ysuNj
4s5kLY8rNLma7HDfrCZ5lxcCIJ/v49ZmMLuXrBOY7X0B2gIAS5dAXohKds8/T7h8iG2YIIaCAAAA
AAAA
--Apple-Mail=_3CFB6D88-363B-4C76-8F9B-D808AC224F4E--

