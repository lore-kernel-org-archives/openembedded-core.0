Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 054AD6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 22:10:24 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id s63so10810764ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 15:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=e9lLyTnmuN+vGM97Ni/WABIACpi8sIcfCGmbHuLDHZE=;
	b=bx0Ivt+/UfMxwcKKV/Eyx479lxoZNRcyPRu9vHY3khe5C3JC6lzX9dZOfSUOCAYHLb
	Kp8EAclgBryRIDVJv3tM+CJkV2w/vRoUgAr3ndhJM3XjFiSDWGbEi3wAWohIPASbuKH1
	Tsyhnt4svi082Bvs22+lCki7MuN/LjrhZ50dyDJXFW5qsj4Bv/JbjRdonqS+4/Le0bqj
	Fz5rQdmVUgeM/roGWuI/5TNd8apwl+JAIkP2v45AcRjVPi3tMWMd4caaNj6VUpYF0L1x
	plJql3QL9qZexWReDW/YuzcDVfyohk4JoGa7d73CCO34IGGrrhwjrLRufMSfN2YQL0vA
	sGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=e9lLyTnmuN+vGM97Ni/WABIACpi8sIcfCGmbHuLDHZE=;
	b=jKPYe67HWTH09AXcrxqBc95J7hDe2LlJWqmap+mgpMhw5ClsqXOODyHzUqYhSx7b82
	NVrsnkoNTiCQnMLrNGjxsT0KuZVD55AluTM//zkHheg/szJDt/V/ppazK+gi85r4Lbee
	a0nnkfSVnus8Gx7faGhVm5R1DJj5bom1NKL/IlCxEJQdoEtKAdnk4RebZyWHYBYbi0Ej
	fPwO8z+jDD7BYga8wtxXt1SlIfzObrwBiw/wr3Oe33kzbY+qcw+cNpb1dTPgPKJw9ge1
	7mNpA92xH4Rgts4HEcoV81Te8Fl3awTDliAqi0pZ1xafri7Z0zVcr6LgCJAjMaudHQYf
	/55g==
X-Gm-Message-State: ALyK8tLljIVEA5lwLM5lIUy/Ss47vyrHbLzDoOpvkU8f12HRQSen72d1uQ64+4WcOT4plbGlc97k00dvhb5q4g==
X-Received: by 10.107.131.212 with SMTP id n81mr6773901ioi.126.1466201425249; 
	Fri, 17 Jun 2016 15:10:25 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.130.66 with HTTP; Fri, 17 Jun 2016 15:10:05 -0700 (PDT)
In-Reply-To: <CABcZANkPQBWukZTtzz69JQZHOFRpnXyPV1BvP8Bv-CZqqRtSkA@mail.gmail.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E5718DD13@fmsmsx111.amr.corp.intel.com>
	<CABcZANkPQBWukZTtzz69JQZHOFRpnXyPV1BvP8Bv-CZqqRtSkA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 17 Jun 2016 15:10:05 -0700
X-Google-Sender-Auth: oyrssgCS1DPm6Qq-GIh3QFVPoTI
Message-ID: <CABcZANn0Th7280tbwbMuL+YcWyvyzrYJHkGRv4SNiY0TLygGaw@mail.gmail.com>
To: "Jolley, Stephen K" <stephen.k.jolley@intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW25
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
X-List-Received-Date: Fri, 17 Jun 2016 22:10:25 -0000
Content-Type: multipart/alternative; boundary=001a113ec32e1f0b190535809f34

--001a113ec32e1f0b190535809f34
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 2:42 PM, Christopher Larson <clarson@kergoth.com>
wrote:

> On Fri, Jun 17, 2016 at 8:31 AM, Jolley, Stephen K <
> stephen.k.jolley@intel.com> wrote:
>
>> =C2=B7        There is a multilib issue related to the layout of the hos=
t
>> libraries leaking into python=E2=80=99s build process which we=E2=80=99r=
e struggling to
>> debug
>
>
> Could I get some details on this? I've seen something like this where
> cmake and automake are relying on sys.lib from python3-native/python-nati=
ve
> to determine the sitepackages directory, is that the behavior others are
> hitting? So python modules end up in /usr/lib/ rather than /usr/lib64/, f=
or
> example?
>
> If that's the issue in question, the issue is the mismatch between the
> native sys.lib and target. We already patch automake to fall back to usin=
g
> our libdir + python version to determine the path, but only if it wasn't
> able to use sys.lib to do so. If we change that to always use libdir+pyth=
on
> version, it should fix the automake packages. Then we might need to patch
> FindPythonLibs in cmake to do the same. I'm testing the automake change
> locally now.
>

Hmm, nevermind, seems that was fixed in oe-core already, huzzah :)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ec32e1f0b190535809f34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jun 17, 2016 at 2:42 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmai=
l_extra"><span class=3D""><div class=3D"gmail_quote">On Fri, Jun 17, 2016 a=
t 8:31 AM, Jolley, Stephen K <span dir=3D"ltr">&lt;<a href=3D"mailto:stephe=
n.k.jolley@intel.com" target=3D"_blank">stephen.k.jolley@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span style=3D"font-size:10=
.0pt;font-family:Symbol;color:black"><span>=C2=B7<span style=3D"font:7.0pt =
&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><u></u><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Arial&quot;,sans-serif;color:black">There is a multilib issue related to=
 the layout of the host libraries leaking into python=E2=80=99s build proce=
ss which we=E2=80=99re struggling to debug</span></blockquote></div><br></s=
pan>Could I get some details on this? I&#39;ve seen something like this whe=
re cmake and automake are relying on sys.lib from python3-native/python-nat=
ive to determine the sitepackages directory, is that the behavior others ar=
e hitting? So python modules end up in /usr/lib/ rather than /usr/lib64/, f=
or example?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">If that&#39;s the issue in question, the issue is the mismatch betwee=
n the native sys.lib and target. We already patch automake to fall back to =
using our libdir + python version to determine the path, but only if it was=
n&#39;t able to use sys.lib to do so. If we change that to always use libdi=
r+python version, it should fix the automake packages. Then we might need t=
o patch FindPythonLibs in cmake to do the same. I&#39;m testing the automak=
e change locally now.</div></blockquote></div><br>Hmm, nevermind, seems tha=
t was fixed in oe-core already, huzzah :)<br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at=
 kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintain=
er - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113ec32e1f0b190535809f34--
