Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3937.1792751310253974075
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=XSjrvYq/;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=mz2usYK7;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 5503DEC0110
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:28:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 23 Oct 2026 06:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792751309;
	 x=1792837709; bh=0wFkZJu49On7dPeBb2Xd90yF/wyWA+T0a9eI32IBJvs=; b=
	XSjrvYq/q9H5oTvYGbXKWU1rJKVBo8rq0gIEQSQ6PMjjS2eiLanYjW2MHaTcB3Ao
	HwGIDwlKtQMikCeAT9UtckV9UZ6U01e2CD2LBERhBV2AEosxbUXQQ38QBTHqpZZp
	DZq40IwcRZXugD8YwbyByZ+AdLHuMsOFruZX0rUu+OkeEsDvMIdbF1t3ozJXOTf8
	ezeoKI08Xn6tmvlkoljSlPlwRuWCOff1/pR190Wp9/ixMmru+AL//r2RDCKLbIv0
	XHfD0PjYh+Mag4zVmgMWfATgLCsSW8BLl2J6cd/NKIExNdUzvjN6Ww+vX9HqCj4L
	7XOw/X/JXgxXKguLM8OAfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792751309; x=
	1792837709; bh=0wFkZJu49On7dPeBb2Xd90yF/wyWA+T0a9eI32IBJvs=; b=m
	z2usYK7wFc+VPd2BkQdEYfZIsnY1HGv0j4WjBzoFpymDlYJyieUTBEjjOmw5RhQ4
	4r6GdeGCxoXtxYxhQG/Y+1zMcqmkh8ycokceqy0IopX6t6Y0rgGA1TqL0DtWHISs
	YxGFE9VYs6EdY43eM6tEYHCb6ZJyp0cfmYG+Ipoa46DBEf9/O2/OzAR/5ZV0pr+N
	mBr+FSfu2iMc0ZHa5CqOpHA5au6NtzQb9FMTpQB0IBA2TSGgErphEopRx8HGLzNX
	fGUzQ9wYAcaQlSakjZm0MMN3QgRjfaD7WKmTLrENOKA8Vp/XeKCSwXbf44+fDH0o
	envMZt3zkDyBVFv20Z3eg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792751309; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:dNsDjKZx3+0B2WxpaEUG98zSP7urZKWGgmH8z0ZgYLbHTGt
	dlyG8pQdkzY81kXTIyoPRwLxwSdtpbgNP2sY8Ev03PbAQV5/MF1qDqND+JNkB6Ft
	2b49/Lv6+7ekzgPBHi8yYtdDOhwZks1mZLm4I0keAahNhsw2QtImAZY7W+tr3Gh7
	Ebpd0Gslx2zP0N84fgSOA6ZPb6IBnKyFkD2xXJP7pznzzFD0t7/NBGq/z6ec9+Zu
	Vq0FXJaVQ+L1GgBytCPDz00l1oHHDp8/MddU2CdHH9HD2f6PnyYfvDnUf2F6r8LA
	Y8mt69DdohhHJdx+9XrL8rfYvq9KizHBLt9rPBg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:mAWmrFs3BhmegFbZ+MW78PAjZkJh+C05O7dqfed5Tq8=:u+e1UtOgghRw9lKchbdKDsQOLwsy6A5eD/wGn6+ciAE=;
X-ME-Sender: <xms:zTbbarfYxegj7MQZ_WWZZYolRV2DYySMld8kZnMtOXVHqYFLh5StPg>
    <xme:zTbbaoNw1Lq1TincqtFb56Z0XXg987VtR02gJB-Us8EH1nOJbxOrL-QWlz_Jkn8h2
    B52PATp9PgS8ChcETzi_2K5WopQHxWjf_8uclm_qvYRr2POgZR78aB7>
