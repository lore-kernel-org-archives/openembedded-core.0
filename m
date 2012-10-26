Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TRkur-0007yv-LU
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 16:29:42 +0200
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2012 07:16:09 -0700
Received: by mail-oa0-f69.google.com with SMTP id j6so8738884oag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2012 07:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:cc:content-type
	:x-gm-message-state;
	bh=+oavJE1/dXPDzkYAmHuycYNGIMCDUFdFPtKOSKH0Jj0=;
	b=LAmA7uEYIKYp/JaRsgi0s1ZAZTr0OLb0icu+Qpj380HAomB5pPJhFqyeKwJzjw/f5O
	FnoYQk3GWORm1WF0b2Ot8FpoOD2xlpqREMamFGT/4Hu8ufL7XSxIJ94ZWn8CwKXx0TSK
	gk8z7pCUpLZS0PcJ4dUoopRRxmGSOgdzNLwgN/Js0gR5EBgxEQEeOk7+UC9ONbd3v70F
	/5Jdtv12NBtd2dRDrhGr52A2FEzI9TyfuLgNTlRwbYRCkde6nVk882zTp9h3Q+XRQAwB
	nL5oNXIZtA2ZGnYCWhPfgNz3GoJn6TcYr/am+1UNUMIOXd27AFpzauB6e76r29kkGkuz
	3pog==
Received: by 10.60.170.9 with SMTP id ai9mr18939291oec.36.1351259083364;
	Fri, 26 Oct 2012 06:44:43 -0700 (PDT)
Received: by 10.60.170.9 with SMTP id ai9mr18939283oec.36.1351259083274; Fri,
	26 Oct 2012 06:44:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Fri, 26 Oct 2012 06:44:22 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Oct 2012 14:44:22 +0100
Message-ID: <CAJTo0LYm7bwU0fNYcD8wQ3unJm_ShoW-ej5tZ3FeeogEztJGnQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlVcLYq1KeS9/nnjyn+KzFTQLUWFvlQ6AJZuZo/JrdMsqEY2g+YgvacXVm9heWC9sL2HIr3Fa22sN6JYATo05DfEhp8zHFzvtHsJbKXn5QJrJrdMuWj6wkd9Z3lQ0OW6lWJkIj0sN91xA67315X0Xgg99UI2H9bv0C1o8daTtLBn5Qudh2OBhgSWcjvz7Ge3T+MYkM4
Cc: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Danny stable release branch
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
X-List-Received-Date: Fri, 26 Oct 2012 14:29:42 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Now that 1.3 is released[1] I can announce that I'm the Danny stable
release series maintainer.  This involves pulling any relevant
security fixes, build fixes and critical bug fixes from master, and
periodically rolling a 1.3.x release.

Obviously there's a lot of activity in master so whilst I intend to
consider every commit, if anyone submits patches to master that should
also be in danny, please say so either in a direct mail or with a tag
in the subject line.

Expect to see a ross/danny-next series in the poky-contrib repository
fairly soon where I'll be staging the commits.

Ross

[1] http://www.yoctoproject.org/blogs/davest/2012/yocto-project-v1.3-released
if anyone missed the news


