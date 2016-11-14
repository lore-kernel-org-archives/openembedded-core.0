Return-Path: <kergoth@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 62CDE60269
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 15:39:06 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id s68so7209047ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 07:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=0DOQFn+WCVGF6wVUvS4oV7RU6e/KSdewS+8UXUK+xjk=;
	b=J9Yh7YxUlstUV4VcdUgsbK2441vfC44+3JyJrKciicqxSD3qJcPHi9oCnTrq3iK1JW
	gS0QECJ82Fv8jgbQIgN7gTsQLAevc3jHS2RPLvPha0GkSg8AN9tTSiYsLV6Oqgn11EuI
	rguh1a/oBq5Qib54cZsZ8zfZOzClvaYch50zep1QY61UxE2K0B0E3XybLYO5oWmV1nmi
	cvP5WBeutzNgnI3mJUU8M0Cl/nPS50vaota1lDPv4nU6zLlIVebcgpu/EROwHn8ZJzCP
	53tZegnt1E31ugZiWYh6oCtdNTYQneTpVcVGdm0R7GItWyj5yc1ee+mhjBBwXD/wbesv
	v4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=0DOQFn+WCVGF6wVUvS4oV7RU6e/KSdewS+8UXUK+xjk=;
	b=cckZarQXp6z+Ik9fgRIFvyYHCj8qzTbAXU2dnItPoGYI0iRmKs3jaWi+wKuxawelwH
	3TFuOohuIlMedphUiQD8wACpAug0em4EC6kzz8pCtofFhXojhkvssbO69YavIvJ0Rnl1
	CToh7sHSoZUaur7JTl+AyDnPIce45Wja7fx1T6mU0FjCFecu+6fbn2lIYqhHJt5rW9CP
	CMDmfM9FoS+Xifzw3MPN8nzPxFauBYZdTufFW4D3M9DcGKb9usBBuU9GkTHavEXLzNix
	ek1eI6j5C7letoe0rP8gpYhUXqqY3tfmSPEZqNLpPvZP2prRjf5IbDAfVIuLdgmc/iYu
	bI3g==
X-Gm-Message-State: ABUngvc4HlVnIOLtTvqLn3FFUWPgHdTqGnWT4vwwWKhYWJT/4WhFoIJ6uOJnVPYuBvWeCWEVRCkRaOpXmbmERw==
X-Received: by 10.202.215.85 with SMTP id o82mr1307333oig.145.1479137946902;
	Mon, 14 Nov 2016 07:39:06 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.29.137 with HTTP; Mon, 14 Nov 2016 07:38:46 -0800 (PST)
In-Reply-To: <ea0d4ea9-f9c6-64bf-2647-bd1f55b62534@windriver.com>
References: <cover.1479133967.git.liezhi.yang@windriver.com>
	<8c8065fec7073acfbe7c9ea308137e7bb8b83321.1479133967.git.liezhi.yang@windriver.com>
	<CABcZANn7+CW65pS-fV8d=0ju9v5YjAY64=b3=qZLnZ8C+uz+hg@mail.gmail.com>
	<ea0d4ea9-f9c6-64bf-2647-bd1f55b62534@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 14 Nov 2016 08:38:46 -0700
X-Google-Sender-Auth: Su1ACheu2I4l7O25Qwb--w3Kuzs
Message-ID: <CABcZANniN3J9vLsXu=K3StVyXERoTiAHGb_Ppn_APv+0kYUPUA@mail.gmail.com>
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
X-List-Received-Date: Mon, 14 Nov 2016 15:39:07 -0000
Content-Type: multipart/alternative; boundary=001a113d3d14e6289d054144a3d4

