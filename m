Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id DA66773D46
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 10:33:37 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so86031502qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 02:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hB4KVLfDm8QDzObXv2tSSa26ROlRiLSvqFDUzZuZ8qg=;
	b=HiZl1HxCPZG707p9W2+nG3LO4VJGkSbiLthtmyFq4V2idmnHz6Z7lSajcTpOJl2iJY
	DH/qZUWxfOe+OK5ASHanGx2ssy1eJSoze+RUXBXMd1fpMGGMikCHdqBY7o9azM4sHlYP
	kZNOxZVczQgS7jXfl25IZUD/WRrjCEp0QkJrGGTg+Dclgs2/S7VZgw2IDdbhyeeI7yu5
	imPD0hqtvibWwG/maYmi91CEOi9qbOlp7i3Y060k25FgBb8nV32oZYYK3NqTdp67PfNh
	zwXFmYHan9OdzJURr364u2kgNxs5LJAWFMab5mRE+REDZBH6jJbnMd1ecBwYfXe1nmYs
	5MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hB4KVLfDm8QDzObXv2tSSa26ROlRiLSvqFDUzZuZ8qg=;
	b=BK17FRD297NVQTkkdE+ybmFia10VbZoP8JHzjcc17PFUv4q6HsTRj5nEK23BMdFWd/
	rupzpZO8kDeA/uEpBvw9WZtUxeR6uKnkei2j90rdxhqFsTFebHfHSMrvBBb0FHBDLV60
	5cos7IdmXTW540X9cbh93BTRg/0y0caFhG46tyZUlHFOUHgzpgI67Uz18FSv1nGh1NKW
	yamHqYVBoz8moYHWX2IFKXacQ28Xm0J0jm0F+woY6qt2o9jJi1yr7jqw9BNNYi5PbEEa
	Qur6g0CB0GjhG6ftFX7+HRY+XIsSeKgPyokhU9Cjz44dwhrDl2YB2lv+5OpXvrQZ+Fxr
	fv5A==
X-Gm-Message-State: ALoCoQmS7rYHCci2Q38TNLMqjl1g4NpKBoEeJAGkZ2uyrsdUSa+klOKAhvH9+XiMF3KItjcUgKqk
X-Received: by 10.141.28.76 with SMTP id f73mr30029445qhe.17.1447065217834;
	Mon, 09 Nov 2015 02:33:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Mon, 9 Nov 2015 02:33:18 -0800 (PST)
In-Reply-To: <b6a5e9973afe805490f6aee8967026bc47f2692b.1445333081.git.liezhi.yang@windriver.com>
References: <cover.1445333081.git.liezhi.yang@windriver.com>
	<b6a5e9973afe805490f6aee8967026bc47f2692b.1445333081.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Nov 2015 10:33:18 +0000
Message-ID: <CAJTo0LaOD2_=aDwHi9fjGzWZ2+hcMtUnjHMFsSOTABWiozuSTQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] bitbake-prserv-tool: check file name
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
X-List-Received-Date: Mon, 09 Nov 2015 10:33:38 -0000
Content-Type: multipart/alternative; boundary=001a11423d0c46b7b10524192010

--001a11423d0c46b7b10524192010
Content-Type: text/plain; charset=UTF-8

On 20 October 2015 at 10:25, Robert Yang <liezhi.yang@windriver.com> wrote:

> Fixed:
> $ bitbake-prserv-tool import /tmp/1
>   File "/path/to/lib/bb/parse/__init__.py", line 114, in
> handle(fn='/tmp/1', data=<bb.data_smart.DataSmart object at 0x2369bd0>,
> include=True):
>                      return h['handle'](fn, data, include)
>     >    raise ParseError("not a BitBake file", fn)
>
> ParseError: ParseError in /tmp/1: not a BitBake file
>
> But 1.conf works well, its help also shows "<file.conf>", so check the
> filename and print proper error message.
>

This breaks the selftest:

