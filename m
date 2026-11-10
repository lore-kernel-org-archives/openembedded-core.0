Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9821.1794270721337696900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 16:32:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GzNqSpfk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Wca5SMWx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA8og1393066
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 00:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrbUc5SLtXWsTfN+BqzNpkPsMjc9IrdHEKKAONlpaE4=; b=GzNqSpfkauKoWCgi
	FHdDU/nLQ9GpRp8F1idfuhVISlWOL8dmrAOnxlq2VxWBDhxCVXNuhosO7XaBei1W
	B4RQxjN433E78f44OVXjq1BpBQ7YDOqFTfJHBI7tgvf2XRGZ+Q80ZWOgW58xLqEU
	4jJjIkc5y8nAf5PP0jUFfcHyXE8O16vVWOaBbvGrNVFNGlDF9qjdiD+4KBcgwqZ8
	8f1mqaV8y+nQhLTo1r7FyipABrxa6rYhrQJ8oe6qDHlFf4HhAqo4rBp/Oc4w0qPv
	GVy9VM/XVE7GbQAiiY+BsBKRMkafltpHJEng1LmBwt6O/YcS5wOlYKX43rtHpYCZ
	jHxfTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5tt03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 00:32:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5364605e74bso40962911cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 16:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794270719; cv=none;
        d=google.com; s=arc-20260327;
        b=oxdwcaVmuiwqAV05r74kFN06hiRTp/wfEBEr6epuGTw6jtf9AuiDLYteCK9Kkt36G0
         MBf0DEuaSBwcLhaSdvF5lmVFs8hW+HL+qfkd7Q87CeOJRS/fah/w/IBOoFx/ffUkH3/5
         3o/67MZ3EIi7dVVddYYo0VEVnc+C7b5w+QNaq9TPajAZXrm8121xXJ8FLN4GDpbaO0Xp
         2H3XWmQ1bGeC2MqCsVDq2GeDbFng3YppV+Wz457QiBq5U1xrca05pX4oDfqlzXOLxI24
         DhjYFdw0V8jsG8TP05BgpNHNfRYP1Su64z70d5UIy+NN6oa1s/zxQfmqlbJ6rjK8ICdA
         86Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jrbUc5SLtXWsTfN+BqzNpkPsMjc9IrdHEKKAONlpaE4=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=jbKXCxbs5iOcanlUel3Tp2nhosu+rOzj3Uu7Lw1GMhwie3634Tnc6z3sW6ZNLLQz3S
         WJjJjzLDy/7tYwzkV9B5XiAz6r2tQPVMwLAPL1e6sD3BTzvaRiJMEzVxXksFRmVRDgOT
         /PGOprNsYnU1nNfrhpr1R7JVb1Q6p3DvCWeiS0Kxum6WtE7w9jXw17Zgd+Np1nwTb2f2
         LZC2rftUTlLstosI3JtdS1UROeLZFMV2tdfhHZ5aeHggKJHnt4oZvRQ0MDQzwMNO4ADr
         bPGveG0mmKCFND1PbDD/UZGoBJdOPmjls/JFMdqPQ2kmFUHkiJ8Ns3QP9gvJL8A/qiHN
         FZkA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794270719; x=1794875519; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jrbUc5SLtXWsTfN+BqzNpkPsMjc9IrdHEKKAONlpaE4=;
        b=Wca5SMWx7X7WMfcLxcgWeKIOfRCgc+tW0PpKUUpeDe3Y5tSAUScpA5sQojlEJNBaM9
         i3+1PVlVeh/pNcCttJ5kKZlVnA8wyl9mj68zncLdT5E5qE4ROv9nQWGbQotMr4f+ukYX
         ZDXJEGJ8G4jxL0pZ/lDuFLFSa3UJSHEpEO7EAGQvFbnEK96MOlx2EfA8/ZMvqSbo/NXR
         hTrDSyhwbQjNH697FS9eJKqX+ustyV61Llq2FX1TfMqlbK10LWVT1o29mrOs6xP3lOYo
         UyR3WdxG0WxRlRNyFr8v4tHD6ulR6NnxgVThDizY4OmDicMfdn0XVT2CN0cpYm0LONRb
         v6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270719; x=1794875519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrbUc5SLtXWsTfN+BqzNpkPsMjc9IrdHEKKAONlpaE4=;
        b=LnJpmHXyIHusPMemo2Y3WIphadw668x4W7b0mTZpdcpvk2kGlVABBypykG3ZDuWlzC
         RP/vXOC3xowIBMU7fbOedE+p1ye8ZyHhFYo+GRccxxtqeBRp6U2RYKy9u4NcSA3uB7Ck
         aD4/BZuLSSEwfIbLmhYJvM4wwd3pAzC2xuOuOkpZk93VR5e+niJ3ovgB/0rygBxNmGdW
         /eQIgZjWoNaFaLYu5PNw944RTHHXKyAGobmvu3cLphh4YmXa0d0EPygWAAYAwEBL6MYq
         yIrfPW8ow0RkYbkxqD/jNUCRQ7k8T8auNzyn8qnZMXMHTairikMg1Q2ZO1CJCa8PtKZ+
         WP2Q==
