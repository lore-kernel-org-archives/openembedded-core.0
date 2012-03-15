Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1S8643-0005co-Rm
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 09:29:40 +0100
Received: from WX-EXCHMB2.insigma.com.cn (10.0.1.203) by
	WX-Edge.insigma.com.cn (10.0.1.205) with Microsoft SMTP Server (TLS) id
	8.1.436.0; Thu, 15 Mar 2012 16:20:39 +0800
Received: from [192.168.0.98] (122.224.76.38) by Wx-ExchMB2.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.436.0; Thu, 15 Mar 2012
	16:20:31 +0800
Message-ID: <1331799506.1041.55.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2012 16:18:26 +0800
Organization: Insigma
X-Mailer: Evolution 3.2.3 
MIME-Version: 1.0
Subject: LSB support?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 15 Mar 2012 08:29:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello, I'm working on custom lsb-base image using oe-core.

and when using the lsb script, found error:

lsb_start_daemon line 44: daemon command not found.

similar thing happend on lsb_log_message: failure and warning command
not found.

maybe these function should be defined in /etc/init.d/functions?

but there are not these function in this file (belongs to initscripts).

Any idea?

thanks!


-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



