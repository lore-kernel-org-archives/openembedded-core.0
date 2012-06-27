Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1SjySI-0000VS-SS
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 22:03:15 +0200
Received: by ggnp4 with SMTP id p4so1232572ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 12:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/0t4q9ViUJIW1iL3vrilmoPCc/kvjXjojGkGG68dvKM=;
	b=AdP/+tDvveE3GO65zzhoQNioMDmnX4KRCpiO3gSoH0n3ckAujkcX9j7oFp4ubRS4xl
	MO4muv5CA6HpbExXAYoauvBVo8IFx+/OqYdO0k2AkvuFQ4RQ33I6lGjLeYHQAnw90mze
	bD6/YYC9kC+ke7cxHnplm3RS9e+106WtiLsYysseLqutEhZEHxFVd9VmYX+yvodFGTza
	D4YxTNlfTds2TIdfptnqYuXWuMRuDVHp8FrVb3bzblbq4IKmBxR7whCf6JrjgMBPr4KE
	mq83Ox0xgRUwrxN9w5dqmpK4jRvRIN3M5gLu0KoNqjFgPcNbJIsNfRiqXtOreaPZ9r6e
	Alyw==
MIME-Version: 1.0
Received: by 10.60.2.161 with SMTP id 1mr22345091oev.48.1340826740150; Wed, 27
	Jun 2012 12:52:20 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Wed, 27 Jun 2012 12:52:20 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Wed, 27 Jun 2012 12:52:20 -0700 (PDT)
In-Reply-To: <4FEB23F3.6070408@windriver.com>
References: <CAF1ZMEcMxTQUhyHdmMWV_PA6TY=RTz9rq-EahKU0p=DFFPw+Ew@mail.gmail.com>
	<4FEB23F3.6070408@windriver.com>
Date: Thu, 28 Jun 2012 03:52:20 +0800
Message-ID: <CAF1ZMEcU1fLbucJQC=BrXZ2XK50N-eMxei0m++vDb+edGnPkrA@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: yocto@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bring mipsel support (little endian mode)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2012 20:03:15 -0000
Content-Type: multipart/alternative; boundary=e89a8f923de48d531804c3798d5c

--e89a8f923de48d531804c3798d5c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi  bruce:
   i'm cherry-pick your commit, and it seems compile successfully, though
will do a run-time check later, thanks

