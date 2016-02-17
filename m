Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 781C260616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:35:50 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id x65so18153837pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 13:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=U5D8JZUGLpyGtxQbLf3VCIrCaaOnyQ3/1rvsYAkmr/w=;
	b=eJXozB+a6rJpPf/xtobrBkamfLt+hkyA+NJWQkfKON8CTYF1YaeQpg9KnesK/Tldax
	Jr8BS4lfkOFymsacutLCZHRJpGqudiM6pZQkr03bCLJoIdL5lcIM1n5yB4RhKgUzJWYE
	NrflrO78xcMFpdur3fn6d4P4VqYrI6LROknMfEFNMZwB9Fm5hviURc8JfIVYr1qpEOA1
	Okphe9cTMhPVWEX1hwJmAzLsPkVJtWcHt6qrpLKQiD+C/TlzvzLiTyb0It8zFfFSzZ7A
	JhgJCSEAyTxy4aWWc1U64MObzDJzgIkm+u+OUTe+7zf9MKBYlnABCmB/cQUMy+ZBoJGE
	noEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U5D8JZUGLpyGtxQbLf3VCIrCaaOnyQ3/1rvsYAkmr/w=;
	b=hpkawh6LdTJYCioJh5E+nCG+dWvDhleDdjVovDsQD3lfxuZxrtWlzUkllYLaZTOrG/
	xh4bQSZ0ZERedRsAn0BwAIwTOUqx7PXkp4IfTs666E995e62S4t14D9ZchSCSedTPGR6
	Asnh+kych5v1aYfWaqIOt+B4dELBpeO6BQ61x7fIgsBcai+P6+4mWRVPd1FhUuCP0lXo
	GIqw5w3usaOr+WkvltwMy6+FunOjqkytrS/Ph7X2DZmbpwYpnyCVCsI/tzajSqG0GcbA
	9Bq0mnMlsjTwkFPFuFaRAURoGSsM6d2I8e0ta5rS05gBHqa6LrniN4Np3YL3gG0ECseJ
	hu4A==
X-Gm-Message-State: AG10YOStXNnPv4GAbg0jB2N726iji5iaRrLknI04TVWQHAPnH+OJ/FbQYDgt+QvAnGohig==
X-Received: by 10.98.34.212 with SMTP id p81mr5270546pfj.23.1455744950964;
	Wed, 17 Feb 2016 13:35:50 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	o184sm4874493pfo.36.2016.02.17.13.35.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Feb 2016 13:35:49 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 13:35:37 -0800
Message-Id: <1455744937-841-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] curl: re-enable proxy support by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Feb 2016 21:35:50 -0000

Proxy support is a feature, so should not have been disabled in
the previous commit (which disabled support for legacy protocols):

  http://git.openembedded.org/openembedded-core/commit/?id=b26634900d487a22eef41e9e077d35fb347d4c29

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/curl/curl_7.47.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 0872dbe..7e2664c 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -17,9 +17,9 @@ SRC_URI[sha256sum] = "ddc643ab9382e24bbe4747d43df189a0a6ce38fcb33df041b9cb0b3cd4
 
 inherit autotools pkgconfig binconfig multilib_header
 
-PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} gnutls zlib"
-PACKAGECONFIG_class-native = "ipv6 ssl zlib"
-PACKAGECONFIG_class-nativesdk = "ipv6 ssl zlib"
+PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} gnutls proxy zlib"
+PACKAGECONFIG_class-native = "ipv6 proxy ssl zlib"
+PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl zlib"
 
 PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
-- 
1.9.1


