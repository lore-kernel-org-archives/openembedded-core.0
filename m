Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6647.1793347150032457449
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Hpity9va;
 spf=pass (domain: mvista.com, ip: 209.85.218.50, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4326803b54so18528766b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 00:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793347148; cv=none;
        d=google.com; s=arc-20260327;
        b=EQa70f53bJhrGoxB5+Hleo4XrB0vQcL2r05cVpsXesFNWgIQjXG/ctBNZ1EyOybitz
         kunQ7fCSQMau+PoSinUCI62TiNwmpjVOnOUnkJWxwan6u2sFKp8W8MkQZI2HnVnMWgfj
         F31lrL9YKuCZnuRn0nLKODr/eTCGC033Jsw0S48kC86u1+TkbOLnEw0bH8/dCSuio8Dk
         C3jmZ/O2UJKlA5t+ZOrlN8USySDLes+ZRqaTtXc+IgSNlUCoiP0ptOYmhqa4SMUbCbdN
         Y0LcsSvXorGzwQwwFoqm0JYzOvYAvTouwiE79EVjMrrbcbnzR7HXtNJNpdYR1RmZZNui
         OHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PVT5BsvRNPLqfe0OOtRSpCIVcTzRupUiz8TajIypqbc=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=FHp3XVSPJFLyedN4fZW6b3eMA9Sg5Jkzxrb9EDtuHYCAx7yxL1Z+gU6owJeU6/qfae
         0xBOu+KHLHY2p/et+QRKYLGECidcO06YlJGEVF42D82VfqFXfBNF+gBAUY8CLeojfBXu
         pdnbgH9Jf9XkOQ94UoHDHWmWwhly10bFIe/gIkUtAJBZqm6Y9ordG4ehUbTOG876gs4Q
         3AUv/yCskzBRTbtHFqN3FAetabTE063Gdmpw2AkGc2zNfhv9KB/+E2R3jiuSYJqHsvvn
         a5mwX5p9vJalddVFwr26MlLMWz4/YVVEUmYpwEqTFeRjRtwq9nBLAhPIyWtBscYyintk
         GTdw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1793347148; x=1793951948; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVT5BsvRNPLqfe0OOtRSpCIVcTzRupUiz8TajIypqbc=;
        b=Hpity9vanNoqdYIk+/lnrYtPp1VqNbjV00yN2ayDIvagjkKakCwwaUyKsfYk9OjIHu
         5U8R0l2xlq23CGfHHNmoueTPlL1CeUiidldhhtOea5VXzFwPsRO2GNYotqurY4b7mKcH
         UcKEG7GHgxHxfHjQcWWkYEYtEU7nUcc2WjowA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347148; x=1793951948;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PVT5BsvRNPLqfe0OOtRSpCIVcTzRupUiz8TajIypqbc=;
        b=in4SZqAVHHknYi7ozXMoE17i2p4ATnE5g2gAh2cWCBVaklgDY9jCoFfzOg13WKLyod
         Ywen53oMfGTzRmvExy3+LMn8MyosrzuFY4j2VeAro0lGeGFxC9Obo8povdQoDq9xKgtq
         qx6fGgxN/Ezg3UI8IMuolggqO9MSmt+DdvrgzMby3hOq+cXUFvNMS8s8qfSk1oSRJdwY
         Uc1FDSOFKuh/4hsCP8/GmpEkcQ/CsPDYLADqZ1BoT3CHUehnjtYUH2Kec1hirAEbIZ7f
         DQWfgLvawVz4alVh8XsV5NYf+KP/7IR8vaK8+oV6eJ7EiqDY1ojvLyNpuRltYWUqUlD8
         ClGA==
X-Gm-Message-State: AFq9FYKrPFG3UWfgAfhtX3EyJYSdfO4zxVDGoetjv2Vwdtzga6sN9HbP
	HcosKsEINz7MfaEAlnmrYp2JCKAJeyivl/6DA8ljfI+KGaYxmSFjuvRB44SaAfE4XEOdX5OyK9O
	13AASUYXtu/GaKb27FEMIOC/Vo0WFSrCti9YfJaus0g==
X-Gm-Gg: AYBFou2yvuu5uDkYbFCuWfuTPeTIpwmqNvUVWYAsscB/q6okML0xvrooSUfZr8s2Mya
	6q7WLi2DVKwDgZSIxfS8SUMxO8pYdb4sWuo0GFSYy3MNzvXHE6ulfWkXMHXQw+Gdq8ea4csFxV8
	jTglqo4acb4WTRp6qJZFODZp2Srtp6b60cGuR/oGhLk5cyPE9ZS/9QophG9fwNqZSfmyHfM8rVT
	Cqg/4WAxG3B7PGyWMkc7dsooAsTR2Hf4rMdkvDzS9nPETAENvz1IfALmiyBy8Maer1Jt3Akd3GH
	BepzPD33NpfsYMaxeMoJeoAuk6K/wqC1hbFxedQpi2GbCQ6YkSi9Cjf4WVArhcMouv0C9Spe6ip
	gkOqgVa647UiqwfL+xX48KLRG0fROmH72Njonrg==
X-Received: by 2002:a17:907:d643:b0:c46:ca2b:84bd with SMTP id
 a640c23a62f3a-c4ca7a858b5mr127976666b.30.1793347148092; Fri, 30 Oct 2026
 00:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20261030053009.1414220-1-vanusuri@mvista.com> <DMHZWXNNYTJF.14GBPLM5QIM8H@smile.fr>
In-Reply-To: <DMHZWXNNYTJF.14GBPLM5QIM8H@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 30 Oct 2026 13:28:54 +0530
X-Gm-Features: AclHuK8A9pYXQTsS7g4r3PQ71AQW5gJw-L5wRkRDpUSBhgQdRAuYOlnJW6k4QoY
Message-ID: <CANQUz1_0s4Kp1ygMhwsgGNwVZ4CvNPtp5NMgbzXo2hv_HhXiWQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch] python3: upgrade 3.12.15 -> 3.12.16
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b8b222065f0a2bda"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249004

