Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.43859.1612221568610141875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 15:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RnXSNGHA;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id k193so18133971qke.6;
        Mon, 01 Feb 2021 15:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CjZfdsybiGLfZMSJWrCsYyk9MMgMIRMB/1NfD6txO1Q=;
        b=RnXSNGHANn0CmsmAecx6x1dmM8ilSMRnABEZ9MyEv2mZ9AAVnvLQkxVclQMC+Z2F40
         Xy/0XdmO9DfO3L4YvoyY3fP8fRMaIAaDlD+9LsCHvst9HttgJc3hX8PgEA9jiqYLREv4
         lkI6aBaZP3B+mXUVkZFZn70xZBpkzOIKzohSJKalhjmvA2ZTh33AFfJe1pnFFwqL1i4W
         TlPHrNd0bPjW7+0wc1OjaQZGk4QM9QKX5VtRRV/w+UexxmQtkbQz4nQEmPqc9lyMfcr0
         VH2iOfTu0paP5Y/85w0jmj0t7LpcJHjevnhwfUIi7nwYkQbvYEvbdmhmU/EvmResE6zI
         7moQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CjZfdsybiGLfZMSJWrCsYyk9MMgMIRMB/1NfD6txO1Q=;
        b=eKccmz9YbY/buH/A48SC9tsv4X/sgMaxXQN7G08t9I81IA+Xs1Pt+IAaWQGSPm/597
         bgCxvBgBvE+EtqXeWzyHUu/vBlmmgsOeeSmyVXBgRWib0AaCtHL85sNHYGkSSzIN5+Nm
         //pP7eLRIWTIzRc/TUJlv0EM1LwE1Mbv7Gz4QKT1NJGMvIs4a/aT8U0KqSSJCNBhl2mF
         5Uo06fW1e8pu/lx8mxXZW7SpNt+0tNdzaQDiCnVM+U7lEK/6WuRjb76vgLM1lB2w3rIq
         iCXmHlY5NNLNI4ZnChC2jnsnb/+PnwEMrgoRxAuiGtWFrUow2Ib81L5OHwZ7LSqW0DVD
         Hnvg==
X-Gm-Message-State: AOAM532F5RbFe0vTGoNgW/TCFEv/+cNkcRRzJNUpt7I6PhKZwnSvDAFi
	AmhxosbkzqyaW7gVXpyPcJIRLf8T0zfeG5GBjqk=
X-Google-Smtp-Source: ABdhPJz2W9qq9itZYEQMP9bQoSVZAN3lunlHftc54pX16rbDSSxgeRnYcLc5JfOkUTQHd4UB4SJ1Zirofs1c+zlBCuc=
X-Received: by 2002:a37:9b8b:: with SMTP id d133mr17268655qke.71.1612221567791;
 Mon, 01 Feb 2021 15:19:27 -0800 (PST)
MIME-Version: 1.0
References: <CANx9H-DFtcdnZwDqHEPg4t5ySyJe++KS8hO9QDFX5r31KLz3Ww@mail.gmail.com>
 <16406E32EA0586FD.712@lists.yoctoproject.org> <CA+chaQeJnDzgusQvqEWkkNwkoDxR1fMhrb0kM3932D71yWTMRw@mail.gmail.com>
In-Reply-To: <CA+chaQeJnDzgusQvqEWkkNwkoDxR1fMhrb0kM3932D71yWTMRw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 1 Feb 2021 15:19:16 -0800
Message-ID: <CAMKF1srgg5CsZtDZXRJwwmQM80=vD1+=CFA5ABdt8T+omMLXuA@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Let me tell you how I really feel. Zero filter. If you need meta-python2, you need to become a maintainer. Immediately. Period.
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Anibal Limon <anibal.limon@linaro.org>, Tim Orling <ticotimo@gmail.com>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d8f65805ba4e9541"

--000000000000d8f65805ba4e9541
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 1, 2021 at 6:40 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:

