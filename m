Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 253786AB67;
	Thu, 25 Jul 2013 19:58:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6PJw2kk012916
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Jul 2013 12:58:03 -0700 (PDT)
Received: from [128.224.20.100] (128.224.20.100) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 25 Jul 2013 12:58:01 -0700
Message-ID: <51F18346.2@windriver.com>
Date: Thu, 25 Jul 2013 15:57:58 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	<koen@dominion.thruhere.net>, Martin Jansa <martin.jansa@gmail.com>
X-Originating-IP: [128.224.20.100]
Subject: Add lua to oe-core.
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
X-List-Received-Date: Thu, 25 Jul 2013 19:58:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


I've found that many projects use the lua scripting language.
I'd like to move it from meta-oe to oe-core:

 
http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb?h=master

http://www.lua.org/about.html

lua-5.2.2 is current, see: http://www.lua.org/download.html
so we'd likely uprev and send that version.

rpm and lighttpd could (would?) optionally depend on lua.

oe-core.git $ grep -r lua * | egrep -v 'valuat|valuable|uargp|rpm'
meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb:
              --without-lua \

Any comments pro or con before we do the uprev, testing and send
a commit?
-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

