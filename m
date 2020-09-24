Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web10.24998.1600973504619776024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2020 11:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=MrT3hKgw;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.219.195, mailfrom: jonathan.richardson@broadcom.com)
Received: by mail-yb1-f195.google.com with SMTP id s19so198573ybc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2020 11:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:references:in-reply-to:mime-version:thread-index:date
         :message-id:subject:to;
        bh=4p2zSxTK/a/TCEYFy3vR0Qf92W6qHMZBCKBKtM/JD+k=;
        b=MrT3hKgwC+YbnhzMKPru6nVcYvt2WGGdcsom4ZfPROP9Wf/EwVDSxVJlPTGWF6N4i9
         CUwyO2KlxCXgGCteDqV64jDf9fFkhGacv5R142WF/F9d6Ma329E6/QSdzOmbiC+xEhNX
         LOzCZMTf2gDT51ZNwjKc+5O/PkrXidBthfyCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:references:in-reply-to:mime-version
         :thread-index:date:message-id:subject:to;
        bh=4p2zSxTK/a/TCEYFy3vR0Qf92W6qHMZBCKBKtM/JD+k=;
        b=eL0LLRuDbUjbVNYC0DP1bSmugZKpYg7BJhQ+v49IZsUXUI3yYQ7GJl24jgmQX50bsc
         feXDPmMz/Fxt3NtGeX13hq4esh4X00b/sBBqm/+gIddOYaUnEyEGRRto+/2luuV9U+Ty
         CFVgj9RNRFqleC16pZEEV6xb3TonBIwqk4IFfeva6VY/OgZu0cU8fuIny8g9MERU73UU
         jPrhGeIv+EGomEZ2XtQbhY0RSFGNi2EWXutiDrk9gHw9Do6jtVg9pKhLgho4q3JcxPjq
         2fMahjDyzzFiaYWEc7f9+vm5VjW7Ww6fsTz55jdPAh9C/Oib8r2LOOuIf2y2LgM/QnBg
         apEA==
X-Gm-Message-State: AOAM532zxt+16DK6p0k6TYuSx5g35IL8Qw5Dqt2aRiGJNr1+wiXqbzDp
	Xus96TEwhY2WebMhJYZWbNJ40CbI+9D4Cnymm2viKqW5gJA=
X-Google-Smtp-Source: ABdhPJwFLzYszFhIT2no3fHrW094Jru7Uak6XQhV3yDGY7zul4xwaQw1GEBsM1OaT8RWOicDl5Jt4abua/jRz7Iq5Kg=
X-Received: by 2002:a25:606:: with SMTP id 6mr270954ybg.86.1600973503450; Thu,
 24 Sep 2020 11:51:43 -0700 (PDT)
From: "Jonathan Richardson" <jonathan.richardson@broadcom.com>
References: <16378A523748CE42.11000@lists.openembedded.org>
In-Reply-To: <16378A523748CE42.11000@lists.openembedded.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQExvYDZBMNdeantXt3Z5c5kmpNNaarBysbQ
Date: Thu, 24 Sep 2020 11:51:42 -0700
Message-ID: <ef814b2002b1914ddf4c4583b1e13634@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/1] cortex-m0.inc: Add tuning for cortex-m0
To: openembedded-core@lists.openembedded.org
X-Groupsio-MsgNum: 142758
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000fe2af005b013b05f"

--000000000000fe2af005b013b05f
Content-Type: text/plain; charset="UTF-8"

My commit said "Add tuning for" but the f went missing after I created the
patch using git format-patch -M -n1 -s --subject-prefix="meta-oe][PATCH".
Not sure why.

-----Original Message-----
From: openembedded-core@lists.openembedded.org
<openembedded-core@lists.openembedded.org> On Behalf Of Jonathan Richardson
via lists.openembedded.org
Sent: Wednesday, September 23, 2020 3:31 PM
To: openembedded-core@lists.openembedded.org
Cc: Jonathan Richardson <jonathan.richardson@broadcom.com>
Subject: [OE-core][PATCH 1/1] cortex-m0.inc: Add tuning for cortex-m0

Add tuning or ARM cortex-m0.

Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 meta/conf/machine/include/tune-cortex-m0.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortex-m0.inc

