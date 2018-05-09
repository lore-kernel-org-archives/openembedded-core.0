Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 82C43748BF;
	Wed,  9 May 2018 09:38:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y189-v6so8274328wmc.3;
	Wed, 09 May 2018 02:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JLvnABTqo5D0zKpmwgh7JYvBbZrGxKXL0eftTifD6bU=;
	b=GVFglNJdz+0+lTsgnoLeIswahhSv7ZDNG8MBgVUskGIdIf+Av5V3uLL34OzwWIZtCZ
	FYJanb+7G9n91Qg/H2nRkEygbkA6sMfLv0Tg7sYogbsxeMrDHf73C+tcMDCRBGn8Fry0
	rS7xWof3L4bTNEhSZ1lbYf3IBHKiMwodybOkfzTphGZUM0/MqGeN0dIepp9oM+kNQi59
	voR3eUfjFISBB2fe5+3+v9Teqjyi6bRDUoTQ77ydw34DNslCFBvAPdjJmybzAJ4ppxVl
	eVKg83HNQalucjPJaXujwtSrdXo5113l8z/3pyLj74V397LpWAgh25OyXERGWqzz6dpn
	l5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JLvnABTqo5D0zKpmwgh7JYvBbZrGxKXL0eftTifD6bU=;
	b=fDtLDSg3NVyhlor91lbWgdicmaoUusU0vaxSj/OwtxIq91Ak19XNeLctcrK5wO/BRI
	fv+ft6SOkw2D0QDdWlqe2sTtUXNwCD0Oml3TxckIr37kP3EYuHrk0zRI1Wxqv0F6QC8h
	PA2M2qHaQEapZ8xF6XftHAlLnzbA6mkc/d7CZmOOP2E1WmmrwQFhfXKkerWytJPQ6627
	kyTMC0Q5WbyxGCDccePdyNivJWVa80QQlNwLOeLBmT37ikGfPU6qNk9gKb3QTqxuRali
	ZU89UxbeWRquGW6IZuTw1l6aOAKjpI2LcWE+R8JCxKemz6rJHlqRSvp3Rs3nB+AVu2bm
	4iTQ==
X-Gm-Message-State: ALQs6tDQ2u/T+G5vTbOKRJnziW8YqvM7s64ffi9M5tAfu+P29NaXTLJ7
	todwrXsap/ioarwFDdzkzbketYpDJWc3sfMbPL8=
X-Google-Smtp-Source: AB8JxZquMwFgVrK9zuuQNoxWzwzif2Vn3caY0rNFxDlQCBbIaCaRLOpP9Cq8ZJlhU/lso9rD/X+CLnR/GJImkpFiPdA=
X-Received: by 2002:a1c:bfce:: with SMTP id
	o75-v6mr4896556wmi.122.1525858739701; 
	Wed, 09 May 2018 02:38:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Wed, 9 May 2018 02:38:59 -0700 (PDT)
In-Reply-To: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 May 2018 11:38:59 +0200
Message-ID: <CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Wed, 09 May 2018 09:39:00 -0000
Content-Type: multipart/alternative; boundary="000000000000284bfe056bc2acb1"

--000000000000284bfe056bc2acb1
Content-Type: text/plain; charset="UTF-8"

My initial tests show couple issues, but usually caused by other changes in
that branch, not the gcc-8 itself.

1) strace-4.22 from
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gcc-8&id=af33a8b721cc9caebd3f5226b4c5903f666ab654
fails to build with ptest enabled (it builds with 4.20 version if I revert
this change)
../../strace-4.22/tests/inject-nf.c: In function 'main':
../../strace-4.22/tests/inject-nf.c:86:1: error: r7 cannot be used in asm
here
 }
 ^
Makefile:6313: recipe for target 'inject-nf.o' failed
make: *** [inject-nf.o] Error 1
make: Leaving directory 'strace/4.22-r0/build/tests'

2) glibc with obsolete rpc disabled from:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gcc-8&id=0cd820424d4bdb5cc68e7503e09a0359fd21150a
causes busybox's mount applet to fail building:
util-linux/mount.c:252:11: fatal error: rpc/rpc.h: No such file or directory
 # include <rpc/rpc.h>
           ^~~~~~~~~~~
compilation terminated.
make[1]: *** [util-linux/mount.o] Error 1
make: *** [util-linux] Error 2

3) grub and grub-efi fails to build with gcc8:
In file included from ../grub-2.02/grub-core/partmap/gpt.c:26:
../grub-2.02/include/grub/gpt_partition.h:79:1: error: alignment 1 of
'struct grub_gpt_partentry' is less than 8 [-Werror=packed-not-aligned]
 } GRUB_PACKED;
 ^
