Return-Path: <kergoth@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0B59D6FF78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 16:08:55 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id a10so7377726ywa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 08:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=SZ3yKy6ZjfvKw747DJxUQs3PS+od0rhbcpGmAAAjId8=;
	b=rCZG3WpoX6wW1+xwIy0kn0qwmM1ekW+MRXmh8v+Wnrxnl1dDSVXKGhQ3drJJyVJNx3
	8oBMVUia1zCv+wehh+yrrY9Fyf6Bd0NqXoynGPp+pvLvu3eEq0pQc243RJ/DOKX8y3Qg
	CkddkxUvqaHMMV8ciqaVIYy73HQBgdsAq7RU+MBzN4T29RF+qocpWQPikoYhxWbjgDCw
	cCEGuN5k74wTa4Eerf/AgoVN5qJW0/6MePaxmduF+Su7uFZ1vBayhwbeb0cpOjmMfmQm
	Uqqxu3mp7Ua0LvIdLaFTTqxe4QWkUPQkCMBVfVHWWHn/JnEha4TTQJqM2iHW+x9x36KM
	Dsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=SZ3yKy6ZjfvKw747DJxUQs3PS+od0rhbcpGmAAAjId8=;
	b=HwVi+bwXGWG00bnjzMUjel++93D1DIas0ls8KktwgXB27vKibdUTdJAjjxxMh3JKaP
	y7pUPnIbHcbmDd23iOufrXe0TX4pKN7zEI7Kt/x88x13O3CHws7D1ZRoVi2cnvVypCb1
	8SpLOa+ia6ZBoUXIyBI3B98CVQb2JenaR7mYBNT6rgUcBlX/maMDikzSvbqNVRoyZ5Wz
	C8A71DjK4kYzBMjqqLjQu8w7FalUUiVlJNv1yjSfxbtTiSfxrPwJSswRmUQxtGgZH3qi
	eo+KbCdwthy2vE2z3mnrRl9BkAruhuPTaoC41T13qz6DqqgrsR9lTDZrilVCLtXtcHZh
	RGiQ==
X-Gm-Message-State: ABUngvcbjBQpPqCUV2vTTgkDRZScCigO5Xrb02bcUdRKK2iYDkeRWthwvr+JzrnsbKcNVRrDSImQ/F85N+aPnw==
X-Received: by 10.202.191.134 with SMTP id p128mr8539199oif.14.1479139736848; 
	Mon, 14 Nov 2016 08:08:56 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.29.137 with HTTP; Mon, 14 Nov 2016 08:08:36 -0800 (PST)
In-Reply-To: <4e2659f6-3cbf-5d91-7a08-9675657d4495@windriver.com>
References: <cover.1479133967.git.liezhi.yang@windriver.com>
	<8c8065fec7073acfbe7c9ea308137e7bb8b83321.1479133967.git.liezhi.yang@windriver.com>
	<CABcZANn7+CW65pS-fV8d=0ju9v5YjAY64=b3=qZLnZ8C+uz+hg@mail.gmail.com>
	<ea0d4ea9-f9c6-64bf-2647-bd1f55b62534@windriver.com>
	<CABcZANniN3J9vLsXu=K3StVyXERoTiAHGb_Ppn_APv+0kYUPUA@mail.gmail.com>
	<4e2659f6-3cbf-5d91-7a08-9675657d4495@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 14 Nov 2016 09:08:36 -0700
X-Google-Sender-Auth: hUXfzABYSUgg2pfzVjbX1tVqlQE
Message-ID: <CABcZAN=v680FxZ5GHRN53hj3Rd5TnNhQxmVRMds0qZMW7Lc=bg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] sanity.bbclass: fix check_connectivity() for BB_NO_NETWORK = "0"
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
X-List-Received-Date: Mon, 14 Nov 2016 16:08:56 -0000
Content-Type: multipart/alternative; boundary=001a113d6e809693560541450e7b