======================================================================
FAIL: test_import_export_override_db
(oeqa.selftest.prservice.BitbakePrTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/decorators.py",
line 106, in wrapped_f
    return func(*args, **kwargs)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/prservice.py",
line 97, in test_import_export_override_db
    self.run_test_pr_export_import('m4', replace_current_db=False)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/prservice.py",
line 74, in run_test_pr_export_import
    self.assertEqual(export_result.status, 0, msg="PR Service database
export failed: %s" % export_result.output)
AssertionError: 1 != 0 : PR Service database export failed: ERROR:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/export.inc
must end with .conf!

======================================================================
FAIL: test_import_export_replace_db (oeqa.selftest.prservice.BitbakePrTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/decorators.py",
line 106, in wrapped_f
    return func(*args, **kwargs)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/prservice.py",
line 93, in test_import_export_replace_db
    self.run_test_pr_export_import('m4')
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/prservice.py",
line 74, in run_test_pr_export_import
    self.assertEqual(export_result.status, 0, msg="PR Service database
export failed: %s" % export_result.output)
AssertionError: 1 != 0 : PR Service database export failed: ERROR:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/export.inc
must end with .conf!

Ross

--001a11423d0c46b7b10524192010
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 October 2015 at 10:25, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div style=3D"overflow:hidden">=
Fixed:<br>
$ bitbake-<span>prserv</span>-tool import /tmp/1<br>
=C2=A0 File &quot;/path/to/lib/bb/parse/__init__.py&quot;, line 114, in han=
dle(fn=3D&#39;/tmp/1&#39;, data=3D&lt;bb.data_smart.DataSmart object at 0x2=
369bd0&gt;, include=3DTrue):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return h[&#39;handle&#39;](fn, data, include)<br>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 raise ParseError(&quot;not a BitBake file&q=
uot;, fn)<br>
<br>
ParseError: ParseError in /tmp/1: not a BitBake file<br>
<br>
But 1.conf works well, its help also shows &quot;&lt;file.conf&gt;&quot;, s=
o check the<br>
filename and print proper error message.</div></blockquote></div><br>This b=
reaks the=C2=A0selftest:</div><div class=3D"gmail_extra"><br>=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>FAIL: test_import_expor=
t_override_db (oeqa.selftest.prservice.BitbakePrTests)<br>-----------------=
-----------------------------------------------------<br>Traceback (most re=
cent call last):<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yoc=
to-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/decorators.py&quot;=
, line 106, in wrapped_f<br>=C2=A0 =C2=A0 return func(*args, **kwargs)<br>=
=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe=
-selftest/build/meta/lib/oeqa/selftest/prservice.py&quot;, line 97, in test=
_import_export_override_db<br>=C2=A0 =C2=A0 self.run_test_pr_export_import(=
&#39;m4&#39;, replace_current_db=3DFalse)<br>=C2=A0 File &quot;/home/pokybu=
ild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/=
selftest/prservice.py&quot;, line 74, in run_test_pr_export_import<br>=C2=
=A0 =C2=A0 self.assertEqual(export_result.status, 0, msg=3D&quot;PR Service=
 database export failed: %s&quot; % export_result.output)<br>AssertionError=
: 1 !=3D 0 : PR Service database export failed: ERROR: /home/pokybuild/yoct=
o-autobuilder/yocto-worker/nightly-oe-selftest/build/build/export.inc must =
end with .conf!<br><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>FAIL: test_import_export_replace_db (oeqa.selftest.prservice.B=
itbakePrTests)<br>---------------------------------------------------------=
-------------<br>Traceback (most recent call last):<br>=C2=A0 File &quot;/h=
ome/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta=
/lib/oeqa/utils/decorators.py&quot;, line 106, in wrapped_f<br>=C2=A0 =C2=
=A0 return func(*args, **kwargs)<br>=C2=A0 File &quot;/home/pokybuild/yocto=
-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/=
prservice.py&quot;, line 93, in test_import_export_replace_db<br>=C2=A0 =C2=
=A0 self.run_test_pr_export_import(&#39;m4&#39;)<br>=C2=A0 File &quot;/home=
/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/li=
b/oeqa/selftest/prservice.py&quot;, line 74, in run_test_pr_export_import<b=
r>=C2=A0 =C2=A0 self.assertEqual(export_result.status, 0, msg=3D&quot;PR Se=
rvice database export failed: %s&quot; % export_result.output)<br>Assertion=
Error: 1 !=3D 0 : PR Service database export failed: ERROR: /home/pokybuild=
/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/export.inc =
must end with .conf!<br><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a11423d0c46b7b10524192010--
