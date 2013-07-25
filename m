Return-Path: <raj.khem@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id E0C9B6AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 16:42:24 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k14so4836866oag.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 09:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QgetJBzwBM0ZnIISc5dWUtwaZgsT94IVtPk03IMgtWU=;
	b=nR9MfGz4gkuH3ZZo8evw1yDVINeQlvbIL1b+wHwQeED+wuBUbV/6ORDe01nK6saIyc
	xgzgaPDKt8l4VIk03gwBtWy8jaKKfshHZcQPoBNKOgi/UW39ndvwP7gF29FsZPnOIQzh
	xyhmPzovA67iyc69uRIX74GyS2lc6IIuGnC3gD2ohi84wE4vg2Fn1lVVMFkiC0MjlHQ7
	zmyxT+NjHsypkSoi39HxncujTlaYvksELL7Sos1NIOZsrq0gehj3R5wW4YGxZ4+9u4hk
	eKF3vKNV4X0J6kjCcoNPw326Umk7afVByC+lNQlPnW2jbX02Gf/qDdtZ2o3O8UoK/BPe
	1dBg==
MIME-Version: 1.0
X-Received: by 10.50.103.3 with SMTP id fs3mr436890igb.39.1374770545055; Thu,
	25 Jul 2013 09:42:25 -0700 (PDT)
Received: by 10.50.4.168 with HTTP; Thu, 25 Jul 2013 09:42:24 -0700 (PDT)
In-Reply-To: <CAOHjBZuwd2ZOMQ85jButDc7y+KNvCrmxrR84MShN4Euwku=rVw@mail.gmail.com>
References: <CAOHjBZuDPPjk9dySzOTtGjXzy5yisjdumag=22qV5U-aW2hj4A@mail.gmail.com>
	<1374652108.28370.6.camel@firebird.rb.intel.com>
	<CAOHjBZvycJUgtJc0sZdkENH51YHvSGj5P50uMALU95T3+W_RPA@mail.gmail.com>
	<CANyK_8eXoSMdsQFGwzPmnxZrgN_bmFejxoLdLAXqmis=rQ7Cmw@mail.gmail.com>
	<CAOHjBZtoXxaHXFammidVFGwGQz6pCJBKhZe5233Us+bDQPQ9QQ@mail.gmail.com>
	<1374660286.28370.15.camel@firebird.rb.intel.com>
	<CAOHjBZuwd2ZOMQ85jButDc7y+KNvCrmxrR84MShN4Euwku=rVw@mail.gmail.com>
Date: Thu, 25 Jul 2013 09:42:24 -0700
Message-ID: <CAMKF1sogv57tOMK10hYSVWqw+ZjSrrR6U=eXY+JE0JGW458OVg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to solve the make 3.82 issue at sanity check time?
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
X-List-Received-Date: Thu, 25 Jul 2013 16:42:25 -0000
Content-Type: multipart/alternative; boundary=047d7b2e15d7fc5e1f04e258b569

--047d7b2e15d7fc5e1f04e258b569
Content-Type: text/plain; charset=UTF-8

On Thursday, July 25, 2013, Giuseppe Condorelli <
giuseppe.condorelli@gmail.com> wrote:
> Well,
> further information for Stefan and Paul.
>
> 1) installing the make-3.82-14.fc18.x86_64  the problem disappeared.
Previuosly I downloaded and installed the -9 release and it was not
enough...

Fedora has pushed a fix for the issue iirc

