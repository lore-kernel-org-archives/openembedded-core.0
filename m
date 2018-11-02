Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D39686FFC8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 17:08:09 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s10-v6so2599843wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 10:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=pMiU0I8T7lfw4p96S9TPx3wn5ZvNhTmMpfGP1cyyOSg=;
	b=mxf8YqyMqio/K5q0gAegQe4Y1HgPDXKDVU3/gesy3PnqF8sGb6U4CAhguj+JYzilyG
	GRrYCOt2CcrexAm4MoGA7NTu5iKjfwbBTZCaE1f7eyl2FjZ3z4l45z3s/z/c2tq2uPxw
	TLc/0WQJhYOtnP5pXiUjsMiZHUdO+//lDsYD9f1KQnTmcy59ScVzRcMF7hbQupOysv0w
	fDIiPUdnVzssRLJs86HpRJOMvpxq1MP0jF0ABPj/knyqCZEgYMfxI13QkIpNnkeAquDT
	+1uYWGj4AUuhwrebzMXexLvooQS9oXkCGDmA3U3RTCHEottN5ELR7WNxP4j/hBydXRmH
	DJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=pMiU0I8T7lfw4p96S9TPx3wn5ZvNhTmMpfGP1cyyOSg=;
	b=JYWMroin45K5obHMegf9rNAOu4LCqgZGmt+ocd93oYfAVCnhsKAbZ/q4j02PpAEL+Z
	B0P8rVMmS6nA538OmhT7MHAK7iIuIi0onFqELaCns8b6cza8sGgRJFmdJF0N282xmiw8
	nGDpVnA9uzxtbutr3Ktc/nIYfSRX/6wdyeBBbm2GLFP2CJb9pejtozJeKUE3BFQ3owmV
	sR1KSGYivG7FQp3EJ4mZsWTqxwAH1CaoJAGOWXBWI/3NdbKTPV4WZz7kZkHn5UbdCHL/
	2HzLQIMpvPxEuDLjaUrLfEyGVnvxGOr5+O5tc7lshdKA3lww3sFspy4BYrSHVLN1gyyQ
	DNRw==
X-Gm-Message-State: AGRZ1gIEQkEWK1qD9Xv+TYEFVrSBponYVU45Sbi9hWnMPjnD5+aRUcB9
	bIJoNbtwtehr8EYXOV7UDOY=
X-Google-Smtp-Source: AJdET5d/u3PYn4pksFPPn5fAkH0wRMFwSSt8E+XGoOXMkvdcstUA51LZia4lhTVkCj33iUihVau5Jw==
X-Received: by 2002:a1c:cf02:: with SMTP id f2-v6mr96539wmg.34.1541178490501; 
	Fri, 02 Nov 2018 10:08:10 -0700 (PDT)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	h18-v6sm22625193wro.0.2018.11.02.10.08.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Nov 2018 10:08:09 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <A4364314-DB4F-459B-AC36-29136C46691F@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Fri, 2 Nov 2018 18:08:08 +0100
In-Reply-To: <CAJTo0LZBqL3rckX3jEbWauwFWZNs=6gc7p+NGNDH5RbQeyiMdA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181031144648.28277-1-sno@netbsd.org>
	<CAJTo0LYJrmBh1_3AXZXH7xBY1KSCG_9buGfsqtG-D2MLRb=Qmg@mail.gmail.com>
	<9750133E-11F8-4833-9CBF-DB7B6998E3AE@netbsd.org>
	<CAJTo0LYqMLLp9T89CvR0jzSLuiHH7w2M2rrdoE0z-tS54ity9Q@mail.gmail.com>
	<CAJTo0LaoWMZBv0_o8b1MYLq=CnFQFbOgCn2ptpqH0BeGCmN+RQ@mail.gmail.com>
	<CAJTo0LZBqL3rckX3jEbWauwFWZNs=6gc7p+NGNDH5RbQeyiMdA@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Fri, 02 Nov 2018 17:08:10 -0000
X-Groupsio-MsgNum: 117889
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EFD4E564-48FE-4C22-973B-D0FE61C93836";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_EFD4E564-48FE-4C22-973B-D0FE61C93836
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_61FCB5AC-9C52-4E47-BEC6-EDF51CBF9887"

