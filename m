Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.401.1621275117419117848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 11:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=ONWZ6PSs;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.210.181, mailfrom: scott.branden@broadcom.com)
Received: by mail-pf1-f181.google.com with SMTP id s19so3269660pfe.8
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 11:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to;
        bh=3Z7l4Zf6XlGWuHQURs0LR9RvKCGQ4qh3rA/5mYbKQJg=;
        b=ONWZ6PSsxeRVHVJrLgebGLxNHRk79F/Vruf86t0YzxBRkYbVsjeVhCW7IN2mzZoFSV
         wpB8H3RQVqkeaNwYjCzsuFGvUiO3TEbRnoPH6FPZB5uxZkGu7HCtwfb9AfxLCXnGGcIu
         59tAym55N4Z3Z1Y9BZ1mK0Ze194ylohV0wTSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=3Z7l4Zf6XlGWuHQURs0LR9RvKCGQ4qh3rA/5mYbKQJg=;
        b=oh/g4FwqJeLfBbVB3LS9wtWIuiYsY/+/Kt21XOYjNcX5WjOUf1S8jYHt7StsXjSgRU
         qj4jp4oFaCA9GnoBbNhr4bSNR61mexh0O2pOCw+JmgAFr1tUcFxG/LsQdYxoJhwffhmb
         HdWWv9pUWTCosX/tGb954CbyyL5iURoJouoZ23EdLNhkqsKMqFRMvrAYa+DcRwjSBDcY
         eyvrzvTJYjszHPL2drKK9DxuXWwkcP0f3z6OzUEefOliJZMmbI5KD/wvl8t95/PU0ekD
         9fqM0Euq6VUNtKH8ubomL4bbYj3cMTeSa2EhXSjER4aVWBX9ViEAaO6Vb4W7rEgxCCwe
         BRXQ==
X-Gm-Message-State: AOAM533hkOX/EYXafZdCumj3uP4zLdhXOoeV5U00hu6Dazo4DI5G+3gH
	CJWWl21ejGRfOaq0IZfT0uOUSQ==
X-Google-Smtp-Source: ABdhPJw7fKn2x/FFvGu0bkWunZByMlTSGX1mqLTxuENqyBfdwKH/dYx2M9pffabep1S9WSmY09tfJg==
X-Received: by 2002:a63:4a4b:: with SMTP id j11mr732714pgl.451.1621275116562;
        Mon, 17 May 2021 11:11:56 -0700 (PDT)
Return-Path: <scott.branden@broadcom.com>
Received: from lbrmn-lnxub113.ric.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id x4sm3246264pjh.14.2021.05.17.11.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 11:11:56 -0700 (PDT)
Subject: Re: [OE-core] Recent runqueue changes destablized hardknott release for multiconfig builds
To: akuster808 <akuster808@gmail.com>,
 openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <331b520c-6c5f-76f3-f1bf-ec15180e3e39@broadcom.com>
 <1db039b5-729a-5888-0ab0-c6eb125e71de@gmail.com>
From: "Scott Branden" <scott.branden@broadcom.com>
Message-ID: <610ff383-f003-fb10-c9bc-e0cba7ff2cda@broadcom.com>
Date: Mon, 17 May 2021 11:11:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1db039b5-729a-5888-0ab0-c6eb125e71de@gmail.com>
X-Groupsio-MsgNum: 151986
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000713daf05c28a87cf"

--000000000000713daf05c28a87cf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2021-05-17 10:57 a.m., akuster808 wrote:
> 
> 
> On 5/17/21 10:29 AM, Scott Branden via lists.openembedded.org wrote:
>> I tried updating to the latest hardknott and various multiconfig builds now fail.
>>
>> I had to revert the following changes to get back to a stable build:
>> Revert "bitbake: runqueue: Handle deferred task rehashing in multiconfig builds"
>>
>>
>>
>> This reverts commit 58cbdaecf75b0248f96780b6882e8d4f232d038a.
>>
>>
>> and
>>
>> Revert "bitbake: runqueue: Fix multiconfig deferred task sstate validity caching issue"
>>
>>
>>
>> This reverts commit 8aad4c243a542c8720cd23b6d1c4267916393df3.
>>
>> Also note; I see other changes sitting in master-next attempting to fix runqueue and multiconfig issues.
>> So I tried cherry-picking and still have build issues.
> 
> Can you provide more info like error messages or even a way to reproduce
> this?
To reproduce we build with no yocto-cache populated.  Here is the start of the error messages with hardknott:

Sat May  8 21:08:05 2021: ERROR: mc:valkyrie:initramfs-framework-1.0-r4 do_deploy_archives_setscene: No suitable staging package found

Sat May  8 21:08:05 2021: NOTE: recipe initramfs-framework-1.0-r4: task do_package_qa_setscene: Started

Sat May  8 21:08:05 2021: ERROR: Logfile of failure stored in: /tmp/yocto_builds/20630387_vxc_valkyrie-genericx86-64/poky/build/tmp-valkyrie/work/all-poky-linux/initramfs-framework/1.0-r4/temp/log.do_deploy_archives_setscene.78226

Sat May  8 21:08:05 2021: NOTE: recipe initramfs-framework-1.0-r4: task do_deploy_archives_setscene: Failed

Sat May  8 21:08:05 2021: ERROR: mc:valkyrie:initramfs-framework-1.0-r4 do_package_qa_setscene: No suitable staging package found

Sat May  8 21:08:05 2021: ERROR: Logfile of failure stored in: /tmp/yocto_builds/20630387_vxc_valkyrie-genericx86-64/poky/build/tmp-valkyrie/work/all-poky-linux/initramfs-framework/1.0-r4/temp/log.do_package_qa_setscene.78235

