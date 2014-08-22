Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id A5EDF65DD0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 19:47:25 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id x3so11708709qcv.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 12:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:user-agent:mime-version
	:content-type; bh=aOaG9uTJKDISbUhfL+YqnrZyGNBCn2UH1dPSi7Lt4Hc=;
	b=SI+MFBRgUGuJ552UcTdwarRYhS+CWfWH2Fy2xT6dullLtfTomqEMj4x24L3owjs5OZ
	6Z8XgMyPxCur4qNLFl3gscWH92LZRwQMI3PTHTy7LPQQxbHxWg6YWOaEoOWTZ0ZzxNIv
	mem57bx3dqrbNrdLKkJVGqVkm9LiMFxSYlIGIgopeEXnCLlqZJE4w6cBHt9Cb4x4bvD1
	jrkDvqSUGZ95QkQt8gDfGefOVoIKSQdLb/W9D0+PQHHpceRoWOn7iXEdRkgbfS3/ib19
	GdRFu5xhzXKy3u3ID1WL7wV4m4G/hYMCoFkBE3l7t/bP02z1/smc/comlLpfS411fSqo
	Tp8A==
X-Received: by 10.140.83.242 with SMTP id j105mr10754413qgd.38.1408736846269; 
	Fri, 22 Aug 2014 12:47:26 -0700 (PDT)
Received: from parenteses.gmail.com (email.parenteses.org. [198.199.72.94])
	by mx.google.com with ESMTPSA id i5sm56870748qaz.3.2014.08.22.12.47.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Aug 2014 12:47:25 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 19:47:22 +0000
Message-ID: <87sikoz4qd.fsf@parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3.50 (gnu/linux)
MIME-Version: 1.0
Subject: Should lsb rdepends on lsbinitscripts?
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
X-List-Received-Date: Fri, 22 Aug 2014 19:47:27 -0000
Content-Type: text/plain

Hi,

The scripts installed by the lsb package (under /etc/core-lsb) source
/etc/init.d/functions, but that file is not installed by lsb or by any
of its dependencies, as far as I can see.

/etc/init.d/functions is provided by the lsbinitscripts package.  Should
it be in lsb's RDEPENDS?

Best wishes.
Mario
-- 
http://www.ossystems.com.br