In file included from ../grub-2.02/grub-core/disk/ldm.c:26:
../grub-2.02/include/grub/gpt_partition.h:79:1: error: alignment 1 of
'struct grub_gpt_partentry' is less than 8 [-Werror=packed-not-aligned]
 } GRUB_PACKED;
 ^
..
../grub-2.02/grub-core/fs/btrfs.c:186:1: error: alignment 1 of 'struct
grub_btrfs_inode' is less than 4 [-Werror=packed-not-aligned]
 } GRUB_PACKED;
 ^

4) iotivity fails to build with gcc8:
service/resource-encapsulation/src/common/primitiveResource/unittests/PrimitiveResourceTest.cpp:
In lambda function:
service/resource-encapsulation/src/common/primitiveResource/unittests/PrimitiveResourceTest.cpp:164:30:
error: 'value' is not captured
                 ocRep[KEY] = value;
                              ^~~~~

5) nativesdk-libxcrypt fails to build (not sure which change caused this,
it build OK with sumo since the -std=gnu99 addition.
../git/crypt-sunmd5.c:189:13: error: 'snprintf' output may be truncated
before the last format character [-Werror=format-truncation=]
             "$" CRYPT_ALGNAME "," ROUNDS "%u$%s$",
             ^~~

6) couple internal components which usually fail to build with gcc8,
because of more strict warnings + Werror.

I didn't get very far in testing, because our old kernel fails to build
with gcc8 and there are some other issues caused by other master changes.
But it doesn't look too bad (in my small test, lets see what bitbake world
will show), thanks a lot for new gcc.

Cheers,





On Sat, May 5, 2018 at 2:26 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Hi All
>
> As you might have noticed that gcc 8.1 was released this week, I am
> calling out for some testing help on testing branch so we can weed out
> issues you might see in your setups. so if you have your
> builders idling over weekend, then you know what they can do this weekend
> :)
>
> Highlighted changes are
>
> https://gcc.gnu.org/gcc-8/changes.html
>
> and porting doc is
>
> https://gcc.gnu.org/gcc-8/porting_to.html
>
> The branch is here
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8
>
> Its uptodate on top of current master oe-core
>
> May fourth be with you !!
>
> Cheers!
>
> -Khem
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000284bfe056bc2acb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My initial tests show couple issues, but usually caused by=
 other changes in that branch, not the gcc-8 itself.<div><br></div><div>1) =
strace-4.22 from=C2=A0<a href=3D"http://git.openembedded.org/openembedded-c=
ore-contrib/commit/?h=3Dkraj/gcc-8&amp;id=3Daf33a8b721cc9caebd3f5226b4c5903=
f666ab654">http://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dkraj/gcc-8&amp;id=3Daf33a8b721cc9caebd3f5226b4c5903f666ab654</a></div><d=
iv>fails to build with ptest enabled (it builds with 4.20 version if I reve=
rt this change)</div><div><div>../../strace-4.22/tests/inject-nf.c: In func=
tion &#39;main&#39;:</div><div>../../strace-4.22/tests/inject-nf.c:86:1: er=
ror: r7 cannot be used in asm here</div><div>=C2=A0}</div><div>=C2=A0^</div=
><div>Makefile:6313: recipe for target &#39;inject-nf.o&#39; failed</div><d=
iv>make: *** [inject-nf.o] Error 1</div><div>make: Leaving directory &#39;s=
trace/4.22-r0/build/tests&#39;</div></div><div><br></div><div>2) glibc with=
 obsolete rpc disabled from:=C2=A0<a href=3D"http://git.openembedded.org/op=
enembedded-core-contrib/commit/?h=3Dkraj/gcc-8&amp;id=3D0cd820424d4bdb5cc68=
e7503e09a0359fd21150a">http://git.openembedded.org/openembedded-core-contri=
b/commit/?h=3Dkraj/gcc-8&amp;id=3D0cd820424d4bdb5cc68e7503e09a0359fd21150a<=
/a></div><div>causes=C2=A0<span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial;float:none;display:inline">busybox&#39;s mount app=
let to fail building:</span></div><div><span style=3D"text-align:start;text=
-indent:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial;float:none;display:inline"><div>util-linux/m=
ount.c:252:11: fatal error: rpc/rpc.h: No such file or directory</div><div>=
=C2=A0# include &lt;rpc/rpc.h&gt;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~</div><div>compilation terminated.</div><div>make[1]: =
*** [util-linux/mount.o] Error 1</div><div>make: *** [util-linux] Error 2</=
div></span></div><div><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline"><br></span></div><div><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">3) grub and grub-efi fails to build with gcc8:</span><=
/div><div><span style=3D"text-align:start;text-indent:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline"><div>In file included from ../grub-2.02/grub-c=
ore/partmap/gpt.c:26:</div><div>../grub-2.02/include/grub/gpt_partition.h:7=
9:1: error: alignment 1 of &#39;struct grub_gpt_partentry&#39; is less than=
 8 [-Werror=3Dpacked-not-aligned]</div><div>=C2=A0} GRUB_PACKED;</div><div>=
