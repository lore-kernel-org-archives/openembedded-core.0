Return-Path: <sungwon.pino@gmail.com>
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
	[209.85.219.169])
	by mail.openembedded.org (Postfix) with ESMTP id CEBC660807
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 15:53:37 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id t16so5767231ybk.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 07:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6kMeRp4SjKohlp1p4NRrz0aG29u3DjclEkVo4WdhFIo=;
	b=quyLq38+EyXANONrxuXrxfpbh3ZhgRKF+IkIP5VPurgsVzC//XrNfXLf0Ei8Fe7Xha
	TFtF00wNVBS0Vdyne0f8QsT1rTQYE+pWkj9IAbj/q8TgQIAGVV17yQ4oheFGAMyK7Ia0
	BVBGr5efOJa28W39BJNi5gWV45bURu33gtyVwKOB37b1HagDZrIrhTIzU3DiZTCu/z1p
	MbHbN0m8d/33M6abcJi2eQjwCJqgThZofu5amntY80nfOAwa6tWP5CeMixyCEBMMJs1d
	QzyshjJcDODEKWjWMfpsL1FYpnFiHzFEhSua2ctp1EhzkGYRnWRLQ9ViVkBo12AsAvjb
	ApOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6kMeRp4SjKohlp1p4NRrz0aG29u3DjclEkVo4WdhFIo=;
	b=PQjeWX7YtaDqtIMrd/aRlxbcCx3fBElGsllEcLNM6fZ8C4q8zUbkTiUOx4NjZwU0Eq
	xpAundOrcuVK5Opvp/YW6SNYbMqM5HhQeBk73/eJMn/Gk3xM9DTtBCVZFLiLanFxgjOZ
	O1Z3pfklwBOQFUfwt21FF+7UiZ80mBkZbKpQdf5ebQvwLNDO3CSHeaROrwlACQu3gyud
	bJm6YR/w+VJWZh+sdkNmBTtKZPByFhk22TdU8zHkZOUqS115wEQaVI8zllxBoGhKwV3O
	iV1rRKZPhmi4w5TdRu4vtVk8GNh6tDtb35HHeK7ZUw10MToK06tYhdw73FEHWEGHkC56
	zb0A==
X-Gm-Message-State: AA+aEWbY5Gn9kCDApwBLzkIQcpoTztd1qse+mcqos932FaiUX/qTTfbN
	lFQnpDFAoD69wnLGL+HlYMZWKgr0kDdI54WSudU=
X-Google-Smtp-Source: ALg8bN5NZuyuSapRgfdbpmk0fclMQmHqASyH3xUuxdRlyHht15Wfplrfe+VWKPwL2YFRS64x6Ykish9dbq5JMGsFyf0=
X-Received: by 2002:a25:ba04:: with SMTP id
	t4-v6mr24723341ybg.251.1545926018597; 
	Thu, 27 Dec 2018 07:53:38 -0800 (PST)
MIME-Version: 1.0
References: <CAE7Z+X0fWR4LtY+iCPGqsGX8atqK+W42SL+MCha1jcjtyt-DHg@mail.gmail.com>
	<CAMKF1sr0fWaO1EFUWR-_SF3g9mxoyipXyd-4p_WuY1kt3AH5nw@mail.gmail.com>
In-Reply-To: <CAMKF1sr0fWaO1EFUWR-_SF3g9mxoyipXyd-4p_WuY1kt3AH5nw@mail.gmail.com>
From: sungwon kim <sungwon.pino@gmail.com>
Date: Fri, 28 Dec 2018 00:53:27 +0900
Message-ID: <CAE7Z+X0m-rbvDN35SaT3EbT7Vy-OMKzUmqov5u0BQTpY6NuFEA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: Add bison-native for gdb-cross-canadian
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
X-List-Received-Date: Thu, 27 Dec 2018 15:53:38 -0000
Content-Type: multipart/alternative; boundary="000000000000300765057e02f3d4"

--000000000000300765057e02f3d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To. Khem Raj
thanks to comment my patch mail.
I send patch mail but return back something wrong.
below contents are returned
-------------------------------------------------------
=3D=3D Series Details =3D=3D