> 2) trying with the script Paul suggested all was built right. I only
catched a warning at the end of the build due to a wrong path that
obviously doesn't exist in my machine.
>
> ======================
> warning: templates not found
/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/buildtools/build/build/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
> ======================
>
> Thanks all for the support,
>
> Cheers.
> Giuseppe
> 2013/7/24 Stanacar, StefanX <stefanx.stanacar@intel.com>
>>
>>
>> On Wed, 2013-07-24 at 11:43 +0200, Giuseppe Condorelli wrote:
>> > Hi Paul,
>> >
>> > I saw it early this morning (reading the previous thread)
>> > but I've not put it in the right attention I think.
>> > Now I've installed the sdk using that script and a run is still
>> > ongoing.
>> > I'll let you know.
>> > I ask the same to you: are you sure the FC17 and ahead have solved the
>> > make issue?
>> >
>>
>> I'm running F19 and didn't ran into any problems.
>>
>> I also have an F18 machine that works which has
>> make-3.82-14.fc18.x86_64 (this was the update that fixed the problem,
>> pushed two weeks ago).
>>
>> And according to
>>
https://admin.fedoraproject.org/updates/FEDORA-2013-11295/make-3.82-14.fc17?_csrf_token=9e2949b0095b56c00b217d0b00e77e28df2bb7ba
>> and
>>
https://admin.fedoraproject.org/updates/make?_csrf_token=9e2949b0095b56c00b217d0b00e77e28df2bb7ba
>>
>> the same patch was pushed for F17 make on the same day as F18, so that
>> should work too.
>>
>> Cheers,
>> Stefan
>>
>>
>> > Many thanks,
>> > Cheers.
>> > Giuseppe
>> >
>> > 2013/7/24 Paul Barker <paul@paulbarker.me.uk>
>> >         On 24 July 2013 09:47, Giuseppe Condorelli
>> >         <giuseppe.condorelli@gmail.com> wrote:
>> >         > Many thanks for the quick reply Stefan,
>> >         >
>> >         > For completion, I'm working on FC16.
>> >         > Indeed (before sending the mail) I tried downloading the
>> >         make rpm for FC17
>> >         > (rpmfind.net) and to use it
>> >         > (accordingly unpackaged under my personal directory,
>> >         updating the PATH) with
>> >         > the same failure.
>> >         > Can this sound strange for you?
>> >         > As you know, which are the make versions Fedora has released
>> >         for the
>> >         > FC17/18?
>> >         >
>> >         > I think at the moment the build of the buildtools-tarball
>> >         will be the way
>> >         > I'll follow, temporary disabling the sanity check.
>> >         >
>> >         > Cheers,
>> >         > Giuseppe
>> >         >
>> >
>> >
>> >         As stated in a previous thread, there's a snapshot of the
>> >         buildtools
>> >         at
>> >
http://autobuilder.yoctoproject.org/pub/nightly/CURRENT/buildtools/
>> >         which might work for you. It should install a known good set
>> >         of tools
>> >         including make. This could be a good test for it.
>> >
>> >         --
>> >         Paul Barker
>> >
>> >         Email: paul@paulbarker.me.uk
>> >         http://www.paulbarker.me.uk
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--047d7b2e15d7fc5e1f04e258b569
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, July 25, 2013, Giuseppe Condorelli &lt;<a href=3D"mail=
to:giuseppe.condorelli@gmail.com">giuseppe.condorelli@gmail.com</a>&gt; wro=
te:<br>&gt; Well,<br>&gt; further information for Stefan and Paul.<br>&gt; =
=C2=A0<br>
&gt; 1) installing the make-3.82-14.fc18.x86_64=C2=A0 the problem disappear=
ed. Previuosly I downloaded and installed the -9 release and it was not eno=
ugh...<br><br>Fedora has pushed a fix for the issue iirc<br><br>&gt; 2) try=
ing with the script Paul suggested all was built right. I only catched a wa=
rning at the end of the build due to a wrong path that obviously doesn&#39;=
t exist in my machine.<br>
&gt; =C2=A0<br>&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>&gt; warning: templates not found /srv/home/pokybuild/yocto=
-autobuilder-new/yocto-slave/buildtools/build/build/tmp/sysroots/x86_64-lin=
ux/usr/share/git-core/templates<br>&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; =C2=A0<br>&gt; Thanks all for the support,<br>&gt; =C2=A0<br>&gt; Chee=
rs.<br>&gt; Giuseppe<br>&gt; 2013/7/24 Stanacar, StefanX &lt;<a href=3D"mai=
lto:stefanx.stanacar@intel.com">stefanx.stanacar@intel.com</a>&gt;<br>&gt;&=
gt;<br>&gt;&gt;<br>
&gt;&gt; On Wed, 2013-07-24 at 11:43 +0200, Giuseppe Condorelli wrote:<br>&=
gt;&gt; &gt; Hi Paul,<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; I saw it early this=
 morning (reading the previous thread)<br>&gt;&gt; &gt; but I&#39;ve not pu=
t it in the right attention I think.<br>
&gt;&gt; &gt; Now I&#39;ve installed the sdk using that script and a run is=
 still<br>&gt;&gt; &gt; ongoing.<br>&gt;&gt; &gt; I&#39;ll let you know.<br=
