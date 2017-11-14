Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id B628F784FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 23:13:38 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id v21so5379833ioi.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 15:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6Tmjg79BmcCT5J3MkjHUoYDjLL1jw4oNY3X615jYQRU=;
	b=eGKw3URlgzVxxgYDL5DQcco4fpYIimR/Oi1RyUyt7xKIeS4hkceKb1MOPtCjAuPjfq
	SO0FBhG80EknJsPCorqVoMBLBUr7tm5nPHFBXPayCUvyET66ZJEDZnVpU9V1KhM5YiL+
	8Mw82v6tFGjIF70nQlzXzTO8ghRH8ZWFbaKLPMKuv4+zCyyRfk9XrhWNf7qsJGvzZOq5
	KcSTsAN8L0wNcpxx+D41lbnU9XuJJKm7xZaRv7McEpxg0nJvQjPfA4mjtYiEfTkG/hC2
	J9sShZMsRlwFeqllzANNpPM5+knD20+PuwlTR2GmniCBSGSCRpPITltZIMOe+8/PpZD5
	H4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6Tmjg79BmcCT5J3MkjHUoYDjLL1jw4oNY3X615jYQRU=;
	b=K05kvBN+PLl980Hgt4YzP6j7eYZZ+7qAQwwh9YoyBnof5HqQNS9t2YRkxEGqdBD9JB
	2QtViLwKq2seJx7hLaHdF9jWhOlBJGj7on1GE6XMIBGGhprcy1DzfeR6K6aoq7+RKWLz
	Z1dvbkwzlOZVE7x4mbCfdct+LO8cc2+lpgY7OJ4o9KqKpGvpxz7ZPJ3wb/+tgMXX+zJJ
	ve1qns7sqOc3WQE2DYJgP6zdIcX/cPQGXTYTC/fm8Tl/qhVi8/0dupjMgZSUuDo+tO61
	k9yI3+DJ8cbW6L1rv5ZNvPv+F17EB/FwTVoduFBdD7pTGln6PfWWK0C6cM8y/79hZd0M
	YhgA==
X-Gm-Message-State: AJaThX5kdFQjr/yfVBOSD9aGlTh9e1MCc8wLIDrj8ngErXb/6eEOLhMD
	lgfYFLnli/GYuGfPOwEfDJkaOdJ4hnO/rNQ3lkY28w==
X-Google-Smtp-Source: AGs4zMav1oqH5libkQRkizewiXHNX41Z792f5OXsxIDSKjdZLI5FD5RnuIuQS5mSFoooYWrsx8rFaDwONc1lrddrBMg=
X-Received: by 10.107.146.86 with SMTP id u83mr16347917iod.37.1510701219132;
	Tue, 14 Nov 2017 15:13:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Tue, 14 Nov 2017 15:13:18 -0800 (PST)
In-Reply-To: <1510700700.3005.34.camel@sdl.usu.edu>
References: <1510698639-3858-1-git-send-email-jhaws@sdl.usu.edu>
	<20171114230258.2787.25990@do.openembedded.org>
	<1510700700.3005.34.camel@sdl.usu.edu>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Nov 2017 23:13:18 +0000
Message-ID: <CAJTo0Lbv_qAyXZTQd1=T7SZTnVh=Q2SbHp5dSRLQ7c5A4Vmuxg@mail.gmail.com>
To: Jonathan Haws <jhaws@sdl.usu.edu>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG1hcmlhZGI6IEFkZGVkIG1pc3NpbmcgaW5zdGFsbGF0aW9uIG9mIG15c3FsZF9zYWZlX2hlbHBlciB0byBGSUxFU18ke1BOfS1zZXJ2ZXIgKHJldjIp?=
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
X-List-Received-Date: Tue, 14 Nov 2017 23:13:38 -0000
Content-Type: multipart/alternative; boundary="94eb2c054fa6875a42055df98914"

--94eb2c054fa6875a42055df98914
Content-Type: text/plain; charset="UTF-8"

meta-oe patches go to openembedded-devel@.  -core@ is for oe-core
specifically.

Ross

On 14 November 2017 at 23:05, Jonathan Haws <jhaws@sdl.usu.edu> wrote:

