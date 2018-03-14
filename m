Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id A344E788EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 16:55:01 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id f1so5187670iob.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 09:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9AvYlRQseI48LA8pQo4H9Zk/gmJhAOG/BpduEuepHaA=;
	b=W43fWeN3h4vsKdkc4YYxdMuHd+qK/zDW+TB4nQi0N5WYH7BkO3T6QPeGUjh1hmOMLb
	HUHrCyIlpRliG7NqhPLO4QAb+0RakJ8tWFo5QmyATEAN0wYtjQli2//U16r+ulPgqmS4
	6lE5J316HHEy9PX9jvZwXMQOkRvfM1k+szTBZKvEOxMj6niHOUcDzNK/IB4E+1YFVr7x
	kNql+7tr4tzx79v9KgcnQKr1HTgtuLbNkJvVPxLKmdoVlz2gjM6qbpUy/DgRWZimWuQr
	KAvTvjZijuYmH4/qG61PsobXYfUaPIxx5EimlRV01R5criTkVf8HbymeZNBGt3vNcTYy
	bAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9AvYlRQseI48LA8pQo4H9Zk/gmJhAOG/BpduEuepHaA=;
	b=HgXOtkdOnN4vDXB/A/v28Mo1M9Rghk6W/uRcFlIPPjCthpvldMYay1yYy0fPsQibd2
	8tGSXA4bms6jdzUUDmf8wlc5cujfu+zb2ELBc1EOUB2RW4a4Zh1IVMhGfEpQsDNx2xuL
	zTtT5rsaO564rk1MMjT/YeXr/EoPUg+09+2GxPo9OhXvOCAxBAJC3N1vTufKst9Pkt8G
	7LkxkxglpzhGe0GZiJon8+AmdUFGQGE/eAAodmGL/6L9kVqCV8EGRoE2oZXDivNIDpJ7
	qFMLHXChpwpBhNbw6Zw9B/lvXgd/ujTLpHihQyswnMtBDsvxHLPweUIgvTH1c8Uql0rL
	+nTQ==
X-Gm-Message-State: AElRT7HsDddNfklblcO1JsxCPzdKkqga1U+o9LVv04SEWfcLsoiA7ny9
	r2mRt09cocDg22XvVXnwR5FSzPuSbznnEZzdowDLCw==
X-Google-Smtp-Source: AG47ELtwhwvi3z+/tYcRFvEt1zuI6yznz3PrQPqfzHIQpaFnDnIXrg3QhYP0Y66nAiJT8VP/hmWJcqcOADmPEQW343Y=
X-Received: by 10.107.7.68 with SMTP id 65mr2531163ioh.216.1521046502801; Wed,
	14 Mar 2018 09:55:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 14 Mar 2018 09:54:42 -0700 (PDT)
In-Reply-To: <1519965857-14794-2-git-send-email-anuj.mittal@intel.com>
References: <1519965857-14794-1-git-send-email-anuj.mittal@intel.com>
	<1519965857-14794-2-git-send-email-anuj.mittal@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Mar 2018 16:54:42 +0000
Message-ID: <CAJTo0LbbK75Zh_h1TvAUeE=QLvFvN1NOREFKhay42-5eC2+yhg@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] perf: enable support for libaudit
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
X-List-Received-Date: Wed, 14 Mar 2018 16:55:02 -0000
Content-Type: multipart/alternative; boundary="001a113f97307c9fa10567623c71"

--001a113f97307c9fa10567623c71
Content-Type: text/plain; charset="UTF-8"

On 2 March 2018 at 04:44, Anuj Mittal <anuj.mittal@intel.com> wrote:

>  # gui support was added with kernel 3.6.35
>  # since 3.10 libnewt was replaced by slang
>  # to cover a wide range of kernel we add both dependencies
> @@ -22,6 +22,10 @@ PACKAGECONFIG[libnuma] = ",NO_LIBNUMA=1"
>  PACKAGECONFIG[systemtap] = ",NO_SDT=1,systemtap"
>  PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
>
> +# libaudit support needs python to be present
> +PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit python"
>

All you need in this patch is:

+# audit needs scripting to be enabled.
+PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit"

The convoluted logic will only get more complicated over time, when a
comment saying "if you want audit to work, turn on scripting" is sufficient.

+PACKAGECONFIG_CONFARGS += "${@bb.utils.contains_any('PACKAGECONFIG',
> 'scripting audit', '', 'NO_LIBPYTHON=1', d)}


PACKAGECONFG_CONFAGS isn't for assigning in a recipe.

Ross

--001a113f97307c9fa10567623c71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 2 March 2018 at 04:44, Anuj Mittal <span dir=3D"ltr">&l=
t;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@in=
tel.com</a>&gt;</span> wrote:=C2=A0<div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex">
=C2=A0# gui support was added with kernel 3.6.35<br>
=C2=A0# since 3.10 libnewt was replaced by slang<br>
=C2=A0# to cover a wide range of kernel we add both dependencies<br>
@@ -22,6 +22,10 @@ PACKAGECONFIG[libnuma] =3D &quot;,NO_LIBNUMA=3D1&quot;<b=
r>
=C2=A0PACKAGECONFIG[systemtap] =3D &quot;,NO_SDT=3D1,systemtap&quot;<br>
=C2=A0PACKAGECONFIG[jvmti] =3D &quot;,NO_JVMTI=3D1&quot;<br>
<br>
+# libaudit support needs python to be present<br>
+PACKAGECONFIG[audit] =3D &quot;,NO_LIBAUDIT=3D1,audit python&quot;<br></bl=
ockquote><div><br></div><div>All you need in this patch is:</div><div><br><=
/div><div>+# audit needs scripting to be enabled.</div><div>+PACKAGECONFIG[=
audit] =3D &quot;,NO_LIBAUDIT=3D1,audit&quot;</div><div><br></div><div>The =
convoluted logic will only get more complicated over time, when a comment s=
aying &quot;if you want audit to work, turn on scripting&quot; is sufficien=
t.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-c=
olor:rgb(204,204,204);padding-left:1ex">
+PACKAGECONFIG_CONFARGS +=3D &quot;${@bb.utils.contains_any(&#39;<wbr>PACKA=
GECONFIG&#39;, &#39;scripting audit&#39;, &#39;&#39;, &#39;NO_LIBPYTHON=3D1=
&#39;, d)}</blockquote><div><br></div><div>PACKAGECONFG_CONFAGS isn&#39;t f=
or assigning in a recipe.</div><div><br></div><div>Ross</div></div></div></=
div>

--001a113f97307c9fa10567623c71--
