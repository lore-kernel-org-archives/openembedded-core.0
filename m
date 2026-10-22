Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.978.1792681394077664598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 08:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=djBkWAwh;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JG8hD9WT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEretp534595
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 15:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0iQp3iqChnh
	lhHk90OvSZruwZNFDffqW0MtSzLF7PXs=; b=djBkWAwh23kzY38G73Z7xmkDj75
	0bwS8jwK+eEsbt7nB+o4dUrFhgLZd+dg31HK32nHCioCYL5Yo6edqoW+eqai4EzX
	sBpp6wlNzGvwCeoBWTzQs4OHXJKlnBnhqFG7zOSxFu9sS/D9gIVY4ar5jjDm+VPG
	KzmHILO+0/a4AANrdFtq89OHmJc8xRaC6ff2eD+JtL03G6yb8Haojcw/A4AkIExQ
	7+Tw9gViZ9SDIL1E0V1wqE9muIz6bHH9ZhJFyc2MFfT6VG5ta9PQSlB84KA9WSLJ
	4d2jsadJYsaGD4FsHGz4NX/i4H8fI+p5JPpWFoW4LDYR8jnIklcchJmIyuw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93cc8s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 15:03:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso3160427a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792681391; x=1793286191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0iQp3iqChnhlhHk90OvSZruwZNFDffqW0MtSzLF7PXs=;
        b=JG8hD9WTQ94klw4FhimbRHNwKK/tI0DYp0AKwKlFHkrV3q7/vdSub/9r+X0fhuPR8k
         DJCseCB/oU1hZHULlkANQ5GNdf57N16TYwSZKb+y61DJ0gNlbL4/OItWmyXHN4Kzoean
         WpUFM8rrlaRIM/lyd2TiuXwyBpP1gOGmhLNnBjRjPFtMC8Z9KfBaIaHKzYfa8KZltRI/
         wlT3lMCgSC/lXwIG8GEnD5lrTCk5hh0oOwKUUWNtZEa/gZ9C3TN99LdffnCdqM3cz+af
         OhHN/hLKoMVqaxxW0IzljDkQ0Nl6brHV5n7kby476lkrSBp99t7YzgAXoJ554JjL9YwD
         HbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792681391; x=1793286191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0iQp3iqChnhlhHk90OvSZruwZNFDffqW0MtSzLF7PXs=;
        b=mvsrahWDxtTAUyKwibg2lWRlaRuCWQfKDqfapufjxtGPh6Y2D5X8f0ptR+TpyLgKgW
         tJNb9Id1FrPs9ilW6qPlGBwKQIefESQ1u7BitRZPWd6SQn6F5UpgbV3vLo+0BJp04GD3
         osLcBnRlJKCFY7MXtbjpETlQAyk4BU2lQtPI4Xxmg0UVuCZ/3mU6PT+AHl1hUXl0psfF
         1pMqFKTrnR3tps40Yhrpi3tVxZIwZNJXBMysldWergl9FA/ja/hkdJ479ZunePcecmr5
         mI5jtBTUMMq46n9Pz2bEFvsK+TlzM6LjC+kXt4YbCCKlYeRAH/mPY+aiHDBenLMvXkJU
         m/dg==
X-Gm-Message-State: AFq9FYKW56Vsu8/0VOePWcpXNB4e4zxSt4fwetjY1FrwVw7RcRcRyI05
	Di69oBaPRPAZDaBExKJ9psx++VOL0mJc3Mw+PfJPsyh5DN77PJuuRHUWSmZ0X9xM3XW1X/TZC5w
	vGjjdxLxNJBTIEkvDIXKI5bokK3euzOQVeQrlMTZ2Wy1ADt4NVo2JAbHfsWnqhiYkiJ078J5tLr
	rJkQt4H3CHf7hcEIZCGg==
X-Gm-Gg: AYBFou2YetZgupj+z12K6/79jW7abxZ1i2B/IdmyE/fiuYjXaTzQhOUv0YsalyO4+lV
	qBulc1l38FweUXBQDSyd4Miid7ETnKEPHno7C1weO4sKndZlt7zrCIxKuk3Hdi0wn4ve+eYbtkH
	fmX9U8g2qKXNAaheHG8jEXv4KARNOJ+tSXG0n6OC8k+BoVGKerujMtVAbkBYLg2NdBzGG/euMjX
	jlRUBXSEOGUEIvDARB/EVtTVeyUdplCYCwd6D8lDFzK+THpDXc+ZXmqrrBj9lU1CHY+c/0S/Dov
	hCC6in0yCY2oME2wUq5z42ZHtNO+4MhkrYk5ZWTuPGq70wc+ntUE04uB+GNxQlHH2CNtvsgrNs2
	hlXgfjqr3To62OFUlMrfmjqI/hY7uFoccgcVlU14HVT4VrT53fy39hNhuLIcruGN9++ivYlq1+q
	XDJD15jrdXy3jVGLQms7jojN72hK4dNY+yP235NQ==
