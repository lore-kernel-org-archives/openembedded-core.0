Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id A73E878950
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 13:51:00 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id j7so1872605ita.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 05:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b+ke5vl7vvCVdGIsLWKzjotlAV+Pe+7vPtmLSOht1Gg=;
	b=pRHl/Yh+reCdzK+VpetL+T/zDdjaNTMf+/IOwWr6nNMHyt3v8WHoU6+M/3kuMiPxaQ
	AyMO/zGMQCa0bafgPtX8LfXIdwxGS4g/Eb2L1ecaUyzWlkBqRThG9Am+Qy/5+ltR/edq
	4b5iN4MNM8GK4zall8JF/ekcx1llF2gDVOjSYuR1oiD2Jv2Baq8i1AG44ZLyj3iFzU9B
	agPSTlVOGdl3ZNQMY50euUsq7BHuMYjzjJ8iy08Ah/heF1xWugCgAJ6xLiCo+DKlYNG6
	2uSog7kmnVhblJIEbBKUtRSOqxKpFrT8891S5HhIurghLA9jV/VbRwbcED6mYpKQvFKf
	1ByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b+ke5vl7vvCVdGIsLWKzjotlAV+Pe+7vPtmLSOht1Gg=;
	b=QBGCvy3OXtm3Ls3gy0UBw0E9+FVnze23UnhjmzwfIbzIYXN27yIZjPY+JlL+L6CDpj
	aa6hCMkQzUY++TNP4lU0xAC1jx5aSa4QQZQz08IQ77PtjA+Ntuh9njZXQ9MrTJ/0KNBw
	zi84ffSsLJF+Fc9+dc3MAzteNmhhkA09w1rm89AUrF74UOQVeYEaATWdFASyXmtSzBnx
	OsEsCJeM/FdwKVuR88rs/QcZE7HZKjfbInp5Yow0y8ngms0zF+3zha80aII5ApSvxWiq
	5/hfgwGVc29cDk8OSr/Be6G265oNG8W03JIJI8Y5xo4qLEBOR/7QcRGr5NCpjM2kdlY2
	egvQ==
X-Gm-Message-State: AElRT7EcOIXhdZIYHZR3V/fSFoq1YiTxQhlA7mlBmZGj0FIgcB6aKxjv
	PAEF9J+rzFaec91yqZlRorgYyK+g02FtBwYYoFo=
X-Google-Smtp-Source: AG47ELtBdS3eFUjTmvrsO3tTsxGVAxZauyrz5JIiW87baRkIxVhs8CNWRb9g+0thJqfgQ8OyvxDC7BDkHEkxbjEpZMU=
X-Received: by 10.36.101.194 with SMTP id u185mr2426082itb.124.1519998661597; 
	Fri, 02 Mar 2018 05:51:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.96.23 with HTTP; Fri, 2 Mar 2018 05:50:41 -0800 (PST)
In-Reply-To: <2f950370-c577-e27d-c162-3c529b041956@windriver.com>
References: <415639a4-b01a-514e-5eb8-2242cbec1bf9@windriver.com>
	<2f950370-c577-e27d-c162-3c529b041956@windriver.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 2 Mar 2018 14:50:41 +0100
Message-ID: <CAB2nKc-vypc73tsN4zBPC2VeXAJsu42m0qpyyCunQtrYPhjtgQ@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Cc: Yocto-mailing-list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IFF1ZXN0aW9ucyBhYm91dCB1ZGV2IHJ1bGUgYW5kIHN5c3RlbWQtdWRldu+8jHJlbGV2YW50IHRvIG1vdW50aW5nIGJsb2NrIGRldmljZQ==?=
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
X-List-Received-Date: Fri, 02 Mar 2018 13:51:00 -0000
Content-Type: multipart/alternative; boundary="001a1143da8e48a25705666e4460"

--001a1143da8e48a25705666e4460
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm not sure what is your use case, but you can check usbmount[1][2]
or automount-usb[3] for example on how to use udev with systemd:

Regards,
Vincent

[1]https://github.com/rbrito/usbmount
[2]
https://github.com/nefethael/meta-random/blob/master/recipes-support/usbmou=
nt/usbmount_git.bb
[3]https://github.com/six-k/automount-usb


2018-03-02 6:44 GMT+01:00 Hongzhi, Song <hongzhi.song@windriver.com>:

