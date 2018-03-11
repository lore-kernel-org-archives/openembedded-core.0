Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E9C2A78752
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 01:21:38 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id e194so10151014wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 17:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DgA/5g1r1RT2JoxXeNLzETmcd/4Cht9HFMws53piULU=;
	b=rF4/nFwZ+yGHgDE+G7HY3uzyqe2G/n/ofgDbqLytMKwQ1ZKNtiK4eoA6lqTDnA7PhC
	ydj5P7ZIOkTj9HkWmSvDkLkdu+VI0+T0mMzFj6NQ6qk2qp3UwLh7gdnixx/as2lR2gd8
	DtDX7dPFFUjFhMYa5wYR2e0VJr3HJPSLYtpirP/ZhRbS3PPms9JRt1e8kaid5ZeydeSY
	CBRqtLhKS/gm5cHu2OKx1LRb8MfqAbIE3gk3EJmIL7ZsEF72dJQ21eR+EwdPdZqewf5I
	8PfXgFdJiqC7GI5AEvnFXv7iFY8fjxS1tw+0xFcrl6gB3TsbO1pTyRJY2M3F3Pj/s63e
	pg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DgA/5g1r1RT2JoxXeNLzETmcd/4Cht9HFMws53piULU=;
	b=LCUeaNe0LEhEKi1UN9zPu4umS3ZKUhtlehBvt6xqz+kyGnPTHKmNtz5LmhPfnFP+qr
	Yos61NQbLA8w5+RdV0lcDpUtRveILpuJYRs3Yc9PDkVRk96XAk6zDi0lmLlTRzRs5qsJ
	DE0CU6yRuv8BArZQftPXHdPLxP54UhFuB37Ab3W7K/dkRgC2kOHswGD/sfX88G32p1F1
	M580Eg5fl71+es6MUo7hHLpyuJuFMox+lsf7gtQh/9wi3/cxpdzHRKHqPPDAMFUgMtgv
	+KFeHNBKv6TuPrwpQhxgHwW0qTXInWiH9jYQhc3+FI+xCQgyDmYWG1eBHfdTw2GZCPWz
	hXFQ==
X-Gm-Message-State: AElRT7GQwBl08ebTLkYx5Z2O8K/xKsthicZlPITtlL+neawSZx6vf1yi
	LqTbCno1MyfejuPSnakSzoxWrO/JvDaOo/iS+K5dNw==
X-Google-Smtp-Source: AG47ELseKnb/OlXpt1mq2GMXGwfLjrPHTEeImILIccMNA2+JBe3dB/xUe1PO+Ra+pUG7XfuIPpzORc3uaTisFn/Z67Y=
X-Received: by 10.28.212.141 with SMTP id l135mr1916093wmg.122.1520731299908; 
	Sat, 10 Mar 2018 17:21:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Sat, 10 Mar 2018 17:21:39 -0800 (PST)
In-Reply-To: <CAJ86T=Xwc3XPMp9G2y5c-noa6OiHuUkszLJMzefF2y20pLHQMw@mail.gmail.com>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
	<20180310000058.15536.85416@do.openembedded.org>
	<CAJ86T=Xwc3XPMp9G2y5c-noa6OiHuUkszLJMzefF2y20pLHQMw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Mar 2018 02:21:39 +0100
Message-ID: <CA+chaQea+2-xbUM5DmmPDh0vWk4rxK5AosKOzsUb7VS1U-ybfQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGdjYzY6IFVwZ3JhZGUgdG8gNi40LjAgKGxhdGVzdCBzdGFibGUgc2VyaWVzIHJlbGVhc2UpIChyZXYzKQ==?=
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
X-List-Received-Date: Sun, 11 Mar 2018 01:21:39 -0000
Content-Type: multipart/alternative; boundary="001a11469594ee10c0056718d841"

--001a11469594ee10c0056718d841
Content-Type: text/plain; charset="UTF-8"

Heh, I made the same mistake, I did remember that you sent some e-mail that
there was v2 on the ML.

So to be sure I've cherry-picked this one from your branch instead of
cherry-picking from patchwork which already had your change included 2 more
times in various pull requests from Khem:
https://patchwork.openembedded.org/project/oe-core/patches/?submitter=&state=&q=LPAE&archive=&delegate=

so instead of checking which version was the correct one, I've
cherry-picked it from your branch..

.. and only after the patchtest complained again, I've read the 2nd half of
your message saying that your morty branch has v1 :).

Fixed in my branches:

To git+ssh://git.openembedded.org/openembedded-core-contrib
 + 67f3094d7e...d4176ea2b1 jansa/morty -> jansa/morty (forced update)
 + 16250e9dba...155936a8e5 jansa/morty-backports -> jansa/morty-backports
(forced update)
 + e619b8bef6...3367e9d602 jansa/pyro -> jansa/pyro (forced update)
 + e48f581764...8283b4ee52 jansa/pyro-backports -> jansa/pyro-backports
(forced update)
 + a6bd32a657...5530f852e9 jansa/rocko -> jansa/rocko (forced update)
 + 0aae0b0579...56b25745e3 jansa/rocko-backports -> jansa/rocko-backports
(forced update)