X-Received: by 2002:a17:90b:4d08:b0:3ac:a7ee:6766 with SMTP id 98e67ed59e1d1-3ad87071007mr4508439a91.36.1792681391455;
        Thu, 22 Oct 2026 08:03:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4d08:b0:3ac:a7ee:6766 with SMTP id 98e67ed59e1d1-3ad87071007mr4508411a91.36.1792681390936;
        Thu, 22 Oct 2026 08:03:10 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490d4bfsm5362502a91.10.2026.10.22.08.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:03:10 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: jose.quaresma@oss.qualcomm.com
Subject: [PATCH v2] sstatesig: write locked-sigs.inc atomically
Date: Thu, 22 Oct 2026 15:03:01 +0000
Message-ID: <20261022150301.4033599-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022021932.1842395-1-ricardo.salveti@oss.qualcomm.com>
References: <20261022021932.1842395-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfXyiaTS0yON6t5
 eC0cLp36ZDSp5T17x0Jmsh122csrgEBwMHryDa1wKtOeekze/cRvmoHflwnlkAuuj1HewPp9R/p
 o+CKDNMeom7lamq6aYNHOWuMDWkzQrg=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ada25b0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=FyNu86JuBG-2Knc06FUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: AyBZuk_dNPjBGIIzxjLYsnktKhSfcRfd
X-Proofpoint-ORIG-GUID: AyBZuk_dNPjBGIIzxjLYsnktKhSfcRfd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfX73btmlr3+9Mb
 MHmHLY1OPiGnKnAb9+9CpMtjJqIG7BhHJ/7Q+vQYrqCOf34fgygiiIyqxRLjc2h51GMY/BqOlES
 cArzn35LKhs9B+E8VYAz254hmWrdrgLXxAi9cntTVS8Oi0CJfGl1Sqh/3SSa+DujRTvr6Gua7Ai
 CkvfNdmelLIbUsz4rsrD/HzBa/FDGElEklC2fEmtiUoMb2p+7zATq7XlZFbvMv0yovbBPim9dTc
 lKhMnBRYzc8Mv82/PKdcliMh4R+kA3y+vjTVNw/70AF2AND1nfjpYYfPXpaYu+WTp0XVDVDAnZT
 f9N4v3o2XJihHti/Y3dwTujivhnnhLoFEb+pf6KwAK4OQSv/BU4gmFy8bMLF+XBm+TgjXI5cplS
 xbr3Uur+xre5+Rlaki5XPRs8YtVMZufbYVNqhxnvbJu3XW0xQcYNHpKIOfsx2vAAmypZ1kUyMZF
 ygNJa+fuvFEykq/nwyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 15:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248450
Content-Type: text/plain; charset="utf-8"

dump_lockedsigs() writes the sigfile in place, so if bitbake fails or is
killed partway through, for example on a full disk, a truncated
locked-sigs.inc is left behind. yocto-check-layer's test_signatures and
test_machine_signatures run bitbake with -k and ignore its exit status
when the file exists, so they would compare a partial set of signatures
without noticing.

Write to locked-sigs.inc.new and move it over locked-sigs.inc with
os.replace() once complete, as epochfile_write() in oe/reproducible.py
does, so a failed dump leaves no sigfile behind.

Tested by making dump_lockedsigs() fail with ENOSPC halfway through on
meta-qcom data: yocto-check-layer previously accepted the partial file,
now it reports the error. Complete output is byte-identical and a
meta-qcom yocto-check-layer run gives the same results as before.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
Changes in v2:
- Use os.replace() instead of os.rename() to make it clear that an
  existing locked-sigs.inc is replaced (same behaviour on Linux).

 meta/lib/oe/sstatesig.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 9928f3af49..928fe2e44f 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -259,7 +259,8 @@ class SignatureGeneratorOEBasicHashMixIn(object):
             if taskhash != unihash:
                 unihashmap[tid] = "    " + self.lockedpnmap[fn] + ":" + task + ":" + taskhash + ":" + unihash
 
-        with open(sigfile, "w") as f:
+        tmpfile = sigfile + ".new"
+        with open(tmpfile, "w") as f:
             l = sorted(types)
             for t in l:
                 f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
@@ -277,6 +278,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
             for tid in sortedtid:
                 f.write(unihashmap[tid] + " \\\n")
             f.write('    "\n')
+        os.replace(tmpfile, sigfile)
 
     def dump_siglist(self, sigfile, path_prefix_strip=None):
         def strip_fn(fn):
-- 
2.43.0

