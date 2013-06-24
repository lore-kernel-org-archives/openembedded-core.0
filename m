Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3360361485
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 10:29:58 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id k14so8102903wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 03:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=srdcwYE9jQ/3Wf6JwyQ+k8NsodMLmUPmhUoFOIGQ1Qk=;
	b=ftoO2lCKoV3SYNjoQV5IJ4sxGLrznbLp18kojQ9g/SF1kYjWi/gn/JEORgDG0EMxbk
	D6kSTeZbY2a3ZJDiz6uw/YlCBUgWlOE1FmU50oREKlALWIKvkSxmEqLZHHgA7K/V/gMR
	lk+DeKBIFCC6NsJzTYUV8p+rsRmn0dHQot3TfNuNzWqLFyliFoiCCS9otRgLzjpaTEvy
	U3EeOKWuvDyD0P3bBuW3vRDgpj6XNcPeec6GbAeby4xh850iGkoZPY/EtlDEG79eN/st
	aDYIEH0PdCp9eCG+ib2ipT/KMx55FUmZqLCs7vg8RYTNEc79bBYNXqxgq9iRL5meq+Cd
	wKtA==
X-Received: by 10.194.170.168 with SMTP id an8mr7162410wjc.72.1372069798682;
	Mon, 24 Jun 2013 03:29:58 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fs8sm15570508wib.0.2013.06.24.03.29.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 03:29:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2013 11:26:24 +0100
Message-Id: <cover.1372069538.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnhoWO7Z5j3wUK4XRARxgSaeYy9+yTBFnPersWsV2+BLAIQF/GUGrDtV6bLHpQQ4PkjCwFi
Subject: [PATCH 0/4] GStreamer 0.10 improvements
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
X-List-Received-Date: Mon, 24 Jun 2013 10:29:59 -0000

Hi,

Found these sitting in a branch that was never sent.  Two small fixes and then
element selection cleanup to use PACKAGECONFIG.

Ross

The following changes since commit edcbb79583e1577cb64d368e3902915dea50a96e:

  ref-manual: Added note about issues on supported distros (2013-06-21 14:26:31 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/gst

for you to fetch changes up to f8e66c6a3d0ae67e780bfd2d8191ba3a729f2800:

  gst-plugins-bad: element selection rationalisation (2013-06-24 09:51:01 +0100)

----------------------------------------------------------------
Ross Burton (4):
      gst-plugins-bad: use correct option when enabling librsvg
      gst-plugins-bad: tremor was moved from here to -base
      gst-plugins-base: element selection rationalisation
      gst-plugins-bad: element selection rationalisation

 .../gstreamer/gst-plugins-bad_0.10.23.bb             |   18 ++++++++++++------
 .../gstreamer/gst-plugins-base_0.10.36.bb            |   12 +++++++++---
 2 files changed, 21 insertions(+), 9 deletions(-)

Ross Burton (4):
  gst-plugins-bad: use correct option when enabling librsvg
  gst-plugins-bad: tremor was moved from here to -base
  gst-plugins-base: element selection rationalisation
  gst-plugins-bad: element selection rationalisation

 .../gstreamer/gst-plugins-bad_0.10.23.bb             |   18 ++++++++++++------
 .../gstreamer/gst-plugins-base_0.10.36.bb            |   12 +++++++++---
 2 files changed, 21 insertions(+), 9 deletions(-)

-- 
1.7.10.4