--Apple-Mail=_61FCB5AC-9C52-4E47-BEC6-EDF51CBF9887
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 02.11.2018 um 17:29 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
> On Fri, 2 Nov 2018 at 16:17, Burton, Ross <ross.burton@intel.com =
<mailto:ross.burton@intel.com>> wrote:
>> Turns out enabling reproducible builds breaks the test suite:
>>=20
>> test test_py_compile failed -- Traceback (most recent call last):
>>  File "/usr/lib/python3.7/test/test_py_compile.py", line 125, in
>> test_source_date_epoch
>>    self.assertEqual(statinfo.st_mtime, testtime)
>> AssertionError: 1541175127.6495416 !=3D 123456789
>> 0:11:47 load avg: 0.41 [269/415/1] test_pyclbr -- test_py_compile =
failed
>=20
> We're patching in SOURCE_DATE_EPOCH but 3.7 supports this directly, I
> think we should just drop the source-date-epoch patch.

Done.

>> test test_venv crashed -- Traceback (most recent call last):
>>  File "/usr/lib/python3.7/test/libregrtest/runtest.py", line 163, in
>> runtest_inner
>>    the_module =3D importlib.import_module(abstest)
>>  File "/usr/lib/python3.7/importlib/__init__.py", line 127, in =
import_module
>>    return _bootstrap._gcd_import(name[level:], package, level)
>>  File "<frozen importlib._bootstrap>", line 1006, in _gcd_import
>>  File "<frozen importlib._bootstrap>", line 983, in _find_and_load
>>  File "<frozen importlib._bootstrap>", line 967, in =
_find_and_load_unlocked
>>  File "<frozen importlib._bootstrap>", line 677, in _load_unlocked
>>  File "<frozen importlib._bootstrap_external>", line 728, in =
exec_module
>>  File "<frozen importlib._bootstrap>", line 219, in =
_call_with_frames_removed
>>  File "/usr/lib/python3.7/test/test_venv.py", line 20, in <module>
>>    import venv
>> ModuleNotFoundError: No module named 'venv'
>>=20
>> Urgh, venv.  We just changed this, I wonder if it's not being pulled
>> into the python3-modules depends.
>=20
> Missing dependency, I'll post this fix for master/thud.


There're some similar tasks around in oe-core ML ...

> Am 02.11.2018 um 17:31 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
> Oh, and we should either backport
> =
https://github.com/python/cpython/commit/7bd6f0e5500f778e940374237b94651f6=
0ae1990
> or move to 3.7.1.

Done.
I run compile before sending new patch (seems you're faster running =
tests than I could ever be).

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_61FCB5AC-9C52-4E47-BEC6-EDF51CBF9887
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 02.11.2018 um 17:29 schrieb Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On Fri, 2 Nov =
2018 at 16:17, Burton, Ross &lt;</span><a =
href=3D"mailto:ross.burton@intel.com" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">ross.burton@intel.com</a><span=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">&gt; =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">Turns =
out enabling reproducible builds breaks the test suite:<br class=3D""><br =
class=3D"">test test_py_compile failed -- Traceback (most recent call =
last):<br class=3D"">&nbsp;File =
"/usr/lib/python3.7/test/test_py_compile.py", line 125, in<br =
class=3D"">test_source_date_epoch<br =
class=3D"">&nbsp;&nbsp;&nbsp;self.assertEqual(statinfo.st_mtime, =
testtime)<br class=3D"">AssertionError: 1541175127.6495416 !=3D =
123456789<br class=3D"">0:11:47 load avg: 0.41 [269/415/1] test_pyclbr =
-- test_py_compile failed<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">We're =
patching in SOURCE_DATE_EPOCH but 3.7 supports this directly, =
I</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">think we =
should just drop the source-date-epoch patch.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>Done.</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><blockquote type=3D"cite" style=3D"font-family:=
 Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">test =