On Sat, Mar 10, 2018 at 4:30 AM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, Mar 9, 2018 at 4:00 PM, Patchwork
> <patchwork@patchwork.openembedded.org> wrote:
> > == Series Details ==
> >
> > Series: gcc6: Upgrade to 6.4.0 (latest stable series release) (rev3)
> > Revision: 3
> > URL   : https://patchwork.openembedded.org/series/11226/
> > State : failure
> >
> > == Summary ==
> >
> > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > an automated response. Several tests have been executed on the proposed
> > series by patchtest resulting in the following failures:
> >
> > * Issue             Upstream-Status is in incorrect format
> [test_upstream_status_presence_format]
> >   Suggested fix    Fix Upstream-Status format in
> 0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
> >   Current          UpStream-Status: Backport
> >   Standard format  Upstream-Status: <Valid status>
> >   Valid status     Pending, Accepted, Backport, Denied, Inappropriate
> [reason], Submitted [where]
>
> The v2 patch was sent to the list here:
>
>   http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-November/144159.html
>
> but it seems my morty branch still has the v1 patch with the typo...
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11469594ee10c0056718d841
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Heh, I made the same mistake, I did remember that you sent=
 some e-mail that there was v2 on the ML.<div><br></div><div>So to be sure =
I&#39;ve cherry-picked this one from your branch instead of cherry-picking =
from patchwork which already had your change included 2 more times in vario=
us pull requests from Khem:</div><div><a href=3D"https://patchwork.openembe=
dded.org/project/oe-core/patches/?submitter=3D&amp;state=3D&amp;q=3DLPAE&am=
p;archive=3D&amp;delegate=3D">https://patchwork.openembedded.org/project/oe=
-core/patches/?submitter=3D&amp;state=3D&amp;q=3DLPAE&amp;archive=3D&amp;de=
legate=3D</a></div><div><br></div><div>so instead of checking which version=
 was the correct one, I&#39;ve cherry-picked it from your branch..=C2=A0</d=
iv><div><br></div><div>.. and only after the patchtest complained again, I&=
#39;ve read the 2nd half of your message saying that your morty branch has =
v1 :).<br><div><div><br></div><div>Fixed in my branches:</div><div><br></di=
v><div><div>To git+ssh://<a href=3D"http://git.openembedded.org/openembedde=
d-core-contrib">git.openembedded.org/openembedded-core-contrib</a></div><di=
v>=C2=A0+ 67f3094d7e...d4176ea2b1 jansa/morty -&gt; jansa/morty (forced upd=
ate)</div><div>=C2=A0+ 16250e9dba...155936a8e5 jansa/morty-backports -&gt; =
jansa/morty-backports (forced update)</div><div>=C2=A0+ e619b8bef6...3367e9=
d602 jansa/pyro -&gt; jansa/pyro (forced update)</div><div>=C2=A0+ e48f5817=
64...8283b4ee52 jansa/pyro-backports -&gt; jansa/pyro-backports (forced upd=
ate)</div><div>=C2=A0+ a6bd32a657...5530f852e9 jansa/rocko -&gt; jansa/rock=
o (forced update)</div><div>=C2=A0+ 0aae0b0579...56b25745e3 jansa/rocko-bac=
kports -&gt; jansa/rocko-backports (forced update)</div></div><div><br></di=
v></div></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Sat, Mar 10, 2018 at 4:30 AM, Andre McCurdy <span dir=3D"ltr">&lt;<a =
href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On =
Fri, Mar 9, 2018 at 4:00 PM, Patchwork<br>
&lt;<a href=3D"mailto:patchwork@patchwork.openembedded.org">patchwork@patch=
work.<wbr>openembedded.org</a>&gt; wrote:<br>
&gt; =3D=3D Series Details =3D=3D<br>
&gt;<br>
&gt; Series: gcc6: Upgrade to 6.4.0 (latest stable series release) (rev3)<b=
r>
&gt; Revision: 3<br>
&gt; URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series=
/11226/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openem=
bedded.org/series/11226/</a><br>
&gt; State : failure<br>
&gt;<br>
&gt; =3D=3D Summary =3D=3D<br>
&gt;<br>
&gt; Thank you for submitting this patch series to OpenEmbedded Core. This =
is<br>
&gt; an automated response. Several tests have been executed on the propose=
d<br>
&gt; series by patchtest resulting in the following failures:<br>
&gt;<br>
&gt; * Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Upstream-Status=
 is in incorrect format [test_upstream_status_<wbr>presence_format]<br>
&gt;=C2=A0 =C2=A0Suggested fix=C2=A0 =C2=A0 Fix Upstream-Status format in 0=
001-enable-FL_LPAE-flag-for-<wbr>armv7ve-cores.patch<br>
&gt;=C2=A0 =C2=A0Current=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UpStream-Status:=
 Backport<br>
&gt;=C2=A0 =C2=A0Standard format=C2=A0 Upstream-Status: &lt;Valid status&gt=
;<br>
&gt;=C2=A0 =C2=A0Valid status=C2=A0 =C2=A0 =C2=A0Pending, Accepted, Backpor=
t, Denied, Inappropriate [reason], Submitted [where]<br>
<br>
</span>The v2 patch was sent to the list here:<br>
<br>
=C2=A0 <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core=
/2017-November/144159.html" rel=3D"noreferrer" target=3D"_blank">http://lis=
ts.openembedded.org/<wbr>pipermail/openembedded-core/<wbr>2017-November/144=
159.html</a><br>
<br>
but it seems my morty branch still has the v1 patch with the typo...<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a11469594ee10c0056718d841--
