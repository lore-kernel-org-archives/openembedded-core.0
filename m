Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.958.1792681338213123674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 08:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Nrxf2AaM;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dK1ddspt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFF8i3210481
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 15:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/cybMB9KDHc3qF24O9nykJY4HxCrzVAW6jNtGtGXzM=; b=Nrxf2AaMbPKZwc+I
	MJlWh758CYcERr2L94CGzUiNVObqn6dVeRnYl0fcBoCIKGOfC55P1FMlLLl/tu2d
	uWWmD+zq1DDHtuIm/8xhOZl2qV4IQCAYqk43yM+dNOI6R5jNdZGN/JBX7/sg8FgL
	HAQQlC6e7/AJ72/VrjORWwtN9bPh9UaU121MstJ572EZYavYUz9H3R/EpPB86D91
	N4g/xiQ1xD9tkh05qEvPrr+9uL4V4mxRR53+brnjXmLzd97AjlAO3CRcxkTpPCcR
	cqyEY51/B+MY2FdWdbjqPtVVxjcZLMtmbnfd8fckwTqpJIqQjD1NwKq2vti+D7J2
	5hquJQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93am5bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 15:02:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso2918502a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 08:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792681337; cv=none;
        d=google.com; s=arc-20260327;
        b=jh5qO2X2empPZ802B5VVFcY1NPEdLg8e8OmdrkqfhucEIlGPyLjk28M7CE85WNvjPd
         YCZe6LQjeqrtnYfyKZmQxY/gIkrmxsJIQnTWp/8edE7V1KpBzeBfKkMSDV8putYMzFns
         t56gEcCG71kJwJ7HdIAs/PEvG2S+cUs1sqkPFAENP31R/QD3qDNYAh0Ekdbj2AbKZYoh
         rRfKfDc0hBjlrN488xhu9nGpktL098ypM1ItQp5xcWGwGjbPZ9AcRipXEylP4F3YDr2A
         pT1BQMV44/q3fhqpqKjSJKSL6kh1kpdmDSEfDVtuXca5wk+pMdUDedy94AV3V9VsONve
         P5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b/cybMB9KDHc3qF24O9nykJY4HxCrzVAW6jNtGtGXzM=;
        fh=AZl8ROU/xaGJN13eaY2g6S1Wy3HeRWOzGsUL1utIaTA=;
        b=BWq2lEuu0IUIHX6CkYEB2JxOZeBGVATtsN5gAlzJglAn+VFM9H2boFAAKEOpz8Dckp
         DQnwWXRCcfsOYrmimsIZPYdLK05/b25D1dBYE1txxTHCsURluIxBpYh2wf2YXoSBZXd1
         GYYU8Cc4Agy8xVgo5IrzsKuIF5R9Ej/jeq40sEhYl88Gq68fL+xw1oyNx6pWixc6vcqt
         PypN9NfRE/fybinYbwJKop0c/ebVbo7MkFNrSFjQ8wIORN2ngXus8Iw1wStYvPuJdTwy
         dThFJEalPli2k67mDycbusJSe07f4kXUsWyRKt+/tXjEm2RbE/q1ule1OPoh9SbuI5u6
         Kp3Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792681337; x=1793286137; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b/cybMB9KDHc3qF24O9nykJY4HxCrzVAW6jNtGtGXzM=;
        b=dK1ddspt+TwWgqsPIV0Tlu3X/EK11Eee+rUs2m8rA+FNbBF9BGdFwonKE7g/AH1s6Y
         aKY4I+z3p6yG4ah1yGhNIVJaQZZfIvLSntbiH4uRQnGPdAyELkoSM+3yzqiRsUx9/urf
         HS8H4moy6qweqtg6j9ksz1Mx7UVoC7I3b80xQW89orpHukt3Hx9fyk3C5viPDpqewyJY
         Ujhd+0J1l+FgMYRv0K/pFmtEDfPz3ErwNDv6YSAWu2qJ2m7yWv58jBA7PvAu8GyoXqTi
         8tm/6F1+Fkbf53PcT5hizXhPQIx6Dq1ra6Ps/57PSe5P+2ARpngeZzqw29bebEYS+q0d
         Re9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792681337; x=1793286137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/cybMB9KDHc3qF24O9nykJY4HxCrzVAW6jNtGtGXzM=;
        b=KDoTbVQS2E8VNohf35OFtb+NNan/C+hSYpFluDKDa2yGrRpz7xFrmzpYOg/VWhzMkl
         jm55wz+dUuGU9ZfOJ2tdDwomX6R7Eva9RiHC3idGzRarmJv+WUsqshByPqwufhUjzkhd
         lEHQ94JUP0Lr5lMD0VccoBnS6NQGeXQqP2KsnkXd37MbRhtdvdjk2d54zziDkSY2zgTu
         HV7+WyOQ45R90NV/ruCzHqPqcu71VsTnNxNfq8SUwDPQbz09qpYMuCdnflimvn6KG8O7
         xtcRFxoq2qOw47xAIDpfL43mjVJWEqbYlUIFsw+6fYqcealaSQh5qqJn2gGq1oRAjKbj
         s9MQ==
