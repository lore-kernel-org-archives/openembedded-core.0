Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DE6E578A8E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 16:13:29 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id s12-v6so6758631wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 09:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=be8xlr6jfLa9/BdUt/27Pl3OYCry/2wSAqLt5RLB2a8=;
	b=aLdOT94Zq/SU+6m/tk96/DxICxVhY3dg/kKg+8BwbxLE6l5MSjeTFO2XUeEG7s5bJq
	Zo5GdEijQgNgi6AxMGwtvLkEvQT6mRuuZcKXZ1kH2rKZZtmWIbnNehvF6929a2DMEZRM
	YcxgyHpQ068P7siSDIuSSjnUlyGinqY3T9xhN3WliWE3ATsFAmVUWXIPXK2vAq32vKXl
	GAhSxdvPv9LN/UJ9zSJdIXob9yHLx9xUk7t39A2iXa9NOQ+bTdOYgGBBpmQG2oroAFZu
	pRCzd0uq8anGF+bhYmfczSkwNnrZunKdiARZt21bMvc4zMzLNV3djLgUbZBNvjtrOCS2
	niBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=be8xlr6jfLa9/BdUt/27Pl3OYCry/2wSAqLt5RLB2a8=;
	b=Zmd4lkKa0Ij0LUJGz+IJZl9NifpK83VuxirmUJfpc/Bgiyfey3Yv9sDbcRzXRr6Uip
	rXbKkaDaBtt5OKzmSrPzY8ZpY/SkvTcQEqLOf956FeGbldW+iK/e07fsFqoK/gnW4Es0
	Y4r/3JzYMHzBK7CXnOCMfAJ1grWFFuDbZe1c+EhOHBaN7T+3TJTvw/CCniqWCoj+J1hu
	q2wTucAwCfsilW/LgSuojJWNYBgqnhzayb+s4H7x1ECqbLlYRqJbCE074a5sUqURDhTM
	OT11RZ4emkkt9UJTv7xmQ17A4d5NOr8AGXM6wsIEJrQxnDpIaJ2uM3rkYeBb74KjuRRU
	CR3A==
X-Gm-Message-State: APt69E3xKTgxJtubmTnWEMPc1OsFW+kLDTUuRkF6xYVs2Kw5NEyJXU95
	7Z/3ku+afr0gVqpjhDvdfn6680mo0QsLoerRkLg=
X-Google-Smtp-Source: AAOMgpcX0c8OspE/5Ut5bFzrBrcte72B/6EXVWd5qwT5Q++nQz4qVkufnWMhC6svCSbVCT63mhx9XgKUiTsvITPE590=
X-Received: by 2002:a1c:f46:: with SMTP id 67-v6mr1860562wmp.122.1530720810483;
	Wed, 04 Jul 2018 09:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20180702150344.12852-1-ptsneves@gmail.com>
	<530e7398-c299-f4b9-f18e-dce3ced9ba80@gmail.com>
In-Reply-To: <530e7398-c299-f4b9-f18e-dce3ced9ba80@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 4 Jul 2018 18:13:19 +0200
Message-ID: <CA+chaQdsj-Q06itvPYJTrQD6S-8G6eMPhg8A3uTtGGAKRQN0Kg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] kernel-devicetree: Corrected normalize_dtb
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
X-List-Received-Date: Wed, 04 Jul 2018 16:13:30 -0000
Content-Type: multipart/alternative; boundary="00000000000028dca005702eb6b4"

--00000000000028dca005702eb6b4
Content-Type: text/plain; charset="UTF-8"

Confirmed.

I was seeing the same today when testing my rebased changes for
kernel*bbclasses.

