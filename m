Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 369F26E5CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 19:34:30 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id d132so2078087oib.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=J/tHHdu6gEzGOubW2y5gaYWbPb64JFtxK1h1WfEf5yc=;
	b=FpxpGCEyL88XV+I5Kj8B8tcHbFzi2HubHBbJ/Xs1ynJmtoElOAEl32sT/r66UFYNWx
	TmM2CnpaqvUsm96CUpAES+ONKPhwgUQaih+rBAkLJmpxqW4GEDkt9wcgXG+yYV0TUJyg
	AY67KWcJj5nt1JyxasnUVvjuLq8eCCKYlctHJtWiUmjvrnHih++07l2+jEui53qXkntb
	0t+iYXiBpbgt0bmU3UGTrl65QzFLIPzgdZbCYjjQ1Z+EWM+7dECju+4L+T9oGtd5yPS6
	24ML5lebC6Es3C2ePs5ve90pxLZT/VSi0CVw15eUFHpB1y7vOK9zMM/eNr1yDU2VD4At
	Fncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=J/tHHdu6gEzGOubW2y5gaYWbPb64JFtxK1h1WfEf5yc=;
	b=mmOMgC4vpqYXa7p9cBlAmIDYyIZ17tiFywLW98Vdhp91tB3jzh7gj104Vln7kLwDmY
	1k2NCf3CJx5tz4v0eSqLGVxtaEUU/6oluf2pEG3Oh5TJ1XWZ1OGVYIr0iDqZL60wNObB
	LVdZWBLn75u6q050KeHrzARPCnSiheUIx7QMmcdS4FbdpGbXssp+sx0+n7QA3q606aKO
	j9Oe8zVRhyTvfMI6zTmttsi4AegvzV169SFtKi7LZVtFcxqdvrGhJxiSvE5N9h5UhHcD
	iH2HPnjjIZl0caZIp0EoOSt0kG0HEEWE8k+2VvslaTYtc45L3R0Jzf+4oVYmwvp3IUwU
	XGkQ==
X-Gm-Message-State: AA6/9Rnf9BmxCai3fQqGiKcAOmZAik9yQ+HGuOTtXu5rfbijqMNljzVQj6AnEQjFZvK0G/Q2vhIt0jJ2DvDwxw==
X-Received: by 10.202.222.133 with SMTP id v127mr3769615oig.22.1476214471943; 
	Tue, 11 Oct 2016 12:34:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Tue, 11 Oct 2016 12:34:11 -0700 (PDT)
In-Reply-To: <CAD3vsf6muVV_NNP=rTGNo-4gMz_Q0SNojJ-qJui8_j9eW-gmZQ@mail.gmail.com>
References: <1476120925-26574-1-git-send-email-jkrishnanjanappa@mvista.com>
	<defce586-6033-baed-bf70-bdbe1659922c@opendreambox.org>
	<CAD3vsf5zv87RLAN70WF06Jxr1qq2=5-ctDekdA_0o1Cr1nmBhQ@mail.gmail.com>
	<CABcZANkt+TbuEkTCGmqEQZG+Nw+MardZR4Jj+9FNDXFHbZysEg@mail.gmail.com>
	<CAD3vsf6muVV_NNP=rTGNo-4gMz_Q0SNojJ-qJui8_j9eW-gmZQ@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 11 Oct 2016 12:34:11 -0700
X-Google-Sender-Auth: 1Dh6akdv9f0C7YEuY7YTvmeFKf0
Message-ID: <CABcZANnDjD7MAU-8EU1CmRxZKDAZtB3E6JHiPCwo1q77oNjc1A@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 19:34:33 -0000
Content-Type: multipart/alternative; boundary=001a11440d06366db4053e9bf717