>&gt;&gt; &gt; I ask the same to you: are you sure the FC17 and ahead have =
solved the<br>
&gt;&gt; &gt; make issue?<br>&gt;&gt; &gt;<br>&gt;&gt;<br>&gt;&gt; I&#39;m =
running F19 and didn&#39;t ran into any problems.<br>&gt;&gt;<br>&gt;&gt; I=
 also have an F18 machine that works which has<br>&gt;&gt; make-3.82-14.fc1=
8.x86_64 (this was the update that fixed the problem,<br>
&gt;&gt; pushed two weeks ago).<br>&gt;&gt;<br>&gt;&gt; And according to<br=
>&gt;&gt; <a href=3D"https://admin.fedoraproject.org/updates/FEDORA-2013-11=
295/make-3.82-14.fc17?_csrf_token=3D9e2949b0095b56c00b217d0b00e77e28df2bb7b=
a">https://admin.fedoraproject.org/updates/FEDORA-2013-11295/make-3.82-14.f=
c17?_csrf_token=3D9e2949b0095b56c00b217d0b00e77e28df2bb7ba</a><br>
&gt;&gt; and<br>&gt;&gt; <a href=3D"https://admin.fedoraproject.org/updates=
/make?_csrf_token=3D9e2949b0095b56c00b217d0b00e77e28df2bb7ba">https://admin=
.fedoraproject.org/updates/make?_csrf_token=3D9e2949b0095b56c00b217d0b00e77=
e28df2bb7ba</a><br>
&gt;&gt;<br>&gt;&gt; the same patch was pushed for F17 make on the same day=
 as F18, so that<br>&gt;&gt; should work too.<br>&gt;&gt;<br>&gt;&gt; Cheer=
s,<br>&gt;&gt; Stefan<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; &gt; Many thanks,=
<br>
&gt;&gt; &gt; Cheers.<br>&gt;&gt; &gt; Giuseppe<br>&gt;&gt; &gt;<br>&gt;&gt=
; &gt; 2013/7/24 Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk">p=
aul@paulbarker.me.uk</a>&gt;<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 O=
n 24 July 2013 09:47, Giuseppe Condorelli<br>
&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:giuseppe.co=
ndorelli@gmail.com">giuseppe.condorelli@gmail.com</a>&gt; wrote:<br>&gt;&gt=
; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Many thanks for the quick reply Ste=
fan,<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; For completion, I&#39;m work=
ing on FC16.<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Indeed (befo=
re sending the mail) I tried downloading the<br>&gt;&gt; &gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 make rpm for FC17<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; (<a href=3D"http://rpmfind.net">rpmfind.net</a>) and to use it<br>
&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; (accordingly unpackaged unde=
r my personal directory,<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 updat=
ing the PATH) with<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; the sa=
me failure.<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Can this soun=
d strange for you?<br>
&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; As you know, which are the m=
ake versions Fedora has released<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for the<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; FC17/18?<br>&=
gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>&gt;&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &gt; I think at the moment the build of the buildtools-ta=
rball<br>
&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 will be the way<br>&gt;&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; I&#39;ll follow, temporary disabling the s=
anity check.<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>&gt;&gt; =
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Cheers,<br>&gt;&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &gt; Giuseppe<br>
&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>&gt;&gt; &gt;<br>&gt;&gt;=
 &gt;<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 As stated in a previous =
thread, there&#39;s a snapshot of the<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 buildtools<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 at<br>&gt;&=
gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://autobuilder.yoctopro=
ject.org/pub/nightly/CURRENT/buildtools/">http://autobuilder.yoctoproject.o=
rg/pub/nightly/CURRENT/buildtools/</a><br>
&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 which might work for you. It shou=
ld install a known good set<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 of=
 tools<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 including make. This co=
uld be a good test for it.<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 --<br>
&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Paul Barker<br>&gt;&gt; &gt;<br>&=
gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Email: <a href=3D"mailto:paul@paul=
barker.me.uk">paul@paulbarker.me.uk</a><br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://www.paulbarker.me.uk">http://www.paulbarker.me=
.uk</a><br>
&gt;&gt; &gt;<br>&gt;&gt; &gt; ____________________________________________=
___<br>&gt;&gt; &gt; Openembedded-core mailing list<br>&gt;&gt; &gt; <a hre=
f=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lis=
ts.openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded=
-core</a><br>&gt;&gt;<br>&gt;<br>&gt;

--047d7b2e15d7fc5e1f04e258b569--
