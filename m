Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4257.1792751827381972044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=NaDwgB/K;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Fujo43gv;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B91E61400047
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:37:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 23 Oct 2026 06:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792751826;
	 x=1792838226; bh=gFBPdL8QOPQl0a5Wj6mCZ2oXrZefnIj6Gvwx0IRvr/A=; b=
	NaDwgB/KluG/0yWXpI/GwQg9Qsi9s6GeVrdW2RG7CLd3EEa3muSO3r8AkkG9g9rR
	7bh29HejXOW4PFmyJg62qky2+4t+/BWzahMfFg+vKOOiGTJHnZ4QmaMC3VR6D3yK
	XTRSF6h93uB+8eR/0+BZ90DQgAnxwCPbDj6d1Wjsc1DSxIJjRi7VtiZ0NOfEhxd/
	zHhD6sIFAHzhCWipsa6kpw0rIr5+sLqmKE0lyhc2ZxpDoPbVuTewakxIgdkQzrt2
	CaFFUFoH7Lq2DPLK4n/wfzoVK7AIuEIxp0o9R4z7UAbspleE7acqG0J5pRK64ikt
	os1POWBHN+F+2gyd94JY5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792751826; x=1792838226; bh=g
	FBPdL8QOPQl0a5Wj6mCZ2oXrZefnIj6Gvwx0IRvr/A=; b=Fujo43gvlkr1nMZi+
	1839gA+I+g/5kQAAQLFWeHYRTBnUIvWqq9OyzHFpYWHu/9m49hKt267si2pSxmuo
	GGHqXmjP7Js3gcPDYaunCnhLrilUoJk/LJN+p87CL6M9WzG7bLuL5ZCzWEIY0aNe
	DMFq/VzkzDKF9IOgbe3UH6r4U583URBFsUfF5RWYHgRTjoBqd8x8xP8LYsRfOJzd
	Uobji5SE/7HabuRTCtfgw6qXb/zMHuQrcA/cEfc/QydH2PmZwFO6aMeDOBuLHFaX
	UgXJxJ/5H/yd1+RGUsnk2SJ3DlGwGQD3j0rpp9HyRwcj0/mKr0+0cozl7uwLmUtr
	L54OA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792751826; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:YdunuyDD8oXwzdvTJe7vtJF522x8DZlcdn9CvBUBak2s9y6
	7Hr+0WbbyWjSZ701211BPnlvgBPfoWGlnrOGIHnAqbOB57ybuWcCN4k27DXiJkiw
	OC2syN+Mm4aY3gVohdTVRx8Aa6+U6Q9yhiRk3kmrR8eRqwz6Vym9QPNsKsyRq5+L
	28ZK/a9xBmorXXwqHLTJM7qRnYksirqOAFVStkCzfytNno7NOywAiks2u5dJjqAS
	xn34hYb8BJxx1CoPfYfeOgSLz7e5hS8vLtFLcGnzk2GxHEjEr3X1HMP7HZl0HHDc
	Jo5RzXDZuTVm8cIjOla6bIoKNHHRDFdDbNgarcA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:6aLEKRpnqvnSVHTMcPoTRjIFYeP6EgUr+MB4BsjRtHg=:0eHspfNdIELb+1ubkhCN01+XKgJHBMKycsMimmBkoSM=;
X-ME-Sender: <xms:0jjbaouKZLgY3_YOrend0vfIHEPW5E2qGiM50pl2QZ3WoGAzO-GlMA>
    <xme:0jjbasbzC8BGu9EtteP5gAHoVdsMmZA3BfozgVgPVAiUU-tP6Z-bt9hlxnnlhdXmR
    X3oVMrZVcSAEa4D7p8ZM10XV5fU-uUH5D2_LNY4WlKGBqCgeBs_qQEH>