X-Gm-Message-State: AFq9FYLBbOsvbUBxKd8rC6cXxC1mJKN32y67jtG4YF5/v1uMpwVRYGbm
	J0DJHChBBZQkS0Y/zpp61j7DWaw001srfwhFNCda85DFAjAKnOZgjfyWlrFSjJdIoW2jc71okOW
	tmqJglJQCz9SGGKG/frm50vxPoQjLsSic13SP9Yk0TpUM79p0LVecHT9K6WbB16ockHFXzgrBYw
	nGN/zOkSPEGTgiyoPidDVcaDxUCKNzTgdRmHgsRUot89Ww2cnKZAM4iZdTdQ==
X-Gm-Gg: AYBFou2P8lrX6KuKxq/h64eRRxIN1yD3cyhQEeTS9cX/9WrA7UG58rXiwnwQMStWz1I
	dtZeOIKkd11/iYxjM17zkfUMmvr1J24uSA0uzik04KGZq/EJCRRgXGOXF9dgKsHVOmY/YF/8CiQ
	Frt1R9FNdLIQhMRO3H3qm6SDbMKgw7Y5XRI3civsygh/YuGp3FIZLZ4AhoSn0=
X-Received: by 2002:a17:90a:d883:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3ad86f1bd4emr4473562a91.13.1792681336246;
        Thu, 22 Oct 2026 08:02:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d883:b0:3ac:3588:b548 with SMTP id
 98e67ed59e1d1-3ad86f1bd4emr4473519a91.13.1792681335560; Thu, 22 Oct 2026
 08:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20261022021932.1842395-1-ricardo.salveti@oss.qualcomm.com> <CADWMC-YVt0-0pkDh1eHFW8GKRwDaLaoC0tygqckez_GLci_3dA@mail.gmail.com>
In-Reply-To: <CADWMC-YVt0-0pkDh1eHFW8GKRwDaLaoC0tygqckez_GLci_3dA@mail.gmail.com>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 12:01:38 -0300
X-Gm-Features: AclHuK8eHH6g1LF8t9JepxMp4W-F9zI_4V8hjOdjb-o3dpH6uNfKvaIxP130gu4
Message-ID: <CAA_5yov138EMzSMP6Ox=w_6M-=wTOqTwwGxd3zeZRB3V=ROoAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstatesig: write locked-sigs.inc atomically
To: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ExWkwIbJfZ7K9doGQ17moTI6nuxmfvo3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfX9lKhh8EHwQLX
 xJ6AWqI3NPzg4w5Fa0UFudPTE4/FBBSMpCPbcmN+InhyIeoMeGaGr64/gbTv12G5peLTaD5aDRN
 JmO+XsO6XLn6H/NCBeYlDg/XX88a58c=
