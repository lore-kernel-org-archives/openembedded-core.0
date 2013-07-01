Return-Path: <v.mayoralv@gmail.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id B35EF6A468
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 13:40:29 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id i3so3594000vbh.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=jVSSeNG2C4oXf77pFARuX+d5GI8lMvyF0IyZGCqKsp4=;
	b=zzoU6f347dskLKvYfKxtef7MdVpmZW09E7KCq+gXGnca8N4q73gRARI0kDjPDCUO5w
	uaLhHSs6RE7Gq2L4SUp5YFRfimnotT+0lseid02Jmf/5zZVbRB8sDaqGpky0VLOpBh/r
	BF173c3RZ3FFrPm6rVt4wZ0qWssCTGQ9aOnVR0YB6tUDgClHfcNBCAjBOngUI/5mNoHD
	J1No1OEU8dQaiWgmn8OIiEOrNnps16StrqXUDaAiAX4HGNVQxCrg6St8YRq2MMMNHICn
	vpl8hW7TFnwzInG4hScO+ckJnQWTKJOizUfwp96jtMnWch/7/1hSS+PMVHn8hQA+I2Aj
	Qp3g==
MIME-Version: 1.0
X-Received: by 10.52.34.40 with SMTP id w8mr8050550vdi.7.1372686030297; Mon,
	01 Jul 2013 06:40:30 -0700 (PDT)
Received: by 10.58.210.42 with HTTP; Mon, 1 Jul 2013 06:40:30 -0700 (PDT)
In-Reply-To: <CAKpQ200meOQcEu+vwbWBQpVC+FtvJw1uXLVV2qufvLud5aEvLg@mail.gmail.com>
References: <CAKpQ200meOQcEu+vwbWBQpVC+FtvJw1uXLVV2qufvLud5aEvLg@mail.gmail.com>
Date: Mon, 1 Jul 2013 15:40:30 +0200
Message-ID: <CAKpQ2036MNwGmDOxGFxYc6WmQoiLam7_L3h8LkQZZSOjcMHHgg@mail.gmail.com>
From: =?ISO-8859-1?Q?V=EDctor_MV?= <v.mayoralv@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: apr: Add EXTRA_OECONF += "apr_cv_mutex_recursive=yes"
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
X-List-Received-Date: Mon, 01 Jul 2013 13:40:29 -0000
X-Groupsio-MsgNum: 41235
Content-Type: multipart/mixed; boundary=20cf307cfec03966c604e0735f33

--20cf307cfec03966c604e0735f33
Content-Type: multipart/alternative; boundary=20cf307cfec03966c304e0735f31

--20cf307cfec03966c304e0735f31
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Updated the commit message and patch.


2013/7/1 V=EDctor MV <v.mayoralv@gmail.com>

> Working with the meta-ros project we detected that the ROS nodes didn't
> launch properly the reason was that by default apr_cv_mutex_recursive in
> apr is set to no and this leads to the APRENOTIMPL return value of
> apr_thread_mutex_create in thread_mutex.c when APR_THREAD_MUTEX_NESTED is
> requested via flags. Added EXTRA_OECONF +=3D "apr_cv_mutex_recursive=3Dye=
s" to
> sources/openembedded-core/meta/recipes-support/apr/apr_1.4.6.bb to fix
> this issue.
>
> Regards,
>
> V=EDctor.
>
>

--20cf307cfec03966c304e0735f31
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Updated the commit message and patch.</div><div class=3D"g=
mail_extra"><br><br><div class=3D"gmail_quote">2013/7/1 V=EDctor MV <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:v.mayoralv@gmail.com" target=3D"_blank">v.=
mayoralv@gmail.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Working with the meta-=
ros project we detected that the ROS nodes didn&#39;t launch properly the r=
eason was that by default apr_cv_mutex_recursive in apr is set to no and th=
is leads to the APRENOTIMPL return value of apr_thread_mutex_create in thre=
ad_mutex.c when APR_THREAD_MUTEX_NESTED is requested via flags. Added EXTRA=
_OECONF +=3D &quot;apr_cv_mutex_recursive=3Dyes&quot; to sources/openembedd=
ed-core/meta/recipes-support/apr/<a href=3D"http://apr_1.4.6.bb" target=3D"=
_blank">apr_1.4.6.bb</a> to fix this issue.</div>

