Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RQrrC-0007je-74
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 03:37:42 +0100
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Thu, 17 Nov 2011 10:31:02 +0800
Received: from [192.168.0.98] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Thu, 17 Nov 2011
	10:31:01 +0800
Message-ID: <1321496999.1264.24.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2011 10:29:59 +0800
Organization: Insigma
X-Mailer: Evolution 3.2.1 
MIME-Version: 1.0
Subject: how to exclude files when packaging?
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
X-List-Received-Date: Thu, 17 Nov 2011 02:37:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello, All:
	I'm working on opensaf, wrote a bb file for it,
and found that the FILES_${PN} has included /usr/lib/${PN}/*.
but there are some .a and .so(symlink) in /usr/lib/${PN}, which will
result QA issue.
	how to exclude some files (e.g. *.a, *.so) in FILES_${PN}?

	there are some elf in /usr/lib/${PN} whose prefix is not 'lib', so if
no 'exclude' feature, I must redefine FILES_${PN} like this:
	FILES_${PN} = "/usr/lib/${PN}/*.so.* \
                       /usr/lib/${PN}/saf* \
                       /usr/lib/${PN}/open* \
                       /usr/lib/${PN}/immload \
                       /usr/lib/${PN}/nid_tipc \
                       /usr/lib/${PN}/smf* \
                       /usr/lib/${PN}/clc-cli/*"


-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



