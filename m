Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RJfJ4-0004BI-D4
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 07:48:42 +0200
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Fri, 28 Oct 2011 13:42:25 +0800
Received: from [192.168.0.98] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Fri, 28 Oct 2011
	13:42:24 +0800
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Oct 2011 13:41:39 +0800
Organization: Insigma
X-Mailer: Evolution 3.0.3 
Message-ID: <1319780499.10032.46.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: how to set time zone
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
X-List-Received-Date: Fri, 28 Oct 2011 05:48:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello All:

what is the right way to set timezone?

I have added tzdata into my image, and can find some variables in the
etc, e.g. 'TZ'.

on my archlinux, I can set TIMEZONE in the rc.conf, which is used in
rc.sysvinit (which will link the /etc/localtime using TIMEZONE).

what is the right place to locate similar setting code (e.g. link
the /etc/localtime) in the yocto?

thanks!



-- 
Yi Qingliang
niqingliang@insigma.com.cn
http://niqingliang2003.wordpress.com




