Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18445.1792659350734798244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 01:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=l5A3tQrg;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EeUvP1E9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8Lnbd3194741
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 08:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xtmp7KEgVHaa00jqAn504KTC
	XIsDd9bisRT/bn7QJCk=; b=l5A3tQrgxiiFCrsOUvU6LBO9mLfJGBZfDE8wV53T
	aRkx2lcW9PRournrDKcCU7DVX/3AWytmuetDxn4wrfi/+NXwzdpoFWmh29pIMXfi
	yhgMuxDTUZQdGgIh4Y//xwFVLzfhrR70SAmXmjcRj0s09lpwZFNpOmbC/OimqELU
	xsdGKthJeHDKpNMBJGd+/0Npdu4voXoZ0EtYgvOhpegzpob3lD1KBfl//oeBe3Ur
	FIGAxqxLcDgg3CpNkZaC5p8IuUvlrJd/b7lJNnaStp7YgZKcmoIzRupXVq8kkyUZ
	G8dQntvDR1ii3zhTopmWiZ5kRj+S8wFqfHyR590fH7OGOw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq05kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 08:55:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b8c60c550so42545846d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 01:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792659348; cv=none;
        d=google.com; s=arc-20260327;
        b=pdi/fNYD+4fv/TJq1uWHn60iKaTjd8UQi87fiUWliPyxS74nE9WOCICZnoZHHdJi2M
         HdP0MGhfGx5ER5RlxyxLMJT95ScydXfwXC1iNlsXkX5hYsa9n0ieYtFGfM8xwQ0ng0Hr
         m5PzD0beEAmyQJiPnuWT8vWVyQ+l7Ctjg3NyzFm9ZbSsjpt1eh9+Q0s7gt1Ao1idSQvP
         TCOfqYNrfxZvkVfMor3oY+CyUak/JEWnF27OGFBGSB2maMgGU4RlsKg0MxiyO6osPPYB
         q8GpdySOexnDPIIKLTBYKuq86RkaL59lTP/H8j//pzRfIcU3e0+qFnUhje8Mh/xBi2mU
         UjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xtmp7KEgVHaa00jqAn504KTCXIsDd9bisRT/bn7QJCk=;
        fh=J0+s6+jF4/+iB2/jNIxX9EbxpmZlrZkSy0v1MNi66iI=;
        b=AV+MmhP09Sqth00qvJyTHTAhp/2xZFsi041NIxPcLmB/ruyPIviwqgeDhqS9W8sJHZ
         jsPK+PzM0ve71ZaLNOCy7xaSQRilL2O7ftxEpAOS2vnN5ZbhTZyWzKukpp0xm4LeE57a
         QSSMJPDrPhgLkrzI24YyBwWWW6zfuPZesvLDFMAKmJnoKYkFatxSYmpBOsMOKr2VmFoP
         AZv+NiuNrFFdfYbGbpLWjQawLVBD61L/pfLygTgZ/IkQwxxcgZ8aVq0JHd7TuTsYCp7r
         FJah0KmXM89PX/mVsvuEfQpvarSmzFeoVeX0ywr6rbj+0vZWDjx8+q+5oymdTWiBXBwQ
         A9Gw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659348; x=1793264148; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtmp7KEgVHaa00jqAn504KTCXIsDd9bisRT/bn7QJCk=;
        b=EeUvP1E9ugSE4QnjNM/ZSN+wDAuxehlpYouXd3idCMHk/SwSvOgyHb7ZAEnrs534Uj
         NBbX0+PgCpvx0AdrLqi9gtPHEuDoq+muKduJnGaSXEqv4vBaGxrxU1xeBLmgADGhb6lI
         TzT62jT5pz15fUiDeqS/mAnMkRTCwkhxIVZfgGOOGCDeR730c0ZHDz/BHcNPBUMrzqdn
         mcMYJc08vGPwr09E/LKUurf1m7BqPCyveYwTz/Htva15nYT5+kgP5FhJHXNyRNHHEIMm
         tedIk3NllF6aWgCp7Vytc6dIIevDMDpxZ/Rr/qIASSCUjPTDOiqEOKvs305+wcJ6nAPm
         mdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659348; x=1793264148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xtmp7KEgVHaa00jqAn504KTCXIsDd9bisRT/bn7QJCk=;
        b=Y3+OBzLodoDzUHdon3y/wMR3YT/dt89abiqUzO7yDbdKl1hTZ3pJWoeeQJYbPhNHqL
         +SJ5uGMs+gu+6ZFyaFf+uF+zQfWuU3vhDdhqWTUFnQJQrtAbu0pgET+oBb7141JSGga4
         mJnC4zTM+oIMT2tmfLaWbwB+LbTuitjXF7dfoOIqVhqq26qygvskX34xG6X0qES3hd26
         YClaakLppDhU+67ic7pdiQjvW8qxW1+f9OnxikZ4/NPC0JC0D6ruBVa0nplWGSOebmG5
         LgbM+KDBfHnNIg0tSLkU+uRi0b8p+6RwOc05hAL4MjobskZ9l38TxyvDZzyUNh6Fmujn
         APJA==
