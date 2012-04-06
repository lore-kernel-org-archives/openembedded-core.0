Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SG9nd-0004ZS-CH
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 16:06:01 +0200
Received: by qafl39 with SMTP id l39so503838qaf.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 06:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Ax3Av84xypsJVXPdyK8ELvIMubErqpcdy2YU/bQL3Ps=;
	b=FUMDyWCmZ3EwkxnMiwv+Ohakj3qHIoGS7mKAhhU0o2qn9DaZlrOB3Typtks4Il/vFP
	CvHVNIAvh1yDKWEzEIz+mZUcWB0VD8ymc1az/vPLWYdDGun++lG8seW8P4a5JwVIyLdK
	OFBo/NOidl70+9Qcsoz4tcxkDA3htvY+LmtCEO3dmpUQQ5dbtkAdehSI9MOoQZbBosss
	SM0+4Z5EKDHD76xi4TJGxT1gE8o/PAAfoAflN77h4X95hd699A/dY/MajDVV3WEiAfi8
	YaWIpwWy0DvewH5rXIhz6jE00D7RjgzyBWPoGUvAaGX281axUWbDPuZyg/AsvqmCP555
	9LMw==
Received: by 10.229.136.76 with SMTP id q12mr2649532qct.63.1333720607927;
	Fri, 06 Apr 2012 06:56:47 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id i8sm10999507qah.4.2012.04.06.06.56.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Apr 2012 06:56:46 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2012 16:56:37 +0300
Message-Id: <cover.1333720467.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQlbqGGbczRCE+zhVWt8I1XiSVzfoUA7u7xU2IVr1k5YkBr0G1g10uGxEnBgTKMXCXlPC76N
Subject: [PATCH 0/1] Solve Bug 2205 - package.bbclass/linux_so never calls ldconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Apr 2012 14:06:01 -0000

This is because needs_ldconfig is a local function variable. A way to solve
would be to define this variable global but this is a discouraged. Another
solution would be to return this value in linux_so and i will patch the package
class with this fix.

The following changes since commit 190f6d791d51aaa4cfb9f1cf932bc205ff674fb5:

  runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:47 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ag/linux_so
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/linux_so

Andrei Gherzan (1):
  package.bbclass: needs_ldconfig from linux_so is needed in global
    namespace

 meta/classes/package.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

-- 
1.7.5.4



