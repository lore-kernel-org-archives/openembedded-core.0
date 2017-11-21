Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 09BBD60851
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 03:04:05 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q13so5940521qtb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 19:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F5STR9gZmRvTUsGd64xUJhZvzeu6vDRYf9rRvjkT+Jc=;
	b=MbGhQDnxxNim8QgVYXzY8rAFqDs2f1NQ66AdzmmzPJKq7JLjUqtHSEI7PGA0wni076
	LIL2MtPbedkpnjSVF66TA2piRBtZXZpxbBN/e/feMQIoPj9/3DI5FWPEy3UmrrSs+cTU
	2pvxT77PTieO2xNprpHe9unFCk7PP8dkUwBFYlvVmBqlARMqNOSij68wMSYi+3LTjts6
	qNNPdLKOzDgIeVVtX6X7ZlD5AMQ89kqauehO/m5/RmxIAACxynN/IUdWBk4vk076rN1I
	aOKjl1NBH2zW+Iz9eFChIs2mo+NQUuIYRIKmXBERyj/8NBMglAzxI85MhPqEjlDHfcTP
	ABdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F5STR9gZmRvTUsGd64xUJhZvzeu6vDRYf9rRvjkT+Jc=;
	b=V989/6Ylt+KmfiaaWzLhsD0HHU2IDF02qiFDO2xRVwLIl19oszJ3My2lIVB88w8di/
	GwC0oDi7np3uaY/21Ler5zwiI4tqrvgfEVRY61qSfGuMC5u7GGphXZLArEzcSMXNCGby
	VIIXFRVl21HeA0KfYjE3F+QCuNGN4A0uDWFm8yE2HB9vc5vXKBsqh4Mp6T9ZXiMOFbKp
	c8t6+PTbXOkKION/4nLPJ7RJRR8BZqReIB6X8NezWX9vT6BLQr23AYBXDERIjqZKnwit
	87fLT4+CDd2g/MtH/Gt+SQW58N5MQDa4ZLuYwg+yb1g+sE0JW+A2goUG6WzEC+VSWIT/
	tsIA==
X-Gm-Message-State: AJaThX7FPvuh+gooC1IOzyfBVlg2pJAjGJGKaSpnwP6kuF2abBmH8h0l
	4syJFf+in1eSpO96GDEVnZJajRG5Bri5/spYvGd4GA==
X-Google-Smtp-Source: AGs4zMZxim8un9YrgiKZxkVYi2BcAR3fTurJEiUA6StvlBbtBMhnWhmpDvVr907m18t0bX43p8zsz0afnEWTVDJlHYU=
X-Received: by 10.237.33.130 with SMTP id l2mr24560464qtc.120.1511233446958;
	Mon, 20 Nov 2017 19:04:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Mon, 20 Nov 2017 19:04:06 -0800 (PST)
In-Reply-To: <cbb65333-4bc3-ec34-ffed-da65fc767030@windriver.com>
References: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0LaojmxziZDKu48jfM4K+TW6V9ra=FE8x_oJSz3ps+gG-g@mail.gmail.com>
	<cbb65333-4bc3-ec34-ffed-da65fc767030@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 20 Nov 2017 22:04:06 -0500
Message-ID: <CADkTA4O=gNCQLLJ5Yu5MM7T2kbEb1=RFjb=Va0vUoS1VW7CEYA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: fix formatting IDE storage does not trigger "change" uevents
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
X-List-Received-Date: Tue, 21 Nov 2017 03:04:06 -0000
Content-Type: multipart/alternative; boundary="001a113788f8c75b2a055e757447"

--001a113788f8c75b2a055e757447
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2017 at 8:18 PM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> On 2017=E5=B9=B411=E6=9C=8820=E6=97=A5 19:07, Burton, Ross wrote:
>
> On 17 November 2017 at 06:08, Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
>
>> +qemu by default emulates IDE and the linux-yocto kernel(s) use
>> +CONFIG_IDE instead of the more modern libsata, so disks appear as
>> +/dev/hd*. A similar patch rejected by upstream because CONFIG_IDE
>> +is deprecated.
>>
>
> Can we fix our kernel and/or qemu configuration too?
>
>
> Hi Bruce,
>
> Do you have any suggestion? How about disable CONFIG_IDE?
>

I've been telling people we can disable CONFIG_IDE for years now.

It just requires the kernel-cache change, and someone to boot all arches to
show that
it continues to work, as well as a quick search for references to hda to
make sure they
are all gone.

Not something that is on my TODO list at the moment, but I'd take patches
to the kernel
part (with that testing shown).

Bruce


>
> //Hongxu
>
> Ross
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


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113788f8c75b2a055e757447
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Nov 20, 2017 at 8:18 PM, Hongxu Jia <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <div class=3D"m_-548668992200033025moz-cite-prefix">On 2017=E5=B9=B411=
=E6=9C=8820=E6=97=A5 19:07, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">On 17 November 2017 at 06:08, Hongxu Jia <span dir=
=3D"ltr">&lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">=
hongxu.jia@windriver.com</a>&gt;</span>
        wrote:<br>
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">+qemu by
              default emulates IDE and the linux-yocto kernel(s) use<br>
              +CONFIG_IDE instead of the more modern libsata, so disks
              appear as<br>
              +/dev/hd*. A similar patch rejected by upstream because
              CONFIG_IDE<br>
              +is deprecated.<br>
            </blockquote>
            <div><br>
            </div>
            <div>Can we fix our kernel and/or qemu configuration too?</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></span>
    Hi Bruce,<br>
    <br>
    Do you have any suggestion? How about disable CONFIG_IDE?<br></div></bl=
ockquote><div><br></div><div>I&#39;ve been telling people we can disable CO=
NFIG_IDE for years now.</div><div><br></div><div>It just requires the kerne=
l-cache change, and someone to boot all arches to show that</div><div>it co=
ntinues to work, as well as a quick search for references to hda to make su=
re they</div><div>are all gone.</div><div><br></div><div>Not something that=
 is on my TODO list at the moment, but I&#39;d take patches to the kernel</=
div><div>part (with that testing shown).</div><div><br></div><div>Bruce</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div text=3D"#000000" bgc=
olor=3D"#FFFFFF">
    <br>
    //Hongxu<br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>Ross=C2=A0</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </div>

<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--001a113788f8c75b2a055e757447--
