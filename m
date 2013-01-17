Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1Tviza-00053D-PN
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 07:30:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0H6Exp3029422
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jan 2013 22:14:59 -0800 (PST)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 16 Jan 2013 22:14:58 -0800
Message-ID: <50F796EF.3040900@windriver.com>
Date: Thu, 17 Jan 2013 14:15:11 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
References: <1358234208-6177-1-git-send-email-sen.zhang@windriver.com>
	<1358234208-6177-2-git-send-email-sen.zhang@windriver.com>
	<1358337581.8129.2.camel@ted> <50F75D56.3050005@windriver.com>
	<ADD6A3980E8C39419A432FF422031B4C3F0BB37A@ORSMSX106.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C3F0BB37A@ORSMSX106.amr.corp.intel.com>
X-Originating-IP: [128.224.162.230]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] coreutils: remove dependency on coreutils-native
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
X-List-Received-Date: Thu, 17 Jan 2013 06:30:33 -0000
X-List-Received-Date: Thu, 17 Jan 2013 06:30:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 01/17/2013 01:37 PM, Kamble, Nitin A wrote:
> This is bit old (out of my cached memory), but looking at my commit (543577c25b5a4e89a3ab15ee28e754b71c2a43d5) the dependency on coreutils-native is needed if the build system does not have coreutils, or it is not compatible with the sources of the coreutils you are trying to build. And the commit log does show the errors it was hitting, which are solved by using the native version of the coreutils.

Thanks Nitin. But I don't think there can be any system without
coreutils. And if there is some compatibility issue (which I haven't been
able to reproduce on our various hosts), we should be able to trace it
down to a specific command within coreutils.

Do you still have some notes on how to reproduce the error?

jesse


