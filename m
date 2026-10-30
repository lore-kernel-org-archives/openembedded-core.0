Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18425.1793384584456297669
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 11:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=F1YCCHqD;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Gih5GgTg;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 93174140019B
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:23:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 30 Oct 2026 14:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793384583;
	 x=1793470983; bh=6jHKtpGFuNOEQiMVFYTqcVhYCcuaPbH5h5RqLXUjSMo=; b=
	F1YCCHqD2hF+To7Qmd2fjPXraMBtWc8sFakSNJbSD4p48t+a4ukWc5czxRZMsERD
	b5WVVGmDgNh8bshbHEh2J2h/eoCSkjUD6R4UAFWy3ksMumnVoXcq+A6A5hjlchCR
	JtjWz7nnlSPDQaNTXcosmZe0NSDWbwLEyZiHd2rB7Yu9Y7wm1z65CJtiDsu+AwaJ
	LF2fRz6qra++wq2FwQHD5qewS07u/BqwkfwiGexl3wuxAy9xoUoY1cHk3gXViGCJ
	/EnHqkAJF5y9iUOwrENbr4CxxMj6sQEHAfoxp0EtY1T75ELQkx6pO3iffB03eq54
	KXehKqTemi/IHzvb38hh7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793384583; x=
	1793470983; bh=6jHKtpGFuNOEQiMVFYTqcVhYCcuaPbH5h5RqLXUjSMo=; b=G
	ih5GgTgDHSKBz8F/L7zus7Ykhd+QXvrFEUpSpQTb2dUmfsR+y6iz0IfIF27ggdlD
	/is9KJ1UrJeYpRqROsQZU47cnqgl9+BXZwfBc0BjDIwStvijWVK3D/j/IWODV8SX
	7tPHYLG1rba7TOI7p81xV+3YfmzMmYs0ufI10/ATsD+nsCAPPISU+26tCumcIFD0
	NzMrNDKxfHNj46OTlXugY/bUc1/pJlEbfXVsBesUssg2tjCYzFcKR/rK1E69GmRZ
	S3XdcZbTmKhYycrESyngb59S+EmdhiQhFLv8oIo1UpDcWlaOsAwFFyhZmIU0Svdt
	a4/7PCvfCsJZFtBpR6JZA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793384583; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:KTVApfHJGE7VOtBTpnB0VUN2y/SygvsP+ncz5kTJb9yV24N
	QunZgUPbSeba5hl6wkMea66ZttYORn8ZpZ3sF1B1LnSF477ahUst8cQyMPzzuZPO
	0CQzAGGiHyJ1L25l0d37txGqK1fYXXDfisfPA2hbQqxbjoybjiLYn3dv29VURCYM
	mj2DobE0tVZg17KDnYtdEv6qoyiI8Z8OaSkJKiNFRuA89PuPhhysT5ZrPbwvoz/T
	hM5DbsLd/SCegx7RIczlGSQA1AA3qUvn4IARvqD9bsjuM0TzvpyoFtrbIZXb9K8o
	ZoTMTDY1NUqvAQs09nYCJHm3CKoESkJcNLepfhw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:44xfrqkajFOyhkFJZ8ZpMDDj5pzctO4m/1OYlv2RO8k=:nW3luGNvbEDrvUZ4ICYu885kCjO1VCpbIA4A+kns+5s=;
X-ME-Sender: <xms:h-DkagFSyzIQD3CKXpFGHJbt7MliL_hnoj0geZy66NzuOFCIM2vXCQ>
    <xme:h-DkavVvvptezzfKR_R1u9QxBDAtq_hulQOzNSrbgqNDCWkNwlJvbKWW4JTEVOSzw
    _aFlM7rE_v3Hlhtb2e4m5F6r-aa2SR0Jr87rwfzyxjN8emOtrJctHI>
