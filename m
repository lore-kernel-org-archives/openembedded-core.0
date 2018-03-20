Return-Path: <jpewhacker@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 80A4378289
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 23:49:58 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id 71-v6so2885749oie.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 16:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b+KbzhwLiBxumtNvCFi4oOO7UY/gI6qRNn6ea7dKYfA=;
	b=cAn97zI3QWso9gVq1SiPJS4r3gtPndhOKo7uwQcSbriE3Igb4E8qUJJdn9oduW07Hd
	EtdVqPNVgvSRL5ZuxjLIJC/ETksUS5WDT0gHK9qNiFH9WTOanWC3W4whyVufU7s5nf7Z
	+BBQq1rjHJiAB9ourJmLZBio1w3vTCAhAjH70m64JRksd2r3rWRWEJtpEAAjLjlOwGNA
	kWCHjJVdw2ih4QBWl/Bz1fGZNseYxSEjWycwjNguAjeU781cbg3+Z2FhCpREd7jWnZFA
	5BRDliWr8lAMLnDSOBAk0oNj9AGdO9ekJhcj3iskxyjOpqfX1QVnEurBkgPPDNVlFERY
	BB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b+KbzhwLiBxumtNvCFi4oOO7UY/gI6qRNn6ea7dKYfA=;
	b=fQZmvTs5fwGl0iWcIQeKjgpUTpjQOPqkE7pjr+IkrsgBQWTyKX+HebKjzmR9nIyy4F
	RkhrPeMz1Y7mo7kQz9zedMz1EVqEZGlFsHp+hCm7D+HVSwJ+a6blOEemArbwQA3wuDMK
	/+UN4N6XICV2vxI8KhHybKOsI6EDUPxs2mMQ3yuC+1DVclsClpbJ398Hutb2nk7rlacw
	KzjlH5Ra2Nyl/upfsV0PLkzb6d1Gij3xI4kZzABPD4szS7Qet6cXdlh8mTVhVgKB5vwE
	XyrVngH8Pg2hgHPbmjgUFhbiQi0qwv8ET5WMD7H0nK/FHIjWgPJkCMJUhdQSHyueje44
	T2Tg==
X-Gm-Message-State: AElRT7Fy6RvBtU8rUTrszU/UaKBWVsTCw4HIJl0DSZsGvQgAVkMGmW+z
	XOXh6gB2CY+HuyjGLFHRnKbBIW+1596V/rhM32s=
X-Google-Smtp-Source: AG47ELvzb+/DIFwxgtZH845u2mkRhbsebmi/S9aaW467yG43UQ/U+/8bxhzhATL2Djk9Fb0luMsKKVJb11OL5of1Ugc=
X-Received: by 10.202.214.193 with SMTP id n184mr7763852oig.234.1521589799394; 
	Tue, 20 Mar 2018 16:49:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2221:0:0:0:0:0 with HTTP; Tue, 20 Mar 2018 16:49:58
	-0700 (PDT)
Received: by 2002:a9d:2221:0:0:0:0:0 with HTTP; Tue, 20 Mar 2018 16:49:58
	-0700 (PDT)
In-Reply-To: <CAJdd5GbDmBRej_emtnhHh8PmaRE3Tfs5qzgAva8jW9K-9xUXFg@mail.gmail.com>
References: <cover.1521587166.git.amanda.r.brindle@intel.com>
	<3d59c4dd2b19c529ede09d2bbd10d39f2d56190a.1521587166.git.amanda.r.brindle@intel.com>
	<CA+chaQchyELbN1znvJapZ4az8coY5Ursp2YmtwdsQfpb+fdyrw@mail.gmail.com>
	<CAJdd5GbDmBRej_emtnhHh8PmaRE3Tfs5qzgAva8jW9K-9xUXFg@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 20 Mar 2018 18:49:58 -0500
Message-ID: <CAJdd5GYG4TuL5cRdZv+y1hUK-Ex8ws=fQBtp-dqXV4Z0SdGoTg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Amanda Brindle <amanda.r.brindle@intel.com>, stephano.cetola@intel.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] waf.bbclass: Warn if waf doesn't exist
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
X-List-Received-Date: Tue, 20 Mar 2018 23:49:58 -0000
Content-Type: multipart/alternative; boundary="001a113d2ce47ca4010567e0bb1d"

--001a113d2ce47ca4010567e0bb1d
Content-Type: text/plain; charset="UTF-8"

On Mar 20, 2018 18:33, "Martin Jansa" <martin.jansa@gmail.com> wrote:

see https://patchwork.openembedded.org/patch/147693/

and updated version (just rebased after other waf related changes were
merged):
http://git.openembedded.org/openembedded-core-contrib/
commit/?h=jansa/master-submitted&id=3f70b555e3f6033b807e03247605f3fdad868646