X-Gm-Message-State: AFq9FYINn97QsfISQjsXfZc6Oxs4u7kYBsWEyH1SwrRRsmH5UjR/zgPd
	Oiq3xiZ1pmRyepxaW3Fb2mLdHxA9RmTf1JtNloeRVXBcKk8yvHJWT376wwRS236bn31pO/CoyI2
	QxA9Q/OVp8somtI8KF94WHn+8AVpMTm+Bgcun3DkOz81LPNvKRLit5ZnceFU5DMcPxeQgdzCOse
	X2Ddh94rPwP1fNy5Q2EPq3ZxXn7pJGgnlTuFF7NxAidtOgwvBy0qu2CbM1vQ==
X-Gm-Gg: AYBFou1pv40K4Ugq1+dx4bKpPamy4Bbq3NYsCmnKJTZKH+OfIRqaToL34f2veV0t4IL
	X8Vn+7rsRuJWbgFGsBckAsekVpeYpJ+GT/+VLZD2UJT5J00kbtMSl8sZjBuZOsso3WfNCQQNV4z
	MYXsYyxU+amgdol5l+6ljXY/FVKHf+jQvsij+bAXNz4G2KkImSoP1g+aTSo8g=
X-Received: by 2002:a05:620a:2b83:b0:93e:9508:8360 with SMTP id af79cd13be357-93f57f062e3mr882351185a.27.1792659348443;
        Thu, 22 Oct 2026 01:55:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2b83:b0:93e:9508:8360 with SMTP id
 af79cd13be357-93f57f062e3mr882348785a.27.1792659347821; Thu, 22 Oct 2026
 01:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20261022021932.1842395-1-ricardo.salveti@oss.qualcomm.com>
In-Reply-To: <20261022021932.1842395-1-ricardo.salveti@oss.qualcomm.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:55:37 +0100
X-Gm-Features: AclHuK8rMucscqL6nwSLs3H5ZUhXxZj0L09jD_xRdIaqASQel4isenXmVwSB0RA
Message-ID: <CADWMC-YVt0-0pkDh1eHFW8GKRwDaLaoC0tygqckez_GLci_3dA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstatesig: write locked-sigs.inc atomically
To: ricardo.salveti@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a16a29065e6a0700"
X-Proofpoint-GUID: GJuzBObnwsTyXpr6Ofz0RJio7y70SGA6
X-Proofpoint-ORIG-GUID: GJuzBObnwsTyXpr6Ofz0RJio7y70SGA6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX3ATN00XQ8Kwf
 1efZE/Qc+RT457ci4vom4I5TIf6Q1Y3DyEV29RUduU6hTp6OmM5dt5NE3sfayUqDNHR66q/554n
 9FhY/0VBzjFvmfMYQirhbvwlbHdekYU=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9cf95 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=5TqVpUJVRbxqak62bUoA:9 a=QEXdDO2ut3YA:10
 a=iJwiWPIwAAAA:8 a=CeuZVo8E7aZdySJvcqsA:9 a=IBEwZL2ROlnlGq23:21
 a=lqcHg5cX4UMA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=81xWKa9ips7dK7WwanQv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX4T5FyJ+QKHQy
 4PmeIzWKBmAAL9hShUR8WhE/9aLvjPPNfcqs+haXD6vBJRmhZOMGM71gcw6yvCdsndMZ3JYHaVe
 AaH6coybKWKWNUQQJnbgF6XY2vLetCUWlxD601FkDSSc0WkiQd3wwrcYC1a8XzhrxeuSGX42eOo
 TQJjPRfWW/bX87bT5UNeNmSzqutpWTsx2HzBnkNmEEDe2ZcFkhOjXuzFDisswL21KVpKqjg6iB5
 KR728WV4FIDvd41xD8asJN4DfCVgqfdL1XqU+hR0D9o2lGkd3STHmdMWU31FyNXkR/UOiitWDMy
 PTD/Fil+jN3/k3dfs1JyfFHnLP6nKpWFy8UVzAt2XHfqD2Fl8naM83uNRR+gUkvjkkFEPDDOku6
 m40+wOhMjEmMbUekMn6tV4CKY3JXn7bbgOmT5nvGm0DwUGQbgNYHVityj7xN6Z0T+l81p1dguGT
 pJ0Yel+/c9xRwxMigpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 08:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248425