test_venv crashed -- Traceback (most recent call last):<br =
class=3D"">&nbsp;File "/usr/lib/python3.7/test/libregrtest/runtest.py", =
line 163, in<br class=3D"">runtest_inner<br =
class=3D"">&nbsp;&nbsp;&nbsp;the_module =3D =
importlib.import_module(abstest)<br class=3D"">&nbsp;File =
"/usr/lib/python3.7/importlib/__init__.py", line 127, in =
import_module<br class=3D"">&nbsp;&nbsp;&nbsp;return =
_bootstrap._gcd_import(name[level:], package, level)<br =
class=3D"">&nbsp;File "&lt;frozen importlib._bootstrap&gt;", line 1006, =
in _gcd_import<br class=3D"">&nbsp;File "&lt;frozen =
importlib._bootstrap&gt;", line 983, in _find_and_load<br =
class=3D"">&nbsp;File "&lt;frozen importlib._bootstrap&gt;", line 967, =
in _find_and_load_unlocked<br class=3D"">&nbsp;File "&lt;frozen =
importlib._bootstrap&gt;", line 677, in _load_unlocked<br =
class=3D"">&nbsp;File "&lt;frozen importlib._bootstrap_external&gt;", =
line 728, in exec_module<br class=3D"">&nbsp;File "&lt;frozen =
importlib._bootstrap&gt;", line 219, in _call_with_frames_removed<br =
class=3D"">&nbsp;File "/usr/lib/python3.7/test/test_venv.py", line 20, =
in &lt;module&gt;<br class=3D"">&nbsp;&nbsp;&nbsp;import venv<br =
class=3D"">ModuleNotFoundError: No module named 'venv'<br class=3D""><br =
class=3D"">Urgh, venv. &nbsp;We just changed this, I wonder if it's not =
being pulled<br class=3D"">into the python3-modules depends.<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Missing dependency, I'll post this fix for =
master/thud.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote></div><div class=3D""><br =
class=3D""></div><div class=3D"">There're some similar tasks around in =
oe-core ML ...</div><div class=3D""><br class=3D""></div><div =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">Am =
02.11.2018 um 17:31 schrieb Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D"">Oh, and we should =
either backport<br class=3D""><a =
href=3D"https://github.com/python/cpython/commit/7bd6f0e5500f778e940374237=
b94651f60ae1990" =
class=3D"">https://github.com/python/cpython/commit/7bd6f0e5500f778e940374=
237b94651f60ae1990</a><br class=3D"">or move to 3.7.1.<br =
class=3D""></div></blockquote><br class=3D""></div><div =
class=3D"">Done.</div><div class=3D"">I run compile before sending new =
patch (seems you're faster running tests than I could ever =
be).</div><div class=3D""><br class=3D""></div>Cheers<br class=3D""><div =
class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></body></html>=

--Apple-Mail=_61FCB5AC-9C52-4E47-BEC6-EDF51CBF9887--

--Apple-Mail=_EFD4E564-48FE-4C22-973B-D0FE61C93836
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlvchHgACgkQRJmWrtzl
Cp2tjA/9HKcgm6AnXV77/7oygDKFuhkbxpfb0RUXcSGOy6nbeyO/RNrKjc9IPpBG
zzyXXk8p8X/vJYWBEZo3GLsjz5UxJEJdGijiy0LgG2OTuZcuz9p1z6LJWk5ds/bQ
2zNfi8RaNPlf9Gl2URtA7PYzqGAfc3rQoaiF5yNfo6iXR+gm/u/fl67EeLGqGI8h
+oQ/vJHmuAdQbc+XviXim9a/3rodkr1jF7dkIV0DxEm90E31a5x1TUmwLtTNVJyI
UpXTuMGAvF4BnySTTa9qVe5GoRW5CN+h5XSevz46ZeTOZcl5GcshGSwneSPj3it2
H7sODxxvkvkd/u/8eaYPY7wPT9KmPlwAXQ3MbbnO/HCZOzJ9lgb1UKZObn5XEURO
pa3yx+EOhLsMi4qsnsJRGSdOuqwV8DWRwYovfIsU0ALg3HyewGxti96wIG01XiOj
mFVmfUxB1DFHh1zIKXB3tJewnm8mhZlmWDrQXntn0vdpufW2XTndddPXFAqAIrX+
AfemRdUFaPs9D773iaEF8DKjwcQvInPRkJ+CrfxI5k78dHpwRlRZ+3A2FItXQpAH
SCuB2DRWLa06HNqw47aTzCOzskP3yQjkdHfecOePLK7PNLWxCWbzxRbURSm0KVwe
LJx5FOgTr6ybK9dIwZKdqnTg1y5gemvWw9KooB4hh61kjYZnW8Q=
=i9nS
-----END PGP SIGNATURE-----

--Apple-Mail=_EFD4E564-48FE-4C22-973B-D0FE61C93836--
