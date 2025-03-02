Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E7CC19F32
	for <webhook@archiver.kernel.org>; Sun,  2 Mar 2025 17:02:29 +0000 (UTC)
Received: from sonic311-14.consmr.mail.bf2.yahoo.com (sonic311-14.consmr.mail.bf2.yahoo.com [74.6.131.124])
 by mx.groups.io with SMTP id smtpd.web10.33851.1740934943288875510
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Mar 2025 09:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=e31kFxjZ;
 spf=neutral (domain: yahoo.com, ip: 74.6.131.124, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740934942; bh=Kh/ytYidLrZzD3cMYGoKrqu4GFxqjmu8J2t70oSvS0U=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=e31kFxjZLeXTofUqmSjT+D4lLC5DhUIsrg/kZKB5JAI5DxNuo8eBbm9Fv5ibfLuXupDVhqCc/cRB721lM9O0/bNdZD3sygH1C2XxBg98sS8VMbxF68CCfXLbXZsAjQDiTqlEgQZwAlcZWoSlvhTeHX+FkRK7Eo+52Fxb+KzzVlYoUIMeYzY+fu1a5Cxpu3YdkvL8VtrJS2djVAIJdSnnmrkgGmx27ZlKB4VgFmsuNh5GgIhNU+8coR/uOOr3BfQ7a1gmYS/b9HyPHBPhVGeUwEq9zKawDpd16j/INFS8EPvKFFK5OYptL7IQyU5geusV7NX9VsEq+DGo0IUJmySFQA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740934942; bh=h6El1idb6dRF5ebrPwuZKO5wHRS+1ccc3HRu5RCm6IY=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=iA41IpTulCPa74V/w6EdxqoKKztkpmG94lR6wZx/uY89+jLTuzD/bPYf//4bSzy4NIUNoif9dzG0T9nUQdGb8jiT/hSS+gyBZpuzEczGwQx68Be9SEibEUrDpiz34ELOTJTe6jay+EBX/515vXInrs1c4Qg3h9BvR03MmY8pzxSeOXqhI4Z9dbjipBkpCN+r/PSB4/KnbBVA2V28oi9KWzJ1w4XmvP50IcgE23JBU+K4iWI7pcUo7U1EgyOxK16dpUfxfsIVNQ7zxgkl2zxSMpLj2NAluIDgCB6ZDUomdoYPZH0QgVZ5JCXIulO7i/yzX8V/pce2+Kn91wLLuK7NnQ==
X-YMail-OSG: sFEHXl8VM1mucxLt7fXJQCgxj5PO450xy.F_w8pySpO28McKGsyr5LHhMPGvBLo
 AHbp7K36IvwobQ46smnmYxsMK5n4jED0RFXTy7GK3acvXGedsVBowSdg6VQ_vR4tn0IIFutwPOwx
 vGItdZEM5ASvouiDon0u7n.78M4UiVrLXovgUeWQKmXvMq25CrgH97dTAPQU9Cy9Yp8po0jwIYGS
 KAp6VXjkcNKcItm3PNEGbduT._kLi5oOecB0PQJmNi46GE0YPTKVLoALKMAz0Jg1JQkUeDAFq0Xg
 Z6FR8LVeKQqRlcyJeOA1aVpI7ecaGT68OVK2Ltfg8dNGl_LBjIZvlHCDBXsaw7K0AUwcR9Plxthl
 pp0VEgevZO0UiSmG9X4Ezmq8sXT11NMRY5BGv3GWnU_oznhRRrL3BcWBw0tmwyujdmN_iDBpju.t
 vbVuMN4w_ZIKVnhA7k5pYC9s.rJt9N6bUveu47NgG5nchZNhPUwFA4HkecqOcp7p3_CnyOFOgHkH
 hmfJohy2mFTZ9WaFBRgIQPxDaN5VXs0w0FwhwdF86C9bEFgm.EsjqssV7zAbMk309RJi7kNMhkYx
 alYOeYEo5uwPaDcVyfPi83lH.idMo3g5P_qcq8kEnL1X8DQkHS6d.WU9xlsnZle1oQljbFOnd_Qr
 ci.ivnMujxeUbpAUDn8hb2OWvIOmdRNTloivV6abBQFh.skEU.tvzRQY82Bnx0EH0MgAh03xJZLq
 d.5Gv8MtDLqXWIJ._Zt88rLdqFijdF41ndTMJxhMj2AfBhXJW8ZufDBhNhmIoCEbp2VIQPUqkJKr
 4e4RnpTAAQtoHV_jHtCOA6dDrw2.e0wF35J.SRN9LbYyOm8Efo8O_3Xqr5UW.geYuHwTDyqTiYek
 Oyz5mdPNRv_UgnHLhe_ezOCahyp_nKVfaMw7lfWqfUJdm14k6sAUQiLhLOSFzLaEv.EXjRz9qg4_
 LYLJ4Q4OxY0lo0jB1KVVbwwZncs6nT2bd9l6lCl4h1MW64f6f2r.o7kDWAL_aJsMRJuamaP_9t5N
 DCElSsrT9shIIhGn.9GFXxQRbFk4ZOXw_DiXuI8EyN_oiLD4T0UPPgLUV3QtwddotYdrNwBv.Bbb
 nzsV7.dOl4X7Hr6hrJ.AAJnGuBaFd4GVLkZcrkAn14CmHCP39CNUS.AFRl2ombpIWIDoJPtcW8s.
 PSOL2m36WftzDb3fqH6Yov5d1EcJiDtZpofm49y1O.0N3.KfPHfdRmoJhWsjxqhuIu7Mgv17ANjP
 UUYcRQZc9NhVuCktSymYRtz8HPLJoY5DlmALuaTSBtiWza0J93u6ncdyeR9_PWP5ajJuEZZlofKy
 liAw65S.xcjS3965UsRlYZASoQUhfvcMV5VPtvtynv.7ySoS3PUVDElGLjnrlRG86VURQOe4289x
 EkPQj_MDfpJFrj1Wx5uRM6PXg9kgGntPzjtKJY47KchcNcGufVt.vqFPIZBbp16VXiUMt1ofRX6c
 iq9OjhdR03xYwYc5ptrtxuFn2WMGWVRZKfbfOAx6ptwsDjXBZlIEkxdEhP2DvVkR3kH2k3p3LQSq
 fSEFCjtM1PwIzUN465VHCoauhuyGZs7g5CNJP1Gx3CLkW9s49q4jt4sM9GiXP5LsnqH4m8GjyNPw
 SnGVGLmhbwdMEj4iBE.r4v9SpWHStgon4RnPAZVwcYfFSX74OdibpmwuxJjL6R0wn7KsdnKnI4cE
 SjnSjmcZ4hn9objwrLtBPs3hMuIiknzsypketLyQ26XtruihodSRekVR5m0au0TUeJ0L6z3KlHLM
 ufTTmh4jWpLK7Y6bt_1VZDjirT3txv.ouUxTjx6JFJnZG_bIUEZbzraPBwEHRR5GkQmDal4Z.zCv
 AtKB2XBCcVsZNsQZ1EBl0iIyKGu9Jan2bOb0AgzLWMho7ouF6DK8tvP8WtnDxBUuZd0czXxgPo2C
 zfX0S4__Ju8fqqAWSuFUGRps1GxfgD79gp1L3YoM3iVMkKSsLPeYbXFTAG14EpbPZkKeI0OSp64Z
 YnfX8P41QsUlGmVkBPdihnXOGrmbrYX3pMTmGdgc8a3a6cOIWYBlXCrDoUk.hv8bhGRDkGQE8oQb
 Vsru7gYo1V0LzXxN1OMcQGRFE8S2A.7nVtHB_54x8P9omW0K01wsSCRwbgTiTaUBtzs386fwd5_Y
 kuyn_BRa24MpIT8OkPaGQJIBSYL7mrjlPYP7X0MvTKw2IVItZdSUK4YF5XS3XtXd4iu5eh9266QM
 koKTlzFTqfQctY1u3Jsu92haiNhheBfGzijNi_GTfGhugXl4223ew7A--
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 8e65fb08-e9e0-4d3a-911f-6c644ebf804f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.bf2.yahoo.com with HTTP; Sun, 2 Mar 2025 17:02:22 +0000
Received: by hermes--production-ir2-8c9c6b576-h9tjv (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 812f016d4ed9a549ac8cfa71070cb94e;
          Sun, 02 Mar 2025 17:02:18 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>
Subject: [PATCH v2] GO_IMPORT: check if set in recipe
Date: Sun,  2 Mar 2025 18:01:32 +0100
Message-Id: <20250302170132.45017-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250302170132.45017-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Mar 2025 17:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212195

Check if the variable GO_IMPORT is
set in the recipe. If not generate an error.
Test building go-helloworld when GO_IMPORT assigned
Test building go-helloworld when GO_IMPORT is not assigned, generate error about GO_IMPORT
Test building any other recipe(e.g bash) when GO_IMPORT is not assigned, generate error about GO_IMPORT
Test creating a GO recipe with recipetool (not affected)
Test selftest test_recipetool_create_go (not affected)
Test selftest test_recipetool_create_go_replace_modules (not affected)
Fixes [YOCTO #15763]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
v1->v2
* the shortlog is changed
* the commit message is changed
* the check of GO_IMPORT is moved in go.bbclass
* the logic of checking GO_IMPORT is changed
---
 meta/classes-recipe/go.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index e3e4782025..23aa3f308a 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -7,6 +7,9 @@
 inherit goarch
 inherit linuxloader
 
+# if the GO_IMPORT is not set in recipe generate an error
+GO_IMPORT ??= "${@bb.fatal("The recipe needs to set GO_IMPORT for go.bbclass to work")}"
+
 GO_PARALLEL_BUILD ?= "${@oe.utils.parallel_make_argument(d, '-p %d')}"
 
 export GODEBUG = "gocachehash=1"
-- 
2.34.1


