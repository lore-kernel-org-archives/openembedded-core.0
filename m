Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id E49B96E5FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 15:37:12 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id d132so1682372oib.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 08:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=NTUkF5QVHk2mj10So1e1cT5CwpmXRWArdmNoGa9eYsk=;
	b=RPAHqWvpj10q64hh+uIYT37Jsg/g9aFUIb2dCI+sDJZovTGhB88jgECWSHWgAbZO84
	tRi4obVRKvuKK/sWuBn/zpYcRr6w4Mof+gd6LhjhyKUk+K8KnUw/LaE2Qji6SShntr6O
	zSlVwHNcONyT36zzoytyKqixWEUPJNqYg2+Lc4NVWBfLFDGDqkcGrQTtCYftqtgbXX88
	cGnBzkVWZcAxMfEqqm1a+VYj+QDwG2EXypxCkzjpDmc6voCA0XgacHUHt8lBK3LSH/NB
	ruLNcOHSOtxv0+JH6HQBjrn/TzGnKDxn+FReskjdMo0c/kn1aicPHxvB4y+Y8B6dGFxV
	aVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=NTUkF5QVHk2mj10So1e1cT5CwpmXRWArdmNoGa9eYsk=;
	b=RC7PtKMhQSMJRtiHBDEiqcVqrDX6PqQsTaHotyfP+hotYKdKw/cQ10wPKdpRm1MXAP
	3PoSIqrYAowaSoYNeKB75tP/f3VJASYINN3sdLVRhS4pXIUD/pmMrJIlT/mgEVyXo3Gc
	R/a/bVOTj445Dq/qkvPGvekjZ3x7dOXj/yyEJC/x26Of9pL6+N/2HcD+3EWLbjo3LSvg
	Cdmbu2/pgB0M8xhpYxutZ3aAvqQjM+7LkUN/NFYcbPJCamHWqrJc9b6MpUiNf3ABaeU0
	ciu9mYbZTviJZ43Ei9aQZ8AIWRuWgi72V+qUK7xG4pM1aPN3jfRBjM8n00nd+xqkLYrN
	YnPQ==
X-Gm-Message-State: AA6/9Rnm6zUI8qvDHA/lPxe82jq5aYCd9WFDCGoSQylGxBuM5iYpYaRKdv1N94u4nUdaNWsYk9VBnV16LnSJiA==
X-Received: by 10.202.84.69 with SMTP id i66mr3040325oib.93.1476200234168;
	Tue, 11 Oct 2016 08:37:14 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Tue, 11 Oct 2016 08:36:53 -0700 (PDT)
In-Reply-To: <CAD3vsf5zv87RLAN70WF06Jxr1qq2=5-ctDekdA_0o1Cr1nmBhQ@mail.gmail.com>
References: <1476120925-26574-1-git-send-email-jkrishnanjanappa@mvista.com>
	<defce586-6033-baed-bf70-bdbe1659922c@opendreambox.org>
	<CAD3vsf5zv87RLAN70WF06Jxr1qq2=5-ctDekdA_0o1Cr1nmBhQ@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 11 Oct 2016 08:36:53 -0700
X-Google-Sender-Auth: gRhGaE1zQQwlxorPBq_ziKHSVy4
Message-ID: <CABcZANkt+TbuEkTCGmqEQZG+Nw+MardZR4Jj+9FNDXFHbZysEg@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: get the correct network interface name from dmesg during NFS booting
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
X-List-Received-Date: Tue, 11 Oct 2016 15:37:13 -0000
Content-Type: multipart/alternative; boundary=001a113ac798933c3c053e98a6db

