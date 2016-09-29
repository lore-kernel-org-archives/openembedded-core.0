Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 1EBA66022F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 00:10:01 +0000 (UTC)
Received: (qmail 32134 invoked by uid 1003); 29 Sep 2016 00:10:02 -0000
Received: from unknown (HELO ?10.16.32.128?)
	(philip@opensdr.com@207.114.172.147)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	29 Sep 2016 00:10:02 -0000
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Philip Balister <philip@balister.org>
Message-ID: <330713b9-ebbd-32c0-659d-26f0998920aa@balister.org>
Date: Wed, 28 Sep 2016 17:10:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
Subject: Kernel check of PV versus kernel source
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
X-List-Received-Date: Thu, 29 Sep 2016 00:10:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This check seems to have gone in recently and doesn't appear to work
very well.

ERROR: linux-xlnx-3.14-xilinx+gitAUTOINC+2b48a8aeea-r0
do_kernel_version_sanity_check: Package Version
(3.14-xilinx+gitAUTOINC+2b48a8aeea) does not match of kernel being built
(4.6). Please update the PV variable to match the kernel source.

I hunt around and the kernel source appears to be 3.14.2. Sometimes the
check passes, sometimes it asks for 3.14.2 actual PV is something like
3.14-xilinx+gitAUTOINC+2b48a8aeea-r0

Clearly, something isn't deterministic here.

Philip

