Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4437.1792752615697430333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Qtk7Zyh3;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=YJ8cAhpk;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 122341400163
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 23 Oct 2026 06:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752615;
	 x=1792839015; bh=XbwWh16dKDma3TcdAoZic5hVOBajHgTzIYBrwkfVfU4=; b=
	Qtk7Zyh335aisbh9zaQhUttFmiKhefPW/6BhXFOlaRwfngiUyF2EDZYxBdG+wThG
	YfWR88eWtYf46oyxhFwxyyah8unWOdKu8Dv/AB30r2v+fMDlPO0zT/b8DqeHg3sJ
	5an0oZHraC2ut/mM+VpDa8vXzM5+Acnd1TsYqv+01s76jGCmY+wbk5XXWzsFGAyF
	sl3ZW3PuzJA7Td8jLD427TonLR4iJicwGTdcNntmFg3qKQJ6urv02UOZoJ6gSe5C
	sQFmIc+K9fH9C6mfIPiJSjdy/cenuIv8twGZhsZPWBoxVFm+gPSy6LWXywwTPgP4
	uHorPiv9zsAc47s0qv1kiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752615; x=1792839015; bh=X
	bwWh16dKDma3TcdAoZic5hVOBajHgTzIYBrwkfVfU4=; b=YJ8cAhpkV5dSe9zl7
	XAvpk9I3Dt5enCWGEqt0qIPrzuHQuCgbVCzZjgxh8rUW0ijDerViBUjhwKRhAtKQ
	X+a8Gvt9Av6d2jxtfp2bzF/oXIIXPj3g5FZosgLKvk7dsZcBXkiKhVFTarKSHz5G
	t9SdtcQee9lBDWmWLUuLY53U6DDoUY2HeF6W12WILpOpCAbw/p7fYgzZygS5mCC+
	JijFAq79V/hoigFBKu/y6P6HmRjKN0kUfR+F+TkfRalftB78LvrkZmy6Jioz+fFr
	N6GMoMkdRVO1YSaLlKqT85uGNCsjOut0GGMT0o2aUfWgs38E3cU0edPBMTffZOg+
	Tov0A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752615; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:KCyQtYTZ8I/rTXPd0A8Y4TauvNcnNwf3NSPXdwiCwCpRhNa
	VOTwazJG6J+Uq2OsAcu2oGkEGg5Ck7MV7KRGlma7RblrDe5r5hnddG90hUEjJ0bu
	YXCMCpTxBtap91vCZ4sTVjPM85Y+LQQd6UrAm2uDsDs0zoWkC9y2/ycrt33s4fW4
	Ft7Cc9xO8K+4KNJJu/7kmdbaOa5iEY9dgQG8AN8qFxEPVEGPbrFs1j9UTlSYgfXL
	RgpnhKhITAEwcSP4UpXBGlRU4fVCOeEDAha4T5fFgUBn8UFSggXE7NQ90U5Q+uqH
	PCnrsqZ7FhA/cGWK1F/5EwNN8r4f/6ViYzDERkA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:RP0kT2qsGeM3obtq0Aivhiw0BDJ0tygdrKvcQ6IIBKk=:8ueimzjp1mHnkke7wRd1+2l8Iak0iXMwbW+R2LD7SQk=;
X-ME-Sender: <xms:5zvbagyLXiXq9st03MR7SKxDohoUj0CUthDgueGDhZohXuLN5Y6T4Q>
    <xme:5zvbarMQ3hfyAKIXMdfkYeHdK_kFJ_SVSVZSrUDNF4xfyaZN-q0GATYed1RYXEk0k
    0iKD26ZJDtbILSnEp-89Ht1zFEiBOp48sUnUjhOfaw_RJTnKi3UYg>
X-ME-Received: <xmr:5zvban9ZtMdf2RqlyXvtN1IcX0YpKRAXj2OeiHmaiS-7LX5X4eDBW4rs1SDLOW_BBqYuWYshUVu0_PBzxX8WF463DrxoueQ>
X-ME-Proxy-Cause: dmFkZTGyOagm9BfzPb+YtFk66N3nGLsZpb/VPM8XjyvCI6H5ALoAzhuChEVFVvDnkE/SF/
    JqM9HdccU5QGXh85+PcHSXfPlinR50XvCANansdfjHdI2y4yWT98LB5sYItFtv/YCkRC+D
    gCz49oXUOiIA3GSaVy8hQyIFhJVj70/v42lZYRXkC6yDHyO8Mxh8BPFCEOUQWBw2ymS8E7
    RnCBWgaoCjRMBc+ufLfygswQfPbZu8I30UCpB32sT/SGJkXdSH8ooLc1ooYQLEosEVguDB
    nl2tS57Hfyetr9KYXK2lnhEOBFdFfv/pn1dtrEglp90LQOD/J+D0fLXSLeer7z4rPcHWXI
    6+36gIeH0xspkBbMhvT/hjrm+uBOd1hZf+f4/oZuy54SE9Pl3CA7FBXeevYtZXBKMjcTEQ
    FDTYvRYCwC2KyVorKWQ6QhBLtEHwzaITz2/mA/MHw4jNZ8Cs1wGIV1aVQKQkH82ThW9hrM
    eGdY4uTCH5GehqFmgKo7r9KAyHhnfpu0qeHbVvsE8FKkQfhNznX20Yv25q1gY6qaUy/oWK
    o9Y59om3u8RM3Bt3QjSpDhUUC+5dEWCxS53fCR3/E8LWmD62mXMu4TX1VSkJ6wjMQZGchZ
    XxlLcRWXnR2tIJ8YVU2E5RJedrgqyvm7syegHEoEn2W116Y3oRERN5GWzAeA
X-ME-Proxy: <xmx:5zvbajq2uxu2lt-feTnVLb5hiJIvAXOfQOB37swKAjTPwxiQqk0R0Q>
    <xmx:5zvbah6oQV-6sfNHdZxwAVamhtkboK4XpMMr3yqs1P3sCx-uPtiUBA>
    <xmx:5zvbarN1Uk3y43tTXDa5B8slPpur7OdI7sdEM-I9IjgqmSTvaoN3Ww>
    <xmx:5zvbarP43cvNjBdI-e8tijyvisGGi44jSIqpmGAuXFBKb74gVpfl5g>
    <xmx:5zvbavBjjpTKhWlzY8MRo9tl_ctKtTlmXzjqZdCdRCEkIZbeRBQxDxUY>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:14 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:11 +0100
Subject: [PATCH scarthgap 10/19] python3-certifi: upgrade 2025.6.15 ->
 2025.7.9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-10-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752608; l=1406;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=xWpqKvY4yhhvwfLL0qgYhx+Mfhha8WYyEL4Tlb7JkeM=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAhANbymxZRU+6z6FNJCOtiE+nb9Ef+nwCyFjpOSIMUQPs4AAAAIGd4LBy3wMCG/Y
 clk2gWmBnTOuaQohvAsH5mT20JexR8
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248527

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 99ce38d5ed6f27da5467d3053e80aefcd0184b37)

This is just a cacert.pem update. See
  https://github.com/certifi/python-certifi/compare/2025.06.15...2025.07.09

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2025.6.15.bb => python3-certifi_2025.7.9.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.6.15.bb b/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.7.9.bb
index c8484425dcfb..f6607dee0a48 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "d747aa5a8b9bbbb1bb8c22bb13e22bd1f18e9796defa16bab421f7f7a317323b"
+SRC_URI[sha256sum] = "c1d2ec05395148ee10cf672ffc28cd37ea0ab0d99f9cc74c43e588cbd111b079"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

