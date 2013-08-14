Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 28D92600A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 09:27:46 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7E9cku5007980; Wed, 14 Aug 2013 10:38:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SOtM1nPnmrEj; Wed, 14 Aug 2013 10:38:46 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7E9cc8n007964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 14 Aug 2013 10:38:40 +0100
Message-ID: <1376472441.22952.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Zhang, Jessica" <jessica.zhang@intel.com>
Date: Wed, 14 Aug 2013 10:27:21 +0100
In-Reply-To: <C6510F6D410BB64A8C15398EDC6B847C73C69E71@ORSMSX103.amr.corp.intel.com>
References: <6741EAAB26B57F4995668065CB62D86B33933627@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKhTFiKC8BwPhtULqmtkuzgYV3MVPOCLn64ibgGYjuaGA@mail.gmail.com>
	<6741EAAB26B57F4995668065CB62D86B33933DFC@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKiRwXD8gJhG+7XDSHSGEvZY3YBR5MxBZieVMYPd_sL1g@mail.gmail.com>
	<6741EAAB26B57F4995668065CB62D86B33934034@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKCKapZsVm-sShNcfN_sE+hQM=1oWPoz-=g-PRMnzwTiw@mail.gmail.com>
	<8B119486-AEBF-46F6-9EB1-BC31C81A80D3@gmail.com>
	<1376424663.1838.26.camel@ted>
	<C6510F6D410BB64A8C15398EDC6B847C73C69E71@ORSMSX103.amr.corp.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Sywula, Krzysztof M" <krzysztof.m.sywula@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto toolchain for Windows
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
X-List-Received-Date: Wed, 14 Aug 2013 09:27:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-08-14 at 00:00 +0000, Zhang, Jessica wrote:
> Hi Richard,
> 
> I've tried the sdk on windows and here're the issues that I've run into:
> 
> 1. in our sysroot all the libraries have .so we need to change them to .dll

Which sysroot? The one for the target system should be using .so's since
we're targeting a Linux system.

> 2. seems the cross compiler i586-poky-linux-gcc.exe relies on
> libiconv-2.dll, so I manually installed that dll.

No surprise since the dynamic linking detection doesn't work for
windows. We can add a manual dependency to resolve that.

> 3. Now when I run i586-poky-linux-gcc.exe, I'm getting "the application was
> unable to start correctly (0xc000007b). Click OK  to close the application."
> By doing some initial search on the error, it seems relate to 32/64 bit dll
> mismatch.  You mentioned that 32bit windows binaries are generated, so can
> we generate a 64bit for me to try since my windows box is a 64bit.

I was confused, they are supposed to be windows 64 bit binaries (and
file under Linux says they are) so something other than what I
originally thought is wrong.

Cheers,

Richard


