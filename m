Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9D17361A8D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 13:51:08 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id f5so2555923pfk.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 05:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z6ycrgxCC+ytPWXAOUTnh1lbdGObNRO+wn5emTb4kW4=;
	b=hFbBbGQHD0cEydom86uK9KfT8x8Rtaz5LjQNA9WSa3zvceCdQ2vQsQE6wWd8K9oApc
	oGjdgeECVpsR0clA3rSn2eMGYQQsL0ZvOqYMG496oCDixebtEHOX8tk8qq4i0g+tDXST
	uk0Mww3JhIFGXaHQcjK4DWSo+taYKWIwAvhNw4wDPb0GvYEFBYNDWDJQIFpsd94EQD/K
	2AvRER1JqDabAoZz41W9eQnJmCjMsGYV9c2ocvxHraAuWVYoAmBmevf0JzVYsF0lksMi
	P0JXArCHgPbUPnMg7RhcmTWiEIh3FxUIezCtgRgFx6ScBO6EoJpDXIxAzJRgMx26zowz
	Mr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=z6ycrgxCC+ytPWXAOUTnh1lbdGObNRO+wn5emTb4kW4=;
	b=a+RwVNi23ZyyK9jWCaEi56UldLAQYxfxOc6pq+TqTznCxl9Cd9F3/6CEvpzuy8vSnG
	DqsUJJgIxlvKx0n8lB4TxvWLKTyRP1ijVJAr0d1zQ507ToGOlJMVoIymWvXaNMkYq984
	GzVrFr3ixIf4N6FYMusHrmFiHLVgnjp2n2tZkCc7kDkusWK+MzPm3tj+eEuFIBnQGj+u
	afPpoDe/s03tsH+3tMYuXSwvoAILzoLrDY6bvaN126nOIEew/1lD1dIfuDKThRElX94b
	FwZse2OuCqvf/vn3kgIMAroMEITWGTSK03eObWtEO8kFCyprf6hh7KlMBV1Cdwk7Q1Y0
	PCiA==
X-Gm-Message-State: ANhLgQ0qydAFlfhGRUjpL5AdULopFuAzMP5wnPn2DbV09cii0T1fEJqQ
	89jSiUJAt4figo4Hbd3wksYHQY1V
X-Google-Smtp-Source: ADFU+vtMkFxyocsz9WHToAfSliQk22NMXBsUkd2j7mtfzhxmXl8zDkimtKc0DflxsS7gNcqkTpuzXQ==
X-Received: by 2002:a63:485f:: with SMTP id x31mr6093909pgk.347.1583589069291; 
	Sat, 07 Mar 2020 05:51:09 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	k20sm17065861pfk.123.2020.03.07.05.51.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 05:51:08 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id D43A82A0895; Sat,  7 Mar 2020 05:51:07 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Mar 2020 05:51:04 -0800
Message-Id: <20200307135105.12838-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200307135105.12838-1-jpuhlman@mvista.com>
References: <20200307135105.12838-1-jpuhlman@mvista.com>
Subject: [PATCH 2/3] xserver-xorg: make manpage mutlilib identical
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
X-List-Received-Date: Sat, 07 Mar 2020 13:51:08 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 14ba6bfee6..b4f0760176 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -152,6 +152,7 @@ PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
 do_install_append () {
 	# Its assumed base-files creates this for us
 	rmdir ${D}${localstatedir}/log/
+        sed -i -e 's,${libdir}/xorg/modules,${prefix}/lib*/xorg/modules,' ${D}${mandir}/man5/xorg.conf.5
 }
 
 # Add runtime provides for the ABI versions of the video and input subsystems,
-- 
2.13.3