Series: gdb-cross-canadian: Add bison-native for gdb-cross-canadian
Revision: 1
URL   : https://patchwork.openembedded.org/series/15474/
State : failure

=3D=3D Summary =3D=3D


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series cannot be parsed correctly due to malformed diff
lines [test_mbox_format]
  Suggested fix    Create the series again using git-format-patch and
ensure it can be applied using git am
  Diff line        ${TARGET_ARCH} target)"


* Issue             Series does not apply on top of target branch
[test_series_merge_on_head]
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 65c419b8c4)



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your
concerns.
Otherwise we would appreciate you correcting the issues and submitting a ne=
w
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Guidelines:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe




2018=EB=85=84 12=EC=9B=94 28=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 12:38,=
 Khem Raj <raj.khem@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

>
>
> On Thu, Dec 27, 2018 at 7:25 AM sungwon kim <sungwon.pino@gmail.com>
> wrote:
>
>> Got errors when building SDK. Unable to find bison.
>> To fix this issue add bison-native.
>>
>>
> this is ok
>
>> Signed-off-by: pino-kim <sungwon.pino@gmail.com>
>> ---
>>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> index 475e4f08ef..4977a66c32 100644
>> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> @@ -5,7 +5,7 @@ SUMMARY =3D "GNU debugger (cross-canadian gdb for
>> ${TARGET_ARCH} target)"
>>  PN =3D "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>>  BPN =3D "gdb"
>>
>> -DEPENDS =3D "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
>> +DEPENDS =3D "nativesdk-ncurses nativesdk-expat nativesdk-gettext
>> bison-native \
>>             virtual/${HOST_PREFIX}gcc-crosssdk
>> virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc"
>>
>>  GDBPROPREFIX =3D "--program-prefix=3D'${TARGET_PREFIX}'"
>> --
>> 2.17.1
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--000000000000300765057e02f3d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>To. Khem Raj</div>thanks to comment my patch mail.<di=
v>I send patch=C2=A0mail but return back something wrong.</div><div>below c=
ontents are returned=C2=A0</div><div>--------------------------------------=
-----------------</div><div>=3D=3D Series Details =3D=3D<br><br>Series: gdb=
-cross-canadian: Add bison-native for gdb-cross-canadian<br>Revision: 1<br>=
URL=C2=A0 =C2=A0:=C2=A0<a href=3D"https://patchwork.openembedded.org/series=
/15474/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.openembedde=
d.org/series/15474/</a><br>State : failure<br><br>=3D=3D Summary =3D=3D<br>=
<br><br>Thank you for submitting this patch series to OpenEmbedded Core. Th=
is is<br>an automated response. Several tests have been executed on the pro=
posed<br>series by patchtest resulting in the following failures:<br><br><b=
r><br>* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Series cannot =
be parsed correctly due to malformed diff lines [test_mbox_format]=C2=A0<br=
>=C2=A0 Suggested fix=C2=A0 =C2=A0 Create the series again using git-format=
-patch and ensure it can be applied using git am<br>=C2=A0 Diff line=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ${TARGET_ARCH} target)&quot;<br><br><br>* Issue=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Series does not apply on top of ta=
rget branch [test_series_merge_on_head]=C2=A0<br>=C2=A0 Suggested fix=C2=A0=
 =C2=A0 Rebase your series on top of targeted branch<br>=C2=A0 Targeted bra=
