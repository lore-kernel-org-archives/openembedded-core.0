Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4476.1792752614760386168
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=U59CGNwg;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=baVvVRDF;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 20B241400163
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 23 Oct 2026 06:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752614;
	 x=1792839014; bh=4OSzyVTXARX2jzBugVC3Vgayxbv7L9WWo5egBwU4E/A=; b=
	U59CGNwgNPhV7AEijX4WJdM+4R85vA+vp2P7fxGRPK9eoqJQL2Q5zPxiXlG245Bc
	e6bUfXLr7xl2KOXDLrZ4BYK0O3On/ffCVVzpE8bW3Hahpx+ThXq1Fa5OBC0LlZKL
	cHo90ST6gYZUuTMJLWjs48Uy6RT0Dc+WWaZBK0pZidHkE/kkGMi6o3zUoDB3XpJq
	nzUwxiOneKS4T2vNLSsWS3vtR78HQAded85Y0rmAF+gmPrqCC53t9dWdb+gkkxm5
	2/QrHV+n6cjWFT7HkeGe9Xg3b9Gt0bKqFVsQbUqROQUArck8Q6ET1eyyyzion4Hy
	Emc5me8lmLFarS9DJXwSww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752614; x=1792839014; bh=4
	OSzyVTXARX2jzBugVC3Vgayxbv7L9WWo5egBwU4E/A=; b=baVvVRDF92214q9MM
	2jRyQhXtf6cqYa8pe+YJ9CRTAE2y1AWhpRT1cIt3uZY/60SFaRYMInRgQmrMlI4y
	rmkBdqp+8TSXYUHTQL3mzwswN0W2zG96T3XZdx85Gcbl6Ii31+HwkCPY5GQo8btO
	+mhOq2VuvZ72X0QqmjCG6kVioxU0mD08vwgVGQJac3HGaBJ0XM4kSiUkVuzLTILe
	Mv7BHhsydd+3Bh/iHQedERbF90cIEmig74fo3opAfvk+BwFwkmo0k2JEpNnwWzqC
	FgS5WZ0hOaXKPG440UEw/8DMHiWrREUsEj9l+91ai9nP7FZyzmNcbHsV0VB+ANbe
	IJ2gQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752614; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:DHxWBN6UfeX4GmJ6Ba7YHWyGnOvtrmypVje5pEe6T4RkQou
	L97tgJ2zLiSci7I0PuRQkyaeKFgWpt+lyU6/C7le7Q14zyhOX8gCrdFlXEPm2/VK
	Es8grblEsDfv/Wbbj0gqni3Rzf5oZdTSFgi16KM2OZOBY+XU+f9STW1RmVwPfE/T
	z+06yF6KDHIFhS43WaIHJSc0zms6Q8nQ2CzvbZvXSDABUB+mY0jqMmh/3qDhB2Gh
	9XlCnSws/l2EkDpSFiTny+dw62sAX2iZnlddms60Rbsv0588YpWT0mToZKtTYXWE
	I4/8aA7YotPYtQsfsZsLbmguGh077dWhOvg1jvg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:wrktWT/5fHGbaeuLUmgvn52yEOTpG2oe1uXRG6CLs/A=:2U9sGv1t1Vcm9hzxvA1WkF7Hzh1YDglOK6D/rImqodA=;
X-ME-Sender: <xms:5jvbagKbP771Lq0vaPNprontf5h6vl158IihZecOkErsWF2_59bqGw>
    <xme:5jvbanHg0G7axiDUTrRH7rrv_9SsudY8lZ39X2a7hZFAl3gLtiYq5xcoYU7UaN_Cq
    t9Wc06PS41V15WXmdWzhv20f3DkZVuLKzeIYhqVqJsysdK-jrfcxCiOCw>
X-ME-Received: <xmr:5jvbamWB4zrplLitalVGBzPCoBiPws4fsfIRkuFyJpKByF5UdckOee1_AQ7bZl4_nltIM-_1t3pBQznq4bXKWKTzH9sc7g0>
X-ME-Proxy-Cause: dmFkZTGyOagm9BfzPb+YtFk66N3nGLsZpb/VPM8XjyvCI6H5ALoAzhuChEVFVvDnkE/SF/
    JqM9HdccU5QGXh85+PcHSXfPlinR50XvCANansdfjHdI2y4yWT98LB5sYItFtv/YCkRC+D
    gCz49oXUOiIA3GSaVy8hQyIFhJVj70/v42lZYRXkC6yDHyO8Mxh8BPFCEOUQWBw2ymS8E7
    RnCBWgaoCjRMBc+ufLfygswQfPbZu8I30UCpB32sT/SGJkXdSH8ooLc1ooYQLEosEVguDB
    nl2tS57Hfyetr9KYXK2lnhEOBFdFfv/pn1dtrEglp90LQOD/J+D0fLXSLeer7z4rPcHWI6
    iDTaSybuYB2Rf4i3g+rU3sPHYpqqhkjx6qO6iiXIP9T/njNGykzCviVctPlc5ue0CwvU80
    4llqTPBtkoBYSp9jFXn5ZE+xuP2E3S5J7E2283D/jxpVmXF537UlNZVJcVopPix94KFsWC
    1aTIwF8LHbFecSNj5b6KlOXk3HuN4XYMV+jGye3awzxir1rgLQX0o2FWToPAkSsw6YhAYn
    twqXpywsge5jlm+ipl3jICEsZfHfUvWMpm8V1KvEVgV+7Zs2d8L6DMaPzVlsphD0TF5JaJ
    J3NAQAHMwjzVQSPyNDuy+94XggJMX/5zNWsy9pqu+wAGk3A9RRN5DMcP9WBA
X-ME-Proxy: <xmx:5jvbaihXsMAiWVw3KzzEDVxmZuoI2SgOdTBTrQ6LC9ityztpbHjDqw>
    <xmx:5jvbanQBaCNrs2MRQu993adus6tGOZzawttLDTTMhZyqvYzLh13Orw>
    <xmx:5jvbalHDMTXBK13qlrXHhvT3yxYGplWpjPD8ZJ6UDYop6zQF83yOZg>
    <xmx:5jvbavn4VbeEP2VnxkbYRNg7Z_p1LzUnog6BXuyIq846sZb85pe0uA>
    <xmx:5jvbaj51iSLM44RQU7LWyz-G2AyOVJHC3HYM435fTcrZtExnrl2vVKb2>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:13 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:09 +0100
Subject: [PATCH scarthgap 08/19] python3-certifi: upgrade 2025.1.31 ->
 2025.4.26
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-8-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752608; l=1360;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=UxIo/olDg+LZjxFEHOSVCu3s+rlJYPpyE1pqhaQUSQU=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAgchiBTCycj1y1+llXtjmsqm6G2Rcd4m106K6WnLDW/O0AAAAhAJzmoSmZia5GFd
 hF/QdrWIazZNTygdzBAuafElNUKj2b
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248525

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f45a8bbe689ae7d006f8463fd156ebbd8e745227)

This only changes GitHub Actions workflows and cacert.pem. See
  https://github.com/certifi/python-certifi/compare/2025.01.31...2025.04.26

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2025.1.31.bb => python3-certifi_2025.4.26.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.1.31.bb b/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
index 4283376110f3..bedc3d253c3a 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "3d5da6925056f6f18f119200434a4780a94263f10d1c21d032a6f6b2baa20651"
+SRC_URI[sha256sum] = "0a816057ea3cdefcef70270d2c515e4506bbc954f417fa5ade2021213bb8f0c6"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