Sat May  8 21:08:05 2021: NOTE: recipe initramfs-framework-1.0-r4: task do_package_qa_setscene: Failed

Sat May  8 21:08:05 2021: WARNING: Setscene task (mc:valkyrie:/tmp/yocto_builds/20630387_vxc_valkyrie-genericx86-64/poky/build/../meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb:do_deploy_archives_setscene) failed with exit code '1' - real task will be run instead

Sat May  8 21:08:05 2021: NOTE: Running setscene task 4875 of 5643 (mc:valkyrie:/tmp/yocto_builds/20630387_vxc_valkyrie-genericx86-64/poky/build/../meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb:do_package_write_rpm_setscene)

Sat May  8 21:08:05 2021: WARNING: Setscene task (mc:valkyrie:/tmp/yocto_builds/20630387_vxc_valkyrie-genericx86-64/poky/build/../meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb:do_package_qa_setscene) failed with exit code '1' - real task will be run instead

Sat May  8 21:08:05 2021: NOTE: recipe initramfs-framework-1.0-r4: task do_populate_sysroot_setscene: Started

Sat May  8 21:08:05 2021: NOTE: recipe update-rc.d-0.8-r0: task do_deploy_archives_setscene: Started

Sat May  8 21:08:05 2021: NOTE: recipe initramfs-framework-1.0-r4: task do_populate_lic_setscene: Started

Sat May  8 21:08:05 2021: NOTE: recipe netbase-1_6.2-r0: task do_package_qa_setscene: Started

Sat May  8 21:08:05 2021: ERROR: mc:valkyrie:update-rc.d-0.8-r0 do_deploy_archives_setscene: No suitable staging package found

Sat May  8 21:08:05 2021: ERROR: Logfile of failure stored in: /tmp/yocto_builds/20630387_vxc_valkyrie-genericx86-64/poky/build/tmp-valkyrie/work/all-poky-linux/update-rc.d/0.8-r0/temp/log.do_deploy_archives_setscene.78309

Sat May  8 21:08:05 2021: NOTE: recipe update-rc.d-0.8-r0: task do_deploy_archives_setscene: Failed

Sat May  8 21:08:05 2021: NOTE: recipe netbase-1_6.2-r0: task do_deploy_archives_setscene: Started

... (see full log)

> 
> -armin
>>
>> Regards,
>>  Scott
>>
>> 
>>
> 


--000000000000713daf05c28a87cf
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQcAYJKoZIhvcNAQcCoIIQYTCCEF0CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3HMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBU8wggQ3oAMCAQICDH2hdImkqeI7h1IaTzANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMTAyMjIxNDA5MDJaFw0yMjA5MjIxNDMxMTRaMIGQ
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFjAUBgNVBAMTDVNjb3R0IEJyYW5kZW4xKTAnBgkqhkiG9w0B
CQEWGnNjb3R0LmJyYW5kZW5AYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAtKitgySOPXrCfmgJJ/6N4Bq2PYQ9C7pbBbEOgcLdGZyOHK9MJW3fcf8NXplv3OfFCQzp
rm9QWjKvH806lCzDhSKgAg+vro9Alv6BTl7wBdSVpgFsV/Tl+kbDfeBxjE/AwOW+WNGIPJLH4WCo
MMkaRzH4Lg/8h9DnzxR46++4CqLY4KQQ151a+4Ojb/u/YlVGYlZa/jmTEgk3It8dzv54hZ/UoZg1
cRe0CRXA7ypOJSgxO/nOOyQoaJxT7CGg1npOeSpPjEuc3fE4xum3l0nvU85hj6MlKZu43hokdBh0
D0nLyyhEwlR3AC/msdff/UGbM/JR9vk812RP4m/aNWZFJwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRpzY290dC5icmFuZGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUOhjEpl04Sz9dh5MI82E1
V39lM/owDQYJKoZIhvcNAQELBQADggEBAA7Rlypx/esz/iq1yA4+KW7uwV/aBY344BWcXt6I+SNK
VwFBgFWfLj5vaEud9TVv2fPSiaHJo0umemOJk+43QD+bsoqmgcFXd21PrOt7Jjs+jjVED9VC5kJq
S4NNKUkS+BqijJwSegtVygrc/atrIlJbjI21q4qpemUo5fgwqCNm++BmBGTI8yA09vtGSNDRN42k
lLX9hl3iEj5SBgkQqCbbnoE+ZjjKfqt7ED166WhgyQWNrl39yLcvLj+JRUB3RuvXKZjH0NQEEBII
wZBDSkyneykLt3CBNIhSCTxKM6OWxVp936ALSa5K9FNy00TeWSpokR6NmzaW8VD/EjTgvqAxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgx9oXSJpKniO4dS
Gk8wDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIDjdbOWUU5TVIpI9O6k/Ikl2GWQZ
XF7QkRpuywjvXWnOMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIx
MDUxNzE4MTE1N1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQCX2t4kxtSVhzeb1rcrHV1wOr8B7R59/rQvEM9np9z95CpL
jw1+qUJix8vTensdXZtIKP98fW9yij+lVPHwqihWXFMDg5/rMxCCc2im27R9z/p3qhw5NKY0RsUu
Q9yI5rKgQtMnho2MF8iuLisrv3b1TUTtnaVCR8VFiw2X82EjZ+XJczL7By/zZxIxnVNUjnDI4Q5v
MAC7cnhsox19eINeRlEv2cFGWzCOiizM2H4rp+Qk904906GtOzl0itgE+VcpD11wNUhbLygHLXYO
cVI1yqJc9nb2ypprhA+4ZklNuVULIDoGeKlUMszcjkjhgs06LmoOUpzHfHmg0GirYu9j

--000000000000713daf05c28a87cf--