--001a113d6e809693560541450e7b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2016 at 9:05 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> On 11/14/2016 11:38 PM, Christopher Larson wrote:
>
>>
>> On Mon, Nov 14, 2016 at 8:37 AM, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>     On 11/14/2016 11:03 PM, Christopher Larson wrote:
>>
>>
>>         On Mon, Nov 14, 2016 at 7:34 AM, Robert Yang <
>> liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>
>>         <mailto:liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.
>> com>>>
>>         wrote:
>>
>>             The old code:
>>             network_enabled =3D not d.getVar('BB_NO_NETWORK', True)
>>
>>             It is True only when BB_NO_NETWORK is not set (None),
>>             but BB_NO_NETWORK =3D "0" should also be True while "1" mean=
s
>> no network,
>>             "0" means need network in a normal case.
>>
>>             Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>
>>             <mailto:liezhi.yang@windriver.com <mailto:
>> liezhi.yang@windriver.com>>>
>>
>>             ---
>>              meta/classes/sanity.bbclass | 14 +++++++++-----
>>              1 file changed, 9 insertions(+), 5 deletions(-)
>>
>>             diff --git a/meta/classes/sanity.bbclass
>> b/meta/classes/sanity.bbclass
>>             index 7e383f9..c5e3809 100644
>>             --- a/meta/classes/sanity.bbclass
>>             +++ b/meta/classes/sanity.bbclass
>>             @@ -363,15 +363,19 @@ def check_connectivity(d):
>>                  test_uris =3D (d.getVar('CONNECTIVITY_CHECK_URIS', True=
)
>> or
>>         "").split()
>>                  retval =3D ""
>>
>>             +    bbn =3D d.getVar('BB_NO_NETWORK', True)
>>             +    if bbn not in (None, '0', '1'):
>>             +        return 'BB_NO_NETWORK should be "0" or "1", but it
>> is "%s"'
>>         % bbn
>>
>>
>>         Does this mirror the same logic used in bitbake? What=E2=80=99s =
the
>> behavior if it=E2=80=99s
>>         set, but to the empty string?
>>
>>
>>     bitbake only checks whether it equals "1" or not. Without this patch=
,
>> an empty
>>     string is the same as not set since it doesn't equal to "1". But if
>> it is
>>     set to "0", bitbake uses it as enable network, sanity.bbclass uses i=
t
>>     as disable netowrk, which are conflicted. We can add checking for
>> empty string,
>>     but do we have to ? Limit it to "0" or "1" makes things clear.
>>
>>
>> IMO if we=E2=80=99re going to change the semantics, we should do it in b=
itbake
>> and then
>> mirror that in the metadata. Sanity checking should mirror the actual
>> variable
>> behavior where it=E2=80=99s used.
>>
>
> Sounds reasonable, but I'm not sure how to do it, ways I can think out:
> 1) Handle "0" as enable network as bitbake does in sanity.bbclass
> 2) If we want to limit its values, maybe we need check it in bitbake rath=
er
>    than in sanity.bbclass, there are also other values have the similar
>    problems, I did a rough grep, such as BB_FETCH_PREMIRRORONLY:
>
> fetch2/__init__.py:        premirroronly =3D (self.d.getVar("BB_FETCH_PRE=
MIRRORONLY",
> True) =3D=3D "1")
> fetch2/git.py:        if d.getVar("BB_FETCH_PREMIRRORONLY", True) is not
> None:
>
> The __init__.py only checks whether it is "1" or not, but git.py checks i=
f
> it
> is None, there would be confusions when it is "" or "0".


Sounds like bb.utils.to_boolean() may be our friend for a number of these.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113d6e809693560541450e7b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Nov 14, 2016 at 9:05 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On 11/14/2016 11:38 PM, Christopher Larson wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
On Mon, Nov 14, 2016 at 8:37 AM, Robert Yang &lt;<a href=3D"mailto:liezhi.y=
ang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br></spa=
n><span class=3D"">
&lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">l=
iezhi.yang@windriver.<wbr>com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 On 11/14/2016 11:03 PM, Christopher Larson wrote:<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 On Mon, Nov 14, 2016 at 7:34 AM, Robert Yang &l=
t;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yan=
g@windriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.<wbr>com</a>&gt;<br></span=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.<wbr>com</a> &lt;mailto:<a=
 href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@wi=