at 2012-6-27 pm11:17=EF=BC=8C"Bruce Ashfield" <bruce.ashfield@windriver.com=
>written=EF=BC=9A
>
> On 12-06-27 02:25 AM, Dennis.Yxun wrote:
>>
>> HI ALL:
>>    Sorry for crossing post, but I'm quite new here, so if I did
>> something wrong, please point me the right direction. thanks
>>    I'm using oe-core, and notice that mipsel support(o32, little
>> endian mode) is missing (current available choose is: qemumips,
>> qemumips64, qemumips64el).
>>    So, here I'm trying to bring up qemumipsel support . My first
>> attempt would just make qemumipsel work,
>> further would make it running on real board, thus maybe mips4kec,
>> mips24k, mips74k chips.
>>    What I achieved here current:
>>   1) toolchain/basic libs, utilities should works ,only one changes,
>> see my patch [a]
>>    for mipsel we also have to filter out -march=3Dmips32, previously we
>> only handle mips (the big endian?)
>>    don't have the error message now, but if you request, I can provide.
>>   2) attempt to  compile kernel to support qemumipsel, unfortunately it
fail.
>> The point here is linux-yocto doesn't support qemumipsel, but merely
>> support those other three mips arches,
>> So here is my attempt patch [b], and the fail log [c], complied out
>> binary still big endian.
>
>
> Since it was easy enough to do, and doesn't imply any sort of full
> support (since I can't declare that), I did the tweak to the mips
> board descriptions and qemumipsel works without any machine mapping
> in the linux-yocto recipes.
>
> I pushed the change to the linux-yocto-3.4 meta branch, and staged a
> commit for it locally.
>
> You can see that commit here:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dzedd/mips=
el
>
>  .. stacked on top of my other pending 3.4 commits.
>
> Note: I didn't update machine compatibility in that commit on purpose,
> and I wasn't able to complete a full core-image-minimal build due to
> QA issues. I'm probably just not building with a complete machine.conf ..
> since I grabbed one quickly this morning to check the kernel parts.
>
> Cheers,
>
> Bruce
>
>
>>
>>    Could my patch [a] be accepted? or should I send with another mail
>> for better review?
>>    Is it better to request a ticket in yocto's bugzilla? or just
>> report here, I'm not quite sure.
>>
>> Dennis
>>
>> [a] 0001-eglibc-support-mipsel-little-endian-filter-out-march.patch
>> [b] 0002-qemu-attempt-to-add-mipsel-little-endian-support-but.patch
>> [c] build_log.txt
>> [d] log.do_package
>
>

--e89a8f923de48d531804c3798d5c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>hi=C2=A0 bruce:<br>
=C2=A0=C2=A0 i&#39;m cherry-pick your commit, and it seems compile successf=
ully, though will do a run-time check later, thanks<br></p>
<p>at 2012-6-27 pm11:17=EF=BC=8C&quot;Bruce Ashfield&quot; &lt;<a href=3D"m=
ailto:bruce.ashfield@windriver.com">bruce.ashfield@windriver.com</a>&gt;wri=
tten=EF=BC=9A<br>
&gt;<br>
&gt; On 12-06-27 02:25 AM, Dennis.Yxun wrote:<br>
&gt;&gt;<br>
&gt;&gt; HI ALL:<br>
&gt;&gt; =C2=A0 =C2=A0Sorry for crossing post, but I&#39;m quite new here, =
so if I did<br>
&gt;&gt; something wrong, please point me the right direction. thanks<br>
&gt;&gt; =C2=A0 =C2=A0I&#39;m using oe-core, and notice that mipsel support=
(o32, little<br>
&gt;&gt; endian mode) is missing (current available choose is: qemumips,<br=
>
&gt;&gt; qemumips64, qemumips64el).<br>
&gt;&gt; =C2=A0 =C2=A0So, here I&#39;m trying to bring up qemumipsel suppor=
t . My first<br>
&gt;&gt; attempt would just make qemumipsel work,<br>
&gt;&gt; further would make it running on real board, thus maybe mips4kec,<=
br>
&gt;&gt; mips24k, mips74k chips.<br>
&gt;&gt; =C2=A0 =C2=A0What I achieved here current:<br>
&gt;&gt; =C2=A0 1) toolchain/basic libs, utilities should works ,only one c=
hanges,<br>
&gt;&gt; see my patch [a]<br>
&gt;&gt; =C2=A0 =C2=A0for mipsel we also have to filter out -march=3Dmips32=
, previously we<br>
&gt;&gt; only handle mips (the big endian?)<br>
&gt;&gt; =C2=A0 =C2=A0don&#39;t have the error message now, but if you requ=
est, I can provide.<br>
&gt;&gt; =C2=A0 2) attempt to =C2=A0compile kernel to support qemumipsel, u=
nfortunately it fail.<br>
&gt;&gt; The point here is linux-yocto doesn&#39;t support qemumipsel, but =
merely<br>
&gt;&gt; support those other three mips arches,<br>
&gt;&gt; So here is my attempt patch [b], and the fail log [c], complied ou=
t<br>
&gt;&gt; binary still big endian.<br>
&gt;<br>
&gt;<br>
&gt; Since it was easy enough to do, and doesn&#39;t imply any sort of full=
<br>
&gt; support (since I can&#39;t declare that), I did the tweak to the mips<=
br>
&gt; board descriptions and qemumipsel works without any machine mapping<br=
>
&gt; in the linux-yocto recipes.<br>
&gt;<br>
&gt; I pushed the change to the linux-yocto-3.4 meta branch, and staged a<b=
r>
&gt; commit for it locally.<br>
&gt;<br>
&gt; You can see that commit here:<br>
&gt;<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/=
?h=3Dzedd/mipsel">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/lo=
g/?h=3Dzedd/mipsel</a><br>
&gt;<br>
&gt; =C2=A0.. stacked on top of my other pending 3.4 commits.<br>
&gt;<br>
&gt; Note: I didn&#39;t update machine compatibility in that commit on purp=
ose,<br>
&gt; and I wasn&#39;t able to complete a full core-image-minimal build due =
to<br>
&gt; QA issues. I&#39;m probably just not building with a complete machine.=
conf ..<br>
&gt; since I grabbed one quickly this morning to check the kernel parts.<br=
>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 =C2=A0Could my patch [a] be accepted? or should I send with=
 another mail<br>
&gt;&gt; for better review?<br>
&gt;&gt; =C2=A0 =C2=A0Is it better to request a ticket in yocto&#39;s bugzi=
lla? or just<br>
&gt;&gt; report here, I&#39;m not quite sure.<br>
&gt;&gt;<br>
&gt;&gt; Dennis<br>
&gt;&gt;<br>
&gt;&gt; [a] 0001-eglibc-support-mipsel-little-endian-filter-out-march.patc=
h<br>
&gt;&gt; [b] 0002-qemu-attempt-to-add-mipsel-little-endian-support-but.patc=
h<br>
&gt;&gt; [c] build_log.txt<br>
&gt;&gt; [d] log.do_package<br>
&gt;<br>
&gt;</p>

--e89a8f923de48d531804c3798d5c--
