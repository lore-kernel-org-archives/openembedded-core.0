Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18426.1793384585510602649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 11:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=nGIY+lEX;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=gLqAzxDI;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C988A14001C1
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:23:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 30 Oct 2026 14:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793384584;
	 x=1793470984; bh=Yffg4XCCPnSJ42Qk6013b+ItxGVt+NUYEH+3x7Ry3Es=; b=
	nGIY+lEXJHo542Rzws+yuXJLDDxBMaqNTOOGX5ffa9uCBJsjfo7Puns0F5CRdZly
	3POMY7ZG2xfuIQwkv2X3CfQbcFuagtahB/UdSb0vwgxN3kO1cV1uKPKtmVcAa6Cl
	hwfq6WwtJe1UOMIre+R4MPkN2Ox0VCe+Rejh6xGo97dz+rNHpFROyhlAKw2NSjzz
	qUfziasAcY1/eVID43NsICFHPOb7nGz4IOpxbl0loszb2F1vbHDpFFe4uFIRJM8t
	qaRU/2ZPsusyQNpY4G+IfK5bZaqdjMm3odqbpiHrKEerBK0QlewCI4NKAwOXqyZK
	piZhtxlX+AeRb4HC8WU08w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793384584; x=
	1793470984; bh=Yffg4XCCPnSJ42Qk6013b+ItxGVt+NUYEH+3x7Ry3Es=; b=g
	LqAzxDIXuYTWVa6sjrCE5rO9rb7UFwFD6Rc/B/+crmnziaS966Sjo6LhJ4jH6nTk
	uwdekHWhyEEms2UXlka9PdWe5uIom2aJlz5+Tdii3lc3/MwU3qMmL1qDQQj9ywvC
	olPX9VY7Zy5eLQuMEAvZFR3zabQ6XxNr0mXu332uw71VCHUVoLMJW4ltTi8lqCL+
	LVbaKvW4xtibOjIh+pAI8qpJXvJ5kpj9pnrOBJGIrmgxX8+4D7ZPFOPuD2oBIfm9
	aLuz8dKoyAjjdZKU56teXi1fPppzequjOohIofClGMw/9DFLcitG72R0erPfNoND
	/b1EFFjgRwUBVuFr7gULw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793384584; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:ag5RguK8c/0/URGcbbOEesu5zWSWNS+94a5YtwEIl52/e5w
	59Mhd9g2x/DYSoOSnAysQfbVjcN1B2KicJLyUQLcpepWU1RxK8BNrrVt16siNWLk
	/Nk+A6TlozYvWu3M3+PjH7nbFQNCphNgcHEdIMkH50zGZeznUI+jn1RTvrABDIx9
	Yao29lVO5hBvWOz33AFoF8jC55cVWuDDHStGvInqJDmT7p1zwuHW2MuOayuYs1c9
	hbrf580CNHgkFhfZveRshszjCEF6FzkVRrkOiUcQXkZfCfegCiEXkJGRTnOpQD5A
	49MNC/TIYDUg4kYfIGHwJAvvdF4EA80TGBfbN/g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:CmoWjtLkhVV5q88f6cR5e7QM05ufyxpviNe8v2dYWPY=:H+tZ8/0cnSRrgJO/U8wSNls+AAaPQweP0jki9vMqiOY=;
X-ME-Sender: <xms:iODkakz28eXV0Uz2kAtWi868UaoNxpOIbFEGJMHvtOEAEKGWyh6zPw>
    <xme:iODkauTF8Rnoen_RYGBBcUm_c8_JENbpfsp0gIRCXmclXOBo6XZEyyVdzB_U6RtCn
    ggbctjUfgIqNq0wAxzQY-HCtyG65SAdq5zvQz6IQZJ8BQK5YYkVCdS35Q>