nch=C2=A0 master (currently at 65c419b8c4)<br><br><br><br>If you believe an=
y of these test results are incorrect, please reply to the<br>mailing list =
(<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_bla=
nk">openembedded-core@lists.openembedded.org</a>) raising your concerns.<br=
>Otherwise we would appreciate you correcting the issues and submitting a n=
ew<br>version of the patchset if applicable. Please ensure you add/incremen=
t the<br>version number when sending the new version (i.e. [PATCH] -&gt; [P=
ATCH v2] -&gt;<br>[PATCH v3] -&gt; ...).<br><br>---<br>Guidelines:=C2=A0 =
=C2=A0 =C2=A0<a href=3D"https://www.openembedded.org/wiki/Commit_Patch_Mess=
age_Guidelines" rel=3D"noreferrer" target=3D"_blank">https://www.openembedd=
ed.org/wiki/Commit_Patch_Message_Guidelines</a><br>Test framework:=C2=A0<a =
href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/patchtest" rel=3D"norefer=
rer" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest<=
/a><br>Test suite:=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.or=
g/cgit/cgit.cgi/patchtest-oe" rel=3D"noreferrer" target=3D"_blank">http://g=
it.yoctoproject.org/cgit/cgit.cgi/patchtest-oe</a><br></div><div><br></div>=
<div><br><div><br></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">2018=EB=85=84 12=EC=9B=94 28=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=
=84 12:38, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmai=
l.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div =
class=3D"gmail_default" style=3D"font-family:monospace,monospace"><br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Dec 27, 2018=
 at 7:25 AM sungwon kim &lt;<a href=3D"mailto:sungwon.pino@gmail.com" targe=
t=3D"_blank">sungwon.pino@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Got errors when bu=
ilding SDK. Unable to find bison.<br></div><div>To fix this issue add bison=
-native.</div><div><br></div></div></blockquote><div><br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace">this is ok</di=
v><div class=3D"gmail_default" style=3D"font-family:monospace,monospace"></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div=
></div><div>Signed-off-by: pino-kim &lt;<a href=3D"mailto:sungwon.pino@gmai=
l.com" target=3D"_blank">sungwon.pino@gmail.com</a>&gt;</div><div>---</div>=
<div>=C2=A0meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 2 +-</div><di=
v>=C2=A01 file changed, 1 insertion(+), 1 deletion(-)</div><div><br></div><=
div>diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/re=
cipes-devtools/gdb/gdb-cross-canadian.inc</div><div>index 475e4f08ef..4977a=
66c32 100644</div><div>--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.i=
nc</div><div>+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc</div><d=
iv>@@ -5,7 +5,7 @@ SUMMARY =3D &quot;GNU debugger (cross-canadian gdb for $=
{TARGET_ARCH} target)&quot;</div><div>=C2=A0PN =3D &quot;gdb-cross-canadian=
-${TRANSLATED_TARGET_ARCH}&quot;</div><div>=C2=A0BPN =3D &quot;gdb&quot;</d=
iv><div>=C2=A0</div><div>-DEPENDS =3D &quot;nativesdk-ncurses nativesdk-exp=
at nativesdk-gettext \</div><div>+DEPENDS =3D &quot;nativesdk-ncurses nativ=
esdk-expat nativesdk-gettext bison-native \</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREF=
IX}binutils-crosssdk virtual/nativesdk-libc&quot;</div><div>=C2=A0</div><di=
v>=C2=A0GDBPROPREFIX =3D &quot;--program-prefix=3D&#39;${TARGET_PREFIX}&#39=
;&quot;</div><div class=3D"gmail-m_4882711862002557318gmail-m_8584563889366=
560462gmail-yj6qo gmail-m_4882711862002557318gmail-m_8584563889366560462gma=
il-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0px 0p=
x"><div id=3D"gmail-m_4882711862002557318gmail-m_8584563889366560462gmail-:=
5c" class=3D"gmail-m_4882711862002557318gmail-m_8584563889366560462gmail-aj=
R" style=3D"background-color:rgb(232,234,237);border:none;clear:both;line-h=
eight:6px;outline:none;width:24px;border-radius:5.5px"><img class=3D"gmail-=
m_4882711862002557318gmail-m_8584563889366560462gmail-ajT" style=3D"backgro=
und: url(&quot;&quot;) 50% 50% / 20px no-repeat; height: 11px; opacity: 0.5=
4; width: 24px;"></div></div><span class=3D"gmail-m_4882711862002557318gmai=
l-m_8584563889366560462gmail-HOEnZb gmail-m_4882711862002557318gmail-m_8584=
563889366560462gmail-adL"><font color=3D"#888888"><div>--=C2=A0</div><div>2=
.17.1</div></font></span></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>
</blockquote></div>

--000000000000300765057e02f3d4--
