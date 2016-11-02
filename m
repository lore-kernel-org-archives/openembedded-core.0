Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9882C605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 11:04:41 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id o68so13183733qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FZ5uxtkLXyBQyN0kswNKcob4LRXru7NWOE0mUfP7oQg=;
	b=mbT/Fo7p2N77LBOVPrL/TXPKwdIYU6CS7hl53js86cJsUV9koWsv5k6Mfp/bL3x2TH
	Pa5ql0//ujnhrHC9RCb7TFGKc+oiaYxBY/+owOcLcvlZUvN2gtD9GlrXaD0plh6hxPLh
	2uQ7gw+gJ2o+6eOD0HSaAcPZJQsOvi1o2DExpIx8u45ceL/v734hABge2JypDvnUIl9a
	KfwuWxPywJvh2kAY8MzCcs9CoOIEQ2FkIrLrDg1glOhCniEVNYO8E12Ez72vDE7zOcsk
	Qw6ACICCVSzaafprS47jlNa7RXKq5iMhmDd0suc7xo6Jmx+Mxt+botodQfTxp98g6VwK
	/33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FZ5uxtkLXyBQyN0kswNKcob4LRXru7NWOE0mUfP7oQg=;
	b=B1Bc7rbQkCztbORds6uH7LVwT3c+BtX7QwKpJB5/SeB7CdYNEe9bnf6GwSveC+Eqw5
	PPGWiy41pax9OxI4mOfZBxT68VJiNoI8dt4UQqGaN+tuQiVddd9FCPWVW1Bo13fdd0BI
	KzlNTynB/umNxo5h+NtKJNWCwXTBQ1CZbpEMFoOLOjqysBCMe2CxDFEnrGQ7Okk0c15y
	HKOxlnhUPEeTrRUGUU8OA2+tI4vhIa8LlqpjfExbUDWqxgN6ii8ZtlHZ1y6qJ9YrPpy8
	RzdpZfZIIf6l4N4u4uVkrYn3uK3uGvZliC/hhULlALQ6J0rb/T5QpS6S6PtHEreqy7+B
	Y9tg==
X-Gm-Message-State: ABUngvcUy9jK/OnNrRUxquhqy0ZZNK1m+GYeN+7ZUlValw4DPOQx00TaGFjem/Wj1uSsdiuViYVaRU1k9tYtQLdq
X-Received: by 10.55.31.157 with SMTP id n29mr2410463qkh.221.1478084682473;
	Wed, 02 Nov 2016 04:04:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 04:04:22 -0700 (PDT)
In-Reply-To: <1478030040-20670-4-git-send-email-fabio.berton@ossystems.com.br>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
	<1478030040-20670-4-git-send-email-fabio.berton@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 11:04:22 +0000
Message-ID: <CAJTo0LbZrrrcvMmqpb943oarTKY6B=UkmszpdFLv=3cWqCV9SA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] serf: Update to version 1.3.9
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
X-List-Received-Date: Wed, 02 Nov 2016 11:04:42 -0000
Content-Type: multipart/alternative; boundary=001a1147f2287277f005404f68d9

--001a1147f2287277f005404f68d9
Content-Type: text/plain; charset=UTF-8

On 1 November 2016 at 19:53, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> -SRC_URI = "http://snapshot.debian.org/archive/debian/
> 20160728T043443Z/pool/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz \
> +SRC_URI = "https://www.apache.org/dist/${PN}/${PN}-${PV}.tar.bz2 \
>

The reason we download from snapshot.debian.org is that apache.org/dist/
only contains the latest release (see http://apache.org/dist/serf/) so the
moment 1.4.0 is released the tarball will disappear.

If apache maintains an archive of *all* releases with a stable URL then
that would be preferable to snapshot.debian.org, but relying on
apache.org/dist/ isn't possible.

Ross

--001a1147f2287277f005404f68d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 November 2016 at 19:53, Fabio Berton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@ossyst=
ems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:p8" =
class=3D"gmail-a3s gmail-aXjCH gmail-m158217aab2569672">-SRC_URI =3D &quot;=
<a href=3D"http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/=
main/s/${BPN}/${BPN}_${PV}.orig.tar.gz" rel=3D"noreferrer" target=3D"_blank=
">http://snapshot.debian.org/<wbr>archive/debian/<wbr>20160728T043443Z/pool=
/main/s/$<wbr>{BPN}/${BPN}_${PV}.orig.tar.gz</a> \<br>
+SRC_URI =3D &quot;<a href=3D"https://www.apache.org/dist/${PN}/${PN}-${PV}=
.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https://www.apache.org/dist/=
$<wbr>{PN}/${PN}-${PV}.tar.bz2</a> \</div></blockquote></div><br>The reason=
 we download from <a href=3D"http://snapshot.debian.org">snapshot.debian.or=
g</a> is that <a href=3D"http://apache.org/dist/">apache.org/dist/</a> only=
 contains the latest release (see=C2=A0<a href=3D"http://apache.org/dist/se=
rf/">http://apache.org/dist/serf/</a>) so the moment 1.4.0 is released the =
tarball will disappear.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">If apache maintains an archive of *all* releases with a s=
table URL then that would be preferable to <a href=3D"http://snapshot.debia=
n.org">snapshot.debian.org</a>, but relying on <a href=3D"http://apache.org=
/dist/">apache.org/dist/</a> isn&#39;t possible.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147f2287277f005404f68d9--
