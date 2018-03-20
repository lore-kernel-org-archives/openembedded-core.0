Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id CAD07600BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 23:32:49 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z12so3430762wrg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 16:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/ShhfbO5BCedP4bS3EVhLVJfiVM6r48KQ1SIK60LPiQ=;
	b=Kr9+GyEs7Qy3ujMWWbW6xtUi0oVY7flkh4ShS5h/EqA3wlBJrC+BNDBCY5AigbAEt4
	0un5qTIdScBIhjEeEbpachz1AvCGo0ixqu1Zmx36oefVnIfmQ/gJJR2NQhkBnD4CDR6M
	C811QDwrvRtR2u3cjlRP8b8a3MDWtFx3t508xsvDl1/UucYKFrbDsnYZJ791P6gvIHZL
	G3uMaNr8pZXZRjAQHlAoxXJU2KeCXfPoYQlE2EJuR6YYPCEvxls8TKYhZ5GcGYvxoJkM
	0LXmgEiktxwA/Z0M3aRUgGLsTgJRkTlavmbgoyLTdkXQ05eiOfsd/yxu8oN45VdWdFql
	Zy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/ShhfbO5BCedP4bS3EVhLVJfiVM6r48KQ1SIK60LPiQ=;
	b=gjQr2MCT2shmVaDQqAtTjuJYT9XSuoznN03o0jnNE9M/N+8QzIwjxPn4gyQeL90psz
	TzFVvtXD6oRLbQ6nUGnwPkIFabSdMXBXMIn9uoVM+fgsKfHaroOS83ZstoU7TF9HNYJC
	itfjk3+OZvb5urhb0w4se4oXu4AUTfkV8nWQg8ZJD31RiYCbCCYA4aU/nkVRZDdwUxmN
	qZsuwO2wZMbIHMtgxEbN1k7GA7SA4xhvPY+kMJTv0tL2n0TdA6e+IH5+q22cSI4jivyo
	WThqkiP8WdHsY0v6TiWBAN5cL2HBjX/Mjm0Kpa0ENPpIvkCTCijrUlwh7xD8+xHQKqZt
	iWjA==
X-Gm-Message-State: AElRT7EcBO/bwaNFrqchyOGawBTAqd5NZHDr8S7SVx6VPOSvDPwrmIxq
	rp1+9dnK7JDRjeCYq1FdbfhPPYF5VRI2OTcETgc=
X-Google-Smtp-Source: AG47ELuXW2Q6C1Yz6A0O5RoWo/cnHu9/YnvsdwkdJFJYro7r7NGrFqksSc4FJVOXzo99sm2NAd5EdtMfMc0zrbWNusQ=
X-Received: by 10.223.142.13 with SMTP id n13mr13459683wrb.133.1521588770687; 
	Tue, 20 Mar 2018 16:32:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Tue, 20 Mar 2018 16:32:50 -0700 (PDT)
In-Reply-To: <3d59c4dd2b19c529ede09d2bbd10d39f2d56190a.1521587166.git.amanda.r.brindle@intel.com>
References: <cover.1521587166.git.amanda.r.brindle@intel.com>
	<3d59c4dd2b19c529ede09d2bbd10d39f2d56190a.1521587166.git.amanda.r.brindle@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Mar 2018 00:32:50 +0100
Message-ID: <CA+chaQchyELbN1znvJapZ4az8coY5Ursp2YmtwdsQfpb+fdyrw@mail.gmail.com>
To: Amanda Brindle <amanda.r.brindle@intel.com>
Cc: stephano.cetola@intel.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 20 Mar 2018 23:32:50 -0000
Content-Type: multipart/alternative; boundary="f403045f500a2bd0f00567e07e8f"

--f403045f500a2bd0f00567e07e8f
Content-Type: text/plain; charset="UTF-8"

see https://patchwork.openembedded.org/patch/147693/

and updated version (just rebased after other waf related changes were
merged):
http://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/master-submitted&id=3f70b555e3f6033b807e03247605f3fdad868646

but it was rejected by Ross before, maybe now it won't be when it has Yocto
bug number in commit message..


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

--f403045f500a2bd0f00567e07e8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">see=C2=A0<a href=3D"https://patchwork.openembedded.org/pat=
ch/147693/">https://patchwork.openembedded.org/patch/147693/</a><div><br></=
div><div>and updated version (just rebased after other waf related changes =
were merged):</div><div><a href=3D"http://git.openembedded.org/openembedded=
-core-contrib/commit/?h=3Djansa/master-submitted&amp;id=3D3f70b555e3f6033b8=
07e03247605f3fdad868646">http://git.openembedded.org/openembedded-core-cont=
rib/commit/?h=3Djansa/master-submitted&amp;id=3D3f70b555e3f6033b807e0324760=
5f3fdad868646</a><br></div><div><br></div><div>but it was rejected by Ross =
before, maybe now it won&#39;t be when it has Yocto bug number in commit me=
ssage..</div><div><br></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Wed, Mar 21, 2018 at 12:07 AM, Amanda Brindle <span dir=
=3D"ltr">&lt;<a href=3D"mailto:amanda.r.brindle@intel.com" target=3D"_blank=
">amanda.r.brindle@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Before, waf.bbclass would fail to catch FileNotFoundError. Now, i=
t will<br>
catch this error and warn that waf doesn&#39;t exist.<br>
<br>
Fixes [YOCTO 12553]<br>
<br>
Signed-off-by: Amanda Brindle &lt;<a href=3D"mailto:amanda.r.brindle@intel.=
com">amanda.r.brindle@intel.com</a>&gt;<br>
---<br>
<span class=3D"">=C2=A0meta/classes/waf.bbclass | 2 ++<br>
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
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--f403045f500a2bd0f00567e07e8f--
