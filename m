Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1TOzKC-0003lw-KR
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 01:16:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9IJnV69007248
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2012 12:49:31 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Thu, 18 Oct 2012 12:49:28 -0700
Message-ID: <50805D43.8090300@windriver.com>
Date: Thu, 18 Oct 2012 15:49:23 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.147.210]
Subject: libcrypto.so exec stack
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
X-List-Received-Date: Thu, 18 Oct 2012 23:16:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

In openssl recipe, it has this:

# Avoid binaries being marked as requiring an executable stack (which causes
# issues with SELinux on the host)
CFLAG_append_virtclass-native = " -Wa,--noexecstack"



Why this is only enabled for native? yocto doesn't support secure kernel?

thanks,
yao


