Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 02AE178234
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 12:02:20 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id y77so54049084ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 05:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8KlGVZdmPjTjVVucauoMssGVxXDC5snkCNXQVINSpz8=;
	b=Hus2Y4rJ12ibkq/j/JEqWUswL4DJDT/8iZLXA1nlILlLSyIwjmWWtXskmlP+wqWWLK
	p00OpqQw1OmAs74FrvUalmOqFmfU+juUP3ebqU1pRBr03yq8iTqiZmZsYqjY1buzOvsk
	gJqoszDeG2fr4To+vlGxdQ3WYmaMqYmKQpNNnxp7dt1cviNjhh/S65TGzGkldepTL0S3
	67OC7cILIML+X6yjBxaS+9KTM7GJXcjIpFz1qbcDcfv7i9//tsHWLT1YU/RHTUVhr/W7
	8MIxyrNgqrRnLhUcgRNpwcwd9FyvvxOxqeC3kpyTJlXaHMx/MoftAZ/vL5xg7xTmJ+3D
	dW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8KlGVZdmPjTjVVucauoMssGVxXDC5snkCNXQVINSpz8=;
	b=jILJFprenPGRW9Uyzepk97+WLf80c1V6AexysPbG+rjgW0SQ5+sHdMojub+SJas5vq
	8BaN8ZoRIBUfkeOBDcLERblohI2J5P6rdlHrr/mA/9I2ZcvLxgkNliyFdQbKhYUiOBg/
	TcmKjWs4IW2w90GmQTfv9zYxtJlcl8lWKwsrp7sFDBxiLrocRGGe7BIJTMePx33a8AuJ
	6v55MbTpSP0+ZRwEqK0RT6qt5r82Sxs5T+vCBKgjfUFlMEQ4XqONB+2HBJ1dEna5ayKD
	kCyWKWtsOxtFLhjHzVG2p6tcvImuvAFVuehIfKxcg8lt0zPZ4B4Iw7JWgazGJv9XcSkQ
	eJDA==
X-Gm-Message-State: AKS2vOxufSRvSXTdyzGpN1Em6bMz0kEqVDc4c96e7wMRrWOpWgz7Axn4
	CzOSg0uDE0UHIH2IV5QiVZ8U3qAVjw==
X-Received: by 10.107.9.160 with SMTP id 32mr9338823ioj.212.1497268941729;
	Mon, 12 Jun 2017 05:02:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.16 with HTTP; Mon, 12 Jun 2017 05:02:21 -0700 (PDT)
In-Reply-To: <CAJTo0LY_O+BctxPoraFsYpSnTBksq+Cz7e=UZT2bHYyzpt94aw@mail.gmail.com>
References: <1497265861-2562-1-git-send-email-changhyeok.bae@gmail.com>
	<CAJTo0LY_O+BctxPoraFsYpSnTBksq+Cz7e=UZT2bHYyzpt94aw@mail.gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Mon, 12 Jun 2017 21:02:21 +0900
Message-ID: <CACrLJgCAdBwC8jWSdAMxdHAEyuW31AQchSA=rHZ-5-UTbMMY5Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] openssl: Upgrade 1.0.2k -> 1.0.2l
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
X-List-Received-Date: Mon, 12 Jun 2017 12:02:21 -0000
Content-Type: multipart/alternative; boundary="001a113eac9a67da2a0551c2173b"

--001a113eac9a67da2a0551c2173b
Content-Type: text/plain; charset="UTF-8"

I think that do_install_ptest is fine. Why would you think that?

Thanks
Changhyeok

2017-06-12 20:51 GMT+09:00 Burton, Ross <ross.burton@intel.com>:

>
> On 12 June 2017 at 12:11, Changhyeok Bae <changhyeok.bae@gmail.com> wrote:
>
>> +do_install_ptest() {
>> +    # exclude binary files or the package won't install
>> +    for d in ssltest_old v3ext x509aux; do
>> +        rm -rf ${D}${libdir}/${PN}/ptest/test/$d
>> +    done
>> +}
>>
>
> I think you meant do_install_ptest_append here?
>
> Ross
>



-- 
Thanks
Changhyeok

--001a113eac9a67da2a0551c2173b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think that do_install_ptest is fine. Why would you think=
 that?<div><br></div><div>Thanks</div><div>Changhyeok</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-06-12 20:51 GMT+09:00 =
Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com"=
 target=3D"_blank">ross.burton@intel.com</a>&gt;</span>:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span class=3D"=
"><br><div class=3D"gmail_quote">On 12 June 2017 at 12:11, Changhyeok Bae <=
span dir=3D"ltr">&lt;<a href=3D"mailto:changhyeok.bae@gmail.com" target=3D"=
_blank">changhyeok.bae@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D"m_-4299528920085873015:5n1" class=3D"m_-4299528920=
085873015a3s m_-4299528920085873015aXjCH m_-4299528920085873015m15c9c011b8a=
b5e36">+do_install_ptest() {<br>
+=C2=A0 =C2=A0 # exclude binary files or the package won&#39;t install<br>
+=C2=A0 =C2=A0 for d in ssltest_old v3ext x509aux; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${libdir}/${PN}/ptest/test<wbr>/$d<=
br>
+=C2=A0 =C2=A0 done<br>
+}<div class=3D"m_-4299528920085873015yj6qo m_-4299528920085873015ajU"><div=
 id=3D"m_-4299528920085873015:5o9" class=3D"m_-4299528920085873015ajR"></di=
v></div></div></blockquote></div><br></span>I think you meant do_install_pt=
est_append here?</div><span class=3D"HOEnZb"><font color=3D"#888888"><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></font>=
</span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Th=
anks<div>Changhyeok</div></div></div>
</div>

--001a113eac9a67da2a0551c2173b--
