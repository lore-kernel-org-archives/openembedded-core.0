Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id F09A271BEE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 15:05:19 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 87so5917698ior.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 07:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=um+WibQPG7Ehdz0cqNl8rCBrmGio6Yiyu/Ps9cKUg9I=;
	b=AWvabxIqVaQQp01QP5IEcIXLfvGyCje63gMEksp6opQcDClK+jGnZWKksebwoDMUqN
	m5ZRiN/7zfH/S6WpQJDsyb93MdQDYsYcGXGA8B02bWDS00OVSRmy5XiTy22sKU6qADVc
	r0e6k9ZWpOKPbk0Iy1qxBapzGmMNU754Y/Zhvd/xh3XF4aM+y8tMM2LgNqqyJkKO4drV
	B2YpU5B3wohKNXXQniphU3+jd6cvgeuYpbM7Zh4pTWwp17qBnsL/j3WNYPTVgiN/baxk
	Ihk/c8tc9MI3HaFgqaY7rzpLTMgtOC9rV26HqMnkE6nPwcDewMHEfWIivO0SJ/Uqkb8z
	eo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=um+WibQPG7Ehdz0cqNl8rCBrmGio6Yiyu/Ps9cKUg9I=;
	b=PxkwjANcjkrvoCxyGAo6PTeJJ96lEpXnFsFGasbNDz/OD0TkV1XpeThQBYkPKI04GQ
	PgCyllvgdd2tF/xxkXHIdPAnHz4b+pmUO4LErmDsxo/+deuSj3bIOr3YspyZEqvo+vbx
	5QgDbtiWBt0AqO4f5xlzRpXYrF3wp5ox27oDEfFtM7FugvyJBuJu+ERYgN/8VZiqthC2
	hJuuzatiq/O+ksIIEFC/xraYPucwz2DEfGgB2vXiPZUMWyvG4nWVgg7kg77fNBbGWEX4
	BGtMxpZ2oqyvlrqQuRGa+VntQ48hV9A6Kpk/VbAmp4dusEfHH0uS+YdrtTwSCjVUo94Q
	DpWw==
X-Gm-Message-State: AKGB3mKx0oUge8q0uFVlI68mkUTIDEqwWETp2WbndrGg9GxI2SkV/4W1
	/ObR+/ONpmUn7c7K8iWcaezeKHR7zPasMyLqa5NG1w==
X-Google-Smtp-Source: ACJfBotJWCEyFcNmQQBsoOOj7yDEVbusyXBz5Too0baciYCDcBst8kwQZU9SzgtZQVWPND/pNgJL4iPKfMAG+dUMnLM=
X-Received: by 10.107.47.1 with SMTP id j1mr1563ioo.217.1513609521073; Mon, 18
	Dec 2017 07:05:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.141.20 with HTTP; Mon, 18 Dec 2017 07:05:00 -0800 (PST)
In-Reply-To: <1f6d1fa417f9a7128168b0ad934f4ae75a8198e3.1513527416.git.akuster@mvista.com>
References: <cover.1513527416.git.akuster@mvista.com>
	<1f6d1fa417f9a7128168b0ad934f4ae75a8198e3.1513527416.git.akuster@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Dec 2017 15:05:00 +0000
Message-ID: <CAJTo0Lb6JfFMJAH7_1Sph-VwhJ_6aD=-YXtWBfBSH8GWMT8Hcw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] bind: Update to 9.11.2
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
X-List-Received-Date: Mon, 18 Dec 2017 15:05:20 -0000
Content-Type: multipart/alternative; boundary="001a11377fbcd52e7105609ead26"

--001a11377fbcd52e7105609ead26
Content-Type: text/plain; charset="UTF-8"

On 17 December 2017 at 16:34, Armin Kuster <akuster808@gmail.com> wrote:

> From: Armin Kuster <akuster@mvista.com>
>
> New License (mpl-2.0) and LICESE file.
>
> New features in bind 9.11
> see: https://www.isc.org/wp-content/uploads/2016/09/BIND9.
> 11NewFeatures.pdf
>
> add zlib PACKAGECONF
>

packages/corei7-64-poky-linux/bind/bind-doc: FILELIST: removed
"/usr/share/man/man8/dnssec-checkds.8
/usr/share/man/man8/dnssec-coverage.8", added "/usr/share/man/man1/mdig.1"

I see you're removing those binaries from a sed, so have they been removed
entirely?  Are they somewhere else, or just disabled?

