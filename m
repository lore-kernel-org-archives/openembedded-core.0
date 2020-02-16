Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1BF6144E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 20:47:06 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id 4so7738848pfz.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 12:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KebnYMGWVMO9p/8KXA9JxkPYz2rtEke2Qdc1zIzqU8M=;
	b=V2Z/vpvB/9jyOqTW77AIiy+5rFZ/ruNfZLiLw5SKQDVsdttQIoxN4Gu5eIq+c4bfsF
	omlhcFjlhhakBncGUmw6vDLhALn33zSAZSiK0s2SMTPLfw6BllQ9pfmjs98ApkTlRwT6
	K6Z0LQ3Xy4oKKnLAgVtQcyDtoqIijpas0+2DYhDhkBpMYY4uWuxlo7VR8u5YQkAvcWcK
	+LrwP9yIbBSMUHweBVSLoCT28PIPzN1EMCGZOKXGHD0YyDdEx/gXP4qsTDc6mhUVLje7
	30+N/Xw3IIpwE22okWE5dMxJBoQWl6Pddw4V5C72lhKHb6LCeyJyR6pr1XK3HzMHm4AY
	OiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KebnYMGWVMO9p/8KXA9JxkPYz2rtEke2Qdc1zIzqU8M=;
	b=BOHaS0VAHmo/W8WpEMz2qLN64su5R2tAU2jT1AT4gkaAO7QuTj4p0OUHrP48v3PJcx
	ec1RRXNfknaqdwRkLMT5dYOazRtVJUozGb+3oeLW94ooEg2cOcG9iSpMZX8ALTk+1JS1
	hyb9gF8D0hU7ojmCQjBC5hj1S1SjteMW0fQpX92Hg6zIcLTAJRjTVIywh37dX81EnPg+
	esrt9VGfg70Zf2Mpt0CGa9GUaMzcXHUIsvoHgzZdqWEvnpg+SXLsTi1Bjw2JZFhnozzn
	OPDUfXFl1BVCtzlzT1Gxap8lUtxnbas8OIJvqj4wFf21Z4LC1GQ9L2jbvLDqhqyJDvVY
	7o1w==
X-Gm-Message-State: APjAAAVqum2IcXgzH4Rjj26P9eLrP6CU9IAoXuPm5QGgXFx6UAVSEjXj
	Sp45UDFiRw8hZcMkd7dZc6fQ4XM2PQk=
X-Google-Smtp-Source: APXvYqz6c1IwNs+8tHdo2+jnK9L7r8QLUVU6TSwyxecW4lnfSnYsY/NMwVPLXAwj4KXPGr9wyKxS1w==
X-Received: by 2002:a65:68ce:: with SMTP id k14mr13905375pgt.336.1581886027149;
	Sun, 16 Feb 2020 12:47:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	m12sm13877924pfh.37.2020.02.16.12.47.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 12:47:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 12:47:05 -0800
Message-Id: <20200216204708.7179-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216204708.7179-1-raj.khem@gmail.com>
References: <20200216204708.7179-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/7] remmina: Inherit mime-xdg
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
X-List-Received-Date: Sun, 16 Feb 2020 20:47:06 -0000
Content-Transfer-Encoding: 8bit

Fixes
remmina-1.3.6: package contains desktop file with key 'MimeType' but does not inhert mime-xdg: remmina path '/work/aarch64-yoe-linux/remmina/1.3.6-r0/packages-split/remmina/usr/share/applications/remmina-file.desktop'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
index 14fbc94b21..f9963ff65e 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea5
 
 S = "${WORKDIR}/Remmina-v${PV}"
 
-inherit cmake features_check
+inherit cmake features_check mime-xdg
 
 # depends on avahi-ui with this restriction
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-- 
2.25.0


