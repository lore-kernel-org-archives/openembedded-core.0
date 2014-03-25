Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E66D46F877
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 01:43:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2P1h4ZW009452
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Mar 2014 18:43:04 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 24 Mar 2014 18:43:03 -0700
Message-ID: <5330DF25.6070607@windriver.com>
Date: Tue, 25 Mar 2014 09:43:01 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Chris Larson <kergoth@gmail.com>
References: <cover.1395639298.git.liezhi.yang@windriver.com>
	<c4b687132dcd976635a375f994f66b3a6b9242f9.1395639299.git.liezhi.yang@windriver.com>
	<CABcZANma6KPgomjHwW=Lc2_VSiHrWiE624=cNWN3FaiNEbfPZQ@mail.gmail.com>
In-Reply-To: <CABcZANma6KPgomjHwW=Lc2_VSiHrWiE624=cNWN3FaiNEbfPZQ@mail.gmail.com>
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] local.conf.sample.extended: update it for the archiver
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
X-List-Received-Date: Tue, 25 Mar 2014 01:43:08 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/24/2014 11:34 PM, Chris Larson wrote:
> On Sun, Mar 23, 2014 at 10:39 PM, Robert Yang <liezhi.yang@windriver.com>wrote:
>
>> +# 9) The recipe type that will be archived:
>> +#    COPYLEFT_RECIPE_TYPES = '<type1> <type2> ...'
>> +#    The type can be: target native nativesdk cross crosssdk
>> cross-canadian.
>>
>
> Hmm, I wonder if we should note that the default is to archive all types,
> here.
>

Good idea, I've updated it and pushed to:

git://git.openembedded.org/openembedded-core-contrib rbt/archiver_license
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/archiver_license


diff --git a/meta/conf/local.conf.sample.extended 
b/meta/conf/local.conf.sample.extended
index aa01917..a1f2464 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -214,9 +214,20 @@
  # 6) the recipe (.bb and .inc):
  #ARCHIVER_MODE[recipe] = "1"
  #
-# Whether output the .src.rpm package:
+# 7) Whether output the .src.rpm package:
  #ARCHIVER_MODE[srpm] = "1"
  #
+# 8) Filter the license, the recipe whose license in
+#    COPYLEFT_LICENSE_INCLUDE will be included, and in
+#    COPYLEFT_LICENSE_EXCLUDE will be excluded.
+#COPYLEFT_LICENSE_INCLUDE = 'GPL* LGPL*'
+#COPYLEFT_LICENSE_EXCLUDE = 'CLOSED Proprietary'
+#
+# 9) Config the recipe type that will be archived, the type can be
+#    target, native, nativesdk, cross, crosssdk and cross-canadian,
+#    you can set one or more types. Archive all types by default.
+#COPYLEFT_RECIPE_TYPES = 'target'
+#

-R

