Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3854.1792750948146443104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Lu0X9gpN;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=p1dk1hQO;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2B51B1400130
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:22:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 23 Oct 2026 06:22:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1792750947; x=1792837347; bh=fm
	WpUdtwb6+HZ4nQUt6mM8nhkwsK9mPBbzZiw8ozVG8=; b=Lu0X9gpNOD+soDWsUu
	+T9dWF4srk1sn/bEs8E5b4+NMoxcEHvLi5w/BFq5p+wOH4Ne4OOKCjwGrYTkVglL
	l7SRCoT2LW6ndIsiEIehXd0MizSAEsnPMhS39krFTmADKwW+gR3gjs1tnX6EZabc
	lkiZmZwdxyuy5idKU2sryvTctFS7wI/y1FkRXWQbQMwcUdWLaAYhVWpAR5pJCx6q
	/NpSvQ2X3cC6CQ3EYHuAqV0R6cWAkLtpNt2/aRmWd0KI/Beft0iWZWJrBYPBwDYt
	EnY8lS6uLgY4wTg9L9AkemRqi8dOxZHSOztNgYZirmw7dCoqbfLt2J/8SyTLYOrB
	8UPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792750947; x=1792837347; bh=fmWpUdtwb6+HZ4nQUt6mM8nhkwsK
	9mPBbzZiw8ozVG8=; b=p1dk1hQOQfl4GHJERGa4L7QQxl9Oh0SIvRGOU1rK0SnJ
	2iGUnQh1zGuWQ2ZHSfVcDZbAM7wWwwDmTT5AqO+RNRrABFwOAhi8uH0yAXvCyoTC
	nGQ20beKQtGXgPZJCXxx2+jgJpvWNBXT12cjizeb1MllhJhtFlgiw21YKZpfYWU7
	RhFM7BURoc4Ug9ZcAggZlVAHc4IkSxXzNIRc28Qk5CP9Mt3VkpheC2oM/LDwni8R
	OHCl1oUhqsRfCLNTcjVRb16O1Os+q7us2TH0F2k70PIzdqroiER83bMIFfrwRVV8
	AZP5YxytCOe8OE7NODXkgB3dOUsLhH+5/iCjc4zOLg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792750947; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:sfrE6AdKBmTF/ul3+rR9WrX0bJoxzGGU/e+9099PQmmyRGz
	qd22hxwAlFyFJb9YW7i5itwSz1zNPYBwxDqOQV6g9NmwUsAuwsC7sKuY617t691t
	wUMlHdRw3/Iwe4F6iOmXF/yI9Pw0IolMTrZU+aFYBx418sgjG5jiNi22BSt6RePg
	K/l7nsmMToio2FbudXdfqLdFIB+KOyF7S+R9N4U3xjsDkqf+0Hc2od03Uynyf78i
	267Zt0H4T+ZK3YL2aAdV+COP0K1YObiL2eBw9bSYwCNZ4kf3XsEB4JLteaLSiy1D
	r4O2+RSAsXa3TgpJEp5r7SqT8gAiBujSu4+AR/g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:irFlGiBTIpVQtV0HD8+CtI9HOl+PSnCinTc0buXyEn8=:C0hUG/N4ZecS5b0yySGPcVbAWn85ZUK7JJyBlu7/nc4=;
X-ME-Sender: <xms:YjXbaiQ2Zss9ZIKuyUhZGFo3oCUaxTPK6bBJV3a2gLiyfF-tBAysjw>
    <xme:YjXbatwE7WhgW3PLsgPmbxkDj4xmr-5uowLJalcPgZGGwN9pnD4t6UFIaH-glseIE
    rRhJwzigIcyTpleqkreOZ_fdZ6Xz_qt0mNlAlcMLivNarbMMXztFoM>
