Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id B158B766E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 14:00:04 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id m101so19554734ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 07:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fLbIgxYlXnWDmjytcj+BwAeFVyKrwcsARyuJGpWcD1c=;
	b=XfXtHA0IX20dYiqSeo/D45qSZoCJyHrbNnhgB3/Y9zzsqgDZN8AokTgWddOAqtYRYe
	EFZFGi0KdDJ0NKJ54pu5PFKtBE178dXw6r4wm/Yfv1E9anDMuLKEhzltJ7qyJjkHkEnL
	m945RnWltUTlhaNRgZG54EKnOWtO2l6r9pVI+RgU+nkgm95p2ZDgE3nnD3zr47wtxVQf
	x5D+d1ts8z0eBXu0oHyvuYGtqB2I55+kLNBufcC13WP8/J7bfPsZWpA0jHGX9slvhrLt
	8nuNDpmTeD7KjAftQCigL1NiN2sCZpnEsO932LpE4R8ej/Ivx4WoetvedB/5XrUibeNM
	BzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fLbIgxYlXnWDmjytcj+BwAeFVyKrwcsARyuJGpWcD1c=;
	b=cjF54D5jtylfMlbVcL/0rgdadE3wT/DbDe3VyK6htRxtKTOCCTTwdmQRce6/cinPse
	oMRgn0L3d90AY6tHwUM8AgOlrTGBnkHPd0LavS/oA91xdf4uCSJT+e4/4WJCSLl8rOqq
	2H/+01POsr81Vw+8+7tBdkStWiqdTrOdLrXFn5Uec9a3JvGlUejnS6BL2I47V2KX6t8J
	isXEGcb1fT/1m3RqP7wCxl3yWEGGADZophR947UZZbdjQemqBLf5WA5YsO0BwZg+Mess
	IM34I0iOIa+fTGQrDHMg3hV2ovUtdy54UNE+BxluYKWLJ63/XqvCnCXlG4R5jkS4TBul
	hxXA==
X-Gm-Message-State: AEkoouuoUS2FD30appfUJR4HpIF0uinz0x/QPczp5h7RU6rroE6HaIAnx/+ZEgmLw62P1tf/yqx/r9UzZs3jmVw3
X-Received: by 10.107.154.196 with SMTP id c187mr3181884ioe.99.1471528804828; 
	Thu, 18 Aug 2016 07:00:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 18 Aug 2016 06:59:44 -0700 (PDT)
In-Reply-To: <1471428098-10774-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <CAJTo0LbCgGpLwVFSd9NCNDSxp6ZW0=i7EQKAYcnL5VBr-UzLqA@mail.gmail.com>
	<1471428098-10774-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Aug 2016 14:59:44 +0100
Message-ID: <CAJTo0LaGp6_ipQSETzApT+beA-FUGD5jGKv5=0cqubhuhJgukw@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
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
X-List-Received-Date: Thu, 18 Aug 2016 14:00:04 -0000
Content-Type: multipart/alternative; boundary=001a1140e81eb07200053a58ff21

--001a1140e81eb07200053a58ff21
Content-Type: text/plain; charset=UTF-8

On 17 August 2016 at 11:01, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> 4) Modify do_install_append(), since the dnssec-coverage file and
> dnssec-checkds file do not exist.
>

When I build bind this happens:

ERROR: bind-9.11.0b2-r0 do_package: QA Issue: bind: Files/directories were
installed but not shipped in any package:
  /usr/lib
  /usr/lib/python2.7
  /usr/lib/python2.7/site-packages
  /usr/lib/python2.7/site-packages/isc-2.0-py2.7.egg-info
  /usr/lib/python2.7/site-packages/isc
  /usr/lib/python2.7/site-packages/isc/parsetab.py
  /usr/lib/python2.7/site-packages/isc/coverage.pyc
  /usr/lib/python2.7/site-packages/isc/keyevent.py
  /usr/lib/python2.7/site-packages/isc/rndc.pyc
  /usr/lib/python2.7/site-packages/isc/keyseries.pyc
  /usr/lib/python2.7/site-packages/isc/keyevent.pyc
  /usr/lib/python2.7/site-packages/isc/checkds.py
  /usr/lib/python2.7/site-packages/isc/__init__.py
  /usr/lib/python2.7/site-packages/isc/keymgr.pyc
  /usr/lib/python2.7/site-packages/isc/keydict.pyc
  /usr/lib/python2.7/site-packages/isc/keymgr.py
  /usr/lib/python2.7/site-packages/isc/__init__.pyc
  /usr/lib/python2.7/site-packages/isc/rndc.py
  /usr/lib/python2.7/site-packages/isc/keyzone.py
  /usr/lib/python2.7/site-packages/isc/eventlist.pyc
  /usr/lib/python2.7/site-packages/isc/checkds.pyc
  /usr/lib/python2.7/site-packages/isc/coverage.py
  /usr/lib/python2.7/site-packages/isc/keyseries.py
  /usr/lib/python2.7/site-packages/isc/keydict.py
  /usr/lib/python2.7/site-packages/isc/eventlist.py
  /usr/lib/python2.7/site-packages/isc/utils.py
  /usr/lib/python2.7/site-packages/isc/policy.py
  /usr/lib/python2.7/site-packages/isc/dnskey.pyc
  /usr/lib/python2.7/site-packages/isc/keyzone.pyc
  /usr/lib/python2.7/site-packages/isc/utils.pyc
  /usr/lib/python2.7/site-packages/isc/policy.pyc
  /usr/lib/python2.7/site-packages/isc/parsetab.pyc
  /usr/lib/python2.7/site-packages/isc/dnskey.py