<div><br></div><div>Regards,</div><div><br></div><div>V=EDctor.</div><div><=
br></div></div>
</blockquote></div><br></div>

--20cf307cfec03966c304e0735f31--

--20cf307cfec03966c604e0735f33
Content-Type: application/octet-stream; 
	name="0001-Patch-to-apr_1.4.6.bb-to-make-rosnodes-work.patch"
Content-Disposition: attachment; 
	filename="0001-Patch-to-apr_1.4.6.bb-to-make-rosnodes-work.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hilptf9t1

RnJvbSAxY2NmYzEwYzBhZmVjN2M2ZmQ3MzgwNGUxYWM0OGNjNDZmZDMxZWIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiB2aWN0b3IgPHYubWF5b3JhbHZAZ21haWwuY29tPgpEYXRlOiBN
b24sIDEgSnVsIDIwMTMgMTQ6NDY6NDIgKzAyMDAKU3ViamVjdDogW1BBVENIXSBhcHIgdXNlIGEg
QUNfVFJZX1JVTiB0byBjaGVjayBpZiBQVEhSRUFEX01VVEVYX1JFQ1VSU0lWRSBpcyBzdXBwb3J0
ZWQgYW5kIHRoaXMgZG9uJ3Qgd29yayBvbiBjcm9zcyBjb21waWxlLgoKQnkgZGVmYXVsdCBhcHJf
Y3ZfbXV0ZXhfcmVjdXJzaXZlIGluIGFwciBpcyBzZXQgdG8gbm8gYW5kIHRoaXMgbGVhZHMgdG8g
dGhlIEFQUkVOT1RJTVBMIHJldHVybiB2YWx1ZSBvZiBhcHJfdGhyZWFkX211dGV4X2NyZWF0ZSBp
biB0aHJlYWRfbXV0ZXguYyB3aGVuIEFQUl9USFJFQURfTVVURVhfTkVTVEVEIGlzIHJlcXUgICAg
ZXN0ZWQgdmlhIGZsYWdzLiBBZGRlZCBFWFRSQV9PRUNPTkYgKz0gImFwcl9jdl9tdXRleF9yZWN1
cnNpdmU9eWVzIiB0byBzb3VyY2VzL29wZW5lbWJlZGRlZC1jb3JlL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2Fwci9hcHJfMS40LjYuYmIuCgpTaWduZWQtb2ZmLWJ5OiBWw61jdG9yIE1heW9yYWwgVmls
Y2hlcyA8di5tYXlvcmFsdkBnbWFpbC5jb20+Ci0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBy
L2Fwcl8xLjQuNi5iYiB8ICAgIDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwcl8xLjQuNi5iYiBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHJfMS40LjYuYmIKaW5kZXggODk2Zjc5Zi4uOTIwMGRj
YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwcl8xLjQuNi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHIvYXByXzEuNC42LmJiCkBAIC0yMyw2ICsyMyw5IEBA
IGluaGVyaXQgYXV0b3Rvb2xzIGxpYl9wYWNrYWdlIGJpbmNvbmZpZyBtdWx0aWxpYl9oZWFkZXIK
IAogT0VfQklOQ09ORklHX0VYVFJBX01BTkdMRSA9ICIgLWUgJ3M6bG9jYXRpb249c291cmNlOmxv
Y2F0aW9uPWluc3RhbGxlZDonIgogCisjIEFkZGVkIHRvIGZpeCByb3Nub2RlIGlzc3Vlcy4gUmVm
ZXIgdG8gaHR0cHM6Ly9naXRodWIuY29tL2Jtd2Nhcml0L21ldGEtcm9zL2lzc3Vlcy82OCNpc3N1
ZWNvbW1lbnQtMTk4OTY5MjgKK0VYVFJBX09FQ09ORiArPSAiYXByX2N2X211dGV4X3JlY3Vyc2l2
ZT15ZXMiCisKIGRvX2NvbmZpZ3VyZV9wcmVwZW5kKCkgewogCWNkICR7U30KIAkuL2J1aWxkY29u
ZgotLSAKMS43LjkuNQoK

--20cf307cfec03966c604e0735f33--
