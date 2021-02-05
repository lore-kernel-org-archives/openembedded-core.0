Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web10.5643.1612515123770662742
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 00:52:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=iW1zoIAe;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=6636a3d1c=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1612515123; x=1644051123;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=rVci02W67vmyWaAg/UVGQglp9aqYZYt0VQkIuQoREGk=;
  b=iW1zoIAeFHWUErRN/tr65TpXqXUuJ17khZ88r7DuIx1F3IyKv5RmsN8D
   IEjEcY3AHdXidvqpOfzQkjmY8322OmF4VMujgSdqhftMZnd53XSF7ITLQ
   wpvMR74j7qqQpEWM4ZEzwSFSj8OCbAxQokUq2AHVVLkcAslKYKo6/2whG
   Q=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 05 Feb 2021 09:52:00 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw6.muc with ESMTP/TLS;
 05 Feb 2021 09:52:00 +0100
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb1.muc with ESMTP/TLS; 05 Feb 2021 09:52:00 +0100
Received: from michael-pcx.bmw-carit.intra (192.168.221.44) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Fri, 5 Feb 2021 09:52:00 +0100
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH] RFC: rootfs.py: expose prepared_index and ipk_repo_workdir for OpkgPM
Date: Fri, 5 Feb 2021 09:51:45 +0100
Message-ID: <1612515106-377011-1-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: smucm07k.europe.bmw.corp (160.48.96.35) To
 smucm09k.europe.bmw.corp (160.48.96.43)
Content-Type: text/plain

From: Michael Ho <Michael.Ho@bmw.de>

Hi,

The OpkgPM class has two arguments for advanced control over the ipk
repository creation/use that I would like to make use of from outside of
OpkgRootfs (which wraps OpkgPM). This is for purposes beyond just standard
image generation so it's more of an advanced interface that is not intended
for normal use. In this commit, I've added the variables IPKGREPO_TARGET and
IPKGREPO_TARGET_PREPARED as interfaces to forward on to as ipk_repo_workdir
and prepare_index when calling the OpkgPM constructor.

Is this something that could be suitable for upstreaming or not likely? And
if so, should I send a patch to document these variables or leave them
undocumented like other IPKG variables (eg. IPKGCONF_TARGET).

Thanks!

Michael Ho (1):
  rootfs.py: expose prepared_index and ipk_repo_workdir for OpkgPM

 meta/lib/oe/package_manager/ipk/rootfs.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.7.4

