Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE6977C84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 18:22:42 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id u65so58412112wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AGGYOJBli59aAE9C50DHHKq8u8YMX3NYdxU4hh7ftqs=;
	b=UPYB/Cy4AyVbdam+7tBPrjMARYK+c0UdSbsyaJ+WN+QrbPV0Vw3WqQ4zY3ZNU8x4k8
	mC7dNS7wBfjKfytlThylr+lWtVfV4ptHaooXkH3J3YglgG4J7IXUjTgjVCwWCL9VZXcw
	w3JB9zfmZOswx1Pg97OSDOHb288jLcVdU6tM3C3FS/U5Tvdy8obaRYFP2MxUFbzNC2zZ
	jBuK0dyCHBVLbzFDnHygNAeEoYd+ECibnfTo3Fm8a849NCZhu2ZriFYM0jBEn9twGDNY
	VuSsevf1k1JQCo2lCtr+Qw/1SP0RTzHNlRRWH4c5YpEszInTvMFyO4T0F8pOzje67P+V
	fYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AGGYOJBli59aAE9C50DHHKq8u8YMX3NYdxU4hh7ftqs=;
	b=MIX5e109O0rmmhx0+vvhN7ZNxyYnidbrWnTZsCrM6w/jtJI2b3LHVt9XSjuyPlBe3u
	UCg9Ghd1RPAZyb2/pWo8PgMDkztqS/HXyPohMUd/X1uY4XN/bpO7xINzGPZ38DtxHW8d
	+UhlD+3ldrhVGIomFqUnDtJl+G4QH1tS6VlIwzoZI5c9Ta0aukMbelX9lLyMIowvCBK/
	4uEiRr65HC5jkyZ2GIiUmd47GGftny5YxkYcs5Xa8BOTYqQfa11rhA7cCBEGUERQnK+9
	zHeMFXOC1fNeBWORM89cRGatgYJed5Ro5cQsMtaXqgRj4wHs2dJqw8W859W3tZwsg0UW
	Giww==
X-Gm-Message-State: AN3rC/5W05I6ogkjO70WnePs+dhcB59mf+uSn8OAb3OWgFlbFMlsOZUZ
	m6gD+InouDWT6XEfQX7jLbWM76CkfQ==
X-Received: by 10.80.182.50 with SMTP id b47mr1927543ede.123.1493230963328;
	Wed, 26 Apr 2017 11:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQfX1iYsYwqx4CMKuADmW75_VZStzZpdE-hw=ahtsDvdwg@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61194BE74@ORSMSX112.amr.corp.intel.com>
	<20170426074212.GB3258@jama>
	<6E51916E4A1F32428260031F4C7CD2B61194DCC6@ORSMSX112.amr.corp.intel.com>
	<CA+chaQe4o+LKRV5voXOhoPoWEGjx2cmXedsagmQEgouAP6jMvQ@mail.gmail.com>
In-Reply-To: <CA+chaQe4o+LKRV5voXOhoPoWEGjx2cmXedsagmQEgouAP6jMvQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Apr 2017 18:22:31 +0000
Message-ID: <CAMKF1sprG=kmRRLR1Wko+E5BbZu8OY9GQFXUg2oTQge4uJQPTw@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>,
	Martin Jansa <martin.jansa@gmail.com>
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Reproducible binaries
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
X-List-Received-Date: Wed, 26 Apr 2017 18:22:43 -0000
Content-Type: multipart/alternative; boundary=94eb2c0e40be231574054e15ed9f

--94eb2c0e40be231574054e15ed9f
Content-Type: text/plain; charset=UTF-8

That sounds better option but we still will need a fallback there is a
libfakedatetime as well which can be used to generate consistent date and
time

On Wed, Apr 26, 2017 at 10:52 AM Martin Jansa <martin.jansa@gmail.com>
wrote:

> What about passing the seed value (currently created based on last commit
> in repo you're building from - which doesn't need to be oe-core repository
> right?) to make it easier for people to pass whatever value works for them?
> even some constant value in DISTRO config.
>
> On Wed, Apr 26, 2017 at 6:43 PM, Bystricky, Juro <juro.bystricky@intel.com
> > wrote:
>
>>
>> > But not for 2 different builds with slightly modified metadata (e.g.
>> > just because top commit is different in whatever build repository you're
>> > running from even when it doesn't have any effect in your image), right?
>> >
>>
>> This may be addressed in the future. Presently, the goal is to ensure
>> that if we
>> use identical repositories we get identical results. This should not
>> depend
>> on the time/date, build folder or even Linux distro. By identical results
>> I mean binary identical comparison of the resulting "deploy" folders.
>> (images, packages, licenses). So for example, there should be no binary
>> differences
>> between the two images of core-image-minimal.rootfs.ext4.
>> In your case (slightly different repos), the difference would be presented
>> as different time stamps for /etc/version and /etc/timestamp only.
>>
>>
>> > So it doesn't fix the files-in-image.txt differences as described in:
>> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=5866
>> >
>>
>> Eventually it will. There is still ways to go and this patch set is just
>> the first
>> kick at the can.
>>
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0e40be231574054e15ed9f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>That sounds better option but we still will need a fallback there is a=
 libfakedatetime as well which can be used to generate consistent date and =
time=C2=A0</div><div><br><div class=3D"gmail_quote"><div>On Wed, Apr 26, 20=
17 at 10:52 AM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">m=
artin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div>What about passing the seed value (currently created based on last c=
ommit in repo you&#39;re building from - which doesn&#39;t need to be oe-co=
re repository right?) to make it easier for people to pass whatever value w=
orks for them? even some constant value in DISTRO config.</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Apr 26, 2017 at 6:4=
3 PM, Bystricky, Juro <span>&lt;<a href=3D"mailto:juro.bystricky@intel.com"=
 target=3D"_blank">juro.bystricky@intel.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><span><br>
&gt; But not for 2 different builds with slightly modified metadata (e.g.<b=
r>
&gt; just because top commit is different in whatever build repository you&=
#39;re<br>
&gt; running from even when it doesn&#39;t have any effect in your image), =
right?<br>
&gt;<br>
<br>
</span>This may be addressed in the future. Presently, the goal is to ensur=
e that if we<br>
use identical repositories we get identical results. This should not depend=
<br>
on the time/date, build folder or even Linux distro. By identical results<b=
r>
I mean binary identical comparison of the resulting &quot;deploy&quot; fold=
ers.<br>
(images, packages, licenses). So for example, there should be no binary dif=
ferences<br>
between the two images of core-image-minimal.rootfs.ext4.<br>
In your case (slightly different repos), the difference would be presented<=
br>
as different time stamps for /etc/version and /etc/timestamp only.<br>
<span><br>
<br>
&gt; So it doesn&#39;t fix the files-in-image.txt differences as described =
in:<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5866" r=
el=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_=
bug.cgi?id=3D5866</a><br>
&gt;<br>
<br>
</span>Eventually it will. There is still ways to go and this patch set is =
just the first<br>
kick at the can.<br>
<br>
<br>
</blockquote></div><br></div>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--94eb2c0e40be231574054e15ed9f--
