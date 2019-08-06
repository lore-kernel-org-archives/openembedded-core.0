Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5977F354
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 12:16:54 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id m10so82087820edv.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+csuONPt6cFRr0rMM8MMI7qyo1wc1dJepc7dF7w4xQw=;
	b=TLIU6TPC7SThlZWGTfxYjHOssWerrqwr+JtWbdyKQlcfe3SznWGY9ADtG3ZVgSgqyX
	9qRfhzmAJkYxsZwrJAnIKdTeZIzTwgMjce2DroG5+4LGPn/xTWF7zxBJO2rQdyszr13w
	y6WrGYjY4PKEVSbD4uS73uL4g4TXZkcoHpiZYvxYxP7VgrHHd5etCwFM2zGq00Dc+ivu
	LE/gx9g/Ve1RDcfUKSyBP/QhRzdhYoNCLDPqsADPCI2vCwJScoMBWQ809gc18dOU/KIO
	cIBsRTwg+mnn0z8uFB/MwSSAi6UrvDPu7iDTVM9c9dEilt79HmjEVfTQbcbefUFd0AYd
	Zy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+csuONPt6cFRr0rMM8MMI7qyo1wc1dJepc7dF7w4xQw=;
	b=Q/yfdVftkZOAtJktEKvN28j5ptJCQvtnru0/gTM7Kwt2tvKZeI9LWTO904jAoZv3NC
	czuzdFCDkcWLojPZoAKzLNUKGhulVksc/uol7BGpMowzD9S1s1Z1z5AwAEzGfxXoUpq/
	xTvi6ay+k0OUnXqqPmO4bokhWD2e+goxovpQwhVxG6IqBT3VON0mgeitzAVcWs+9AAG7
	lLew5doibNvisU0q13rJRAJcffWubcYvbyT/6oauQ2sJ22HZ7dUEevwyeBjaCdI2i06F
	Hobs7RAoRtekBFixtrrTqIupRDRs4MhULKaLQ093kOEC5qvZFJCKtkh9YUVcIxG0/CMP
	XUMw==
X-Gm-Message-State: APjAAAWpGP9UGcUJg4eO/q+VVTFmRoC7OB0kG3nQdvDs5gQXP8H5iFqD
	lG2voYwsKzHy4MpfeGFNM117QYrmh/TZBEMvCNQ=
X-Google-Smtp-Source: APXvYqyBAMRnUM8CGmL3AXXznm4Odcy8XHGOv1V3EZ5tD8Mp/HogjI2X9ahWhm3p/Ufs0gKMZGO7v76yTRphymbHc1g=
X-Received: by 2002:a50:c35b:: with SMTP id q27mr3483197edb.98.1565093814878; 
	Tue, 06 Aug 2019 05:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
	<4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
	<18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>
	<CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
	<eba25cda-3ca0-039d-45ea-f9a86e80b4f6@intel.com>
	<CANNYZj-QUcKdw4BygFyfXLSm4L=89XC44u65LNFx2OiiqrQE0Q@mail.gmail.com>
In-Reply-To: <CANNYZj-QUcKdw4BygFyfXLSm4L=89XC44u65LNFx2OiiqrQE0Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 6 Aug 2019 14:16:43 +0200
Message-ID: <CA+chaQfsQLEcxS9-XVQJT-7PR-JgtZ1cEFMdbJshmYMst6s2Lw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 12:16:54 -0000
Content-Type: multipart/alternative; boundary="000000000000e0477b058f71cc6e"

--000000000000e0477b058f71cc6e
Content-Type: text/plain; charset="UTF-8"

Maybe another case of
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9217#c6 ?

On Tue, Aug 6, 2019 at 1:57 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 6 Aug 2019 at 13:18, Ross Burton <ross.burton@intel.com> wrote:
>
>> > Note that bash-completion files are not executable, and we do not
>> > observe this with other recipes. We might have a false positive here -
>> > can you look at the actual contents of the package please and see why
>> > _qa thinks it needs /bin/bash?
>>
>> Also I don't see this with master.  Do you have some local patches or QA
>> changes?
>>
>
> Actually there is a determinism problem here. I have reproduced it with
> master, and the error happens if and only if bash's do_package task has not
> yet run. If it has already run, then the package_qa for stress-ng passes
> fine. I'll poke at it to see if it's a recent issue.
>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e0477b058f71cc6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Maybe another case of=C2=A0<a href=3D"https://bugzilla.yoc=
toproject.org/show_bug.cgi?id=3D9217#c6">https://bugzilla.yoctoproject.org/=
show_bug.cgi?id=3D9217#c6</a> ?</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Aug 6, 2019 at 1:57 PM Alexander Kan=
avin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div dir=3D"ltr">On Tue, 6 Aug 2019 at 13:18, Ross Burton &l=
t;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@in=
tel.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">&gt; Note that bash-completion files are =
not executable, and we do not <br>
&gt; observe this with other recipes. We might have a false positive here -=
 <br>
&gt; can you look at the actual contents of the package please and see why =
<br>
&gt; _qa thinks it needs /bin/bash?<br>
<br>
Also I don&#39;t see this with master.=C2=A0 Do you have some local patches=
 or QA <br>
changes?<br></blockquote><div><br></div><div>Actually there is a determinis=
m problem here. I have reproduced it with master, and the error happens if =
and only if bash&#39;s do_package task has not yet run. If it has already r=
un, then the package_qa for stress-ng passes fine. I&#39;ll poke at it to s=
ee if it&#39;s a recent issue.<br></div><div><br></div><div>Alex<br></div><=
/div></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000e0477b058f71cc6e--
