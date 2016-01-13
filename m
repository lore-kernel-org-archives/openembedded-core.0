Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id E81DB73218
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 02:10:59 +0000 (UTC)
Received: from kw-mxoi2.gw.nic.fujitsu.com (unknown [192.168.231.133]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 2c1c_3f09_01532e61_09a7_417a_87b5_12fc070f5106;
	Wed, 13 Jan 2016 11:10:55 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by kw-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 57C4BAC02C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 11:10:55 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id 3E7FA110
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 11:10:55 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 28E6E1E0089
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 11:10:55 +0900 (JST)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <5695B289.1030902@jp.fujitsu.com>
Date: Wed, 13 Jan 2016 11:12:25 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
X-TM-AS-MML: disable
Subject: Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Wed, 13 Jan 2016 02:11:01 -0000
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit

Hi

I notice that there is foomatic-filters item in packagegroup-core-lsb.bb
file.
The foomatic-filters.bb file is added in 2011 for providing foomatic-rip
to pass LSB commands check.

But the foomatic-rips is moved from foomtic-filters to cups-filters and
maintained by cups-filters according to the cups-filter's NEWS.
(http://bzr.linuxfoundation.org/loggerhead/openprinting/cups-filters/annotate/head:/NEWS)

Now the foomatic-filters package is unmaintained.
(http://www.gossamer-threads.com/lists/gentoo/user/288184)

So I want to replace foomatic-filters with cups-filters in
packagegroup-core-lsb.bb file and replace the foomatic-filters.bb file
with cups-filters.bb file.

How do you think about it?

Best Regards,

Fan