X-Proofpoint-ORIG-GUID: ExWkwIbJfZ7K9doGQ17moTI6nuxmfvo3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfX8OEID0om+xnt
 Ig1SMNKvrUb89LuYXMsvWgSeTAnyqRa9o1ihyXd9b1kAs9+16LWveJ9bo9dEcczV5WWxONMloS+
 ujja/0wfZUD0TZaHUMDs/PDHvuJXPQmtzxPQ1591+1EB5DszKa7raLL2e6jXgvwQ8BdZaiL2jST
 xULG1SqcGUTKL5Dt3mBbI8oC9YPZPoXrOakF92a5D8jPN0E7PCmZ0zJtYiK6+kdXIGEbaObvEIG
 dAyoSEZZFKcY751FSKChJJeJhCPKrBBLL0JvbbXddQ8Icwq0DiZ1bqLURYecr5oWIrhgbjF4GUN
 IyXKl8wZgU0/KriuaXGEklj6qp81855jwg//3EnScauVdwPCVuENFw0inpeB+QMwRmm6vSOj6kC
 EPxZy0S64s8ppWMK2CBBynezLzirPa9Iq3bU2blau1+I0PA++RRPHrKcnNAyGYv5+uKoO2jhwDx
 /rixZ9UYYaFzqhCUFdA==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ada2579 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=Q4-j1AaZAAAA:8
 a=g6JpQOm-opLx_UVjasUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 15:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248449

On Thu, Oct 22, 2026 at 5:55=E2=80=AFAM Jose Quaresma
<jose.quaresma@oss.qualcomm.com> wrote:
> On Thu, Oct 22, 2026 at 3:19=E2=80=AFAM Ricardo Salveti via lists.openemb=
edded.org <ricardo.salveti=3Doss.qualcomm.com@lists.openembedded.org> wrote=
:
>>
>> dump_lockedsigs() writes the sigfile in place, so if bitbake fails or is
>> killed partway through, for example on a full disk, a truncated
>> locked-sigs.inc is left behind. yocto-check-layer's test_signatures and
>> test_machine_signatures run bitbake with -k and ignore its exit status
>> when the file exists, so they would compare a partial set of signatures
>> without noticing.
>>
>> Write to locked-sigs.inc.new and rename it into place once complete, as
>> epochfile_write() in oe/reproducible.py does, so a failed dump leaves no
>> sigfile behind.
>>
>> Tested by making dump_lockedsigs() fail with ENOSPC halfway through on
>> meta-qcom data: yocto-check-layer previously accepted the partial file,
>> now it reports the error. Complete output is byte-identical and a
>> meta-qcom yocto-check-layer run gives the same results as before.
>>
>> AI-Generated: Uses Claude Code (Claude Opus 5.5)
>> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
>> ---
>>  meta/lib/oe/sstatesig.py | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
>> index 9928f3af49..e5a6eb45b9 100644
>> --- a/meta/lib/oe/sstatesig.py
>> +++ b/meta/lib/oe/sstatesig.py
>> @@ -259,7 +259,8 @@ class SignatureGeneratorOEBasicHashMixIn(object):
>>              if taskhash !=3D unihash:
>>                  unihashmap[tid] =3D "    " + self.lockedpnmap[fn] + ":"=
 + task + ":" + taskhash + ":" + unihash
>>
>> -        with open(sigfile, "w") as f:
>> +        tmpfile =3D sigfile + ".new"
>> +        with open(tmpfile, "w") as f:
>>              l =3D sorted(types)
>>              for t in l:
>>                  f.write('SIGGEN_LOCKEDSIGS_%s =3D "\\\n' % t)
>> @@ -277,6 +278,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
>>              for tid in sortedtid:
>>                  f.write(unihashmap[tid] + " \\\n")
>>              f.write('    "\n')
>> +        os.rename(tmpfile, sigfile)
>
>
> If the locked-sigs.inc already exists, we'll get an error. How do we guar=
antee that it doesn't exist?
> Before open truncates the file if it already exists.

On linux os.rename() is rename(2), which replaces the destination, so
that won't be an issue.

But I can send a v2 to replace it with os.replace() (so it could work
the same way on windows, for example) for clarity.

Thanks,

Ricardo
