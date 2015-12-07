Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9C70360124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 19:49:21 +0000 (UTC)
Received: by igl9 with SMTP id 9so81557219igl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 11:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=M+J85RMLQ7b1G/Up2AnVS/sLElgIWzjigrTWmOZke+o=;
	b=QaggRDsm8hkY+4IhyKI2yCrefOdpfW4m6j5mnQS/MH+1GQD9IyGGGpjRZKQY/Ypugu
	y1cOXybqM5kmVfpwEXfNg6dTM1iyTCj5QAz0s2igo0ycD8ewRAwLgjDF5C3O8lVWfCYI
	6AZdy0lKseipuDi1b2gE086fmzCskUHS8MRcmYq1Xxj+fDVb70YazsUT2ucZlb3jSf4x
	e+lMaKoe5rOnDp+woKJmFIKRayGFqXa06P2oas6VvnAfhsCYsZBwxzJ95miPqO8hQIyT
	d8QbfOjwnx0VZkY7LSuiLAgQC1dHPykrj4B8xB1hIXg7/ufViLhzZQUAEMSzxbfDAJdK
	vGww==
X-Received: by 10.50.78.161 with SMTP id c1mr197210igx.10.1449517761769; Mon,
	07 Dec 2015 11:49:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.69.129 with HTTP; Mon, 7 Dec 2015 11:49:02 -0800 (PST)
In-Reply-To: <CACS+7ZR-KmxgSjSOptx_E3w4dFbMz_90munhQPcCfcEmvdV2DA@mail.gmail.com>
References: <cover.1447371049.git.chris_larson@mentor.com>
	<130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
	<05b7cc8c957a9756e7af964a09bc2a89e0aedd9f.1447371049.git.chris_larson@mentor.com>
	<CACS+7ZR-KmxgSjSOptx_E3w4dFbMz_90munhQPcCfcEmvdV2DA@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 7 Dec 2015 12:49:02 -0700
Message-ID: <CABcZANn0wr+1GgYiPVkpTbqVLfOZOK44xZEtPDxdLfSaJgx6Qg@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd: add myhostname to nsswitch.conf
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
X-List-Received-Date: Mon, 07 Dec 2015 19:49:24 -0000
Content-Type: multipart/alternative; boundary=089e0111e07a4946200526542735

--089e0111e07a4946200526542735
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 17, 2015 at 8:49 PM, Dan McGregor <danismostlikely@gmail.com>
wrote:

> On 12 Nov 2015 5:41 p.m., "Christopher Larson" <kergoth@gmail.com> wrote:
> >
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > We don't need nss-myhostname on systemd systems, because systemd already
> > provides myhostname, but we weren't configuring nsswitch to use it.
> Being able
> > to resolve the hostname is useful for a number of different
> applications, so
> > enable it using the same postinst/prerm bits which are in nss-myhostname.
>
> I have this and a similar change for resolved in an append at work. Would
> others be interested in that too?
>

I'm sure there are folks that would find that interesting. I'm sure not
everyone uses resolved, but I'm sure we want it to work well for folks taht
do want to use it.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0111e07a4946200526542735
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Nov 17, 2015 at 8:49 PM, Dan McGregor <span dir=3D"ltr">&lt;<a href=
=3D"mailto:danismostlikely@gmail.com" target=3D"_blank">danismostlikely@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D""><p dir=3D"ltr">On 12 Nov 2015 5:41 p.m., &quot;Christopher Larson&quo=
t; &lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail=
.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; We don&#39;t need nss-myhostname on systemd systems, because systemd a=
lready<br>
&gt; provides myhostname, but we weren&#39;t configuring nsswitch to use it=
. Being able<br>
&gt; to resolve the hostname is useful for a number of different applicatio=
ns, so<br>
&gt; enable it using the same postinst/prerm bits which are in nss-myhostna=
me.</p>
</span><p dir=3D"ltr">I have this and a similar change for resolved in an a=
ppend at work. Would others be interested in that too?</p></blockquote></di=
v><br>I&#39;m sure there are folks that would find that interesting. I&#39;=
m sure not everyone uses resolved, but I&#39;m sure we want it to work well=
 for folks taht do want to use it.<br>-- <br><div class=3D"gmail_signature"=
><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder=
 - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Softwa=
re Engineer, Mentor Graphics</div></div>
</div></div>

--089e0111e07a4946200526542735--