X-ME-Received: <xmr:zTbbapinNyo0zpoLFlRBaymvvrfFq_-_qD2cGhTdRn5hBiHexizs6k1JmTE-ndjx02YJSIigY4m1b_uKcm4q113dKB5uQrw>
X-ME-Proxy-Cause: dmFkZTGgWpSWrdMLfLN3rKDm/MZZnBrL7lGnCjEecENxBNTXm7/J7MIzlKJFvk0lixGl+F
    gaf9FYN3343jDMuSrjobSk3WQigKwPeExR2Lxvymc8CaWfE6CqMwUvQD7tJ9WJx2gsS+xf
    37aUG3K023EhWKgDKMSxW0uZcioUPfsZbvoNCSY4XvaGLQoujOQTXr9hEpWrV966SP8TZA
    SpJNo9dVB7VM1MU2OHIXXZGenC0RBwQxC0WfyQ8mDrL3qJoQzY7PYZ92wYftWgB3lHVBbw
    dHvT5lQNvrU+7qWZK0gDm1ZrRlSg3Q4MFAbn9YaY+0jfK4JOwbxywLoFx8ZFxDd2XGwqNe
    rSe53JLRWqdbKPZQQ586XXOU4IkUP9tETO45hgLS/wiGeVYPY9xGu4XoJBc28PJBUDjXQT
    BfIO8I6/l3VOMmSG5oI5ao/fO4mf0OByBHzRIbUMB+E/F1ULyFM4dI1Mw6a7sCFfprQTcq
    VuyzlE3teZNXHQ/2YaYLBXlo++yKoBSMOALM2xGCj/SskxyulmlSoErYyMlW0qheyYL8wb
    Y5K+z7SkJXolv7bOMXg7YVKWUZ/tBssoPe1Kq0UwFWI8/P+HuWni7fFyk4POY2T31uxXEi
    s6oex3aDTBRe9oPvxEqaZjnY9EPmibcdD+yZjUJXzz6feYnuBDCsLkWAvTbg
X-ME-Proxy: <xmx:zTbbar35hCPFvm2J9dF3uSPojl9U8I2lQP9feDAma6YzFCF4LVASSw>
    <xmx:zTbbajhZe2UuxBbH8-xgKkMvbtBkOv4g214KIIbpCO8zSC_lNwq5ww>
    <xmx:zTbbarea4yUsSP1Q0ceojHo1pMGluGS1YXYOMhhGW4p9JR9YW6eE1Q>
    <xmx:zTbbamldiHnmy-_SC1SqOcxKZ-4vC8IOflrPKGPluqkIoXy6CN9l5w>
    <xmx:zTbbao3CE0LrjE2oHyRUnC33nMRgSeIC336vtzSkpVOlL6iULGRbbjCh>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Oct 2026 06:28:28 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:28:21 +0100
Subject: [PATCH blacksail 2/2] python3-certifi: upgrade 2026.7.22 ->
 2026.10.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-blacksail-v1-2-6c7ed969eafa@pbarker.dev>
References: <20261023-certs-blacksail-v1-0-6c7ed969eafa@pbarker.dev>
In-Reply-To: <20261023-certs-blacksail-v1-0-6c7ed969eafa@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>, Ross Burton <ross.burton@arm.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792751304; l=1397;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=UnbiF0j1Y51P3Ipn0Q0umqjYZOH2YJNX+UgPztUTzaA=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGUAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEoAAAAhANFqvCf09p6HvSwoiHNw0AZUibAqox5fXkOLFkngPuKVAAAAIQC9mKHzaHcLaV
 BKswd2R1xoBRMCtnV5fRqvwZZo10r09Q==
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248507

From: Ross Burton <ross.burton@arm.com>

This release has just one change: it removes the compromised eMudhra
intermediate certificates[1].

[1] https://emudhra.we-have-a-problem.com

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 99c96202a2c9aea84f5ceb267a8c63c0cff58b1e)
Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2026.7.22.bb => python3-certifi_2026.10.19.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
index 8f1ba3aa9d72..02cdbe9a08ba 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
+SRC_URI[sha256sum] = "035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

-- 
2.43.0

