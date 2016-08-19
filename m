Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id AF73D73211
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 09:00:21 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id 4so55566319oih.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qo/cQDMT5wz2WuHVDiyIgPaLt4iRXVmyPHsAhFXFtSI=;
	b=sYNHCoMkyHwK7B6dPNJW6JZJTM6BRjOBkG+wiJGkfE5TTefdCmTqc6DjxMddDhIVHL
	TTnhPl3OMCsNwx/AMOtHq4cPDv6jN4rTj9m2plyQMi0rCPe6gJHGjSj8atux1ASz4UI7
	KZbnQblf/itTTjkm53kDO+6ZzlL7x2cDZntuxLhZsFBhd/D1TGlhAij3vEgsYunpv7ek
	p+2WkmxosZw5oKnMHYZSIB3IE7wJjrRE5sPYeZrlIxTvPQ/jZ845rqFeaYT1KW7AhLHE
	3G6X1L9RfA4IZvNrnEvItPgKdq63wapN9vBz/X3McFak+H+wPOmHPS5L4IPo+xq2SgaC
	ZKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qo/cQDMT5wz2WuHVDiyIgPaLt4iRXVmyPHsAhFXFtSI=;
	b=LAwlDKRX7rXkOtXt11jJhG96drV6/01A1rvnGlVnhlACYYppcSVVV6WMPjx1Gu7n1s
	MgaDAN5XLIu9tu067shu93nwQ7NFV/xHGVyQnfSBSNaEjWZX37+6mQIv/xRjDxilvgR7
	G13FbtruGgeZG42shZ5oIhrxW7NFXAunOWrK2ybNiYzS69htfcPCJ0pXJ4Y4rKaDjMjW
	FQS5EZMuWd++mWeJ+qQ1I0saX2OVak4I7qheHZLvKtSFomlvO5Ky0viYmDdBN0mpwgnA
	MhQB9lUR4X2oVfjDIPUh4uhc28afMzu3dRBKgyHs3wSPXWU5Vf/W4DRK2IjAnXsMKTKM
	zhGQ==
X-Gm-Message-State: AEkooutiET3gn3PAPt01sdmLMQuPn/q51KzxMifhOH19qUBYSvH129EUW8p+ol5HLPIC4CWbuB5M+wS/NIm/5j/Q
X-Received: by 10.157.46.119 with SMTP id c52mr4236565otd.6.1471597221741;
	Fri, 19 Aug 2016 02:00:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Fri, 19 Aug 2016 01:59:51 -0700 (PDT)
In-Reply-To: <C43D7C6FFC265C429F44FEB1C68F1B25633DBCAA@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <CAJTo0LbCgGpLwVFSd9NCNDSxp6ZW0=i7EQKAYcnL5VBr-UzLqA@mail.gmail.com>
	<1471428098-10774-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<CAJTo0LaGp6_ipQSETzApT+beA-FUGD5jGKv5=0cqubhuhJgukw@mail.gmail.com>
	<C43D7C6FFC265C429F44FEB1C68F1B25633DBCAA@G08CNEXMBPEKD03.g08.fujitsu.local>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 19 Aug 2016 11:59:51 +0300
Message-ID: <CAHiDW_EOqi1qsP3AF_a3oqfg7smFb=EL=puyzyUfH+BK92_pOw@mail.gmail.com>
To: "Wang, Xin" <wangxin2015.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bind: 9.10.3-P3 -> 9.11.0b2
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
X-List-Received-Date: Fri, 19 Aug 2016 09:00:21 -0000
Content-Type: multipart/alternative; boundary=001a113d1334a7a34e053a68ed65

--001a113d1334a7a34e053a68ed65
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 August 2016 at 11:00, Wang, Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> I checked the build directory, and didn=E2=80=99t find those files that y=
ou refer
> to. I guess my configuration may be different with yours. Can I see your
> log.do_configure file, thanks.
>
>
You should not need that. configure.in clearly enables/disables things at
build time based on availability of python and some specific modules. I
don't know if new bind should be built with python or not but the decision
should be explicit in the recipe: --with-python / --without-python look
like the correct options.

Jussi