X-Gm-Message-State: APuU4Z+It/VxclIQ6U9xcXqArn50AcLGnOIoA4l1RdbRjPIiU309XLmM
	3H1Hpdzk594NCN2ZCBSag+Qb3uZ0FELEphOvaWTnpU8xhEEL/68824+stNtUjZ4mUB1Pj9Ws8Gx
	/xuLJMEtpji2MAbJrglDRrpOhtwjHDF+374F6t1PZLoVUriBQX4BaqPI4yXNPfxZtT1I3y0aaYv
	h6hjJy9XJItq6Y2jEmxsUbD1IqpHmp4C0XtzHY82DuZ0nlC19K+yQMpInzdA==
X-Gm-Gg: AYBFou2jS7cOfI4JbQySlVMNmeNo9V8BPQ1xP2KCnk7g3sMCzAM0jMMxYNWCgOG3xpu
	YMBTZ8mJ8ePocxZ7vxfM2Bo6rHKws5szdRdWW3ua7EZCeyMiftjLkgaxuE6HdE9icbtAGhRWYkO
	Li8ouTLwFkW8rHdLJ2csERAc0D4dat9n3gNcOgZ++xOgqTW+jCLFm/f8k=
X-Received: by 2002:ac8:5a05:0:b0:536:9737:e30 with SMTP id d75a77b69052e-55527d1231dmr15733091cf.18.1794270719386;
        Mon, 09 Nov 2026 16:31:59 -0800 (PST)
X-Received: by 2002:ac8:5a05:0:b0:536:9737:e30 with SMTP id
 d75a77b69052e-55527d1231dmr15732781cf.18.1794270718762; Mon, 09 Nov 2026
 16:31:58 -0800 (PST)
MIME-Version: 1.0
References: <20261028081905.1780834-1-anuj.mittal@oss.qualcomm.com> <DMQXXV4EAR2S.2L62KIFZJCR0@smile.fr>
In-Reply-To: <DMQXXV4EAR2S.2L62KIFZJCR0@smile.fr>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 08:31:45 +0800
X-Gm-Features: AclHuK9tP4J6z2f0y2iTqUT1IVgTW62gKmVt0P-MufSFrCyh5y9-K6kDyDLvDJw
Message-ID: <CA+s=J=w-Phn9Nai+fgqjsP5sWRoxNAJTVTt2xeC+13FKmtSXeQ@mail.gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH] recipe_sanity: Drop rename overwrite detection
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwMSBTYWx0ZWRfX9GRsjorFm4wu
 s8MMe7i4KE0IGZSL9JwVaqze/wE667yptE8kDlBAcU+tusr+QROay1RAJxYLxfUsKbQrzZ7crAT
 N1kBoRJBa1bINbKbNBirZnYXMstz/O8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwMSBTYWx0ZWRfX3Xjh6p5MiMXd
 nDgkEnA1q0eWiWDqnc+5+oKUC3DRDvuRN+W1EXZKdQJkz4BGoWEY8INS/AJ6b7/yvuAut4s/quD
 pUGJfiu7fzyrpbuzFXRXfZoZI36+6Dk5lWcuw2e3OoIRBxeU5evriTnq4FM8n8p500ExMdBo9Bg
 SddF8AaxuG5HPFoooOWupQwiwTBMwWQXrhMAWCI7MheAGq9tC1DEzQaFftOeeZIKWpKh+ffZ0mU
 9qDkfOgS2Tj4f+kcYyPne39AqVbb41VkJGhmpI7EhWy79fwtpiIMt0krKxzELl1nef8NLn3Cc26
 dWhuD3BQNStsajlTPVxWRPnAPU8uBH+o9ADCeuVZwu46EgJrZa5U3cchInX79gv5y+WKnVQb4cF
 qh9bDJUg6UWa3myU224vLi3b3BiLcGgCOKKauGvOrKlRPLVPzxGVoM67vQznq+w1ayRxlK6cD3h
 H6Bb/EBSCXmXzVa2hwQ==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af26600 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=Q4-j1AaZAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8
 a=JRzul-12Z76EEG8EJWoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: 78tOLYTVtFjp4oeW2EjEg1IE8FMV-nR0
X-Proofpoint-GUID: 78tOLYTVtFjp4oeW2EjEg1IE8FMV-nR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 00:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249883

On Tue, Nov 10, 2026 at 3:52=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> On Wed Oct 28, 2026 at 9:19 AM CET, Anuj Mittal via lists.openembedded.or=
g wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > Bitbake itself checks for probelmatic renames now during key expansion =
so this
> > check shouldn't be needed anymore (it dates from pre 2011).
> >
> > (https://git.openembedded.org/bitbake/tree/lib/bb/data.py#n96 in expand=
Keys())
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 7944665886cb0bf881807a5d849ebdf42a33d1bf)
> > Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
> > ---
> >  meta/classes/recipe_sanity.bbclass | 21 ---------------------
> >  1 file changed, 21 deletions(-)
>
> Hello,
>
> Is this a cleanup? ... in which case I can't take it as those are not
> acceptable under stable policy.
> Or does it fix a bug/error/failure of some kind? In that case, please add=
 more
> detail about it (like the error message, the condition to trigger it, ...=
)
>

It's a bug fix. Please see:
https://lists.openembedded.org/g/bitbake-devel/message/20382

The corresponding bitbake change was merged in 2.18. This would need
to be in wrynose as well so layers using this class work.

Thanks,

Anuj
