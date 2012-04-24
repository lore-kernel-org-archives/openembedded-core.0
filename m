Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1SMboP-00062A-4L
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 11:13:29 +0200
Received: by lbjn8 with SMTP id n8so304914lbj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=39mx19iCfu89YpMSRd420rYEm8rkhjeYeZKt+VZOLM4=;
	b=tj17hUNdt0A3/fMS8R+FDU3qjiuBOFAzSKbV/kAJ8zRei/XSHeQ9z/klXpyJHExB8l
	T7+oAwIhPEQK3m7dy9sEoyybULxnKL0HKeWPly12G2FGKadH5X0EvJdPNEXuJW8kmyRD
	6oa/iVYYhgy9hg5j4D8NgJW6FDxx+P4Ho0ziSuUNckWT/brEe+9Grt8pCqUrLWlSsIaB
	6sZNo0LGFUnHP7RhqIGD9Fh+sZBAV8D9lqSuRaLWl7D5V4d69lR2sGVPt4UpIKOy6tyr
	W2ouUQrcE1OUbZkghTvHxAPFvpHZGsUdoXkDiEttNSaMCs6TZYbPytOgyDWqnW5ey6oc
	lc8g==
Received: by 10.152.115.74 with SMTP id jm10mr16156997lab.32.1335258231755;
	Tue, 24 Apr 2012 02:03:51 -0700 (PDT)
Received: from [192.168.0.117] ([84.49.231.147])
	by mx.google.com with ESMTPS id q5sm23336804lbd.13.2012.04.24.02.03.49
	(version=SSLv3 cipher=OTHER); Tue, 24 Apr 2012 02:03:50 -0700 (PDT)
Message-ID: <4F9714DD.6070608@gmail.com>
Date: Tue, 24 Apr 2012 23:02:21 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335245655.git.xiaofeng.yan@windriver.com>
	<fde21e1126e23439ccd9dc7ba8e7cc9e96df3799.1335245655.git.xiaofeng.yan@windriver.com>
In-Reply-To: <fde21e1126e23439ccd9dc7ba8e7cc9e96df3799.1335245655.git.xiaofeng.yan@windriver.com>
Subject: Error compiling Boost with Python support on 64-bit host for 32-bit target.
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
X-List-Received-Date: Tue, 24 Apr 2012 09:13:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

boost.inc:

# To enable python, uncomment the following:
#BOOST_LIBS += "python"
#DEPENDS += "python"
#PYTHON_ROOT = "${STAGING_DIR_HOST}/${prefix}"
#PYTHON_VERSION = "2.5"

If this is uncommented, stuff fails with messages like:

| ...failed gcc.compile.c++ 
bin.v2/libs/python/build/69ffc88faf507005827aa061bd65b9bd/wrapper.o...
| gcc.compile.c++ 
bin.v2/libs/python/build/69ffc88faf507005827aa061bd65b9bd/import.o
| In file included from 
/src/openembedded/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/include/python2.7/Python.h:58:0,
|                  from ./boost/python/detail/wrap_python.hpp:142,
|                  from ./boost/python/detail/prefix.hpp:13,
|                  from ./boost/python/ssize_t.hpp:9,
|                  from ./boost/python/object.hpp:8,
|                  from ./boost/python/import.hpp:8,
|                  from libs/python/src/import.cpp:6:
| 
/src/openembedded/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/include/python2.7/pyport.h:849:2: 
error: #error "LONG_BIT definition appears wrong for platform (bad 
gcc/glibc config?)."

I have problems figuring out how to solve this (other than by 
reinstalling Ubuntu 32-bit).

- Tasslehoff


