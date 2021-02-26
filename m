Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.16788.1614376665554127711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 13:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=dk3v5TfU;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.208.173, mailfrom: suji.velupillai@broadcom.com)
Received: by mail-lj1-f173.google.com with SMTP id e2so5126396ljo.7
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 13:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1DRm6RTJmPHtHTB+3QlbC6n3JFzH5Y+ENrr3De6Jiao=;
        b=dk3v5TfUtNvsyDA41mvel+nWikICNQmyfi/XSG1lqafwIbWPGcKtWf4iTmBkiSV3Fw
         1EL82DavSSOLf/FLmzlDGuBOM7uUigwP9sQ99Xnhgza755Hq6db7sXgrdykkA/KTCTaU
         99+u3Dd1Scw0AvVxbqdqBhuCa2NIG4kq5uYk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1DRm6RTJmPHtHTB+3QlbC6n3JFzH5Y+ENrr3De6Jiao=;
        b=NnTZdDNFkZqHeXeS1N6dK1ayTho2UHt4hp90R1U9vvVPIP5Zi4LVt5yRZMRjnPlAQi
         slYUKYHwtcdG1W3z0GtnpBMfhkT4B5VeM7qO+lp4HW2rmRWdPnxO1FRWdKxTXmz0HYc/
         u3WFYziuEcJNCjCtALhBTqvlFgZiWSgMbh203C9THr1FvWyTVhF+cslze/bMChQZHjqq
         cmjPZOTN/GvU/v5m31gLJyyKglCql66Jqcuxj4nhY3HRIvDJmIht0Rn3Ny43JiZCdpVY
         eeXh1L7jbdxZ0kJ4bgBK592F+0vABgXAxdipjyzPEu6XfwTn+YWj/0hgts0/aW5DQHKb
         q8rg==
X-Gm-Message-State: AOAM531EVXhyHZ1YMRUfTUbOibqYsg+/0tdC3aWLgS/EsSVn769mH1/u
	HxnngT7A4wtNXwV7sxlszcpUg9OVtNMdo+HyoPpdqw==
X-Google-Smtp-Source: ABdhPJy6eW9andlUlOmnwX8+Dwl1JLB54nVCB2fMt923OjCAqMSKx6zqdvOU/qXqUbgNPg6Y9FzunreLgURUNVYGIaI=
X-Received: by 2002:a2e:8e6e:: with SMTP id t14mr2722922ljk.23.1614376663479;
 Fri, 26 Feb 2021 13:57:43 -0800 (PST)
MIME-Version: 1.0
References: <16663BAB94E51B8F.6890@lists.openembedded.org> <CAJHBTCAnhk=5-EbbKeMTNY7w+98Zq+FdL4uG0yjJR7T9rGN99g@mail.gmail.com>
 <53900be46ea10c63824c84f999e98b874a187510.camel@linuxfoundation.org>
In-Reply-To: <53900be46ea10c63824c84f999e98b874a187510.camel@linuxfoundation.org>
From: "Suji Velupillai" <suji.velupillai@broadcom.com>
Date: Fri, 26 Feb 2021 13:57:32 -0800
Message-ID: <CAJHBTCCtYxYvVD-pLp8pxzusHaOJAvkLvWv0QFS_nnQYnX68uA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] ffmpeg: add ptest install for ffmpeg
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jonathan Richardson <jonathan.richardson@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
X-Groupsio-MsgNum: 148709
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000095cb4c05bc445bad"

--00000000000095cb4c05bc445bad
Content-Type: multipart/alternative; boundary="0000000000008fc22005bc445bab"

--0000000000008fc22005bc445bab
Content-Type: text/plain; charset="UTF-8"

Thank you Richard, please see inline.

On Fri, Feb 26, 2021 at 5:19 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2021-02-25 at 10:12 -0800, Suji Velupillai via
> lists.openembedded.org wrote:
> > This change got dropped from the master-next branch.
> > Did it break any builds? Is there anything I can do to help to get this
> change accepted?
>
> Sorry, there was a bit of a mixup in the triage process and this
> took longer to work through than expected.
>
> Yes, I'm afraid it did fail in testing, there was a reproducibility issue:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/34/steps/12/logs/stdio
>
> which says that the ffmpeg-ptest package has paths which change
> depending upon the directory it was built in.
>
> This is bad, firstly as a reproducibility problem, but secondly as
> those paths won't make sense on target so they show something else
> is wrong.

Okay, I will look into this and address it on the next patch.