> On Thu, Oct 22, 2020 at 11:37 PM Martin Jansa via lists.yoctoproject.org
> <Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:
>
>> There were only a few changes needed between dunfell and gatesgarth to
>> keep it building and I feel guilty for sending half of them - and pinging
>> you on FB :).
>>
>> I don't have interest in python2, but it's still used by quite a few
>> components included in other layers are care about (e.g. qtwebengine in
>> meta-qt5, chromium in meta-browser -
>> https://bugs.chromium.org/p/chromium/issues/detail?id=942720 is still
>> quite far from finished) and at LGE we maintain meta-ros
>> https://github.com/ros/meta-ros which contains support for ROS 1 Melodic
>> which is usually used with python2 and support ends May 2023 (together with
>> Ubuntu Bionic it's usually used with: http://wiki.ros.org/Distributions
>> - just today I've separated meta-ros-python2 layer with python2 recipes
>> which disappeared from oe-core in warrior and were never re-introduced in
>> meta-python2 (like nose and numpy).
>>
>> If you're looking for someone just keeping it buildable, then you can
>> sign me up. If it gets more annoying to maintain in future we can also
>> split it for pythonnative.bbclass and python recipe itself - to keep just
>> the bare minimum of recipes which are actively being used without all the
>> other junk.
>>
>> Cheers,
>>
>
> Hi,
>
> can I get the write access to meta-python2 as mentioned above?
>

+1


> I have 2 fixes to make it parse able with latest oe-core:
> https://lists.openembedded.org/g/openembedded-devel/message/89201
> https://lists.openembedded.org/g/openembedded-devel/message/89200
>
> to fix issues discussed in:
>
> https://github.com/openembedded/openembedded-core/commit/fd6a007efa7cb45101a66f294af81d9d33bb3fab#commitcomment-46565284
> https://lists.openembedded.org/g/openembedded-core/message/147477
> https://lists.openembedded.org/g/openembedded-core/message/147514
>
> Cheers,
>
> 
>
>

--000000000000d8f65805ba4e9541
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Feb 1, 2021 at 6:40 AM Martin Jansa &lt;<a href=3D=
"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Thu=
, Oct 22, 2020 at 11:37 PM Martin Jansa via <a href=3D"http://lists.yoctopr=
oject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;Martin.Jansa=3D=
<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank">gmail=
.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Ther=
e were only a few changes needed between dunfell and gatesgarth to keep it =
building and I feel guilty for sending half of them - and pinging you on FB=
 :).<div><br></div><div>I don&#39;t have interest in python2, but it&#39;s =
still used by quite a few components included in other layers are care abou=
t (e.g. qtwebengine in meta-qt5, chromium in meta-browser -=C2=A0<a href=3D=
"https://bugs.chromium.org/p/chromium/issues/detail?id=3D942720" target=3D"=
_blank">https://bugs.chromium.org/p/chromium/issues/detail?id=3D942720</a> =
is still quite far from finished) and at LGE we maintain meta-ros=C2=A0<a h=
ref=3D"https://github.com/ros/meta-ros" target=3D"_blank">https://github.co=
m/ros/meta-ros</a> which contains support for ROS 1 Melodic which is usuall=
y used with python2 and support ends May 2023 (together with Ubuntu Bionic =
it&#39;s usually used with: <a href=3D"http://wiki.ros.org/Distributions" t=
arget=3D"_blank">http://wiki.ros.org/Distributions</a> - just today I&#39;v=
e separated meta-ros-python2 layer with python2 recipes which disappeared f=
rom oe-core in warrior and were never re-introduced in meta-python2 (like n=
ose and numpy).</div><div><br></div><div>If you&#39;re looking for someone =
just keeping it buildable, then you can sign me up. If it gets more annoyin=
g to maintain in future we can also split it for pythonnative.bbclass and p=
ython recipe itself - to keep just the bare minimum of recipes which are ac=
tively being used without all the other junk.</div><div><br></div><div>Chee=
rs,</div></div></blockquote><div><br></div><div>Hi,</div><div><br></div><di=
v>can I get the write access to meta-python2 as mentioned above?</div></div=
></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">+1=C2=A0<=
/div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D=
"ltr"><div class=3D"gmail_quote"><div dir=3D"auto"></div><div><br></div><di=
v>I have 2 fixes to make it parse able with latest oe-core:</div><div><a hr=
ef=3D"https://lists.openembedded.org/g/openembedded-devel/message/89201" ta=
rget=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message=
/89201</a><br></div><div><a href=3D"https://lists.openembedded.org/g/openem=
bedded-devel/message/89200" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-devel/message/89200</a><br></div><div><br></div><div>to fi=
x issues discussed in:</div><div><a href=3D"https://github.com/openembedded=
/openembedded-core/commit/fd6a007efa7cb45101a66f294af81d9d33bb3fab#commitco=
mment-46565284" target=3D"_blank">https://github.com/openembedded/openembed=
ded-core/commit/fd6a007efa7cb45101a66f294af81d9d33bb3fab#commitcomment-4656=
5284</a><br></div><div><a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/message/147477" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/message/147477</a><br></div><div><a href=3D"https://lis=
ts.openembedded.org/g/openembedded-core/message/147514" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/147514</a><br></d=
iv><div><br></div><div>Cheers,</div></div></div>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000d8f65805ba4e9541--
