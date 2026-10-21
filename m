Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4361.1792603457830383228
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oOGR7s9D;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JCb+5o73;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTwOp4158366
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 17:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+s0+gQYK7qp3+/8XWXfs4NbYuQlOknzsDVpSKN+Imw=; b=oOGR7s9DG7drnfOA
	yXltwTLWEpj5VWie/WRliRRPfNzqQ6zN944NzEHm5+C7h0yjWCsBZRBbpF/zWMQd
	LR86lv1NQKGhZXF2X9a7K3Zz+fRivy2wTwAwqy0EdabsAuKXQnZR48NM9+q2Ae3K
	/WGrcmwMeErUuh6oDyJZQhsY3OG0BoJsPAS3xnjDyrM6sJLssVdxeGM68YQVfUAt
	OXsB3ZncRHtFnxFMkJD5NFbUiga7/uLCzRxV7U3xyDj5nh/QXRACfMgnPlch67pQ
	t4CvbRW7WzDHL6aswoh7e9boCRUitjKpzdRTAuDTDK9XYT8C/eSSi+BW8WniW1Ue
	8X7rBQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q93gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 17:24:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so1058129a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 10:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792603455; cv=none;
        d=google.com; s=arc-20260327;
        b=B8sK7Gm/s2BEp34E0zw3uxI3ExGf0MMyOWN2YwPrV87uuioxSEkhSlGpghUqS6DRWO
         4mvb417zVAjJQA649O3Bi3G+hwCejWg6pu9ONCEFXT5L+u8o66fQQfWj7DGHYYTYniyj
         fwNiBsvRQlwc4mwmvY8fwI0HZk6A/Cl8rxqUmzZ1840Ljz7mkDvTJ3fgAAfJ3dIwxOdh
         eUtl7QnlIB+Sup5ISySAIk2ow84YFn9cgCc5Y5nqitSmY/fxxQIqrDxq7T1FZmKSA/v7
         uIRynnLo9EXIR4x99OFRnM6B9OT8dB3QwlKBWB9yXya1AEoTV4ZJVhff49ZjMKV970PP
         M8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+s0+gQYK7qp3+/8XWXfs4NbYuQlOknzsDVpSKN+Imw=;
        fh=01cU9AVqSiz09GDyYjtjVZHtf7rwYAoCS0BTHtnlHLY=;
        b=sMudORWcw/2f0chSeXrj5VcM5SG1t/MCoxt6CnTyZc8FOfdXyAs8zqYOx0olDSD9al
         WOIKLG0DieocLLORSDNz72Nj44f9D0cBn/H+60lXJH8S8PqgJDfup2QwdkyoEp3vOK5O
         v0uDW+bXA+b3Isi0mezJEr/22nIqwWmn+kqmSC1EV4YrwpkP14yEywWrXKFoFwZHIzOL
         1BJCG1G8O4joXSNqHOF7m9+OYuVYyiP3fctBssVzshxuBEBasOO2/tCWQKnwdm9ZxnTq
         PEPlbs591arnCHVbcYhp+NRyyume6ukrk8EahOCej8RwbtDUdP7zDXOMH9Jc6IipKL2V
         xtNw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792603455; x=1793208255; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+s0+gQYK7qp3+/8XWXfs4NbYuQlOknzsDVpSKN+Imw=;
        b=JCb+5o735kNXmNYzaTGcX3Q6pbHwFaDYE5wEof9f2v8mjMoNEb9U6Zqtm4BCGcb7Xg
         GzvIJaaTlH7JWU2JQQuujiW4CVOnt/zMaauqESeLztkqOEAcYRKgvS29J9bZFrNJw9Yc
         2UDSBR/G0D+UVUsWgbnznJ4YAtJe7XWyhwiEbO+c9EpWzzDPL6EUUDbaRbhykQqCpvDi
         C3+f9afrUvtXUXFMbQO0758TvB3IKYjG+bknveQV5QId+zwq8yfyFOOzYy+2Ur3PqogM
         1b3D4x9ZzkBybi4kN2iLWepBIwB9tHgW5USz+DRVay1jiWuJo3bQkKLB0SMSxNoQmhGC
         2Jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603455; x=1793208255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+s0+gQYK7qp3+/8XWXfs4NbYuQlOknzsDVpSKN+Imw=;
        b=YuUPRGFpklUxBfHeM/plQ+xT7e/6+YtKQv2de6G4Np0n+2yLcre+sicBiZztstW1hk
         XsnnTF/VQAXj/GlDmjfBu2ZsJTFcurDk9xOacok2xZo87+7pwHv7Q1Yxyfhlc04QYA6b
         m+awBsxCcKcJA8X8zhnRptR2SFGp4Izx8kBLkhvBPrkUv7afHKiuuYfRCExoItYWACC/
         ZyKk0PkeYLvQYuCR2ciw+4E7l3wKtdaBYA5Kop6ZYRErm6yqS62lmnlgAt4hMoUTESGW
         wbgOa9kDUk8kfrpO3LoytS2PxlYHq+YudCWaK1B/1Vx97nc5mF0hKPBd1/uSnPOeeDbw
         z6Lg==
X-Gm-Message-State: AFq9FYJGWhQwQGU9P0nbb0A/zCBNu8P91QZMpGIZIMS3Ur7J0LcdFlFM
	dokkrXSpg96UPpZbWMaEsTV2zXYdi+sJIwOERF6Ugygw60yH1KmRsnhMqMnwCZoc+e2ib7An3QI
	4HtZBb+LcWK0+ZXPtLSHaZ4gYVI1WT4Ox9hPC7b/Yiag0CJTlIIFzCdfHM73D9Cnit2fqPONzIc
	sclgmY0zvyrWVcFP6BWAfLIib7UPTXVgpG1qiqAX/hmN7GPdowdq8hKJWVrw==