but it was rejected by Ross before, maybe now it won't be when it has Yocto
bug number in commit message..


Ah started my reply before I saw yours. I thought this looked familiar.
IIRC, the other patch was before we changed waf-samba.bbclass to no longer
inherit from waf.bbclass.

I didn't remember exactly why the previous one was rejected.... But looking
back I think Ross was right that inheriting waf.bbclass without actually
having waf should be an error (at some point). I was (perhaps incorrectly)
presuming that even if you got the FileNotFoundError, do_configure would
still fail. Is that correct? If not I think something strange is going on.



On Wed, Mar 21, 2018 at 12:07 AM, Amanda Brindle <amanda.r.brindle@intel.com
> wrote:

> Before, waf.bbclass would fail to catch FileNotFoundError. Now, it will
> catch this error and warn that waf doesn't exist.
>
> Fixes [YOCTO 12553]
>
> Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
> ---
>  meta/classes/waf.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index f9a851d..5bd5913 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -15,6 +15,8 @@ python waf_preconfigure() {
>              d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir}
> --libdir=${libdir}")
>      except subprocess.CalledProcessError as e:
>          bb.warn("Unable to execute waf --version, exit code %d. Assuming
> waf version without bindir/libdir support." % e.returncode)
> +    except FileNotFoundError:
> +        bb.warn("waf does not exist in %s" % subsrcdir)
>  }
>
>  do_configure[prefuncs] += "waf_preconfigure"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a113d2ce47ca4010567e0bb1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Mar 20, 2018 18:33, &quot;Martin Jansa&quot; &lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">see=C2=A0<a href=
=3D"https://patchwork.openembedded.org/patch/147693/" target=3D"_blank">htt=
ps://patchwork.<wbr>openembedded.org/patch/147693/</a><div><br></div><div>a=
nd updated version (just rebased after other waf related changes were merge=
d):</div><div><a href=3D"http://git.openembedded.org/openembedded-core-cont=
rib/commit/?h=3Djansa/master-submitted&amp;id=3D3f70b555e3f6033b807e0324760=
5f3fdad868646" target=3D"_blank">http://git.openembedded.org/<wbr>openembed=
ded-core-contrib/<wbr>commit/?h=3Djansa/master-<wbr>submitted&amp;id=3D<wbr=
>3f70b555e3f6033b807e03247605f3<wbr>fdad868646</a><br></div><div><br></div>=
<div>but it was rejected by Ross before, maybe now it won&#39;t be when it =
has Yocto bug number in commit message..</div></div></blockquote></div></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ah started my reply b=
efore I saw yours. I thought this looked familiar. IIRC, the other patch wa=
s before we changed waf-samba.bbclass to no longer inherit from waf.bbclass=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I didn&#39;t remember =
exactly why the previous one was rejected.... But looking back I think Ross=
 was right that inheriting waf.bbclass without actually having waf should b=
e an error (at some point). I was (perhaps incorrectly) presuming that even=
 if you got the FileNotFoundError, do_configure would still fail. Is that c=
orrect? If not I think something strange is going on.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><br></div></div><di=
v class=3D"elided-text"><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Wed, Mar 21, 2018 at 12:07 AM, Amanda Brindle <span dir=3D"ltr">&=
lt;<a href=3D"mailto:amanda.r.brindle@intel.com" target=3D"_blank">amanda.r=
.brindle@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Before, waf.bbclass would fail to catch FileNotFoundError. Now, it will<br>
catch this error and warn that waf doesn&#39;t exist.<br>
<br>
Fixes [YOCTO 12553]<br>
<br>
Signed-off-by: Amanda Brindle &lt;<a href=3D"mailto:amanda.r.brindle@intel.=
com" target=3D"_blank">amanda.r.brindle@intel.com</a>&gt;<br>
---<br>
<span>=C2=A0meta/classes/waf.bbclass | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
</span>diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index f9a851d..5bd5913 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -15,6 +15,8 @@ python waf_preconfigure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;WAF_EXTRA_CO=
NF&quot;, &quot;--bindir=3D${bindir} --libdir=3D${libdir}&quot;)<br>
=C2=A0 =C2=A0 =C2=A0except subprocess.CalledProcessError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;Unable to execute waf --ver=
sion, exit code %d. Assuming waf version without bindir/libdir support.&quo=
t; % e.returncode)<br>
+=C2=A0 =C2=A0 except FileNotFoundError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;waf does not exist in %s&quot; %=
 subsrcdir)<br>
=C2=A0}<br>
<br>
=C2=A0do_configure[prefuncs] +=3D &quot;waf_preconfigure&quot;<br>
<div class=3D"m_2265359007684635114HOEnZb"><div class=3D"m_2265359007684635=
114h5">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>
</div><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div></div></div>

--001a113d2ce47ca4010567e0bb1d--