X-ME-Received: <xmr:YjXbatevYRZTEbwTqUuU0TiqY9IbtDHGWbgNp_qn5vp3eiCtfr2VP0nIv36GJ2RwlqqyK8QWqzIIjKp6JlUet58Vtf7Pnio>
X-ME-Proxy-Cause: dmFkZTEfkFw6jECZXKhMEpm81IlIaaggWKCkq6vylJpmZunRBzaPbcVm1FA1NTlAWi7O3l
    ea9pE5NyQA6D5ESIp2qp6tpB3Oz5AOYsQ2TXrS8fdbFMensB82aOPmvzBYlKGkaQWMTHuq
    HFVgBF7gOehLdvITohjCX8mFw37mXcg3SNHxy6HpsfAMq1PDNDIdeRLe0k9S/AIZwlRHMf
    YhhimVe8Z8sl/arVF2Kvq5ZlZxZ4LGUDxrkPpsOivA2pxG2rLjP0G1IGX5e10GoA/uznsK
    uchksUnWrxCIhetm1gyFpUf62zZ59jE2OX7EDgl7kcik9hcKqmoUL7rBUVM6dI8v7/vmGU
    LM0DTxzkadjxR4qAxCcgAoXEP82qcpwc2NXB9jW1m2gpvOzXSQTm3H0mOwuT1u9f6jWz6F
    nK1xLI3tQ1ZdwzSGp9h2UfYx7dUOIK+VnUzRD6j27mqdy/DDfBj48eymsOKzpLTUa3LtAw
    N79+BzIL6WUrXZGO+ipv0yvNpqBc+53Olc1CDbt1jxAxQU6HnhIPAzcbwOoDMXnWhQDDNH
    vSg7XLixViDPWP+9oZ0b56t376MvUZ8dstMWZWQ4olH5mcJ8ksXrS0J+CdiZZrluvShMOT
    h2n5okhH8v9PzbvlCu+nBwOSzwEt4LJBuWjJXySWT5B1/fsJFASElIkqD3lA
X-ME-Proxy: <xmx:YjXbapJRof8CST8TuniJB_JJSvjAcn-KztHBl2mFz7TRL9KyFMKbXw>
    <xmx:YjXbauFkV38vQSixeCAp2e0Za_4GTSAAeiNCiQH6-y-iptkQKanVOw>
    <xmx:YjXbajoF3HdWSqOTdpeQtGKGNqtbCI9VZAByzTML9_I8pdpWZ9extg>
    <xmx:YjXbanQIba7Wnhx1VW2oPZhDtqV_JsOjewyaDsQB6-oYLcXAOfQYzw>
    <xmx:YzXbaq2xTg72oIcvK515YFFfTWSQxRqpcZJs4HBJvXkgmHGovR8m-2Hc>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Oct 2026 06:22:26 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:22:23 +0100
Subject: [PATCH blacksail] b4-config: add send-prefixes for blacksail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-b4-blacksail-v1-1-a4900a4518db@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAF4122oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNj3SQT3aScxOTs4sTMHN00MwtDgyRTY0NTUzMloJaCotS0zAqwcdF
 KcGVKsRCp4tKkrNTkEpBxSrW1AGSM5Px7AAAA
X-Change-ID: 20261023-b4-blacksail-f6810b531556
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792750944; l=560;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=C0hUG/N4ZecS5b0yySGPcVbAWn85ZUK7JJyBlu7/nc4=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGUAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEoAAAAhAMZNsvYUgEeZinJ0lKRvQKR3j4Q0wyXJVyqqyCHO28vDAAAAIQDrzhdRc44QNf
 OLv6/++RfR5hXATvQYDc8O61smy3ZO6A==
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248497

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .b4-config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.b4-config b/.b4-config
index 41094218531d..faabf5333a58 100644
--- a/.b4-config
+++ b/.b4-config
@@ -1,3 +1,4 @@
 [b4]
   send-series-to = openembedded-core@lists.openembedded.org
   prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking
+  send-prefixes = blacksail

---
base-commit: a4461e117c1c501b7021d20c1380e4187fcda4c1
change-id: 20261023-b4-blacksail-f6810b531556

Best regards,
--  
Paul Barker