> *From:* Burton, Ross [mailto:ross.burton@intel.com]
> *Sent:* Thursday, August 18, 2016 10:00 PM
> *To:* Wang, Xin/=E7=8E=8B =E9=91=AB
> *Cc:* OE-core
> *Subject:* Re: [OE-core] [PATCH v2] bind: 9.10.3-P3 -> 9.11.0b2
>
>
>
>
>
> On 17 August 2016 at 11:01, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> wrote:
>
> 4) Modify do_install_append(), since the dnssec-coverage file and
> dnssec-checkds file do not exist.
>
>
>
> When I build bind this happens:
>
>
>
> ERROR: bind-9.11.0b2-r0 do_package: QA Issue: bind: Files/directories wer=
e
> installed but not shipped in any package:
>
>   /usr/lib
>
>   /usr/lib/python2.7
>
>   /usr/lib/python2.7/site-packages
>
>   /usr/lib/python2.7/site-packages/isc-2.0-py2.7.egg-info
>
>   /usr/lib/python2.7/site-packages/isc
>
>   /usr/lib/python2.7/site-packages/isc/parsetab.py
>
>   /usr/lib/python2.7/site-packages/isc/coverage.pyc
>
>   /usr/lib/python2.7/site-packages/isc/keyevent.py
>
>   /usr/lib/python2.7/site-packages/isc/rndc.pyc
>
>   /usr/lib/python2.7/site-packages/isc/keyseries.pyc
>
>   /usr/lib/python2.7/site-packages/isc/keyevent.pyc
>
>   /usr/lib/python2.7/site-packages/isc/checkds.py
>
>   /usr/lib/python2.7/site-packages/isc/__init__.py
>
>   /usr/lib/python2.7/site-packages/isc/keymgr.pyc
>
>   /usr/lib/python2.7/site-packages/isc/keydict.pyc
>
>   /usr/lib/python2.7/site-packages/isc/keymgr.py
>
>   /usr/lib/python2.7/site-packages/isc/__init__.pyc
>
>   /usr/lib/python2.7/site-packages/isc/rndc.py
>
>   /usr/lib/python2.7/site-packages/isc/keyzone.py
>
>   /usr/lib/python2.7/site-packages/isc/eventlist.pyc
>
>   /usr/lib/python2.7/site-packages/isc/checkds.pyc
>
>   /usr/lib/python2.7/site-packages/isc/coverage.py
>
>   /usr/lib/python2.7/site-packages/isc/keyseries.py
>
>   /usr/lib/python2.7/site-packages/isc/keydict.py
>
>   /usr/lib/python2.7/site-packages/isc/eventlist.py
>
>   /usr/lib/python2.7/site-packages/isc/utils.py
>
>   /usr/lib/python2.7/site-packages/isc/policy.py
>
>   /usr/lib/python2.7/site-packages/isc/dnskey.pyc
>
>   /usr/lib/python2.7/site-packages/isc/keyzone.pyc
>
>   /usr/lib/python2.7/site-packages/isc/utils.pyc
>
>   /usr/lib/python2.7/site-packages/isc/policy.pyc
>
>   /usr/lib/python2.7/site-packages/isc/parsetab.pyc
>
>   /usr/lib/python2.7/site-packages/isc/dnskey.py
>
>
>
> I'm guessing there's a non-deterministic dependency on python which is wh=
y
> you thought those tools were not installed, and why I see a build error.
>
>
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a113d1334a7a34e053a68ed65
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
9 August 2016 at 11:00, Wang, Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:w=
angxin2015.fnst@cn.fujitsu.com" target=3D"_blank">wangxin2015.fnst@cn.fujit=
su.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:black">I checked the build directo=
ry, and didn=E2=80=99t find those files that you refer to. I guess my confi=
guration may be different with yours. Can I see your log.do_configure
 file, thanks.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;"></span></b></p></div></div></blockquo=
te><div><br></div><div>You should not need that. <a href=3D"http://configur=
e.in">configure.in</a> clearly enables/disables things at build time based =
on availability of python and some specific modules. I don&#39;t know if ne=
w bind should be built with python or not but the decision should be explic=
it in the recipe: --with-python / --without-python look like the correct op=
tions.=C2=A0</div><div><br></div><div>Jussi</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div lang=3D"EN-US" link=3D"blue" vlink=3D"purple"><d=
iv><p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&q=
uot;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"fon=
t-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Burto=
n, Ross [mailto:<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">=
ross.burton@intel.com</a>]
<br>
<b>Sent:</b> Thursday, August 18, 2016 10:00 PM<br>
<b>To:</b> Wang, Xin/</span><span lang=3D"ZH-CN" style=3D"font-size:10.0pt;=
font-family:=E5=AE=8B=E4=BD=93">=E7=8E=8B</span><span lang=3D"ZH-CN" style=
=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"=
>
</span><span lang=3D"ZH-CN" style=3D"font-size:10.0pt;font-family:=E5=AE=8B=
=E4=BD=93">=E9=91=AB</span><span style=3D"font-size:10.0pt;font-family:&quo=
t;Tahoma&quot;,&quot;sans-serif&quot;"><br>
<b>Cc:</b> OE-core<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2] bind: 9.10.3-P3 -&gt; 9.11.0b2<u><=
/u><u></u></span></p><div><div class=3D"h5">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On 17 August 2016 at 11:01, Wang Xin &lt;<a href=3D"=
mailto:wangxin2015.fnst@cn.fujitsu.com" target=3D"_blank">wangxin2015.fnst@=
cn.fujitsu.<wbr>com</a>&gt; wrote:<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">4) Modify do_install_append(), since the dnssec-cove=
rage file and dnssec-checkds file do not exist.<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">When I build bind this happens:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">ERROR: bind-9.11.0b2-r0 do_package: QA Issue: bind: =
Files/directories were installed but not shipped in any package:<u></u><u><=
/u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages<u></u><=
u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc-2.0=
-py2.7.egg-<wbr>info<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc<u><=
/u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/par=
setab.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/cov=
erage.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/key=
event.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/rnd=
c.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/key=
series.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/key=
event.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/che=
ckds.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/__i=
nit__.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/key=
mgr.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/key=
dict.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/key=
mgr.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/__i=
nit__.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/rnd=
c.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/key=
zone.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/eve=
ntlist.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/che=
ckds.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/cov=
erage.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/key=
series.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/key=
dict.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/eve=
ntlist.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/uti=
ls.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/pol=
icy.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/dns=
key.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/key=
zone.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/uti=
ls.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/pol=
icy.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/par=
setab.pyc<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/python2.7/site-<wbr>packages/isc/dns=
key.py<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I&#39;m guessing there&#39;s a non-deterministic dep=
endency on python which is why you thought those tools were not installed, =
and why I see a build error.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Ross<u></u><u></u></p>
</div>
</div>
</div>
</div></div></div>
</div>

<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div></div>

--001a113d1334a7a34e053a68ed65--
