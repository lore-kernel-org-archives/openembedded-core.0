Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 27E7975894
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 02:24:12 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id d63so2050467ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 18:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=iXK9/aRM23lVSRdo+WY4d9NQjmJ9St+bucAlyViGsgo=;
	b=QhHduLIRf2m9kkiMh0oCiLchhrtWPFTuOVKfXY/HJHxVYYHigjmJT5VUzXVaSHqi+A
	YjGIy4Iy7o75SaZ6OWq2vNRF8WC7aOMgHnE+IUFzdrfvTom6nlVR9QmsnPy92DG8qhXy
	wY9j8JeEkzjwVIFE+Is6uyC2q60VQbIqJNV/edqUeFZ6MnJP4dQBmNB0c9ZSFC3Tn7uf
	/uFYiG9n4dKztfYDU/MhDFk+7GywGGKZ1Qvrfzo2AtgcjLzH2npH8RiRQFZvcKqQyTMy
	8Pl28gtt//sGZRLnVvrv5v4io3p500GHTc/iYSAfJKBX3NrLni1lp5qwSKvn941zuAic
	P5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iXK9/aRM23lVSRdo+WY4d9NQjmJ9St+bucAlyViGsgo=;
	b=QwpldaKC/pCcn65zaIFHyyCuADO21Xl9GBf2OxUhJDWhyGc0UxdQo9hyKS3KEPNeT5
	5gBJn6ND3JFHk4FG2uvgTU9ZftUp9o9JG6nB9D4+eNpRb6ETbqb+EU8xAhX2W8nqsmfY
	eLygW51jXOVhCJgyTbj/nOwxu+T/O9z9WQY05tsm2TVqcOaF8LqWPNzG8I958a1+CecF
	95Urll2TPNKGYEbM3lu7//1JlykymaR9XvA+q/e9Ht4EwkYuIp8DPAaUK5bRTjhbCCSC
	1ehNX2AATP9kxzT4QvJwv7W2krTDg0y4S5Kt8SH9ylGNf/5GTgxR/jf1iMAw4JWfqYKc
	n39w==
X-Gm-Message-State: AG10YOSjivYGGZyUc+z/NLoSuSms8qiJAE46DmBmT4+wYQJ0vcKvoVK07efeZ5nhWVJ8KiwK0Cgow+vejnYzY3OT
X-Received: by 10.107.3.220 with SMTP id e89mr5418914ioi.99.1454379853543;
	Mon, 01 Feb 2016 18:24:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 1 Feb 2016 18:23:54 -0800 (PST)
In-Reply-To: <1454363382-13387-1-git-send-email-armccurdy@gmail.com>
References: <1454363382-13387-1-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Feb 2016 02:23:54 +0000
Message-ID: <CAJTo0LbfKq2CtEj3Y8zBmgQiXPNJF4587R2httpbmsNHgG+mhA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH] curl: disable curl-config binconfig file
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
X-List-Received-Date: Tue, 02 Feb 2016 02:24:13 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7c8a1114052ac03296

--001a113f0e7c8a1114052ac03296
Content-Type: text/plain; charset=UTF-8

On 1 February 2016 at 21:49, Andre McCurdy <armccurdy@gmail.com> wrote:

> This works OK for me, but probably needs wider testing.
>

python-pycurl fails in oe-core:

DEBUG: Executing shell function do_compile
Traceback (most recent call last):
  File
"/data/poky-master/tmp/work/corei7-64-poky-linux/python-pycurl/7.21.5-r0/pycurl-7.21.5/setup.py",
line 743, in <module>
    ext = get_extension(sys.argv,
split_extension_source=split_extension_source)
  File
"/data/poky-master/tmp/work/corei7-64-poky-linux/python-pycurl/7.21.5-r0/pycurl-7.21.5/setup.py",
line 497, in get_extension
    ext_config = ExtensionConfiguration(argv)
  File
"/data/poky-master/tmp/work/corei7-64-poky-linux/python-pycurl/7.21.5-r0/pycurl-7.21.5/setup.py",
line 71, in __init__
    self.configure()
  File
"/data/poky-master/tmp/work/corei7-64-poky-linux/python-pycurl/7.21.5-r0/pycurl-7.21.5/setup.py",
line 113, in configure_unix
    raise ConfigurationError(msg)
__main__.ConfigurationError: `curl-config' not found -- please install the
libcurl development files or specify --curl-config=/path/to/curl-config:
ERROR: /usr/bin/curl-config should not be used, use an alternative such as
pkg-config

Ross

--001a113f0e7c8a1114052ac03296
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 February 2016 at 21:49, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div id=3D":1dw" class=3D"" style=3D"over=
flow:hidden">This works OK for me, but probably needs wider testing.<br></d=
iv></blockquote></div><br>python-pycurl fails in oe-core:</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_e=
xtra">DEBUG: Executing shell function do_compile</div><div class=3D"gmail_e=
xtra">Traceback (most recent call last):</div><div class=3D"gmail_extra">=
=C2=A0 File &quot;/data/poky-master/tmp/work/corei7-64-poky-linux/python-py=
curl/7.21.5-r0/pycurl-7.21.5/setup.py&quot;, line 743, in &lt;module&gt;</d=
iv><div class=3D"gmail_extra">=C2=A0 =C2=A0 ext =3D get_extension(sys.argv,=
 split_extension_source=3Dsplit_extension_source)</div><div class=3D"gmail_=
extra">=C2=A0 File &quot;/data/poky-master/tmp/work/corei7-64-poky-linux/py=
thon-pycurl/7.21.5-r0/pycurl-7.21.5/setup.py&quot;, line 497, in get_extens=
ion</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 ext_config =3D ExtensionC=
onfiguration(argv)</div><div class=3D"gmail_extra">=C2=A0 File &quot;/data/=
poky-master/tmp/work/corei7-64-poky-linux/python-pycurl/7.21.5-r0/pycurl-7.=
21.5/setup.py&quot;, line 71, in __init__</div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0 self.configure()</div><div class=3D"gmail_extra">=C2=A0 File =
&quot;/data/poky-master/tmp/work/corei7-64-poky-linux/python-pycurl/7.21.5-=
r0/pycurl-7.21.5/setup.py&quot;, line 113, in configure_unix</div><div clas=
s=3D"gmail_extra">=C2=A0 =C2=A0 raise ConfigurationError(msg)</div><div cla=
ss=3D"gmail_extra">__main__.ConfigurationError: `curl-config&#39; not found=
 -- please install the libcurl development files or specify --curl-config=
=3D/path/to/curl-config:</div><div class=3D"gmail_extra">ERROR: /usr/bin/cu=
rl-config should not be used, use an alternative such as pkg-config</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv></div>

--001a113f0e7c8a1114052ac03296--
