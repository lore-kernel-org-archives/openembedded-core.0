Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF20606D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 09:47:08 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p65so2825293wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 02:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fRjs4Ug0UaO6RJe/d4L/XN4rqha/zlnCdHmbuYph91g=;
	b=Bl6o9TbTFUg3iRFksftg2IfuHPQz+RF4Q62bVaPRZUIpvZM3Nr88FG1N94bjdxQeua
	fTl5QMJFbafViTC2YhxqPDA8NEE5XTTRpIaFuo2kXbuY33ap6W+yy27NardM+ei61eDD
	BxEEJmPPpN1SM2ps7rz95qx6W+Qz2I3x9RLtV1d/cLmjo/JpgmNdPeRdR+e8iHWRgMaa
	VOPhqXo+2TKSlC/UaldtyvOe/MbM46pzTSWvqlst8cwFH1JF0SSsMQVJqlTLWHvxQkPV
	mivwj1zG4AjlOJi2MbmrKKKE2YC7oMvEmAbmCUYIrL98RtbEnYi6ro3fJx0E7VDMsfz2
	SfSw==
X-Gm-Message-State: AD7BkJI2RQM3lzqMFZq8QaSON0L/VeCPuTPYknlQbHODrV7c/3W7m5DKv0zzj9kVdlCy0g==
X-Received: by 10.28.234.201 with SMTP id g70mr2722424wmi.40.1458726428567;
	Wed, 23 Mar 2016 02:47:08 -0700 (PDT)
Received: from sushi.stratoserver.net (sushi.andred.org. [85.214.105.253])
	by smtp.gmail.com with ESMTPSA id
	k124sm2044853wmb.11.2016.03.23.02.47.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 02:47:07 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 10:47:03 +0100
Message-Id: <1458726425-24672-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.0.rc3
MIME-Version: 1.0
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
Subject: [PATCH 0/2] oe-git-proxy updates
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
X-List-Received-Date: Wed, 23 Mar 2016 09:47:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Hi,

These two patches update oe-git-proxy to:
1) support username + password authentication when using an (http) proxy
   (care has been taken to support spaces in either)
2) also check the 'other' standard env variables all_proxy and http_proxy
   as fallback

Cheers,
André


André Draszik (2):
  oe-git-proxy: also check all_proxy and http_proxy env variables
  oe-git-proxy: support username / password in http proxy

 scripts/oe-git-proxy | 42 ++++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

-- 
2.8.0.rc3