>
>
I was a little concerned that it appeared you're copying the entire
> source into the ptest package too, not sure we need everything?
>
ffmpeg fate test requires to run "make" followed by "make fate" commands,
which requires the source code.
It's best to have the entire source rather than going into details as to
what source is tested, also this is difficult to do.

>
> Cheers,
>
> Richard
>
>

--0000000000008fc22005bc445bab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thank you Richard, please see inline.</di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Feb 26, 2021 at 5:19 AM Richard Purdie &lt;<a href=3D"mailto:richard.pu=
rdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2021-02=
-25 at 10:12 -0800, Suji Velupillai via <a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrot=
e:<br>
&gt; This change got dropped from the master-next branch.<br>
&gt; Did it break=C2=A0any builds? Is there anything I can=C2=A0do to help =
to get this change accepted?<br>
<br>
Sorry, there was a bit of a mixup in the triage process and this<br>
took longer to work through than expected.<br>
<br>
Yes, I&#39;m afraid it did fail in testing, there was a reproducibility iss=
ue:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/118/buil=
ds/34/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/118/builds/34/steps/12/logs/st=
dio</a><br>
<br>
which says that the ffmpeg-ptest package has paths which change<br>
depending upon the directory it was built in.<br>
<br>
This is bad, firstly as a reproducibility problem, but secondly as<br>
those paths won&#39;t make sense on target so they show something else<br>
is wrong.</blockquote><div>Okay, I will look into this and address it on th=
e next patch.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I was a little concerned that it appeared you&#39;re copying the entire<br>
source into the ptest package too, not sure we need everything?<br></blockq=
uote><div>ffmpeg fate test requires to run &quot;make&quot; followed by &qu=
ot;make fate&quot; commands, which requires the source code.</div><div>It&#=
39;s best to have the entire source rather than going into details as to wh=
at source is tested, also this is difficult=C2=A0to do.=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--0000000000008fc22005bc445bab--

--00000000000095cb4c05bc445bad
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
IIpYKc33vzvKVDvs2IWxRv6MyW+eVUk+j/TVRY0v8wuN8GA9Xa2cWrCIF/nZBwZ6XV6cyWqbgHFU
Xv6uTwtYVz+ixpy1R32Pa50S9DA+AT2RLA5tZ56/62XL8dlXzDUCAwEAAaOCAd0wggHZMA4GA1Ud
DwEB/wQEAwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUu
Z2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggr
BgEFBQcwAYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJj
YTIwMjAwTQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3
Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4
aHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmww
JwYDVR0RBCAwHoEcc3VqaS52ZWx1cGlsbGFpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEF
BQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUSiB4fyCZFnFa
INRZOYTRblhwD7IwDQYJKoZIhvcNAQELBQADggEBALB7BzgCJ+VORdoeBmmNg2qfej6VLxIuLx1W
m3q3E2Tx2AKnbI6AUdempPrtgjw0UdLTAyhgnGnXbDn8u0GIPagiUT9VKTuIESp6pd/ByUMVZDu4
WiFyEQ6gixTfJJ08mXc6bC0koGLOcno1ewjWDPLnPuGuYe5B5xdG6tT2IZJYB0bCMTGlW/CqRe9X
d24scEswBsLEwTXimmxjiPwWLF8Bl9JjEC0cSsw83xFYFrMW21PK9GXwr69NgaTKY/xWrZuMyn87
vm9TA/rOkYj953t/G7ndwrCF4fKMR64iXGkhF+fAc6YMNauiXIDsQ0gTMn05JBAcHXy2CsCjCZm6
7DExggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNh
MTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgw/SHIb
YJZUlCWLN7owDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEICs4cAdfcuVI5Puy7Q4V
+zxsQMDf/UOvoEM+8LkTX2QdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTIxMDIyNjIxNTc0M1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUD
BAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsG
CWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCm5w6uGmiP/H2HpAVwHnlCea118h9j/W/o2Z7R
PKFFEqFCfzoqiNqaeUV6fjPo/Pu1B8wgDGvKi23H/n3DrJ2ifYJIwJVH3XvBuw8lSKwD0SRzWrKt
5aaBEmA7KdNaTAB+OiUitYE0xBBZ8eLPztqitRhPYHfkq/LtlOCpdgejntEsuNCnqOQRzueEn+4p
DAg0EvMj9PDSsIFQmTHrHQKoM5gKGK+LH0ePFerW7nYBFMa47jKZvUvMZyTclF82aYuDQvXrr7nk
5/XN5IQ8zDXUPXn9S7c5unXIWsUBkwVyx3JE2MVmDtlWGfk1tRXJa7bwT+TElreg5QYvwgJM8DzC

--00000000000095cb4c05bc445bad--
