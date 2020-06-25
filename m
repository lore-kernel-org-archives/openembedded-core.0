Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.5232.1593068669994582160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 00:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=CBwi87Gs;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.221.54, mailfrom: rahulk@mvista.com)
Received: by mail-wr1-f54.google.com with SMTP id q5so4643044wru.6
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 00:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3+h5l8+peTONCpXHbP6g8RqCMduiNn+oUC65nma0tVU=;
        b=CBwi87Gs6zy4RWtHnwPay3DavHV56/2pLUvu6JB4YtL3x9J0FOY/A61XEkAdHq3Pn+
         +VNDA7NZHiHdYbIqaKZ6C2MFi7I93As0I2GHyNJYs03+ZdyeF41Kf04o7NotZUdAZKzm
         x5hfc3WFXXrRaPwS1qFLmS7Uxp5j81LmYgsNsyfawNoO9HlY/UGaLwKyddvNh+dMil/r
         grUBjJeFCnX4Cigj/NgiHjpMQZOxa09ZJtPYpvQfoJm9mV5LRS6ayP6in8SZDkQemonK
         N6/iqaB8i5WaIW4GP1SHUcNl0qKeqeu8gqurMKbX5WGFelL9kI/t3+K4jXvYaHXr+6AW
         MMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3+h5l8+peTONCpXHbP6g8RqCMduiNn+oUC65nma0tVU=;
        b=ru8eP0mSYlmKxh59ciyUB2hO8pOjNF+22IO4/ZDDvcPOy1AFUosDay2ksIQMeoBLUF
         bxYAEcBvoJ4KsJhYc+HcJwSj4AWivKlI/TIHn8SZKQBw/VfoZy+eNwE2MBTNZIxca4YE
         Ys6/mdHf+IB3yZCQt20WYbQ/neb1+WWw/msQ5DR15Q5LwiSaqW3c98DGCF6tdPB0QtaJ
         Uzz/bBUjRnIXNgFyHMDjCYQxQ+fyopddTF+OPXCB7iDLGqkyoGUL/YQ9YuJgfd5R/raQ
         rA3hxiatFUesdt8+3YZ0ZUhWUZRjFQn7haR3EB8Urj0uGWmfRBwJezNTH9DGscZDqCvv
         y/4A==
X-Gm-Message-State: AOAM5333FCXFZK7WtHgvIZlXr8FX4QXqIn+VMrhGSYxx3dHDWpkJniDb
	ZKysOWw5Yra/nUucRIJAB0O0jx/RtCv3efuNE552jQ==
X-Google-Smtp-Source: ABdhPJxR/QmDNsLPiVO3SQJ3ALAtM0qOlXgkSrnJNdqMhuwzdEZCdHkvbO13K9VPKfv7MkoQmVlptbqgpG2UdA8V0lk=
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr20713795wrx.352.1593068668434;
 Thu, 25 Jun 2020 00:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <HwH9.1592848739113991729.4KYH@lists.openembedded.org> <CAMKF1srh_irBczqSkJo8jcqFc6aLWJZp1zEChz=0F8djZ=ecYA@mail.gmail.com>
In-Reply-To: <CAMKF1srh_irBczqSkJo8jcqFc6aLWJZp1zEChz=0F8djZ=ecYA@mail.gmail.com>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Thu, 25 Jun 2020 12:34:17 +0530
Message-ID: <CANv91vM2A94cH8HQ0275gfzCB1OtARxt0hTVrBNB5a1ZuYXNzA@mail.gmail.com>
Subject: Re: [OE-core] package bzip2-ptest requires /usr/bin/sh, but no providers found in RDEPENDS_bzip2-ptest
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000015d34a05a8e3341b"

--00000000000015d34a05a8e3341b
Content-Type: text/plain; charset="UTF-8"

Hi khem Raj,

Create a patch to update.sample where it asks for /bin/sh instead

I don't think we can create a patch to update.sample file because this is
git hidden file.

.git/hooks/update.sample

In my Patch fetching bzip2-tests.git repository as mentioned below Is there
any issue with below line.
SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests \

At my local system i am not able to face this issue but when this patch
built with open source auto-builder then reporting below error
do_package_qa: QA Issue:
/usr/lib/bzip2/ptest/bzip2-tests/.git/hooks/update.sample contained in
package bzip2-ptest requires /usr/bin/sh, but no providers found in
RDEPENDS_bzip2-ptest? [file-rdeps]
step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal errors.
Please consider fixing them.

I have stuck here. I am not aware why do_package_qa is reporting errors
with git hidden files.

