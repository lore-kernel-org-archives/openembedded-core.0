Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QVJ5z-0007Wi-11
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 09:59:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5B7td88029277
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 11 Jun 2011 00:55:39 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sat, 11 Jun 2011 00:55:39 -0700
Message-ID: <4DF31F79.4070602@windriver.com>
Date: Sat, 11 Jun 2011 15:55:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: "Purdie, Richard" <richard.purdie@intel.com>, "Wold, Saul"
	<saul.wold@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: About share eglibc work directories
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
X-List-Received-Date: Sat, 11 Jun 2011 07:59:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard and Saul,

The source code of eglibc and eglibc-nativesdk are not compatible because of
the patch ld-search-order.patch, this makes it a little complex to share their
source directories, what can I think is that always apply
ld-search-order.patch, then in do_configure_prepend:

if sdk && patch_applied:
	do nothing
elif not_sdk && patch_applied:
	un-apply the patch
elif sdk && patch_not_applied:
	apply the patch

I don't know whether there is a CONDITIONAL variable which can make it simple.

And the source of eglibc is 137M, not too large, maybe we would not share them?

-- 
Thanks

Robert


