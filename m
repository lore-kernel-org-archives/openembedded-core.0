Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D128B7D2AE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 08:35:42 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s15so28079383wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 01:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Ex01fEgb6tVbGO9hP91bUAU4ry+l4+o/xplzzLCenII=;
	b=pyDmqtPWNQ2d2/pzD/+Aid+zVlE5Rs8E4PAFvo39H03RYRb7Dga7ys5fGKgW1udrFG
	PXtkD+ISdYsftnMDn9tc8OBRqTggPB/zp2EdWh12+XdO+YsHSXbaF2ZSl9EDUT24AABw
	8GyAygjSIPEdCYn62BI24fwA883hSFvfr378hOOJ5QUhe/yqoZhLFIwQFtiEyECNCfiQ
	Y73q3qc3zyKdhxCQS5O0myIqnBTtTMrsUJnokBCt3ZdPwBopmjI+S6Sg140zFraMXZAS
	5Z38HqvHADWo8x0CHeGPDjpSQEK7ChSl+qQvg5X66fmxQaljGxUSR2M2XlawRMc3m9v6
	9vPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Ex01fEgb6tVbGO9hP91bUAU4ry+l4+o/xplzzLCenII=;
	b=DyOtRGAF0XLRtEnG5kUCM4xcTbE6YLdKDvZpgCo7oHEh4MB0P8jjEp6qTviLjOa1r+
	lfJV8F3ZUQj7F0r0kXzg4ecFJQSub+KnVrlGhkAP7fW+5UmGCdsYNj9EtwjcAC1Oyk0u
	5BtSoekan1KBRKoG3inwpQKYHg6fEKhg0oD7PS4LZU3vmAbgLIbvcrlOqwmdZk2BflKu
	PQ/y07d5N+tjFty6aAhZK7Sf4inXanE6opaLNaCcPJJzGlZ3qpH2CF4EbJViMhoJprM7
	0BXaxeMkTjtB4SYgMk98EI2Uwy5g0CzR4jCHAj4VRvrun8c5u19/7HpJ0LCnj+vJ/Sok
	nRlg==
X-Gm-Message-State: APjAAAUnyx1tsR/qzcxBXM0T3Cw98f/DWbNpNQTcAC/g1lbxc3YoHfFf
	fjIyH60R6Kn4dbGEki3qgJx1qaEfIjw=
X-Google-Smtp-Source: APXvYqwgPgHKdq9fCi9CvgynXQcZtb15/H0CXIWnRxAlZMXfr4JnoZujoSYa57y/DjlUxl/5KjTSAQ==
X-Received: by 2002:a1c:770d:: with SMTP id t13mr16330889wmi.79.1564216543255; 
	Sat, 27 Jul 2019 01:35:43 -0700 (PDT)
Received: from [10.30.240.241] (tmo-096-244.customers.d1-online.com.
	[80.187.96.244])
	by smtp.gmail.com with ESMTPSA id t3sm43700671wmi.6.2019.07.27.01.35.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Jul 2019 01:35:42 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16F203)
In-Reply-To: <ee2018da-9448-97ba-b34e-c490164492bb@windriver.com>
Date: Sat, 27 Jul 2019 11:35:40 +0300
Message-Id: <607380CA-E78F-40F5-A77B-AE5DE1E42E59@gmail.com>
References: <20190726092342.37231-1-kai.kang@windriver.com>
	<CANNYZj8Jm7q5NfUjHVuDJGaJHC51txQ-iMWZP7YC4-nWkRstdg@mail.gmail.com>
	<ee2018da-9448-97ba-b34e-c490164492bb@windriver.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-sato-sdk: test image with 512M memory
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
X-List-Received-Date: Sat, 27 Jul 2019 08:35:43 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-30888E1A-EB7F-434C-A36D-68C9AB731876
Content-Transfer-Encoding: 7bit

--Apple-Mail-30888E1A-EB7F-434C-A36D-68C9AB731876
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I think you need to re-generate the image first (it goes to qemuboot config f=
ile). It is already used in ptest images, so it=E2=80=99s good to be consist=
ent.

Alex