--000000000000b8b222065f0a2bda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 1:01=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On Fri Oct 30, 2026 at 6:30 AM CET, Vijay Anusuri via openembedded-core
> wrote:
> > Release information:
> > * https://www.python.org/downloads/release/python-31216/
> > * The release you're looking at is Python 3.12.16, a security bugfix
> release for the legacy 3.12 series.
> >
> > Handles CVE-2026-115557, CVE-2026-77214, CVE-2026-102633, CVE-2024-3220=
,
> > CVE-2026-114583 CVE 2026-12345
> >
> > Changelog:
> https://docs.python.org/release/3.12.16/whatsnew/changelog.html#python-3-=
12-16
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../python/{python3_3.12.15.bb =3D> python3_3.12.16.bb}           | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/python/{python3_3.12.15.bb =3D>
> python3_3.12.16.bb} (99%)
>
> Hello Vijay,
>
> I already received this upgrade from Peter:
>
> https://patchwork.yoctoproject.org/project/oe-core/patch/20261025211302.1=
904712-1-peter.marko@siemens.com/


Oh i missed it. You can ignore my patch.

>
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000b8b222065f0a2bda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30,=
 2026 at 1:01=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@sm=
ile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Fri Oct 30, 2026 at 6:30 AM CET, Vijay Anus=
uri via openembedded-core wrote:<br>
&gt; Release information:<br>
&gt; * <a href=3D"https://www.python.org/downloads/release/python-31216/" r=
el=3D"noreferrer" target=3D"_blank">https://www.python.org/downloads/releas=
e/python-31216/</a><br>
&gt; * The release you&#39;re looking at is Python 3.12.16, a security bugf=
ix release for the legacy 3.12 series.<br>
&gt;<br>
&gt; Handles CVE-2026-115557, CVE-2026-77214, CVE-2026-102633, CVE-2024-322=
0,<br>
&gt; CVE-2026-114583 CVE 2026-12345<br>
&gt;<br>
&gt; Changelog: <a href=3D"https://docs.python.org/release/3.12.16/whatsnew=
/changelog.html#python-3-12-16" rel=3D"noreferrer" target=3D"_blank">https:=
//docs.python.org/release/3.12.16/whatsnew/changelog.html#python-3-12-16</a=
><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/{<a href=3D"http://python3_3.12.15.bb" rel=3D"norefer=
rer" target=3D"_blank">python3_3.12.15.bb</a> =3D&gt; <a href=3D"http://pyt=
hon3_3.12.16.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.12.16.bb</a=
>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python3_3=
.12.15.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.12.15.bb</a> =3D&=
gt; <a href=3D"http://python3_3.12.16.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3_3.12.16.bb</a>} (99%)<br>
<br>
Hello Vijay,<br>
<br>
I already received this upgrade from Peter:<br>
<a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/2026102=
5211302.1904712-1-peter.marko@siemens.com/" rel=3D"noreferrer" target=3D"_b=
lank">https://patchwork.yoctoproject.org/project/oe-core/patch/202610252113=
02.1904712-1-peter.marko@siemens.com/</a></blockquote><div><br></div><div>O=
h i missed it. You can ignore my patch.=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div></div>

--000000000000b8b222065f0a2bda--
