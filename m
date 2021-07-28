Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.1987.1627458815584852041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 00:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hor2XvrT;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: nagesh.shamnur@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id k4-20020a17090a5144b02901731c776526so8701684pjm.4
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 00:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=QOCkLOBRGz1i1Hsvyd4E6FrOkfRUstU+D1imBU/5imI=;
        b=hor2XvrTsuYXHROMSXrix8OvhvqCx03zCdoGX/4DfLKm4iZomwQT06oiqZNYXQ5fyW
         ihZMuT8fpgGH3FrITqoqHdjJGrS33dWIyQVOW+rQAW1XIn3loE6oSGfCXs1C8ypLqqj9
         Qaldrg5KAHCvOSqNXO8N2rR8AvE+ZaDIn7KqzZxjagqzn17NSu9xx69cQJEj4pOrX8q6
         DmjbtYwmYXC3Y76nvcrt6gMrhdHYFY3SGc8UwI+ya7WTdWIR/Vfwa7042WrlFdQPXdHG
         l5JtFLIvFnKYoY2H/3BOp9c2L8Oa/hnAq3sMLg9CB1yr+JWJi7L3F4wJ/0IXJ8TcTGPR
         GCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=QOCkLOBRGz1i1Hsvyd4E6FrOkfRUstU+D1imBU/5imI=;
        b=Nxi5bg+3OmkQiBKxSFP0/BlbpfBeGKOvWRLb7x7rstU1yvyj+OF4fswa2C3GlzMLCI
         Qqo6t/JiLMva+GLMrwCgYvPkdZTyRYHE+ycyN9Zs5vCSlIILWRgQ4/Q+HWGDE328clk+
         gNHv3MCiB8t6I6aql9HJ1l4OkJpynC/w+0h3aPYCwrZBp5qbPBbjqbUX+/W2ZizwmvcK
         CmW12LFD1wYpsI8FzyesaGUSkLpQTSn0LUXbhplUEUloIxYWCsT/NUkTtpFIY9BvR1gr
         aomt7lYNC0EhlG0ulzpsb+PnSIba4RWMIrw4mlNNw5D2OLnBgXpK5GiSWDqModFL/hsA
         NoHA==
X-Gm-Message-State: AOAM530BYAcSG3lgimbs2wl44wlYg6uWr7lRBtmmdhpX/ui49IcBHBp8
	L1m0rTQ/wfS7WTb+HuNmMdd+KEVSEI6gDX1l9Hn8d0eTmCc=
X-Google-Smtp-Source: ABdhPJww/0NMIFPyUBlh6Skb4vJW2aOREctIYdWKA7F7MuTwxK/pXpQaM0K0x6Xt3pFuFB5vvigEUud6b/8KpDM7bTk=
X-Received: by 2002:a05:6a00:16c6:b029:32d:e190:9dd0 with SMTP id
 l6-20020a056a0016c6b029032de1909dd0mr26854991pfc.70.1627458814803; Wed, 28
 Jul 2021 00:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_JV5PZwZh8mMw0ZoVBuCA1570ki0gqSi_Du=UqXfNtuG6P4w@mail.gmail.com>
In-Reply-To: <CAA_JV5PZwZh8mMw0ZoVBuCA1570ki0gqSi_Du=UqXfNtuG6P4w@mail.gmail.com>
From: nagesh.shamnur@gmail.com
Date: Wed, 28 Jul 2021 13:23:23 +0530
Message-ID: <CAA_JV5OinDTfVwtVN4hYexvr2c08NxL5=A-pAsiBquFqvEUPEQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] fix compilation error when add libgloss under DEPENDS in recipe
To: openembedded-core@lists.openembedded.org
X-Groupsio-MsgNum: 154198
Content-Type: multipart/mixed; boundary="0000000000008b190405c82a4871"

--0000000000008b190405c82a4871
Content-Type: text/plain; charset="UTF-8"

 Dear Group,
    When include newlib and libgloss under DEPENDS in custom recipe,
 then newlib compilation is successful however libgloss compilation
 fails since it is unable to find the needed include path under
 recipe-sysroot/usr/include. This patch is to fix this issue by
 including recipe-sysroot/usr/include while configuring libgloss.

 Regards,
 Nagesh

--0000000000008b190405c82a4871
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-fix-compilation-error-for-libgloss.patch"
Content-Disposition: attachment; 
	filename="0001-fix-compilation-error-for-libgloss.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_krn6y81v0>
X-Attachment-Id: f_krn6y81v0

RnJvbSA3NzNhMTBmYmMyODU4ZjIzOTdhYmNmNjRjNjBlNjQzODRhOTJmMjVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOYWdlc2ggPG5hZ2VzaC5zaGFtbnVyQGh1YXdlaS5jb20+CkRh
dGU6IFdlZCwgMjggSnVsIDIwMjEgMTM6MDk6NTAgKzA1MzAKU3ViamVjdDogW1BBVENIIDEvMV0g
Zml4IGNvbXBpbGF0aW9uIGVycm9yIHdoZW4gYWRkIGxpYmdsb3NzIHVuZGVyCkRFUEVORFMgaW4g
cmVjaXBlCgpTaWduZWQtb2ZmLWJ5OiBOYWdlc2ggPG5hZ2VzaC5zaGFtbnVyQGh1YXdlaS5jb20+
Ci0tLQogbWV0YS9yZWNpcGVzLWNvcmUvbmV3bGliL25ld2xpYi5pbmMgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL25l
d2xpYi9uZXdsaWIuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvbmV3bGliL25ld2xpYi5pbmMKaW5k
ZXggMGFiYTIxZmFlNy4uZWRmNGQxYjUyYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
bmV3bGliL25ld2xpYi5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbmV3bGliL25ld2xpYi5p
bmMKQEAgLTI2LDYgKzI2LDcgQEAgQiA9ICIke1dPUktESVJ9L2J1aWxkIgogCiAjIyBkaXNhYmxl
IHN0ZGxpYgogVEFSR0VUX0NDX0FSQ0hfYXBwZW5kID0gIiAtbm9zdGRsaWIiCitDRkxBR1NfcHJl
cGVuZCA9ICItSSR7UkVDSVBFX1NZU1JPT1R9L3Vzci9pbmNsdWRlIgogCiBFWFRSQV9PRUNPTkYg
PSAiIFwKICAgICAgICAgICAgICAgICAtLWJ1aWxkPSR7QlVJTERfU1lTfSAgXAotLSAKMi4yNS4x
Cgo=

--0000000000008b190405c82a4871--