--000000000000a16a29065e6a0700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:19=E2=80=AFAM Ricardo Salveti via lists.openembed=
ded.org
<ricardo.salveti=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> dump_lockedsigs() writes the sigfile in place, so if bitbake fails or is
> killed partway through, for example on a full disk, a truncated
> locked-sigs.inc is left behind. yocto-check-layer's test_signatures and
> test_machine_signatures run bitbake with -k and ignore its exit status
> when the file exists, so they would compare a partial set of signatures
> without noticing.
>
> Write to locked-sigs.inc.new and rename it into place once complete, as
> epochfile_write() in oe/reproducible.py does, so a failed dump leaves no
> sigfile behind.
>
> Tested by making dump_lockedsigs() fail with ENOSPC halfway through on
> meta-qcom data: yocto-check-layer previously accepted the partial file,
> now it reports the error. Complete output is byte-identical and a
> meta-qcom yocto-check-layer run gives the same results as before.
>
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> ---
>  meta/lib/oe/sstatesig.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 9928f3af49..e5a6eb45b9 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -259,7 +259,8 @@ class SignatureGeneratorOEBasicHashMixIn(object):
>              if taskhash !=3D unihash:
>                  unihashmap[tid] =3D "    " + self.lockedpnmap[fn] + ":" =
+
> task + ":" + taskhash + ":" + unihash
>
> -        with open(sigfile, "w") as f:
> +        tmpfile =3D sigfile + ".new"
> +        with open(tmpfile, "w") as f:
>              l =3D sorted(types)
>              for t in l:
>                  f.write('SIGGEN_LOCKEDSIGS_%s =3D "\\\n' % t)
> @@ -277,6 +278,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
>              for tid in sortedtid:
>                  f.write(unihashmap[tid] + " \\\n")
>              f.write('    "\n')
> +        os.rename(tmpfile, sigfile)
>

If the locked-sigs.inc already exists, we'll get an error. How do we
guarantee that it doesn't exist?
Before open truncates the file if it already exists.

Jose


>
>      def dump_siglist(self, sigfile, path_prefix_strip=3DNone):
>          def strip_fn(fn):
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248408):
> https://lists.openembedded.org/g/openembedded-core/message/248408
> Mute This Topic: https://lists.openembedded.org/mt/121878481/10043485
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jose.quaresma@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a16a29065e6a0700
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 22,=
 2026 at 3:19=E2=80=AFAM Ricardo Salveti via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;ricardo.salveti=3D<a href=3D"mai=
lto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">dump_lockedsigs() writes the sigfile in place, so if bitbake fai=
ls or is<br>
killed partway through, for example on a full disk, a truncated<br>
locked-sigs.inc is left behind. yocto-check-layer&#39;s test_signatures and=
<br>
test_machine_signatures run bitbake with -k and ignore its exit status<br>
when the file exists, so they would compare a partial set of signatures<br>
without noticing.<br>
<br>
Write to <a href=3D"http://locked-sigs.inc.new" rel=3D"noreferrer" target=
=3D"_blank">locked-sigs.inc.new</a> and rename it into place once complete,=
 as<br>
epochfile_write() in oe/reproducible.py does, so a failed dump leaves no<br=
>
sigfile behind.<br>
<br>
Tested by making dump_lockedsigs() fail with ENOSPC halfway through on<br>
meta-qcom data: yocto-check-layer previously accepted the partial file,<br>
now it reports the error. Complete output is byte-identical and a<br>
meta-qcom yocto-check-layer run gives the same results as before.<br>
<br>
AI-Generated: Uses Claude Code (Claude Opus 5.5)<br>
Signed-off-by: Ricardo Salveti &lt;<a href=3D"mailto:ricardo.salveti@oss.qu=
alcomm.com" target=3D"_blank">ricardo.salveti@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/sstatesig.py | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py<br>
index 9928f3af49..e5a6eb45b9 100644<br>
--- a/meta/lib/oe/sstatesig.py<br>
+++ b/meta/lib/oe/sstatesig.py<br>
@@ -259,7 +259,8 @@ class SignatureGeneratorOEBasicHashMixIn(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if taskhash !=3D unihash:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unihashmap[ti=
d] =3D &quot;=C2=A0 =C2=A0 &quot; + self.lockedpnmap[fn] + &quot;:&quot; + =
task + &quot;:&quot; + taskhash + &quot;:&quot; + unihash<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(sigfile, &quot;w&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpfile =3D sigfile + &quot;.new&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(tmpfile, &quot;w&quot;) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l =3D sorted(types)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for t in l:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;=
SIGGEN_LOCKEDSIGS_%s =3D &quot;\\\n&#39; % t)<br>
@@ -277,6 +278,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for tid in sortedtid:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(uniha=
shmap[tid] + &quot; \\\n&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;=C2=A0 =C2=A0 =
&quot;\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.rename(tmpfile, sigfile)<br></blockquote><d=
iv><br></div><div>If the=C2=A0locked-sigs.inc=C2=A0already exists, we&#39;l=
l get an error. How do we guarantee that it doesn&#39;t exist?</div><div><s=
pan style=3D"background-color:transparent">Before open truncates the file i=
f it already exists.</span></div><div><span style=3D"background-color:trans=
parent"><br></span></div><div><span style=3D"background-color:transparent">=
Jose</span></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0def dump_siglist(self, sigfile, path_prefix_strip=3DNon=
e):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def strip_fn(fn):<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#248408): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248408" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/248408</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121878481/100=
43485" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/121878481/10043485</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:jose.quaresma@oss.qualcomm=
.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000a16a29065e6a0700--
