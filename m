Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1TgOm2-0001OO-Ax
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 00:53:06 +0100
Received: from mail-pb0-f69.google.com ([209.85.160.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 05 Dec 2012 15:37:35 -0800
Received: by mail-pb0-f69.google.com with SMTP id un15so7454016pbc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 15:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=iIPJSh88n5eo4TG3OhP8aCNrL+r3fkgpo1YIxPqo8LQ=;
	b=l72f0W8MlSSIJhW8HTJRoETL/QVX+blW55whMQKvBDi1+NZGHGyTyJpasI9Im7JMFB
	56aSmkhtn8ue9V3PWhPcN8pyDnW7F2eJ5egEakQIQv706RCprowVKb0SI2uk5MjjAGCx
	jU9WdGfVFFQD3DH+tqqNoj4A3TlU9/5xm+arb00dXGWh2N1+6zprb5YFLoV3Fo1eikzG
	szdJrK1KFKvzRwWMcc1scB17sbjj7b2lyGk1v5tttFptS49Xc0Lotqdu4pefun8KEE0J
	ma3P0gW3Hr1qHPAymVViR+h81PSa0/lZGbWt65hWxg48hsf++if3Pv5leZRUXbgOEtt6
	vwMg==
Received: by 10.68.241.73 with SMTP id wg9mr781325pbc.3.1354750652086;
	Wed, 05 Dec 2012 15:37:32 -0800 (PST)
Received: by 10.68.241.73 with SMTP id wg9mr781309pbc.3.1354750651949;
	Wed, 05 Dec 2012 15:37:31 -0800 (PST)
Received: from avartita.hsd1.or.comcast.net.
	(c-71-236-152-235.hsd1.or.comcast.net. [71.236.152.235])
	by mx.google.com with ESMTPS id x2sm3489381paw.8.2012.12.05.15.37.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 15:37:31 -0800 (PST)
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 15:37:22 -0800
Message-Id: <cover.1354748735.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkMp3vgR0VPX6tm/vZosObvFb4z0IUAV0D1XIuHpFpUz9eE+ufqJZL47cRUX1bl6MdHCp2Yuqv5QxsadXTiVLoHsnCgIqFnIhR7Y7ch+H8ceCC6XGpRPEpzFOXkvwFenX08MypWJNyOm6Rhu20ApIW4Y0XrFFwbnK6ld7hLfocqh6ljBh1DsSfwkfJmyjxsXoi9Daal
Subject: [PATCH 0/1] Include locale in the package manifest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 23:53:06 -0000

This patch is removes the exclusion of *locale* from the package and license
manifests. Doing so, allows us to accurately audit the packages installed
on an image with what the manifests contain.

This was tested by:

ssh root@192.168.7.4 'rpm -qa|sort' >> pkg_list
pr -m -t -s package.manifest pkg_list | gawk '{print $2 " " $1}'

and then manually comparing the results.

The following changes since commit 381c4b69c7e8b452f4d3de2f8214e6e5f6a9abe7:

  sstate.bbclass: fix detection of owners matching sstate files (2012-12-05 15:34:07 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib eflanagan/locale_license
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/locale_license

Elizabeth Flanagan (1):
  license.bbclass: Including locale packages

 meta/classes/license.bbclass |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

-- 
1.7.9.5