X-ME-Received: <xmr:0jjbapYaxWzhdfCGP-0sV1L3c5J0ST3uyin9wjebsmyi4vkZAmZNpqmwNXQNmXkkhkPiKfsM1S1g5p1rTNpTh-3LhJCubq0>
X-ME-Proxy-Cause: dmFkZTGdXeWEdgZnrxsR0LfdKteSMLbi16IvVblMar6iaBUXKRIad9b/S1RFbYAPHM8w8i
    fH0EqDVuO+IAqrEfs25nXUvA98hpdiGCUYS+QIeihzz6K/vqil48ncRKsz1V8CDB9cDPoS
    rh4Dy76yV3MwTbJpWnKbCgRHE2rUZ3jLi4Q+Tmb9orUNsVUuWWJQgMpKiK+vij8nCQGmIK
    w9DEWSSOeRqTSsgrKYtDMv0d7E63TMM7B7H7cX4Ff0VskLU1f0REdI85KRRhfWfFubUM6G
    hYTYiCyHLl4iZwZYhXPNsBPuLPQ4hiMoT1sf5XoAWhtYx9BZYb0fupOe1GMh8OYkTjuyiv
    /gqcXi8FG9qyAvH35ok4g2iwu4RmriDvrsWXdbxP3ZIb047XjuKNTdYlYIfhes4IUiD6YE
    EaUbmiQwsKAWOt0e2LnyaOiBMWkWaxmMei5GFb0QMDAT36IuosD5PzqDgwOMRqVQc3WQnA
    KB0f8Sr1zaVatElpqBtjjOSppT3t5rhv91r19swTz6n9n8j85EvMC2wWSLfEm3j0D0rG1n
    gUAqmq3L+hBNGejkQr0fp+bElKdya6JwufafTPaondv0QHHrvYIovy06rsT3jzUs04rBGw
    BO3AyDrasc5XYFZLMDcxfg1IHUqqspSnq+ZERiBDsXZKEad775uqX5SDj4KQ
X-ME-Proxy: <xmx:0jjbagWXjGTu4x1NfLCjm2A9lLWkS15_RP7AtlpHVlultzlQck8Fgg>
    <xmx:0jjbao3AS0_4rISTMCifxEER4omIYm4QmXOhcq9_PpnioT-xBhhGew>
    <xmx:0jjbavaW5ltc7XZsvp_jKbhj8Aqi55PvjwCayPDRuwblEZMMMr4whA>
    <xmx:0jjbajpUltqi3taNYbcFgVvuDRW1ZHLSn40P-soAXe2JfcbkOLH4ug>
    <xmx:0jjbais7jtXhLeNFzl3bwr__ZHpnzeR69MXV1AxgfsOM7wLPte0Eiavy>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:37:06 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:36:58 +0100
Subject: [PATCH wrynose 4/6] python3-certifi: upgrade 2026.5.20 ->
 2026.6.17
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-wrynose-v1-4-83dd2facdbd3@pbarker.dev>
References: <20261023-certs-wrynose-v1-0-83dd2facdbd3@pbarker.dev>
In-Reply-To: <20261023-certs-wrynose-v1-0-83dd2facdbd3@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792751822; l=1683;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=lOloDMuShmm/t8t7LGi8ntgb16We359tvuAzHKQ5fEE=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAgFcXL9XX4qjo88nOjOL/4+2nKUk+/h6ava+bZ7FPYEBYAAAAhAKErNW6zrsHCSd
 Yqto2xBbOUW/ByBeQSxWSFEY7sJefM
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248513

From: Tim Orling <tim.orling@konsulko.com>

d46de62 Bump actions/checkout from 6.0.2 to 6.0.3 (#417)
6c183ec fix: update Requests docs link to canonical URL (#415)
36e3568 Bump dessant/lock-threads from 6.0.0 to 6.0.2

For full comparison of changes, see [2].

[2] https://github.com/certifi/python-certifi/compare/2026.05.20...2026.06.17

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d3eb9f2ae9e887dcb70cf3bb6e284c0f861546c0)

This only changes GitHub Actions workflows, README.rst and cacert.pem.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2026.5.20.bb => python3-certifi_2026.6.17.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.5.20.bb b/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
index fcb395be7b69..e32fd1607aee 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "69dea482ab64caa7b9f6aba1c6bf48bb6a5448d1c0f1b17ab42ad8c763a5344d"
+SRC_URI[sha256sum] = "024c88eeec92ca068db80f02b8b07c9cef7b9fe261d1d535abfd5abd6f6af432"
 
 inherit pypi python_setuptools_build_meta
 

-- 
2.43.0

