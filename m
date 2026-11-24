Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22985.1795540443374909311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=naPsSsfL;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=kiUkk6EN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLBR9700266
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/2hUoEzpOaQVLgGi45iJSW
	3SMPYmx0259Co7hw9FK3w=; b=naPsSsfLZB3KUqhSg7+LYiP/NJ7A8u4rEOyQlB
	N6fkN+YZAQBeuJ/ieXPA7tzKPHX6GoAWqCcS9Bbuq9m9CudTy3FnUi/EqWBoJ9Oh
	z8ZpM64NUOZrDKw8eqpRdpKjN/IYPguRyuam2BD+3h9zZFYgx76hUG/+xihI/S9Z
	c1xcwExlgqVegbE0U26ioBR/HXKrE0BsHVKM02IBouvtheysWEnSfC9nBn//dhlo
	VHYRXvTNWLlfFL8w7vOkYiQceSR53apAB0oGS/cSRBuivivLS7snQECa7U9HhWUJ
	oXfxQ2YyXRmFqzDNZKp+QQSmzuBLY9G/JL+f+JDVJzZiN3cA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f4bpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:02 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67935d0ddcdso7302700d50.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795540442; x=1796145242; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2hUoEzpOaQVLgGi45iJSW3SMPYmx0259Co7hw9FK3w=;
        b=kiUkk6ENYhejUDBh6xXUnYsLXxbx03vmGMnNHJXNJLc2eV1RriLM8b2ymWyrdqFMcr
         Obi6uS/dJmKKeq1htrCz1k6VDLkW8Mx+9t9ZUzDts7RhTgHTAhVc7XmwuD9W/8yaQNwF
         m9/Al2iWauTIgzspKz6nUxjzMu23cooAPzaQ1KsTXqeE6QGjjaUTA7IOkMV3N89NscTt
         rA/6Vm5C4xMOcA+PVu8RStlInxfDJBsCeqFiKAA7In4YONUDo77gKAO3e/gDOx0eKKZg
         /rIQpoc1d/XduCi8vQ98HM33AdczImd8ONLerZkLhEh06Rr2SCinEm9DDQLKKGKqBdlr
         3i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540442; x=1796145242;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/2hUoEzpOaQVLgGi45iJSW3SMPYmx0259Co7hw9FK3w=;
        b=bisU45LdYNbBLCUHGgK79+vRxNGywNi0SA+Yb/tIkfdCjeG2oHSuTePYbivCifKgeN
         M4P01aWLg+PHktt/o9bF3ui62sK+vz8NsuoMiPmq4Kzc7h7FbbunqL4dSvXvja5RiYcx
         LthLIx5tlqTKWS3nx8f81Sv8JXPmSTsVHTuyldNdj6Srvg6ZXE/aO96DlQeTkZ0MdqJN
         fHKdxaJjEKrOhBPK4fNVKrGuo320OmqcFu6ohxRXeuHSiVpjJByBDE6qlYq5fW8XFGrA
         gNc+OFEey8BO1PZs+Rw9xGGnGSwUdBZ2xDl+3TOIi8ZTtOOU3MfzIifCc6b1Q/ADUo45
         vxhw==
X-Gm-Message-State: APuU4Z++qBeJ1CN0CjSLjg6YcLfriS6nkX9gc9EXGO+iMab677vrBijX
	t36AUGtcY1z9Vjb4jBRzIbW/bs+LNhY0hSqSsBUQ9ZMvUXllGXcA+xcalKav7UOCs9/UH66r76+
	l74+wm3h0XQcXvr4hf/X1vUKZSKGZb8RlLQNUAUfTaH1Uj1GQs0w5kDjs+yOD+m5v/D/nOCFE69
	LBr9coT+8toZrm2lc5ZiWL
X-Gm-Gg: AZFdTZdXxeJOORvpX8GdrykKtSBScb/qYQBfoifaFaCYKqzW4tUk/xHBO6pNem26ZaD
	oAka7Qd34kFi8jeHBOY0klvFucaWwxLnT1Hto8To7IKUaV9DZ3Xu/nuLZ0yqjKwiG9a/Qh74xXz
	jP9EyuT1QUet6LaJIp20XUM6Fw8l9BQvVFyxCoPatOlB1pHdFNZ8RtOMnLqWJhGV7KQ59CSP55Q
	7aJXrp0dN2ggf8AIbFLSdqgf+xSRbzKXOX+gZ9ajzLa3xIama2pRspmnUTesiWXA7uj6xlHkLO7
	t4dy2sJ616yuPSCBJAGmxmn3/JbEwur1bklnaJT5+0oVCLn1mCfUYvehcW/uM6bjMOnMSAEmHo3
	oBAHlMBZRUfH9JjNVluqGvNGt/0R95WHU5AWcysRrxaUtsB7XMKh+xOSK1L/ZflI=