--001a113ac798933c3c053e98a6db
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 11, 2016 at 5:11 AM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> Thanks for reviewing the patch.
>
>
>> I think this is too fragile to land in OE-Core. What happens if a
>> network driver prints "device=eth0"? Or if other kernel messages make
>> the string disappear from dmesg and connman gets restarted later?
>>
>
> True. If device=eth0 gets disappeared/corrupted, then we may have problem.
>
>>
>> FWIW, I'm attaching my current wrapper script for connmand. I don't
>> think it's perfect, but at least it doesn't depend on any init manager
>> and works across restarts.
>
> The wrapper script attached by you, takes care of the missing scenarios.
> Seems to be more complete.
>
>>
>>
> Add these lines to connman's do_install, in case you'd like to test
>> and/or submit it:
>>
>> mv ${D}${sbindir}/connmand ${D}${sbindir}/connmand.real
>> install -m 755 ${WORKDIR}/connmand-nfsroot.in ${D}${sbindir}/connmand
>> sed -e 's,@sbindir@,${sbindir},g' -i ${D}${sbindir}/connmand
>>
> I think it would be good idea to integrate your changes into the already
> existing OE-core's connman script, instead of a calling original connman
> script from the wrapper script.
>

I threw together
https://github.com/openembedded/openembedded-core/compare/master...kergoth:connman-systemd-nfs
last
night, only limited testing. I think using a script in libexecdir is rather
cleaner than wrapping connmand in place, for something like this,
personally.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ac798933c3c053e98a6db
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Oct 11, 2016 at 5:11 AM, Jagadeesh Krishnanjanappa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkri=
shnanjanappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div>Than=
ks for reviewing the patch.<br><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote"><span class=3D"gmail-"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex"><span class=3D"gmail-=
m_284506143400425565gmail-"><br>
</span>I think this is too fragile to land in OE-Core. What happens if a<br=
>
network driver prints &quot;device=3Deth0&quot;? Or if other kernel message=
s make<br>
the string disappear from dmesg and connman gets restarted later?<br></bloc=
kquote><div>=C2=A0</div></span><div>True. If device=3Deth0 gets disappeared=
/corrupted, then we may have problem.</div><span class=3D"gmail-"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-le=
ft:1ex">
<br>
FWIW, I&#39;m attaching my current wrapper script for connmand. I don&#39;t=
<br>
think it&#39;s perfect, but at least it doesn&#39;t depend on any init mana=
ger<br>
and works across restarts.</blockquote></span><div>The wrapper script attac=
hed by you, takes care of the missing scenarios. Seems to be more complete.=
</div><span class=3D"gmail-"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,2=
04);border-left-style:solid;padding-left:1ex">=C2=A0<br></blockquote><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding=
-left:1ex">
Add these lines to connman&#39;s do_install, in case you&#39;d like to test=
<br>
and/or submit it:<br>
<br>
mv ${D}${sbindir}/connmand ${D}${sbindir}/connmand.real<br>
install -m 755 ${WORKDIR}/<a href=3D"http://connmand-nfsroot.in" rel=3D"nor=
eferrer" target=3D"_blank">connmand-nfsroot.in</a> ${D}${sbindir}/connmand<=
br>
sed -e &#39;s,@sbindir@,${sbindir},g&#39; -i ${D}${sbindir}/connmand<br></b=
lockquote></span><div>I think it would be good idea to integrate your chang=
es into the already existing OE-core&#39;s connman script, instead of a cal=
ling original connman script from the wrapper script.</div></div></div></di=
v></blockquote></div><br>I threw together=C2=A0<a href=3D"https://github.co=
m/openembedded/openembedded-core/compare/master...kergoth:connman-systemd-n=
fs">https://github.com/openembedded/openembedded-core/compare/master...kerg=
oth:connman-systemd-nfs</a>=C2=A0last night, only=C2=A0limited testing. I t=
hink using a script in libexecdir is rather cleaner than wrapping connmand =
in place, for something like this, personally.<br>-- <br><div class=3D"gmai=
l_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software =
Engineer, Mentor Graphics</div>
</div></div>

--001a113ac798933c3c053e98a6db--