diff --git a/meta/conf/machine/include/tune-cortex-m0.inc
b/meta/conf/machine/include/tune-cortex-m0.inc
new file mode 100644
index 0000000000..a59c8af941
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortex-m0.inc
@@ -0,0 +1,11 @@
+DEFAULTTUNE ?= "cortexm0"
+require conf/machine/include/arm/arch-armv6m.inc
+
+TUNEVALID[cortexm0] = "Enable Cortex-M0 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0',
' -mcpu=cortex-m0', '', d)}"
+AVAILTUNES += "cortexm0"
+
+ARMPKGARCH_tune-cortexm0 = "cortexm0"
+TUNE_FEATURES_tune-cortexm0 = "${TUNE_FEATURES_tune-armv6m} cortexm0"
+
+PACKAGE_EXTRA_ARCHS_tune-cortexm0 = "${PACKAGE_EXTRA_ARCHS_tune-armv6m}
cortexm0"
-- 
2.20.1

--000000000000fe2af005b013b05f
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
vHaK84VoWnHQcLUkaMiN0X7XM5C6vIo8yhBhA6BaVus/5I1NTLPbKuo/kWuFjk2Fpoe66YLtTn3h
RoVB1OA8ItIQN/sCAwEAAaOCAdcwggHTMA4GA1UdDwEB/wQEAwIFoDCBngYIKwYBBQUHAQEEgZEw
gY4wTQYIKwYBBQUHMAKGQWh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzcGVy
c29uYWxzaWduMnNoYTJnM29jc3AuY3J0MD0GCCsGAQUFBzABhjFodHRwOi8vb2NzcDIuZ2xvYmFs
c2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hhMmczME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0
MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNV
HRMEAjAAMEQGA1UdHwQ9MDswOaA3oDWGM2h0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJz
b25hbHNpZ24yc2hhMmczLmNybDArBgNVHREEJDAigSBqb25hdGhhbi5yaWNoYXJkc29uQGJyb2Fk
Y29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBRpcoJiMWeVRIV3kYDEBDZJ
nXsLYTAdBgNVHQ4EFgQUa5kon5XwHZRSZkX5IOJpNb4vbw8wDQYJKoZIhvcNAQELBQADggEBAAaL
wxrc2inAZlHxB3cfK6JxuQI5tZBg5stkNrv4jQ//mOyUsTYCAOip2b/YYrczxaRRBGrSAh7mNVfS
pKyxl2zd/0jj5nwLv9xy78GL89xD/mVvd1gXADqQDTFjHNH3Hqg1lu3vtWq1tOFxdyrDsX8cYkUv
8MIM4iHV5TYM99qNGxKbj/ZNdcHYBO45IIFNG/nqe7nPkQ7ikilr/Y1+DGpVwesuxm9x2ZiRPlBN
MtXVWdVK2QyHMXHbJoENTaUb8qPrzI4gwF9C9nrQBYIJx45s9AMLn/xozqDMyJXqFluyQjJdwv2+
BdZUGnCAtzSgrEru5ffGcSvpzK+qArTc7UYxggJvMIICawIBATBtMF0xCzAJBgNVBAYTAkJFMRkw
FwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQDEypHbG9iYWxTaWduIFBlcnNvbmFsU2ln
biAyIENBIC0gU0hBMjU2IC0gRzMCDH8hIsPI4q59Cxj1yjANBglghkgBZQMEAgEFAKCB1DAvBgkq
hkiG9w0BCQQxIgQgbK+PUXkvuX6hoBaaCcEozDhKBuEe/MV19g1cZOEbYpswGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAwOTI0MTg1MTQzWjBpBgkqhkiG9w0BCQ8x
XDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsG
CSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBACFb
vDpfreMTpsHxgmY4P1bDaGMBvqPBDal7ytdJQQG9ITOO8/FhKc5m55V0/4Qf7JnnzaLr9qtFKMKt
yQFtBZ2Py0iKNqXbnbNkBEAoizrBt329Ie7e0bpo6MzTh9p28S+cdTOuHiVywKjkNEJr/GNjy3tD
1/LM8omAtrS6Kaood7KY4YanwUuTO77puHv4rWnEmm93t7Wpit7vxdecEQX6oBWU3KUvzKMpQXND
Dey8Pvr8I/LvLY2w0IFIy0ovITdPANLQFLVV9uFsrUXI+26AHcqwT4Eu+GO75CcBqGE8SEeDgkA8
tJuuZBDScn33eBKulhvHLZ5RGHovKk+pfko=

--000000000000fe2af005b013b05f--