*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Mon, Jun 22, 2020 at 11:42 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Mon, Jun 22, 2020 at 10:59 AM Rahul Kumar <rahulk@mvista.com> wrote:
>
>> Hi community members,
>>
>> I am working on Yocto Newcommer Bug 13444 - Add test suite for bzip2
>> Patch link
>> https://patchwork.openembedded.org/patch/173009/
>>
>> but upstream build, reported below error .
>> step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue:
>> /usr/lib/bzip2/ptest/bzip2-tests/.git/hooks/update.sample contained in
>> package bzip2-ptest requires /usr/bin/sh, but no providers found in
>> RDEPENDS_bzip2-ptest? [file-rdeps]
>>
>
> Create a patch to update.sample where it asks for /bin/sh instead
>
>
> step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal errors.
>> Please consider fixing them.
>>
>> I am already using below line to my patch.
>> RDEPENDS_${PN}-ptest += "make bash perl"
>>
>> can anyone please help me on this.
>>
>>
>> 
>>
>

--00000000000015d34a05a8e3341b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi khem Raj,<br><br>Create a patch to update.samp=
le where it asks for /bin/sh instead <br><br>I don&#39;t think we can creat=
e a patch to update.sample file because this is git hidden file.<br><br>.gi=
t/hooks/update.sample<br><br>In my Patch fetching bzip2-tests.git repositor=
y as mentioned below Is there any issue with below line.<br>SRC_URI =3D &qu=
ot;<a href=3D"https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz">https:=
//sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz</a> \<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://sourceware.org/git/bzip2-t=
ests.git;name=3Dbzip2-tests">sourceware.org/git/bzip2-tests.git;name=3Dbzip=
2-tests</a> \<br><br>At my local system i am not able to face this issue bu=
t when this patch built with open source auto-builder then reporting below =
error<br>do_package_qa: QA Issue: /usr/lib/bzip2/ptest/bzip2-tests/.git/hoo=
ks/update.sample contained in package bzip2-ptest requires /usr/bin/sh, but=
 no providers found in RDEPENDS_bzip2-ptest? [file-rdeps]<br>step1b: ERROR:=
 bzip2-1.0.8-r0 do_package_qa: QA run found fatal errors. Please consider f=
ixing them. <br><br>I have stuck here. I am not aware why do_package_qa is =
reporting errors with git hidden files.<br clear=3D"all"></div><div class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#0b5394">=
<br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<span style=3D"color:rgb(111,168,220)">	=09
  =09
  
   <b><span style=3D"color:rgb(11,83,148)">Thanks &amp; Regards,</span></b=
></span></div><div><span style=3D"color:rgb(111,168,220)"><span style=3D"co=
lor:rgb(11,83,148)"></span></span><span style=3D"color:rgb(111,168,220)"><s=
pan style=3D"color:rgb(11,83,148)"></span></span></div><div><span style=3D"=
color:rgb(111,168,220)"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</s=
pan></span></div><div><span style=3D"color:rgb(11,83,148)">Software Enginee=
r,Linux Solutions Engineering</span></div><div><span style=3D"color:rgb(11,=
83,148)"> Group,Montavista Software LLC</span></div><div><span style=3D"col=
or:rgb(11,83,148)">Email Id: <span style=3D"font-size:10pt"><a href=3D"mail=
to:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span></span>=
<span><a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noopener"=
 target=3D"_blank"><span style=3D"font-family:Verdana,sans-serif;font-size:=
10pt;color:rgb(42,42,42)"><br></span></a></span></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div><br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 22=
, 2020 at 11:42 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.k=
hem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Jun 22, 2020 at 10:59 AM Rahul Kumar &lt=
;<a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv>
<div>Hi community members,</div>
<div><br>I am working on Yocto Newcommer Bug 13444 - Add test suite for bz=
ip2</div>
<div>Patch link</div>
<div><a href=3D"https://patchwork.openembedded.org/patch/173009/" target=
=3D"_blank">https://patchwork.openembedded.org/patch/173009/</a></div>
<div>=C2=A0</div>
<div>but upstream build, reported below error .</div>
<div>step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue: /usr/lib/bzip2=
/ptest/bzip2-tests/.git/hooks/update.sample contained in package bzip2-ptes=
t requires /usr/bin/sh, but no providers found in RDEPENDS_bzip2-ptest? [fi=
le-rdeps]</div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Create a patch to update.sample where it asks for /bin/sh instead=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div><div></div>
<div>step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal error=
s. Please consider fixing them.</div>
<div>=C2=A0</div>
<div>I am already using below line to my patch.=C2=A0</div>
<div>RDEPENDS_${PN}-ptest +=3D &quot;make bash perl&quot;</div>
<div>=C2=A0</div>
<div>can anyone please help me on this.</div>
</div>
<div>
<div>=C2=A0</div>
<div>=C2=A0</div>
</div>
<br>
</blockquote></div></div>
</blockquote></div>

--00000000000015d34a05a8e3341b--