X-Gm-Gg: AYBFou13vnc0qOpo84TQJMW7U6Qsm1fSsonQI54tT/jKWH6DJ1VybEADRc9Sm2NMYy9
	uuptVGxZ34l52uzdc1R0mC/0ECsWwBLn2a4Wl7K84wQ4QkF2ORZ1eMD9GTjIvysz87GT2AkHxDr
	zJqPCqglX7Mmli9g23EVrQrX/F27scqMLKeK4wrAnC/ljQ1R7v+HzNYaA=
X-Received: by 2002:a17:903:35c6:b0:2e9:3f5a:de9b with SMTP id d9443c01a7336-2ea43d3a74amr21018305ad.9.1792603455297;
        Wed, 21 Oct 2026 10:24:15 -0700 (PDT)
X-Received: by 2002:a17:903:35c6:b0:2e9:3f5a:de9b with SMTP id
 d9443c01a7336-2ea43d3a74amr21018135ad.9.1792603454757; Wed, 21 Oct 2026
 10:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20261020223910.539165-1-ricardo.salveti@oss.qualcomm.com> <DMAKA726B8DQ.1SSH36F5YORHM@bootlin.com>
In-Reply-To: <DMAKA726B8DQ.1SSH36F5YORHM@bootlin.com>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:23:35 -0300
X-Gm-Features: AclHuK9exusgPx0HogrLhk4ODKMewKBt8TnB0KtjPQ03P6EGgvFIuzS5JicEO9k
Message-ID: <CAA_5yovc5uscoxnDB9MjpAmEEQto7nm1zr-b1zReEmyBPe90UQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] checklayer: run bitbake once per machine for
 the machine tests
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, jose.quaresma@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2OSBTYWx0ZWRfXy59rswF3E/1g
 S0EHVqOSy8rYuII/d7sdt7avbr5/w+ncOyRxukErcO4PvdipY/I+UGJmWO5vPOj+DwaSqTI70TB
 Adj+djZAJRquAKMQLWJtBwo1+qchTOs=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8f540 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fvEszTyUgsvutjo8:21 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=alK4_DS-AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=Jc7FCzc_RHHJRY_Cg5wA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=rOCknGvZllDBBwZ8Yz5I:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: b5KnDKLnjuKxbjduzpiS7T4828y2Hfjw
X-Proofpoint-ORIG-GUID: b5KnDKLnjuKxbjduzpiS7T4828y2Hfjw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2OSBTYWx0ZWRfX3QwMQ2qjwFXJ
 EZcs/Zk74JzyASF2bbEcUTPrMBhNjfqpdMISt8CBsE5I38WlGwE4F2m9kmk0LuSOv3h4Z6kB7RH
 m+/tEVY0dfErBRluXgMh3dfhC+hUiC3QUu0/N4Efh+5kxw0rWCOQnhD9JDVxLEBAgyhExoZStkM
 QKa/sMTvCK8kwKoZTzjJQwepXSIVUnlBC1S1Tx1Mwz0QW5azAyShDy9Rf+/RYkb9jsm+kuJNCi4
 nHlWLDW1p2jJZ/zlWZAUNx7toZo9niDveKjDSB0xSI1GTa4LzxNhDjKdZUUpWKR0Y7dXyjVy79H
 B4HzuORMUeENZ3NJnBkUtMShv8gzCuYzBewSySeYp7Xn3FXu/J9JZXZURJiff2qIAiuS3f+Zlsp
 8Zu2mGN9e7bbhMbwSyey1godTEipz6Hx9SjLRf/M/A6WL4863Qir2wIhlB4LvUUjV+46/qemI9R
 fsPE491ZbGNPd7uhfaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 17:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248402

Hi,

On Wed, Oct 21, 2026 at 10:47=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Wed Oct 21, 2026 at 12:39 AM CEST, Ricardo Salveti via lists.openembed=
ded.org wrote:
> > With --machines, test_machine_signatures and test_machine_world each
> > run "bitbake -S lockedsigs world" for every machine, with and without
> > -k. When world can be built, -k makes no difference and both runs give
> > the same signatures, so bitbake runs twice per machine for nothing. On
> > meta-qcom, which tests 24 machines, these two tests take 1665 s of the
> > 1818 s of the check.
> >
> > Cache the outcome of the run without -k on the test context, which is
> > created for every tested layer, so that whichever test comes first runs
> > bitbake and the other one reuses the result. When world can't be built,
> > test_machine_signatures still runs bitbake again with -k for the
> > signatures: get_signatures(failsafe=3DTrue) ignores the error of that
> > run, which test_machine_world needs, so one -k run can't serve both
> > tests. test_world and test_signatures have the same duplication without
> > a machine; that is left for a separate change.
> >
> > Tested on meta-qcom (127450527f) with 16 bitbake threads, time in the
> > two tests: 24 machines 1664.8 s -> 969.9 s, three machines 229.9 s ->
> > 140.5 s, with the same results and logs. Adding a machine that breaks
> > world, one with different zlib CFLAGS or one that doesn't parse to the
> > three machines gives the same verdicts and errors as before.
> >
> > AI-Generated: Uses Claude Code (Claude Opus 5.5)
> > Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> > ---
>
> Hi Ricardo,
>
> Thanks for your patch.
>
> I can see it conflicts with the patch from Otavio Salvador sent a few
> days ago. I believe part of the points addressed by both patches are
> similar. Any thought on that?
>
> https://lore.kernel.org/openembedded-core/20261019143924.1521981-4-otavio=
@ossystems.com.br/

Thanks, I missed this one, and it is indeed trying to solve the same
issue, so we can drop mine and I will follow up with that one instead.

Cheers,

Ricardo
