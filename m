Return-Path: <madhu1313b@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id D10CC6D9AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 10:56:21 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id r9so2380174qtt.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 02:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=PPrlT8ql3G4ce6QBz9DDSdyzsWAgZPQwMNFyvbCTeQI=;
	b=sZEj0y7upzKBA3rHBi868pA/uVBQGT6RuJS3kNgu3HbPAUNZMAFJm93MN7qhSXnFG+
	xDQqTDi+J5Mu0JRGy67nA0LtikUhlGazGVvsQUITNav/pBtYHv9GcbeqpGrYPStdRxf7
	pMrNdv2XUrzQkeSU+6BsDfBfoM6FGNdwudQk5X7ruyu34ePpGLhViwgMHcocZfRG1QAL
	4LhdqtQB652nWWl1vjRN3nNz999WRO1HRkoYcjywQ3eTWMf2KUhuB51C6aK0yvsqNhUF
	ZhokBgGXpQhZwLYaNXKHpvswQ96QbePuRh+X/2ektqC7ww6lDGLfKf3tcgUTp5nsXgmW
	+/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=PPrlT8ql3G4ce6QBz9DDSdyzsWAgZPQwMNFyvbCTeQI=;
	b=fS1Muj2yKn9u2gEP6uvtskaN+96lf6gG/bzaSLQc/rAkKllT8ZmFD2vWET+SnigLve
	DEmhC20TSQeafr4mMG7DtknMVSEIggUZEaJaYnymchajTscGPqhdPLql5Okf23H53rhA
	fOZKi9zIbWsNPu0jq2oQaCdO+m0e99NcnpgJhNHrQxczAF1+/yHiq357HdJvwbMQRX/4
	efa1CDWbI+kpplppeSMZPCmxhvVHwcj37bqOl1CNFBjD0tIuK4lUtXijSCHW69FHZKUO
	iTiwZ7IllhpUjHmsGonrM7Kf9Wt2lE5tRt2JqVOyCnSW2rkRoe/kGDAECYK/pXs91ztP
	q/aA==
X-Gm-Message-State: AHQUAuas8RfLx5ypQVwiJ+VdVpMCmUE5sm6C1wjtqZgs4ZEzkjYULZ+a
	9dKfo/6E0VdvJLCVTpXXAzuqZsKpZrZJHKGukJyMa+P+
X-Google-Smtp-Source: AHgI3IbFtI3PHXro/Xo3OFJFFqsCeDzmw8W1kHmOqxIcjaKO7VgB23uq56Y+BoCMj8VhdDqtr1t57Z96QKsB5Mlsd+c=
X-Received: by 2002:a0c:a326:: with SMTP id u35mr2142883qvu.190.1549968982374; 
	Tue, 12 Feb 2019 02:56:22 -0800 (PST)
MIME-Version: 1.0
References: <CAH5YvUtMEkHQCGZvrnviknkmwQBc_gVNC3cd2f7qb=kCCfk3Kw@mail.gmail.com>
	<CAJTo0LbUuk-EUKwMiemP34dhz51f++qM-psFskqx8bYimoD--Q@mail.gmail.com>
	<CAH5YvUuXHk+7i4be=D_=1JgsoSWPmqK3XNqNVd-0E4sXU=bRjQ@mail.gmail.com>
In-Reply-To: <CAH5YvUuXHk+7i4be=D_=1JgsoSWPmqK3XNqNVd-0E4sXU=bRjQ@mail.gmail.com>
From: Madhu B <madhu1313b@gmail.com>
Date: Tue, 12 Feb 2019 16:26:11 +0530
Message-ID: <CAH5YvUuTyhtSVQ30jJf9_rj_QRwudLLm+WedEu6=ykdeuEnLpw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	"Burton, Ross" <ross.burton@intel.com>
Subject: [poky] Getting an syntax error with 'sed' in systemd-serialgetty.bb
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
X-List-Received-Date: Tue, 12 Feb 2019 10:56:22 -0000
X-Groupsio-MsgNum: 121069
Content-Type: multipart/mixed; boundary="0000000000009b9a4d0581b04630"

--0000000000009b9a4d0581b04630
Content-Type: multipart/alternative; boundary="0000000000009b9a4a0581b0462e"

--0000000000009b9a4a0581b0462e
Content-Type: text/plain; charset="UTF-8"

Hello everyone,
                        There is an syntax error with the usage of sed
command in poky/meta/recipes-core/systemd/systemd-serialgetty.bb, fixed it
and attached the patch file.

Regards,
-Madhu.