packages/corei7-64-poky-linux/bind/bind: FILELIST: removed
"/usr/lib/python3.5/site-packages/isc/__pycache__/dnskey.cpython-35.pyc
/usr/lib/python3.5/site-packages/isc/__pycache__/coverage.cpython-35.pyc
/usr/lib/python3.5/site-packages/isc/eventlist.py
/usr/lib/python3.5/site-packages/isc/keyevent.py
/usr/lib/python3.5/site-packages/isc-1.0-py3.5.egg-info
/usr/lib/python3.5/site-packages/isc/__pycache__/eventlist.cpython-35.pyc
/usr/lib/python3.5/site-packages/isc/keydict.py
/usr/lib/python3.5/site-packages/isc/__pycache__/keyzone.cpython-35.pyc
/usr/lib/python3.5/site-packages/isc/__pycache__/keydict.cpython-35.pyc
/usr/lib/python3.5/site-packages/isc/__pycache__/checkds.cpython-35.pyc
/usr/lib/python3.5/site-packages/isc/checkds.py /usr/sbin/dnssec-coverage
/usr/lib/python3.5/site-packages/isc/keyzone.py
/usr/lib/python3.5/site-packages/isc/__init__.py
/usr/lib/python3.5/site-packages/isc/__pycache__/utils.cpython-35.pyc
/usr/sbin/dnssec-checkds
/usr/lib/python3.5/site-packages/isc/__pycache__/keyevent.cpython-35.pyc
/usr/lib/python3.5/site-packages/isc/__pycache__/__init__.cpython-35.pyc
/usr/lib/python3.5/site-packages/isc/dnskey.py
/usr/lib/python3.5/site-packages/isc/coverage.py
/usr/lib/python3.5/site-packages/isc/utils.py", added "/usr/bin/mdig"

All the Python bindings have disappeared, is this intentional?

Ross

--001a11377fbcd52e7105609ead26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 December 2017 at 16:34, Armin Kuster <span dir=3D"lt=
r">&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808=
@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:r=
gb(204,204,204);padding-left:1ex">From: Armin Kuster &lt;<a href=3D"mailto:=
akuster@mvista.com">akuster@mvista.com</a>&gt;<br>
<br>
New License (mpl-2.0) and LICESE file.<br>
<br>
New features in bind 9.11<br>
see: <a href=3D"https://www.isc.org/wp-content/uploads/2016/09/BIND9.11NewF=
eatures.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.isc.org/wp-<w=
br>content/uploads/2016/09/BIND9.<wbr>11NewFeatures.pdf</a><br>
<br>
add zlib PACKAGECONF<br></blockquote><div><br></div><div>packages/corei7-64=
-poky-linux/bind/bind-doc: FILELIST: removed &quot;/usr/share/man/man8/dnss=
ec-checkds.8 /usr/share/man/man8/dnssec-coverage.8&quot;, added &quot;/usr/=
share/man/man1/mdig.1&quot;</div><div><br></div><div>I see you&#39;re remov=
ing those binaries from a sed, so have they been removed entirely?=C2=A0 Ar=
e they somewhere else, or just disabled?</div><div><br></div><div>packages/=
corei7-64-poky-linux/bind/bind: FILELIST: removed &quot;/usr/lib/python3.5/=
site-packages/isc/__pycache__/dnskey.cpython-35.pyc /usr/lib/python3.5/site=
-packages/isc/__pycache__/coverage.cpython-35.pyc /usr/lib/python3.5/site-p=
ackages/isc/eventlist.py /usr/lib/python3.5/site-packages/isc/keyevent.py /=
usr/lib/python3.5/site-packages/isc-1.0-py3.5.egg-info /usr/lib/python3.5/s=
ite-packages/isc/__pycache__/eventlist.cpython-35.pyc /usr/lib/python3.5/si=
te-packages/isc/keydict.py /usr/lib/python3.5/site-packages/isc/__pycache__=
/keyzone.cpython-35.pyc /usr/lib/python3.5/site-packages/isc/__pycache__/ke=
ydict.cpython-35.pyc /usr/lib/python3.5/site-packages/isc/__pycache__/check=
ds.cpython-35.pyc /usr/lib/python3.5/site-packages/isc/checkds.py /usr/sbin=
/dnssec-coverage /usr/lib/python3.5/site-packages/isc/keyzone.py /usr/lib/p=
ython3.5/site-packages/isc/__init__.py /usr/lib/python3.5/site-packages/isc=
/__pycache__/utils.cpython-35.pyc /usr/sbin/dnssec-checkds /usr/lib/python3=
.5/site-packages/isc/__pycache__/keyevent.cpython-35.pyc /usr/lib/python3.5=
/site-packages/isc/__pycache__/__init__.cpython-35.pyc /usr/lib/python3.5/s=
ite-packages/isc/dnskey.py /usr/lib/python3.5/site-packages/isc/coverage.py=
 /usr/lib/python3.5/site-packages/isc/utils.py&quot;, added &quot;/usr/bin/=
mdig&quot;</div><div><br></div><div>All the Python bindings have disappeare=
d, is this intentional?</div><div><br></div><div>Ross=C2=A0</div></div></di=
v></div>

--001a11377fbcd52e7105609ead26--