> On Tue, 2017-11-14 at 23:02 +0000, Patchwork wrote:
> > == Series Details ==
> >
> > Series: mariadb: Added missing installation of mysqld_safe_helper to
> > FILES_${PN}-server (rev2)
> > Revision: 2
> > URL   : https://patchwork.openembedded.org/series/9784/
> > State : failure
> >
> > == Summary ==
> >
> >
> > Thank you for submitting this patch series to OpenEmbedded Core. This
> > is
> > an automated response. Several tests have been executed on the
> > proposed
> > series by patchtest resulting in the following failures:
> >
> >
> >
> > * Patch            [meta-oe, v2, meta-oe] mariadb: Added missing
> > installation of mysqld_safe_helper to FILES_${PN}-server
> >  Issue             Series sent to the wrong mailing list
> > [test_target_mailing_list]
> >   Suggested fix    Check the project's README (meta-oe, v2, meta-oe)
> > and send the patch to the indicated list
> >
> > * Issue             Series does not apply on top of target branch
> > [test_series_merge_on_head]
> >   Suggested fix    Rebase your series on top of targeted branch
> >   Targeted branch  master (currently at a17f3ec910)
> >
>
> What am I missing here?  I first applied this to the top of the rocko
> branch, then this one to the top of the master branch.  Neither one had
> hash a17f3ec910.  Does this need to go to a different list?  I was
> under the impression this was the right one?
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c054fa6875a42055df98914
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">meta-oe patches go to openembedded-devel@. =C2=A0-core@ is=
 for oe-core specifically.<div><br></div><div>Ross</div></div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On 14 November 2017 at 23:05, =
Jonathan Haws <span dir=3D"ltr">&lt;<a href=3D"mailto:jhaws@sdl.usu.edu" ta=
rget=3D"_blank">jhaws@sdl.usu.edu</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><span class=3D"">On Tue, 2017-11-14 at 23:02 +0000, Patchwor=
k wrote:<br>
&gt; =3D=3D Series Details =3D=3D<br>
&gt;<br>
&gt; Series: mariadb: Added missing installation of mysqld_safe_helper to<b=
r>
&gt; FILES_${PN}-server (rev2)<br>
&gt; Revision: 2<br>
&gt; URL=C2=A0=C2=A0=C2=A0: <a href=3D"https://patchwork.openembedded.org/s=
eries/9784/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>op=
enembedded.org/series/9784/</a><br>
&gt; State : failure<br>
&gt;<br>
&gt; =3D=3D Summary =3D=3D<br>
&gt;<br>
&gt;<br>
&gt; Thank you for submitting this patch series to OpenEmbedded Core. This<=
br>
&gt; is<br>
&gt; an automated response. Several tests have been executed on the<br>
&gt; proposed<br>
&gt; series by patchtest resulting in the following failures:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; * Patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0[meta-oe, v2, meta-oe] mariadb: Added missing<br>
&gt; installation of mysqld_safe_helper to FILES_${PN}-server<br>
&gt; =C2=A0Issue=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0Series sent to the wrong mailing list<br>
&gt; [test_target_mailing_list]=C2=A0<br>
&gt; =C2=A0 Suggested fix=C2=A0=C2=A0=C2=A0=C2=A0Check the project&#39;s RE=
ADME (meta-oe, v2, meta-oe)<br>
&gt; and send the patch to the indicated list<br>
&gt;<br>
&gt; * Issue=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0Series does not apply on top of target branch<br>
&gt; [test_series_merge_on_head]=C2=A0<br>
&gt; =C2=A0 Suggested fix=C2=A0=C2=A0=C2=A0=C2=A0Rebase your series on top =
of targeted branch<br>
&gt; =C2=A0 Targeted branch=C2=A0=C2=A0master (currently at a17f3ec910)<br>
&gt;<br>
<br>
</span>What am I missing here?=C2=A0 I first applied this to the top of the=
 rocko<br>
branch, then this one to the top of the master branch.=C2=A0 Neither one ha=
d<br>
hash=C2=A0a17f3ec910.=C2=A0 Does this need to go to a different list?=C2=A0=
 I was<br>
under the impression this was the right one?<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c054fa6875a42055df98914--
