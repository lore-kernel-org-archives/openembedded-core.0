Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1SthTp-0005mD-HZ
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 17:57:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6OFjTGu007250
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jul 2012 08:45:29 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 24 Jul 2012 08:45:29 -0700
Message-ID: <500EC30C.30503@windriver.com>
Date: Tue, 24 Jul 2012 11:45:16 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343137799-12032-1-git-send-email-yao.zhao@windriver.com>
	<1343144355.5878.18.camel@phil-desktop>
In-Reply-To: <1343144355.5878.18.camel@phil-desktop>
X-Originating-IP: [128.224.147.210]
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] bzip2-native: fix problems when bzip2-native is installed in parallel
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
X-List-Received-Date: Tue, 24 Jul 2012 15:57:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-07-24 11:39 AM, Phil Blundell wrote:
> On Tue, 2012-07-24 at 09:49 -0400, Yao Zhao wrote:
>> when bzip2-native is installed in parallel to sysroot, it is possible that
>> some packages are using bzip2 to unpack, there are chances that bzip2 is
>> installed to sysroot but libbz2.so.0 not installed yet because parallel
>> installation.
>> link bzip2 and bzip2recover statically to avoid this problem and don't lose
>> parallel installation. libbz2.so is still available.
> Can the makefile not be fixed to get libbz2.so.0 installed before bzip?
In the Makefile, libbz2.so.0 is installed before bzip2, but the 
installation is "make -j xxx install". Then this could happen.

yao
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




