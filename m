Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C96D86FF60
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 07:10:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u817APVp016183
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Sep 2016 00:10:25 -0700 (PDT)
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 1 Sep 2016 00:10:24 -0700
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <57C7D481.1070502@windriver.com>
Date: Thu, 1 Sep 2016 15:10:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.229]
Subject: 'qemumips64 + systemd + pam' results in being not able to login
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
X-List-Received-Date: Thu, 01 Sep 2016 07:10:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

Recently I noticed that if we start a systemd based qemumips64 target 
with 'pam' enabled in DISTRO_FEATURES, we could not login in 
successfully. After you provide username and password to the login 
prompt, the login prompt just comes up again.

Below is some error information.

Received SIGCHLD from PID 175 (login).
Child 175 (login) died (code=dumped, status=10/BUS)
serial-getty@ttyS0.service: Child 175 belongs to serial-getty@ttyS0.service
serial-getty@ttyS0.service: Main process exited, code=dumped, status=10/BUS

I've investigated this problem, but I could not find the root cause.
Has any of you also seen the same problem?
Anyone has any idea what's going on here?

Best Regards,
Chen Qi

