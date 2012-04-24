Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SMcRp-0006dw-BN for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 11:54:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3O9idfw005805
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 10:44:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05670-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 10:44:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3O9iWPj005799
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 10:44:34 +0100
Message-ID: <1335260672.12692.114.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Apr 2012 10:44:32 +0100
In-Reply-To: <4F9714DD.6070608@gmail.com>
References: <cover.1335245655.git.xiaofeng.yan@windriver.com>
	<fde21e1126e23439ccd9dc7ba8e7cc9e96df3799.1335245655.git.xiaofeng.yan@windriver.com>
	<4F9714DD.6070608@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Error compiling Boost with Python support on 64-bit host for 32-bit target.
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
X-List-Received-Date: Tue, 24 Apr 2012 09:54:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-24 at 23:02 +0200, Tasslehoff Kjappfot wrote:
> boost.inc:
> 
> # To enable python, uncomment the following:
> #BOOST_LIBS += "python"
> #DEPENDS += "python"
> #PYTHON_ROOT = "${STAGING_DIR_HOST}/${prefix}"
> #PYTHON_VERSION = "2.5"
> 
> If this is uncommented, stuff fails with messages like:
> 
> | ...failed gcc.compile.c++ 
> bin.v2/libs/python/build/69ffc88faf507005827aa061bd65b9bd/wrapper.o...
> | gcc.compile.c++ 
> bin.v2/libs/python/build/69ffc88faf507005827aa061bd65b9bd/import.o
> | In file included from 
> /src/openembedded/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/include/python2.7/Python.h:58:0,
> |                  from ./boost/python/detail/wrap_python.hpp:142,
> |                  from ./boost/python/detail/prefix.hpp:13,
> |                  from ./boost/python/ssize_t.hpp:9,
> |                  from ./boost/python/object.hpp:8,
> |                  from ./boost/python/import.hpp:8,
> |                  from libs/python/src/import.cpp:6:
> | 
> /src/openembedded/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/include/python2.7/pyport.h:849:2: 
> error: #error "LONG_BIT definition appears wrong for platform (bad 
> gcc/glibc config?)."
> 
> I have problems figuring out how to solve this (other than by 
> reinstalling Ubuntu 32-bit).

You have to wonder why its looking in the native sysroot and not the
target one. It would probably find better values in the target one...

Cheers,

Richard



