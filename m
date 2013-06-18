Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B1A986023E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 08:42:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5I8gnxd004718
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Jun 2013 01:42:49 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 18 Jun 2013 01:42:48 -0700
Message-ID: <51C01D87.9080804@windriver.com>
Date: Tue, 18 Jun 2013 16:42:47 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1371539741.git.rongqing.li@windriver.com>
	<b57b85f69322501fb617a01e625734cda1088b5e.1371539741.git.rongqing.li@windriver.com>
	<1371542851.5066.1.camel@pb-ThinkPad-R50e>
In-Reply-To: <1371542851.5066.1.camel@pb-ThinkPad-R50e>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base-files: create /usr/lib/locale dir
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
X-List-Received-Date: Tue, 18 Jun 2013 08:42:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/18/2013 04:07 PM, Phil Blundell wrote:
> On Tue, 2013-06-18 at 15:19 +0800, rongqing.li@windriver.com wrote:
>> -           ${libdir} ${sbindir} ${datadir} \
>> +           ${libdir} /usr/lib/locale ${sbindir} ${datadir} \
>
> This is bogus for a number of reasons.  If the only reason for having it
> is for lsbtest, can't it go in some LSB recipe?
>
> p.
>

Thanks, How about put it into do_install_append_linuxstdbase

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb 
b/meta/recipes-core/base-files/base-files_3.0.14.bb
index fa1cc58..84663e3 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -139,6 +139,7 @@ do_install_append_linuxstdbase() {
         for d in ${dirs4775}; do
                  install -m 2755 -d ${D}$d
          done
+       install -m 755 -d ${D}/usr/lib/locale
  }

  PACKAGES = "${PN}-doc ${PN} ${PN}-dev ${PN}-dbg"

-Roy



>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