I'm guessing there's a non-deterministic dependency on python which is why
you thought those tools were not installed, and why I see a build error.

Ross

--001a1140e81eb07200053a58ff21
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 August 2016 at 11:01, Wang Xin <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:wangxin2015.fnst@cn.fujitsu.com" target=3D"_blank">wangxin2015.fnst@cn.fu=
jitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":3uf" class=
=3D"">4) Modify do_install_append(), since the dnssec-coverage file and dns=
sec-checkds file do not exist.<div class=3D""><div id=3D":3tf" class=3D"" t=
abindex=3D"0"></div></div></div></blockquote></div><br><div class=3D"gmail_=
extra">When I build bind this happens:</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">ERROR: bind-9.11.0b2-r0 do_package: QA Iss=
ue: bind: Files/directories were installed but not shipped in any package:<=
/div><div class=3D"gmail_extra">=C2=A0 /usr/lib</div><div class=3D"gmail_ex=
tra">=C2=A0 /usr/lib/python2.7</div><div class=3D"gmail_extra">=C2=A0 /usr/=
lib/python2.7/site-packages</div><div class=3D"gmail_extra">=C2=A0 /usr/lib=
/python2.7/site-packages/isc-2.0-py2.7.egg-info</div><div class=3D"gmail_ex=
tra">=C2=A0 /usr/lib/python2.7/site-packages/isc</div><div class=3D"gmail_e=
xtra">=C2=A0 /usr/lib/python2.7/site-packages/isc/parsetab.py</div><div cla=
ss=3D"gmail_extra">=C2=A0 /usr/lib/python2.7/site-packages/isc/coverage.pyc=
</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/python2.7/site-packages/is=
c/keyevent.py</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/python2.7/sit=
e-packages/isc/rndc.pyc</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/pyt=
hon2.7/site-packages/isc/keyseries.pyc</div><div class=3D"gmail_extra">=C2=
=A0 /usr/lib/python2.7/site-packages/isc/keyevent.pyc</div><div class=3D"gm=
ail_extra">=C2=A0 /usr/lib/python2.7/site-packages/isc/checkds.py</div><div=
 class=3D"gmail_extra">=C2=A0 /usr/lib/python2.7/site-packages/isc/__init__=
.py</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/python2.7/site-packages=
/isc/keymgr.pyc</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/python2.7/s=
ite-packages/isc/keydict.pyc</div><div class=3D"gmail_extra">=C2=A0 /usr/li=
b/python2.7/site-packages/isc/keymgr.py</div><div class=3D"gmail_extra">=C2=
=A0 /usr/lib/python2.7/site-packages/isc/__init__.pyc</div><div class=3D"gm=
ail_extra">=C2=A0 /usr/lib/python2.7/site-packages/isc/rndc.py</div><div cl=
ass=3D"gmail_extra">=C2=A0 /usr/lib/python2.7/site-packages/isc/keyzone.py<=
/div><div class=3D"gmail_extra">=C2=A0 /usr/lib/python2.7/site-packages/isc=
/eventlist.pyc</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/python2.7/si=
te-packages/isc/checkds.pyc</div><div class=3D"gmail_extra">=C2=A0 /usr/lib=
/python2.7/site-packages/isc/coverage.py</div><div class=3D"gmail_extra">=
=C2=A0 /usr/lib/python2.7/site-packages/isc/keyseries.py</div><div class=3D=
"gmail_extra">=C2=A0 /usr/lib/python2.7/site-packages/isc/keydict.py</div><=
div class=3D"gmail_extra">=C2=A0 /usr/lib/python2.7/site-packages/isc/event=
list.py</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/python2.7/site-pack=
ages/isc/utils.py</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/python2.7=
/site-packages/isc/policy.py</div><div class=3D"gmail_extra">=C2=A0 /usr/li=
b/python2.7/site-packages/isc/dnskey.pyc</div><div class=3D"gmail_extra">=
=C2=A0 /usr/lib/python2.7/site-packages/isc/keyzone.pyc</div><div class=3D"=
gmail_extra">=C2=A0 /usr/lib/python2.7/site-packages/isc/utils.pyc</div><di=
v class=3D"gmail_extra">=C2=A0 /usr/lib/python2.7/site-packages/isc/policy.=
pyc</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/python2.7/site-packages=
/isc/parsetab.pyc</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/python2.7=
/site-packages/isc/dnskey.py</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">I&#39;m guessing there&#39;s a non-deterministic dep=
endency on python which is why you thought those tools were not installed, =
and why I see a build error.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div></div>

--001a1140e81eb07200053a58ff21--