X-Received: by 2002:a05:690e:4806:b0:67d:a8d3:ec62 with SMTP id 956f58d0204a3-67df42bd273mr3830475d50.7.1795540441512;
        Tue, 24 Nov 2026 09:14:01 -0800 (PST)
X-Received: by 2002:a05:690e:4806:b0:67d:a8d3:ec62 with SMTP id 956f58d0204a3-67df42bd273mr3830472d50.7.1795540441013;
        Tue, 24 Nov 2026 09:14:01 -0800 (PST)
Received: from toster.lan ([185.228.162.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b33a596f9csm9632479f8f.12.2026.11.24.09.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:00 -0800 (PST)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [RFC wrynose][PATCH 0/5] yocto-check-layer runtime improvements
Date: Tue, 24 Nov 2026 17:13:46 +0000
Message-ID: <20261124171356.951415-1-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX96P48U5k5tei
 LBIc76dPisc7YtHRdzPYlJhSaKQBBdZSwqSkLL9ZD1KT+aQxlTIWV1q9AEp9WRyiWMxaW0FzlJa
 /i6A5dqpF9NsLx/z31QyuGCUEzx+Aw4=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b05c5da cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=qOKIifoFPMYe9XV0Ag7/Dg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=BA9JO9UTgZHMTDGUlO8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: NdYo7hdQ3Om1XqAQhew7djNtfeVM2Iuc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX6UamH4ojy3jm
 qbT8BmYZfH9iUMkpDm+T+mK66vN6lcT2gekwXqo7mYWzMWrnsY0CYyhMVjxB2SlJaPN0I0PitH4
 0qcIxlXEPUQTOBdi+fCleeuyXD/4QXevRd/SpkTp1zLr6dtrOmFsd06MvMxtNUt6gLfsDHs14tg
 qYGs9APZboSJWmK5vpDYv00wV7wn4C2JJMTzNCE5Go7kfBBFwIYsV7dExGbUtwlv0Cy52yB8/NV
 0Kxs9fOa96oBd+FfZ1fGpJ7rAratfeyuLiCKP/zCPKAS9ouK1bxw9xgctIYqWNF2cxBqrmyGnCi
 uvKAzBAsyPzUGCcWCKfAgwcRQCiRAEwr9ralqtS84QutxX5z2TAs3kWFNvuhVAEJMuwk5RkYl8m
 Ex9UiyF8TLK6uMLxsCRCxmYynxdJ3fLeeNR/v60g+AciV3c+tRfoqW7p/zE+S2o+dDik87M24xi
 wXa3ePx1jjtLaADw9aA==
X-Proofpoint-ORIG-GUID: NdYo7hdQ3Om1XqAQhew7djNtfeVM2Iuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240067
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 6AOFLBR9700266
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251044

Recently, features have been introduced that significantly reduce the
execution time of the yocto-check-layer on master.

This is done using the new argument "--run-tests" which can take the
values =E2=80=8B=E2=80=8Bof: "bsp common distro" to achieve the same resu=
lts as without
the argument at all. In my tests, using the argument reduces the time
required by half in a layer with 25 machines.

Otavio Salvador (3):
  yocto-check-layer: Add --run-tests to select the tests to run
  yocto-check-layer: Skip initial signatures unless test_signatures runs
  checklayer: Share each world signature dump between the tests needing
    it

Richard Purdie (1):
  checklayer: Improve debug output

Vinicius Pedrosa (1):
  yocto-check-layer: don't skip entries when dropping invalid layers

 scripts/lib/checklayer/__init__.py     | 31 +++++++++--------
 scripts/lib/checklayer/cases/bsp.py    | 15 +++++---
 scripts/lib/checklayer/cases/common.py | 20 +++++++----
 scripts/yocto-check-layer              | 47 ++++++++++++++++----------
 4 files changed, 70 insertions(+), 43 deletions(-)

--=20
2.56.1