--001a11440d06366db4053e9bf717
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2016 at 12:03 PM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> On Tue, Oct 11, 2016 at 9:06 PM, Christopher Larson <clarson@kergoth.com>
> wrote:
>
>>
>> On Tue, Oct 11, 2016 at 5:11 AM, Jagadeesh Krishnanjanappa <
>> jkrishnanjanappa@mvista.com> wrote:
>>
>>> Thanks for reviewing the patch.
>>>
>>>
>>>> I think this is too fragile to land in OE-Core. What happens if a
>>>> network driver prints "device=3Deth0"? Or if other kernel messages mak=
e
>>>> the string disappear from dmesg and connman gets restarted later?
>>>>
>>>
>>> True. If device=3Deth0 gets disappeared/corrupted, then we may have
>>> problem.
>>>
>>>>
>>>> FWIW, I'm attaching my current wrapper script for connmand. I don't
>>>> think it's perfect, but at least it doesn't depend on any init manager
>>>> and works across restarts.
>>>
>>> The wrapper script attached by you, takes care of the missing scenarios=
.
>>> Seems to be more complete.
>>>
>>>>
>>>>
>>> Add these lines to connman's do_install, in case you'd like to test
>>>> and/or submit it:
>>>>
>>>> mv ${D}${sbindir}/connmand ${D}${sbindir}/connmand.real
>>>> install -m 755 ${WORKDIR}/connmand-nfsroot.in ${D}${sbindir}/connmand
>>>> sed -e 's,@sbindir@,${sbindir},g' -i ${D}${sbindir}/connmand
>>>>
>>> I think it would be good idea to integrate your changes into the alread=
y
>>> existing OE-core's connman script, instead of a calling original connma=
n
>>> script from the wrapper script.
>>>
>>
>> I threw together https://github.com/openembedded/openembedded-core/
>> compare/master...kergoth:connman-systemd-nfs last night, only limited
>> testing. I think using a script in libexecdir is rather cleaner than
>> wrapping connmand in place, for something like this, personally.
>>
>
> In the above commit,  the last line of connman/connman/start-connman file=
,
> should be exec @SBINDIR@/connmand "$@" instead of exec @SBINDIR@/connman
> "$@" ; as the actual binary file name is connmand.


Thanks, didn=E2=80=99t notice that. Obviously it needs polish and testing b=
efore
submission, I mainly linked it to solicit thoughts on the approach :)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11440d06366db4053e9bf717
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Oct 11, 2016 at 12:03 PM, Jagadeesh Krishnanjanappa <span dir=3D"lt=
r">&lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkr=
ishnanjanappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><span class=3D"">On Tue, Oct 11, 2016 at 9:06 PM, Christopher Larson =
<span dir=3D"ltr">&lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_bla=
nk">clarson@kergoth.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><span class=3D"m_4745572745164191539gma=
il-"><br><div class=3D"gmail_quote">On Tue, Oct 11, 2016 at 5:11 AM, Jagade=
esh Krishnanjanappa <span dir=3D"ltr">&lt;<a href=3D"mailto:jkrishnanjanapp=
a@mvista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div>Thanks for reviewing the patch.<br><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"m_47455727=
45164191539gmail-m_-1398317967282633483gmail-"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-c=
olor:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><span class=
=3D"m_4745572745164191539gmail-m_-1398317967282633483gmail-m_28450614340042=
5565gmail-"><br>
</span>I think this is too fragile to land in OE-Core. What happens if a<br=
>
network driver prints &quot;device=3Deth0&quot;? Or if other kernel message=
s make<br>
the string disappear from dmesg and connman gets restarted later?<br></bloc=
kquote><div>=C2=A0</div></span><div>True. If device=3Deth0 gets disappeared=
/corrupted, then we may have problem.</div><span class=3D"m_474557274516419=
1539gmail-m_-1398317967282633483gmail-"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rg=
b(204,204,204);border-left-style:solid;padding-left:1ex">
<br>
FWIW, I&#39;m attaching my current wrapper script for connmand. I don&#39;t=
<br>
think it&#39;s perfect, but at least it doesn&#39;t depend on any init mana=
ger<br>
and works across restarts.</blockquote></span><div>The wrapper script attac=
hed by you, takes care of the missing scenarios. Seems to be more complete.=
</div><span class=3D"m_4745572745164191539gmail-m_-1398317967282633483gmail=
-"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:soli=
d;padding-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color=
:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
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
v></blockquote></div><br></span>I threw together=C2=A0<a href=3D"https://gi=
thub.com/openembedded/openembedded-core/compare/master...kergoth:connman-sy=
stemd-nfs" target=3D"_blank">https://github.com/op<wbr>enembedded/openembed=
ded-core/<wbr>compare/master...kergoth:connm<wbr>an-systemd-nfs</a>=C2=A0la=
st night, only=C2=A0limited testing. I think using a script in libexecdir i=
s rather cleaner than wrapping connmand in place, for something like this, =
personally.</div></div></blockquote><div>=C2=A0</div></span>In the above co=
mmit, =C2=A0the last line of connman/connman/start-connman file, should be =
exec @SBINDIR@/connmand &quot;$@&quot; instead of exec @SBINDIR@/connman &q=
uot;$@&quot; ; as the actual binary file name is connmand.</blockquote></di=
v><br>Thanks, didn=E2=80=99t notice that. Obviously it needs polish and tes=
ting before submission, I mainly linked it to solicit thoughts on the appro=
ach :)<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_sig=
nature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBa=
ke, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engin=
eer, Mentor Graphics</div>
</div></div>

--001a11440d06366db4053e9bf717--