=C2=A0^</div><div>In file included from ../grub-2.02/grub-core/disk/ldm.c:2=
6:</div><div>../grub-2.02/include/grub/gpt_partition.h:79:1: error: alignme=
nt 1 of &#39;struct grub_gpt_partentry&#39; is less than 8 [-Werror=3Dpacke=
d-not-aligned]</div><div>=C2=A0} GRUB_PACKED;</div><div>=C2=A0^</div><div>.=
.</div><div><div>../grub-2.02/grub-core/fs/btrfs.c:186:1: error: alignment =
1 of &#39;struct grub_btrfs_inode&#39; is less than 4 [-Werror=3Dpacked-not=
-aligned]</div><div>=C2=A0} GRUB_PACKED;</div><div>=C2=A0^</div></div></spa=
n></div><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:small;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline"><br></span></div><div><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">4) iotivity fails to build with gcc8:</span></div><div><span st=
yle=3D"text-align:start;text-indent:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline"><div>service/resource-encapsulation/src/common/primitiveResource=
/unittests/PrimitiveResourceTest.cpp: In lambda function:</div><div>service=
/resource-encapsulation/src/common/primitiveResource/unittests/PrimitiveRes=
ourceTest.cpp:164:30: error: &#39;value&#39; is not captured</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ocRep[KEY] =3D v=
alue;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~</div></span></div><div>=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline"><br></span></div><div><span style=3D"text-align:s=
tart;text-indent:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">5) nativ=
esdk-libxcrypt fails to build (not sure which change caused this, it build =
OK with sumo since the=C2=A0-std=3Dgnu99 addition.<br></span></div><div><sp=
an style=3D"text-align:start;text-indent:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline"><div>../git/crypt-sunmd5.c:189:13: error: &#39;snprintf&#39=
; output may be truncated before the last format character [-Werror=3Dforma=
t-truncation=3D]</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;$&quot; CRYPT_ALGNAME &quot;,&quot; ROUNDS &quot;%u$%s$&quot;,</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~</div></span></div><=
div><span style=3D"text-align:start;text-indent:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline"><br></span></div><div><span style=3D"text-align:star=
t;text-indent:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">6) couple i=
nternal components which usually fail to build with gcc8, because of more s=
trict warnings + Werror.</span></div><div><span style=3D"text-align:start;t=
ext-indent:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline"><br></span></d=
iv><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">I didn&#39;t get very far in testing, bec=
ause our old kernel fails to build with gcc8 and there are some other issue=
s caused by other master changes. But it doesn&#39;t look too bad (in my sm=
all test, lets see what bitbake world will show), thanks a lot for new gcc.=
</span></div><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline"><br></span></div><div>Cheers,</=
div><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline"><br></span></div><div><span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline"><br></span></div><div><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline"><br></span></div><d=
iv><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Sat, May 5, 2018 at 2:26 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Hi All<br>
<br>
As you might have noticed that gcc 8.1 was released this week, I am<br>
calling out for some testing help on testing branch so we can weed out<br>
issues you might see in your setups. so if you have your<br>
builders idling over weekend, then you know what they can do this weekend :=
)<br>
<br>
Highlighted changes are<br>
<br>
<a href=3D"https://gcc.gnu.org/gcc-8/changes.html" rel=3D"noreferrer" targe=
t=3D"_blank">https://gcc.gnu.org/gcc-8/<wbr>changes.html</a><br>
<br>
and porting doc is<br>
<br>
<a href=3D"https://gcc.gnu.org/gcc-8/porting_to.html" rel=3D"noreferrer" ta=
rget=3D"_blank">https://gcc.gnu.org/gcc-8/<wbr>porting_to.html</a><br>
<br>
The branch is here<br>
<br>
<a href=3D"http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dk=
raj/gcc-8" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.org=
/<wbr>openembedded-core-contrib/log/<wbr>?h=3Dkraj/gcc-8</a><br>
<br>
Its uptodate on top of current master oe-core<br>
<br>
May fourth be with you !!<br>
<br>
Cheers!<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-Khem<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--000000000000284bfe056bc2acb1--