> Hi all,
>
> Does anyone have suggestion for me?
>
> Thanks.
>
> Hongzhi.Song
>
> On 2018=E5=B9=B403=E6=9C=8801=E6=97=A5 18:35, Hongzhi, Song wrote:
>
> Defect:
>
>     The exiting method of automount of udev in *oe-core/meta/ *is using
>
> *automount.rules* which call *mount.sh* that using */bin/mount* to mount
> device.
>
> But systemd-udevd detaches *mount()* operations done within the service
>
> from the rest of the system with MountFlag=3Dslave=EF=BC=8C this means ho=
st can
>
> not access device. (e.g. Executing *mkfs.ext4 /dev/sda1/* prompts
>
> */dev/sda1 is apparently in use by the system; will not make a filesystem
> here!*)
>
>
> Solution:
>
>     Systemd upstream suggest that the best way is to use "systemd-mount"
>
> in udev rules, which will request the mount operation to be executed by
> PID 1.
>
> And I have tested it was effective.
>
>
> Uncertain=EF=BC=9A
>
>     The exiting method is designed for *SysV-init *which is not
> compatible to
>
> systemd-udev, at least that's what I think. So I think that we should
> design
>
> a new rule or organizational structure to be suitable for systemd-udev an=
d
>
> to mount deferent device. Dose anyone help do this? Or I can make some
>
> improvements on the basis of the existing with "systemd-mount".
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a1143da8e48a25705666e4460
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div><br>I&#39;m not sure what is your use case, =
but you can check usbmount[1][2] or=C2=A0automount-usb[3] for example on ho=
w to use udev with systemd:</div><div><br>Regards,<br>Vincent<br><br>[1]<a =
href=3D"https://github.com/rbrito/usbmount">https://github.com/rbrito/usbmo=
unt</a><br>

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">[2]<a href=3D"https://github.com/nefethael/meta-r=
andom/blob/master/recipes-support/usbmount/usbmount_git.bb">https://github.=
com/nefethael/meta-random/blob/master/recipes-support/usbmount/usbmount_git=
.bb</a></span>

<br>[3]<a href=3D"https://github.com/six-k/">https://github.com/six-k/</a><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:sm=
all;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">automount-usb</span>

<br><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">2018-03-02 6:44 GMT+01:00 Hongzhi, Song <span dir=3D"ltr">&lt;<a href=3D=
"mailto:hongzhi.song@windriver.com" target=3D"_blank">hongzhi.song@windrive=
r.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Hi all,</p>
    <p>Does anyone have suggestion for me?</p>
    <p>Thanks.</p><span class=3D"HOEnZb"><font color=3D"#888888">
    <p>Hongzhi.Song<br>
    </p></font></span><div><div class=3D"h5">
    <br>
    <div class=3D"m_3529184748491425439moz-cite-prefix">On 2018=E5=B9=B403=
=E6=9C=8801=E6=97=A5 18:35, Hongzhi, Song
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <p>Defect:</p>
      <p>=C2=A0=C2=A0=C2=A0 The exiting method of automount of udev in <fon=
t face=3D"Times New Roman, Times, serif"><i>oe-core/meta/ </i></font>is
        using <br>
      </p>
      <p><font face=3D"Times New Roman, Times, serif"><i>automount.rules</i=
></font>
        which call <font face=3D"Times New Roman, Times, serif"><i>mount.sh=
</i></font>
        that using <i><font face=3D"Times New Roman, Times, serif">/bin/mou=
nt</font></i>
        to mount device. <br>
      </p>
      <p>But systemd-udevd detaches <font face=3D"Times New Roman, Times,
          serif"><i>mount()</i></font> operations done within the
        service <br>
      </p>
      <p>from the rest of the system with MountFlag=3Dslave=EF=BC=8C this m=
eans
        host can <br>
      </p>
      <p>not access device. (e.g. Executing <font face=3D"Times New
          Roman, Times, serif"><i>mkfs.ext4 /dev/sda1/</i></font>
        prompts <br>
      </p>
      <p><i><font face=3D"Times New Roman, Times, serif">/dev/sda1 is
            apparently in use by the system; will not make a filesystem
            here!</font></i>)<br>
      </p>
      <p><br>
      </p>
      <p>Solution:</p>
      <p>=C2=A0=C2=A0=C2=A0 Systemd upstream suggest that the best way is t=
o use
        &quot;systemd-mount&quot; <br>
      </p>
      <p>in udev rules, which will request the mount operation to be
        executed by PID 1.<br>
      </p>
      <p>And I have tested it was effective.</p>
      <p><br>
      </p>
      <p>Uncertain=EF=BC=9A</p>
      <p>=C2=A0=C2=A0=C2=A0 The exiting method is designed for <font face=
=3D"Times New
          Roman, Times, serif"><i>SysV-init </i></font>which is not
        compatible to <br>
      </p>
      <p>systemd-udev, at least that&#39;s what I think. So I think that we
        should design</p>
      <p>a new rule or organizational structure to be suitable for
        systemd-udev and <br>
      </p>
      <p>to mount deferent device. Dose anyone help do this? Or I can
        make some <br>
      </p>
      <p>improvements on the basis of the existing with &quot;systemd-mount=
&quot;.<br>
      </p>
      <br>
      <fieldset class=3D"m_3529184748491425439mimeAttachmentHeader"></field=
set>
      <br>
    </blockquote>
    <br>
  </div></div></div>

<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a1143da8e48a25705666e4460--