X-ME-Received: <xmr:iODkaj8QNZ5bEaOPgC-xm_4xyLQ4CED4R3rw8hbtJyrEIeoAsBbXmxPWAOyQByxUSIggk-axRxr1SmzxAKPsyT2FdKfsUxw>
X-ME-Proxy-Cause: dmFkZTE82P92HZkC+ZomUHxemSV8RkNuGwYsZL2mbexosF0T7TBU9rApGbwo0b/68f/O19
    vATzYUr3Fo+kkppN5zngdozwXkckfNgwKLOBa9S4aRvvYTHxpozQdT9y9qQ3fn1CBWNH3P
    XUExcsB2Sz3P1eGEsfF22/J0fyVkW5BeB62Vni8KlZi2EMoxPbPXKSJsLhVYHj3ULJgLl9
    XFirCZdHEQc43ptyAbOayYpSFIZOPxg2HSODz4nbCpTbdJGZfV9NXbnjo9Ugflq94hh6KT
    MJT4DQCsG2hNuXb7kIsKU58IYWFy1DFB07MUttVFlPXBFcVbbNYgc7yAlefskUMNMMZ0Yx
    J9UfBQuOhPW9EoqEdM3oIA+Hv/EkKne0E2CllRJPbKivbflIs8wjB63sWGbNw8Y5RxaN1B
    FJHvUhQUtd3lXP7Iv1lqFBTChYmu19OYbJRAcIkV4f8I8aHPXroTa2Iigb8FaJWX8K7G7M
    uVVw+tAuAaPV3oGpuK7kHggpxdmWUXTJWUygtbrrd4Be/FF25XQvG04xzr+kIXcneGIJ4X
    YpW6vbSx50Dv26LzrGkBb7lVXD5hJYmqGdp22LDNPbZ7EAD8BhHi++nVinONhte5IfzA8V
    0wbfUbu9Y4PopA3BAoPVuGY+F6/KdaTfM6J+eYx+rueIWIdrcq1CYyQdVAvw
X-ME-Proxy: <xmx:iODkatrNHs1crGg8bgEdOpouKwRibaCccmcMm3TVhBIlX3JUxR2BXA>
    <xmx:iODkaon_zb1kjkQl6G1zxWBZysHBRf8FjFXLaiNqaZTFd2TaBWeDTQ>
    <xmx:iODkasLOLuIoVodqimbKLemrARYNUsjPk-5o1hpmLnokev90aNy-Ng>
    <xmx:iODkalwHHQ79GBYrYa7e89gog_Fh6XMvjcHcFnGvdLl6LjSsEzbqTw>
    <xmx:iODkalXAr4mCpIWO9XKmoXMZAiKl_ToXnvev2sngZcqnfw4OkjFtJApZ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 14:23:04 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 30 Oct 2026 18:22:58 +0000
Subject: [PATCH 3/4] oeqa: selftest: prservice: Don't print regex in
 failure message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-selftest-fixes-v1-3-1ba0fc952001@pbarker.dev>
References: <20261030-selftest-fixes-v1-0-1ba0fc952001@pbarker.dev>
In-Reply-To: <20261030-selftest-fixes-v1-0-1ba0fc952001@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1793384582; l=1044;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=H+tZ8/0cnSRrgJO/U8wSNls+AAaPQweP0jki9vMqiOY=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAgHjOsJa0/iB8KSsUcTwSqDhef9J20886oyZEvFyfzct0AAAAhAM7Sg97JknicgG
 7Giqnjvxe8Pfk26m9hF3kwGUodCGVO
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 18:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249070

Printing the regex doesn't clarify anything.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oeqa/selftest/cases/prservice.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index 8da3739c57f4..32b499c1d90c 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -37,7 +37,7 @@ class BitbakePrTests(OESelftestTestCase):
         package_data_file = os.path.join(self.pkgdata_dir, 'runtime', package_name)
         package_data = ftools.read_file(package_data_file)
         find_pr = re.search(r"PKGR: r[0-9]+\.([0-9]+)", package_data)
-        self.assertTrue(find_pr, "No PKG revision found via regex 'PKGR: r[0-9]+\.([0-9]+)' in %s" % package_data_file)
+        self.assertTrue(find_pr, "No PKG revision found in %s" % package_data_file)
         return int(find_pr.group(1))
 
     def get_task_stamp(self, package_name, recipe_task):

-- 
2.43.0