--001a113d3d14e6289d054144a3d4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2016 at 8:37 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> On 11/14/2016 11:03 PM, Christopher Larson wrote:
>
>>
>> On Mon, Nov 14, 2016 at 7:34 AM, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>     The old code:
>>     network_enabled =3D not d.getVar('BB_NO_NETWORK', True)
>>
>>     It is True only when BB_NO_NETWORK is not set (None),
>>     but BB_NO_NETWORK =3D "0" should also be True while "1" means no
>> network,
>>     "0" means need network in a normal case.
>>
>>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>>     <mailto:liezhi.yang@windriver.com>>
>>     ---
>>      meta/classes/sanity.bbclass | 14 +++++++++-----
>>      1 file changed, 9 insertions(+), 5 deletions(-)
>>
>>     diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbcla=
ss
>>     index 7e383f9..c5e3809 100644
>>     --- a/meta/classes/sanity.bbclass
>>     +++ b/meta/classes/sanity.bbclass
>>     @@ -363,15 +363,19 @@ def check_connectivity(d):
>>          test_uris =3D (d.getVar('CONNECTIVITY_CHECK_URIS', True) or
>> "").split()
>>          retval =3D ""
>>
>>     +    bbn =3D d.getVar('BB_NO_NETWORK', True)
>>     +    if bbn not in (None, '0', '1'):
>>     +        return 'BB_NO_NETWORK should be "0" or "1", but it is "%s"'
>> % bbn
>>
>>
>> Does this mirror the same logic used in bitbake? What=E2=80=99s the beha=
vior if
>> it=E2=80=99s
>> set, but to the empty string?
>>
>
> bitbake only checks whether it equals "1" or not. Without this patch, an
> empty
> string is the same as not set since it doesn't equal to "1". But if it is
> set to "0", bitbake uses it as enable network, sanity.bbclass uses it
> as disable netowrk, which are conflicted. We can add checking for empty
> string,
> but do we have to ? Limit it to "0" or "1" makes things clear.


IMO if we=E2=80=99re going to change the semantics, we should do it in bitb=
ake and
then mirror that in the metadata. Sanity checking should mirror the actual
variable behavior where it=E2=80=99s used.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113d3d14e6289d054144a3d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Nov 14, 2016 at 8:37 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On 11/14/2016 11:03 PM, Christopher Larson wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
On Mon, Nov 14, 2016 at 7:34 AM, Robert Yang &lt;<a href=3D"mailto:liezhi.y=
ang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br></spa=
n><span class=3D"">
&lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">l=
iezhi.yang@windriver.<wbr>com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 The old code:<br>
=C2=A0 =C2=A0 network_enabled =3D not d.getVar(&#39;BB_NO_NETWORK&#39;, Tru=
e)<br>
<br>
=C2=A0 =C2=A0 It is True only when BB_NO_NETWORK is not set (None),<br>
=C2=A0 =C2=A0 but BB_NO_NETWORK =3D &quot;0&quot; should also be True while=
 &quot;1&quot; means no network,<br>
=C2=A0 =C2=A0 &quot;0&quot; means need network in a normal case.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@=
windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br></span>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" targe=
t=3D"_blank">liezhi.yang@windriver.<wbr>com</a>&gt;&gt;<span class=3D""><br=
>
=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0meta/classes/sanity.bbclass | 14 +++++++++-----<br>
=C2=A0 =C2=A0 =C2=A01 file changed, 9 insertions(+), 5 deletions(-)<br>
<br>
=C2=A0 =C2=A0 diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanit=
y.bbclass<br>
=C2=A0 =C2=A0 index 7e383f9..c5e3809 100644<br>
=C2=A0 =C2=A0 --- a/meta/classes/sanity.bbclass<br>
=C2=A0 =C2=A0 +++ b/meta/classes/sanity.bbclass<br>
=C2=A0 =C2=A0 @@ -363,15 +363,19 @@ def check_connectivity(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_uris =3D (d.getVar(&#39;CONNECTIVITY=
_CHECK_<wbr>URIS&#39;, True) or &quot;&quot;).split()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D &quot;&quot;<br>
<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 bbn =3D d.getVar(&#39;BB_NO_NETWORK&#39;, True=
)<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 if bbn not in (None, &#39;0&#39;, &#39;1&#39;)=
:<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;BB_NO_NETWORK should=
 be &quot;0&quot; or &quot;1&quot;, but it is &quot;%s&quot;&#39; % bbn<br>
<br>
<br>
Does this mirror the same logic used in bitbake? What=E2=80=99s the behavio=
r if it=E2=80=99s<br>
set, but to the empty string?<br>
</span></blockquote>
<br>
bitbake only checks whether it equals &quot;1&quot; or not. Without this pa=
tch, an empty<br>
string is the same as not set since it doesn&#39;t equal to &quot;1&quot;. =
But if it is<br>
set to &quot;0&quot;, bitbake uses it as enable network, sanity.bbclass use=
s it<br>
as disable netowrk, which are conflicted. We can add checking for empty str=
ing,<br>
but do we have to ? Limit it to &quot;0&quot; or &quot;1&quot; makes things=
 clear.</blockquote></div><br>IMO if we=E2=80=99re going to change the sema=
ntics, we should do it in bitbake and then mirror that in the metadata. San=
ity checking should mirror the actual variable behavior where it=E2=80=99s =
used.<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_sign=
ature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics</div>
</div></div>

--001a113d3d14e6289d054144a3d4--