X-ME-Received: <xmr:h-Dkany_0EgKrX3wt8VmF3D8jYnVHKC7BY9sj25kjS8DrSFjgFyy1RjaXO2yQpIq0NMUrrdUKEv6r-gFaNh74FLDIcXx6QA>
X-ME-Proxy-Cause: dmFkZTE82P92HZkC+ZomUHxemSV8RkNuGwYsZL2mbexosF0T7TBU9rApGbwo0b/68f/O19
    vATzYUr3Fo+kkppN5zngdozwXkckfNgwKLOBa9S4aRvvYTHxpozQdT9y9qQ3fn1CBWNH3P
    XUExcsB2Sz3P1eGEsfF22/J0fyVkW5BeB62Vni8KlZi2EMoxPbPXKSJsLhVYHj3ULJgLl9
    XFirCZdHEQc43ptyAbOayYpSFIZOPxg2HSODz4nbCpTbdJGZfV9NXbnjo9Ugflq94hh6KT
    MJT4DQCsG2hNuXb7kIsKU58IYWFy1DFB07MUttVFlPXBFcVbbNYgc7yAlefskUMNMMZ0RH
    G62VTWzt8dFVFp9kxZG0ayEbptb8ZYk+zxFwZpx6nuXa7gyd9B31al8TUQVJvold/ex5ha
    3pH7WffuX3rJ5EL48Js3tB15J4++Rx2b7/rujD4+UmYhm5kcIhXi6621lf8brGuXIrWWjT
    KNWQ+Bf4VGw8bkB0s0x5ZVuDD9Qe6go5GPNweQ7b7Hk+d8pyWKI82obIs6iZVQV7LQImlV
    ym6zv0HC3mW9/0G3tXA4Wi+UD8MxEzZ7FNE0bjCNE4suE41oOrrZZE3wNWk9XdIYyrrsMK
    DjIkWERnvJjsBBZmx6zjNnmuDsIVqOD5skCMOSqfsZ8wgu/JN6F9YLESdnJQ
X-ME-Proxy: <xmx:h-DkatM4FcNlfMK5UkBUVNm7R5BtDN1EDGiH-3ti-DYy02r7NNuKag>
    <xmx:h-Dkao5BYWddcNanwEg0GW9uRjFiUanPZHuHBpSozAJMjPZQzNzpSw>
    <xmx:h-DkauNozpXKDXWw913Nh9AJ-cMQkQsljZPPfyskECsOGFJvjhGEvA>
    <xmx:h-DkamlN96HaqM1pKS5xUKcZW5Wb_H8JZkHDw0nEHAXd670k8uHB7A>
    <xmx:h-DkatporY5IRA8hpIcFz9RFWsj6ppmdV71gZkgZQOYAXUg34wamy7RV>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 14:23:02 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 30 Oct 2026 18:22:56 +0000
Subject: [PATCH 1/4] oeqa: selftest: signing: Fix use of gnupg-native
 sysroot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-selftest-fixes-v1-1-1ba0fc952001@pbarker.dev>
References: <20261030-selftest-fixes-v1-0-1ba0fc952001@pbarker.dev>
In-Reply-To: <20261030-selftest-fixes-v1-0-1ba0fc952001@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1793384581; l=2146;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=nW3luGNvbEDrvUZ4ICYu885kCjO1VCpbIA4A+kns+5s=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGMAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEgAAAAgHrYIMpP9ATIrFWaagypOSxoxM0f1RvAAEnhQ8KdEFg4AAAAgJf4+xrG7WkYS9o
 rds9niWva1add4A6F7IcXM5lL7eCs=
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 18:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249068

Instead of modifying PATH in os.environ (which is global), pass the
sysroot to runCmd() via the native_sysroot argument.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oeqa/selftest/cases/signing.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 4df45ba03235..0471ddfd7e92 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -34,7 +34,7 @@ class Signing(OESelftestTestCase):
         nsysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native")
 
         runCmd('gpg --agent-program=`which gpg-agent`\|--auto-expand-secmem --batch --homedir %s --import %s %s' % (self.gpg_dir, self.pub_key_path, self.secret_key_path), native_sysroot=nsysroot)
-        return nsysroot + get_bb_var("bindir_native")
+        return nsysroot
 
 
     @contextmanager
@@ -155,7 +155,6 @@ class Signing(OESelftestTestCase):
 
         with self.create_new_builddir(os.environ['BUILDDIR'], builddir):
 
-            os.environ["PATH"] = nsysroot + ":" + os.environ["PATH"]
             self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
             self.add_command_to_tearDown('rm -rf %s' % sstatedir)
             self.add_command_to_tearDown('rm -rf %s' % builddir)
@@ -169,7 +168,7 @@ class Signing(OESelftestTestCase):
             self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig file.')
             self.assertEqual(len(recipe_archive), 1, 'Failed to find .tar.zst file.')
 
-            ret = runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_archive[0]))
+            ret = runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_archive[0]), native_sysroot=nsysroot)
             # gpg: Signature made Thu 22 Oct 2015 01:45:09 PM EEST using RSA key ID 61EEFB30
             # gpg: Good signature from "testuser (nocomment) <testuser@email.com>"
             self.assertIn('gpg: Good signature from', ret.output, 'Package signed incorrectly.')

-- 
2.43.0

