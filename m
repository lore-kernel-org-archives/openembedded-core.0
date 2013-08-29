Return-Path: <lizhijian@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 2930D6BCD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 01:46:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,979,1367942400"; 
   d="scan'208";a="8338025"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 29 Aug 2013 09:43:33 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r7T1kWuW027633;
	Thu, 29 Aug 2013 09:46:32 +0800
Received: from [127.0.0.1] ([10.167.226.56])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013082909443475-1044558 ;
	Thu, 29 Aug 2013 09:44:34 +0800 
Message-ID: <521EA7EC.80302@cn.fujitsu.com>
Date: Thu, 29 Aug 2013 09:46:20 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
Organization: fnst-ulinux
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org,
	Yocto list discussion <yocto@yoctoproject.org>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/08/29 09:44:34,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/08/29 09:44:39,
	Serialize complete at 2013/08/29 09:44:39
Subject: [Question] libxml: How about add --with-catalog to EXTRA_OECONF ?
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
X-List-Received-Date: Thu, 29 Aug 2013 01:46:41 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=Shift_JIS

Hi,

I had build libxml and executed xmlcatalog
It shows follow messages
# xmlcatalog --help
libxml was not compiled with catalog and output support

meta/recipes-core/libxml/libxml2.inc: 32
EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"

Is it reasonable to add --without-catalog EXTRA_OECONF ?

Thanks

Best regards.
Li Zhijian