> On 27 Jul 2019, at 4.35, Kang Kai <Kai.Kang@windriver.com> wrote:
>=20
>> On 2019/7/26 =E4=B8=8B=E5=8D=886:11, Alexander Kanavin wrote:
>> I think you need to use QB_MEM here.
> Used TEST_QEMUPARAMS because I found the following line in testimage.bbcla=
ss:
>=20
> # TEST_QEMUPARAMS can be used to pass extra parameters to qemu, e.g. "-m 1=
024" for setting the amount o f ram to 1 GB.
>=20
>=20
>=20
> And it seems QB_MEM is not used when boot the qemu during testimage.
>=20
>=20
>=20
>>=20
>> Also, maybe we should just bump the 256M default?
> I hope so.=20
>=20
>=20
>=20
> Regards,
> Kai
>=20
>=20
>=20
>>=20
>> Alex
>>=20
>>> On Fri, 26 Jul 2019 at 12:24, <kai.kang@windriver.com> wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>=20
>>> When run do_testimage for core-image-sato-sdk, it fails to pass test
>>> case:
>>>=20
>>> | RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED (0.43s=
)
>>>=20
>>> It is OOM issue and daemon rpc.statd is killed:
>>>=20
>>> |  [  531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 o=
r sacrifice child
>>>=20
>>> Increase the memory of qemu to 512M to avoid such OOM issue.
>>>=20
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>  meta/recipes-sato/images/core-image-sato-sdk.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>=20
>>> diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/reci=
pes-sato/images/core-image-sato-sdk.bb
>>> index d7cc52b52b..f7963d018e 100644
>>> --- a/meta/recipes-sato/images/core-image-sato-sdk.bb
>>> +++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
>>> @@ -9,3 +9,4 @@ IMAGE_FEATURES +=3D "dev-pkgs tools-sdk \
>>>=20
>>>  IMAGE_INSTALL +=3D "kernel-devsrc"
>>>=20
>>> +TEST_QEMUPARAMS =3D "-m 512"
>>> --=20
>>> 2.20.0
>>>=20
>>> --=20
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Kai Kang

--Apple-Mail-30888E1A-EB7F-434C-A36D-68C9AB731876
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">I think you need to re-generate the image f=
irst (it goes to qemuboot config file). It is already used in ptest images, s=
o it=E2=80=99s good to be consistent.<br><br><div id=3D"AppleMailSignature" d=
ir=3D"ltr">Alex</div><div dir=3D"ltr"><br>On 27 Jul 2019, at 4.35, Kang Kai &=
lt;<a href=3D"mailto:Kai.Kang@windriver.com">Kai.Kang@windriver.com</a>&gt; w=
rote:<br><br></div><blockquote type=3D"cite"><div dir=3D"ltr">
 =20
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"=
>
 =20
 =20
    <div class=3D"moz-cite-prefix">On 2019/7/26 =E4=B8=8B=E5=8D=886:11, Alex=
ander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj8Jm7q5NfUjHVuDJGaJHC51txQ-i=
MWZP7YC4-nWkRstdg@mail.gmail.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
      <div dir=3D"ltr">I think you need to use QB_MEM here.</div>
    </blockquote>
    <p>Used TEST_QEMUPARAMS because I found the following line in
      testimage.bbclass:</p>
    <p># TEST_QEMUPARAMS can be used to pass extra parameters to qemu,
      e.g. "-m 1024" for setting the amount o f ram to 1 GB.</p>
    <p><br>
    </p>
    <p>And it seems QB_MEM is not used when boot the qemu during
      testimage.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj8Jm7q5NfUjHVuDJGaJHC51txQ-i=
MWZP7YC4-nWkRstdg@mail.gmail.com">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Also, maybe we should just bump the 256M default?</div>
      </div>
    </blockquote>
    <p>I hope so. <br>
    </p>
    <p><br>
    </p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj8Jm7q5NfUjHVuDJGaJHC51txQ-i=
MWZP7YC4-nWkRstdg@mail.gmail.com">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Alex</div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Fri, 26 Jul 2019 at 12:24,
          &lt;<a href=3D"mailto:kai.kang@windriver.com" moz-do-not-send=3D"t=
rue">kai.kang@windriver.com</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(20=
4,204,204);padding-left:1ex">From:
          Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_=
blank" moz-do-not-send=3D"true">kai.kang@windriver.com</a>&gt;<br>
          <br>
          When run do_testimage for core-image-sato-sdk, it fails to
          pass test<br>
          case:<br>
          <br>
          | RESULTS - systemd.SystemdBasicTests.test_systemd_failed:
          FAILED (0.43s)<br>
          <br>
          It is OOM issue and daemon rpc.statd is killed:<br>
          <br>
          |&nbsp; [&nbsp; 531.306146] Out of memory: Kill process 193 (rpc.s=
tatd)
          score 200 or sacrifice child<br>
          <br>
          Increase the memory of qemu to 512M to avoid such OOM issue.<br>
          <br>
          Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.c=
om" target=3D"_blank" moz-do-not-send=3D"true">kai.kang@windriver.com</a>&gt=
;<br>
          ---<br>
          &nbsp;meta/recipes-sato/images/<a href=3D"http://core-image-sato-s=
dk.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">core-im=
age-sato-sdk.bb</a>
          | 1 +<br>
          &nbsp;1 file changed, 1 insertion(+)<br>
          <br>
          diff --git a/meta/recipes-sato/images/<a href=3D"http://core-image=
-sato-sdk.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
core-image-sato-sdk.bb</a>
          b/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.b=
b" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">core-image-=
sato-sdk.bb</a><br>
          index d7cc52b52b..f7963d018e 100644<br>
          --- a/meta/recipes-sato/images/<a href=3D"http://core-image-sato-s=
dk.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">core-im=
age-sato-sdk.bb</a><br>
          +++ b/meta/recipes-sato/images/<a href=3D"http://core-image-sato-s=
dk.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">core-im=
age-sato-sdk.bb</a><br>
          @@ -9,3 +9,4 @@ IMAGE_FEATURES +=3D "dev-pkgs tools-sdk \<br>
          <br>
          &nbsp;IMAGE_INSTALL +=3D "kernel-devsrc"<br>
          <br>
          +TEST_QEMUPARAMS =3D "-m 512"<br>
          -- <br>
          2.20.0<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank" moz-do-not-send=3D"true">Openembedded-core@lists.openembedded.or=
g</a><br>
          <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">htt=
p://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang</pre>
 =20

</div></blockquote></body></html>=

--Apple-Mail-30888E1A-EB7F-434C-A36D-68C9AB731876--