---------- Forwarded message ---------
From: Madhu B <madhu1313b@gmail.com>
Date: Tue, Feb 12, 2019 at 4:20 PM
Subject: Re: [poky] Getting an syntax error with 'sed' in
systemd-serialgetty.bb
To: Burton, Ross <ross.burton@intel.com>, <
openembedded-core@lists.openembedded.org>
Cc: Poky Project <poky@yoctoproject.org>


Hi Ross,
                Attached the patch file.

Regards,
-Madhu.

On Tue, Feb 12, 2019 at 3:52 PM Burton, Ross <ross.burton@intel.com> wrote:

> That looks reasonable to me, can you send it as a proper patch
> (git-send-email, nice commit message, signed-off-by tag) to
> openembedded-core@lists.openembedded.org?
>
> Ross
>
> On Tue, 12 Feb 2019 at 06:42, Madhu B <madhu1313b@gmail.com> wrote:
> >
> > Hello everyone,
> >                        While trying to build the AGL image, I am getting
> an syntax error lik e "sed: -e expression #1, char 19: unterminated `s'
> command".
> >
> > With the below patch, I resolved that syntax error.
> > diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb
> b/meta/recipes-core/systemd/systemd-serialgetty.bb
> > index d934716..78b07c2 100644
> > --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> > +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> > @@ -17,7 +17,7 @@ do_install() {
> >                 install -d ${D}${systemd_unitdir}/system/
> >                 install -d
> ${D}${sysconfdir}/systemd/system/getty.target.wants/
> >                 install -m 0644 ${WORKDIR}/serial-getty@.service
> ${D}${systemd_unitdir}/system/
> > -               sed -i -e s/\@BAUDRATE\@/$default_baudrate/g
> ${D}${systemd_unitdir}/system/serial-getty@.service
> > +               sed -i -e 's/\@BAUDRATE\@/$default_baudrate/g'
> ${D}${systemd_unitdir}/system/serial-getty@.service
> >
> >                 tmp="${SERIAL_CONSOLES}"
> >                 for entry in $tmp ; do
> >
> > Is it really missed or am I missing anything?
> >
> > Regards,
> > -Madhu.
> >
> > --
> > _______________________________________________
> > poky mailing list
> > poky@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/poky
>

--0000000000009b9a4a0581b0462e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone,</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 There is an syntax error with the usag=
e of sed command in poky/meta/recipes-core/systemd/<a href=3D"http://system=
d-serialgetty.bb" rel=3D"noreferrer" target=3D"_blank">systemd-serialgetty.=
bb</a>, fixed it and attached the patch file.</div><div><br></div><div>Rega=
rds,</div><div>-Madhu.<br></div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">---------- Forwarded message ---------<br>Fr=
om: <b class=3D"gmail_sendername" dir=3D"auto">Madhu B</b> <span dir=3D"ltr=
">&lt;<a href=3D"mailto:madhu1313b@gmail.com" target=3D"_blank">madhu1313b@=
gmail.com</a>&gt;</span><br>Date: Tue, Feb 12, 2019 at 4:20 PM<br>Subject: =
Re: [poky] Getting an syntax error with &#39;sed&#39; in <a href=3D"http://=
systemd-serialgetty.bb" target=3D"_blank">systemd-serialgetty.bb</a><br>To:=
 Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank=
">ross.burton@intel.com</a>&gt;,  &lt;<a href=3D"mailto:openembedded-core@l=
ists.openembedded.org" target=3D"_blank">openembedded-core@lists.openembedd=
ed.org</a>&gt;<br>Cc: Poky Project &lt;<a href=3D"mailto:poky@yoctoproject.=
org" target=3D"_blank">poky@yoctoproject.org</a>&gt;<br></div><br><br><div =
dir=3D"ltr"><div>Hi Ross,</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Attached the patch file=
.</div><div><br></div><div>Regards,</div><div>-Madhu.<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb =
12, 2019 at 3:52 PM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">That looks reasonable to me, can =
you send it as a proper patch<br>
(git-send-email, nice commit message, signed-off-by tag) to<br>
<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blan=
k">openembedded-core@lists.openembedded.org</a>?<br>
<br>
Ross<br>
<br>
On Tue, 12 Feb 2019 at 06:42, Madhu B &lt;<a href=3D"mailto:madhu1313b@gmai=
l.com" target=3D"_blank">madhu1313b@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello everyone,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 While trying to build the AGL image, I am getting an syntax e=
rror lik e &quot;sed: -e expression #1, char 19: unterminated `s&#39; comma=
nd&quot;.<br>
&gt;<br>
&gt; With the below patch, I resolved that syntax error.<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-seria=
lgetty.bb" rel=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a> =
b/meta/recipes-core/systemd/<a href=3D"http://systemd-serialgetty.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a><br>
&gt; index d934716..78b07c2 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd-serialgetty.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-serialgetty.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a><br>
&gt; @@ -17,7 +17,7 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -=
d ${D}${systemd_unitdir}/system/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -=
d ${D}${sysconfdir}/systemd/system/getty.target.wants/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -=
m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e s/\@=
BAUDRATE\@/$default_baudrate/g ${D}${systemd_unitdir}/system/serial-getty@.=
service<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39=
;s/\@BAUDRATE\@/$default_baudrate/g&#39; ${D}${systemd_unitdir}/system/seri=
al-getty@.service<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp=3D&qu=
ot;${SERIAL_CONSOLES}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for entry=
 in $tmp ; do<br>
&gt;<br>
&gt; Is it really missed or am I missing anything?<br>
&gt;<br>
&gt; Regards,<br>
&gt; -Madhu.<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; poky mailing list<br>
&gt; <a href=3D"mailto:poky@yoctoproject.org" target=3D"_blank">poky@yoctop=
roject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/poky" rel=3D"norefe=
rrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/poky</a><br=
>
</blockquote></div>
</div></div></div>

--0000000000009b9a4a0581b0462e--

--0000000000009b9a4d0581b04630
Content-Type: application/x-patch; 
	name="0001-systemd-serialgetty.bb-Fix-the-syntax-error-related-.patch"
Content-Disposition: attachment; 
	filename="0001-systemd-serialgetty.bb-Fix-the-syntax-error-related-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_js1n9j380>
X-Attachment-Id: f_js1n9j380

RnJvbSBlNzRhMTkzMWFmOWM1Yjg4MzM0NTM0NWEwM2E2YTllYmY2ODIxY2IwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYWRodSA8bWFkaHUxMzEzYkBnbWFpbC5jb20+CkRhdGU6IFR1
ZSwgMTIgRmViIDIwMTkgMTY6MDM6NDcgKzA1MzAKU3ViamVjdDogW1BBVENIXSBzeXN0ZW1kLXNl
cmlhbGdldHR5LmJiOiBGaXggdGhlIHN5bnRheCBlcnJvciByZWxhdGVkIHRvIHNlZAoKVGhlIGN1
cnJlbnQgc3ludGF4IG9mIHNlZCBpcyBub3QgY29ycmVjdCwgaXQgd2lsbCByZXBvcnQgYW4gY29t
cGlsZQp0aW1lIGVycm9yIGFzIGJlbG93OgogInNlZDogLWUgZXhwcmVzc2lvbiAjMSwgY2hhciAx
OTogdW50ZXJtaW5hdGVkIGBzJyBjb21tYW5kIgoKU2lnbmVkLW9mZi1ieTogTWFkaHUgPG1hZGh1
MTMxM2JAZ21haWwuY29tPgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1z
ZXJpYWxnZXR0eS5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVt
ZC1zZXJpYWxnZXR0eS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1zZXJp
YWxnZXR0eS5iYgppbmRleCBkOTM0NzE2Li43OGIwN2MyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtc2VyaWFsZ2V0dHkuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvc3lzdGVtZC9zeXN0ZW1kLXNlcmlhbGdldHR5LmJiCkBAIC0xNyw3ICsxNyw3IEBAIGRv
X2luc3RhbGwoKSB7CiAJCWluc3RhbGwgLWQgJHtEfSR7c3lzdGVtZF91bml0ZGlyfS9zeXN0ZW0v
CiAJCWluc3RhbGwgLWQgJHtEfSR7c3lzY29uZmRpcn0vc3lzdGVtZC9zeXN0ZW0vZ2V0dHkudGFy
Z2V0LndhbnRzLwogCQlpbnN0YWxsIC1tIDA2NDQgJHtXT1JLRElSfS9zZXJpYWwtZ2V0dHlALnNl
cnZpY2UgJHtEfSR7c3lzdGVtZF91bml0ZGlyfS9zeXN0ZW0vCi0JCXNlZCAtaSAtZSBzL1xAQkFV
RFJBVEVcQC8kZGVmYXVsdF9iYXVkcmF0ZS9nICR7RH0ke3N5c3RlbWRfdW5pdGRpcn0vc3lzdGVt
L3NlcmlhbC1nZXR0eUAuc2VydmljZQorCQlzZWQgLWkgLWUgJ3MvXEBCQVVEUkFURVxALyRkZWZh
dWx0X2JhdWRyYXRlL2cnICR7RH0ke3N5c3RlbWRfdW5pdGRpcn0vc3lzdGVtL3NlcmlhbC1nZXR0
eUAuc2VydmljZQogCiAJCXRtcD0iJHtTRVJJQUxfQ09OU09MRVN9IgogCQlmb3IgZW50cnkgaW4g
JHRtcCA7IGRvCi0tIAoxLjkuMQoK

--0000000000009b9a4d0581b04630--
