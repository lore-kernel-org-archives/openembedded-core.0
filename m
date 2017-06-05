Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 85BA47780A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 13:37:26 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2017 06:37:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,300,1493708400"; d="scan'208";a="94810648"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 05 Jun 2017 06:37:26 -0700
To: Joshua Lock <joshua.g.lock@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<1496585728.6630.165.camel@linuxfoundation.org>
	<4f9f2466-1409-e5d8-917c-58b4864f8863@linux.intel.com>
	<1496668890.3690.7.camel@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c247784f-f822-9193-c3cd-650ec9581af4@linux.intel.com>
Date: Mon, 5 Jun 2017 16:34:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1496668890.3690.7.camel@linux.intel.com>
Subject: Re: [PATCH 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Mon, 05 Jun 2017 13:37:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2017 04:21 PM, Joshua Lock wrote:

> On the Yocto Autobuilder clusters we have:
> * centos7 / gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-11)
> * debian8 / gcc (Debian 4.9.2-10) 4.9.2
> * debian-testing / gcc (Debian 6.3.0-14) 6.3.0 20170415
> * fedora24 / gcc (GCC) 6.3.1 20161221 (Red Hat 6.3.1-1)
> * fedora25 / gcc (GCC) 6.3.1 20161221 (Red Hat 6.3.1-1)
> * opensuse132 / gcc (SUSE Linux) 4.8.3 20140627 [gcc-4_8-branch
> revision 212064]
> * opensuse422 / gcc (SUSE Linux) 4.8.5
> * ubuntu1604 / gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609
> * ubuntu1610 / gcc (Ubuntu 6.2.0-5ubuntu12) 6.2.0 20161005
>
> We are aiming to replace openSUSE 13.2 (as it was discontinued in
> January of this year) but CentOS 7 has a good long lifetime ahead of
> it, therefore supporting it and RHEL 7 will require gcc 4.8.5 support.

Thanks; in that case using atomic types and other C11 features is not 
possible at all for quite some time, and openmp support, while 
available, is restricted to version 3.1 of the spec (which should be 
just about enough - earlier versions do not have task support).

I actually have gcc 4.8 here (on debian testing, which will become 
debian 9 in a couple of weeks), even though the default version is 6.3, 
so I can test 4.8 compatibility locally.


Alex