ndriver.<wbr>com</a>&gt;&gt;&gt;<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The old code:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network_enabled =3D not d.getVar(=
&#39;BB_NO_NETWORK&#39;, True)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 It is True only when BB_NO_NETWOR=
K is not set (None),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 but BB_NO_NETWORK =3D &quot;0&quo=
t; should also be True while &quot;1&quot; means no network,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;0&quot; means need network =
in a normal case.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Signed-off-by: Robert Yang &lt;<a=
 href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@wi=
ndriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.<wbr>com</a>&gt;<br></span=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liez=
hi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.<wbr>com</a>=
 &lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">=
liezhi.yang@windriver.<wbr>com</a>&gt;&gt;&gt;<div><div class=3D"h5"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/classes/sanity.bbclass=
 | 14 +++++++++-----<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 9 insertion=
s(+), 5 deletions(-)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diff --git a/meta/classes/sanity.=
bbclass b/meta/classes/sanity.bbclass<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index 7e383f9..c5e3809 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- a/meta/classes/sanity.bbclass=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +++ b/meta/classes/sanity.bbclass=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -363,15 +363,19 @@ def check_c=
onnectivity(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_uris =3D=
 (d.getVar(&#39;CONNECTIVITY_CHECK_<wbr>URIS&#39;, True) or<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;).split()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D &q=
uot;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 bbn =3D d.getVar(&=
#39;BB_NO_NETWORK&#39;, True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 if bbn not in (Non=
e, &#39;0&#39;, &#39;1&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn &#39;BB_NO_NETWORK should be &quot;0&quot; or &quot;1&quot;, but it is &=
quot;%s&quot;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 % bbn<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Does this mirror the same logic used in bitbake=
? What=E2=80=99s the behavior if it=E2=80=99s<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 set, but to the empty string?<br>
<br>
<br>
=C2=A0 =C2=A0 bitbake only checks whether it equals &quot;1&quot; or not. W=
ithout this patch, an empty<br>
=C2=A0 =C2=A0 string is the same as not set since it doesn&#39;t equal to &=
quot;1&quot;. But if it is<br>
=C2=A0 =C2=A0 set to &quot;0&quot;, bitbake uses it as enable network, sani=
ty.bbclass uses it<br>
=C2=A0 =C2=A0 as disable netowrk, which are conflicted. We can add checking=
 for empty string,<br>
=C2=A0 =C2=A0 but do we have to ? Limit it to &quot;0&quot; or &quot;1&quot=
; makes things clear.<br>
<br>
<br>
IMO if we=E2=80=99re going to change the semantics, we should do it in bitb=
ake and then<br>
mirror that in the metadata. Sanity checking should mirror the actual varia=
ble<br>
behavior where it=E2=80=99s used.<br>
</div></div></blockquote>
<br>
Sounds reasonable, but I&#39;m not sure how to do it, ways I can think out:=
<br>
1) Handle &quot;0&quot; as enable network as bitbake does in sanity.bbclass=
<br>
2) If we want to limit its values, maybe we need check it in bitbake rather=
<br>
=C2=A0 =C2=A0than in sanity.bbclass, there are also other values have the s=
imilar<br>
=C2=A0 =C2=A0problems, I did a rough grep, such as BB_FETCH_PREMIRRORONLY:<=
br>
<br>
fetch2/__init__.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 premirroronly =3D (self.d.ge=
tVar(&quot;BB_FETCH_PREMI<wbr>RRORONLY&quot;, True) =3D=3D &quot;1&quot;)<b=
r>
fetch2/git.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;BB_FETCH_PREMIR=
RORON<wbr>LY&quot;, True) is not None:<br>
<br>
The __init__.py only checks whether it is &quot;1&quot; or not, but git.py =
checks if it<br>
is None, there would be confusions when it is &quot;&quot; or &quot;0&quot;=
.</blockquote></div><br>Sounds like bb.utils.to_boolean() may be our friend=
 for a number of these.<br>-- <br><div class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<b=
r>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Seni=
or Software Engineer, Mentor Graphics</div>
</div></div>

--001a113d6e809693560541450e7b--