On Wed, Jul 4, 2018 at 6:09 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 7/2/18 8:03 AM, Paulo Neves wrote:
> > The normalize_dtb function was buggy because
> > it only converted from .dts suffix to .dtb
> > suffix if the user passed a full source path to
> > KERNEL_DEVICETREE containing the /dts/ path.
> > The problem is that if the user did that there
> > would be a warning.
> >
> > On the othet hand if user just set the variable
> > KERNEL_DEVICETREE="file.dts" the bbclass translation
> > to the respective .dtb target did not occur and
> > make would fail saying it has no rule to make target
> > file.dts
> >
> > This patch decouples the logic of having /dts/ in the
> > path from the target translation.
> >
>
> This breaks a case where relative paths are used e.g. for rpi
> kernel we use DTB=overlay/xxx.dtbo and DTB=xxx.dtb and so on
> with this change its going to strip leading directory name and
> break that assumption.
>
> See
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/conf/machine/include/rpi-base.inc#n17
>
> > Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> > ---
> >   meta/classes/kernel-devicetree.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel-devicetree.bbclass
> b/meta/classes/kernel-devicetree.bbclass
> > index 4f80cc62eb..9866d844ab 100644
> > --- a/meta/classes/kernel-devicetree.bbclass
> > +++ b/meta/classes/kernel-devicetree.bbclass
> > @@ -13,8 +13,8 @@ normalize_dtb () {
> >       DTB="$1"
> >       if echo ${DTB} | grep -q '/dts/'; then
> >               bbwarn "${DTB} contains the full path to the the dts file,
> but only the dtb name should be used."
> > -             DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
> >       fi
> > +     DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
> >       echo "${DTB}"
> >   }
> >
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000028dca005702eb6b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Confirmed.<div><br></div><div>I was seeing the same today =
when testing my rebased changes for kernel*bbclasses.</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Wed, Jul 4, 2018 at 6:09 PM Khem R=
aj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 7/2/18 8:03 AM, Paulo Neves wrote:<br>
&gt; The normalize_dtb function was buggy because<br>
&gt; it only converted from .dts suffix to .dtb<br>
&gt; suffix if the user passed a full source path to<br>
&gt; KERNEL_DEVICETREE containing the /dts/ path.<br>
&gt; The problem is that if the user did that there<br>
&gt; would be a warning.<br>
&gt; <br>
&gt; On the othet hand if user just set the variable<br>
&gt; KERNEL_DEVICETREE=3D&quot;file.dts&quot; the bbclass translation<br>
&gt; to the respective .dtb target did not occur and<br>
&gt; make would fail saying it has no rule to make target<br>
&gt; file.dts<br>
&gt; <br>
&gt; This patch decouples the logic of having /dts/ in the<br>
&gt; path from the target translation.<br>
&gt; <br>
<br>
This breaks a case where relative paths are used e.g. for rpi<br>
kernel we use DTB=3Doverlay/xxx.dtbo and DTB=3Dxxx.dtb and so on<br>
with this change its going to strip leading directory name and<br>
break that assumption.<br>
<br>
See<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/=
conf/machine/include/rpi-base.inc#n17" rel=3D"noreferrer" target=3D"_blank"=
>http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/conf/machi=
ne/include/rpi-base.inc#n17</a><br>
<br>
&gt; Signed-off-by: Paulo Neves &lt;<a href=3D"mailto:ptsneves@gmail.com" t=
arget=3D"_blank">ptsneves@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/kernel-devicetree.bbclass | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/ker=
nel-devicetree.bbclass<br>
&gt; index 4f80cc62eb..9866d844ab 100644<br>
&gt; --- a/meta/classes/kernel-devicetree.bbclass<br>
&gt; +++ b/meta/classes/kernel-devicetree.bbclass<br>
&gt; @@ -13,8 +13,8 @@ normalize_dtb () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D&quot;$1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if echo ${DTB} | grep -q &#39;/dts/&#39;; th=
en<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;${D=
TB} contains the full path to the the dts file, but only the dtb name shoul=
d be used.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D`basename ${DTB=
} | sed &#39;s,\.dts$,.dtb,g&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DTB=3D`basename ${DTB} | sed &#39;s,\.dts$,.dtb,g=
&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${DTB}&quot;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000028dca005702eb6b4--
