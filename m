Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD7B70016
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 14:34:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3MEYHul029218
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Apr 2016 07:34:17 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 22 Apr 2016 07:34:16 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1461303847.git.liezhi.yang@windriver.com>
	<dc4e0e3653ac28bddfca011c39a7779bba5ec1b0.1461303847.git.liezhi.yang@windriver.com>
	<CAJTo0LYjvdtzq=q-f+BPNi7k3OraKV_Hez-TZmRucCWYmf0D8A@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <571A3667.7070407@windriver.com>
Date: Fri, 22 Apr 2016 22:34:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYjvdtzq=q-f+BPNi7k3OraKV_Hez-TZmRucCWYmf0D8A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] utils.bbclass: warn for deprecated base_contains
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
X-List-Received-Date: Fri, 22 Apr 2016 14:34:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/22/2016 07:15 PM, Burton, Ross wrote:
>
> On 22 April 2016 at 06:44, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     +    bb.warn('base_contains is depracated, please use bb.utils.contains
>     instead.')
>
>
> WARN seems a bit excessive.  Would a NOTE be visible in the output?

Yes, it is visible since it is happened in parsing.

>
> Also typo, "deprecated".

Sorry, updated in the repo:
* warn -> note
* depracated -> deprecated

   git://git.openembedded.org/openembedded-core-contrib rbt/warn
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/warn

Robert Yang (2):
   directfb/pango/webkit: base_contains -> bb.utils.contains
   utils.bbclass: warn for deprecated base_contains


Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Thu Apr 21 20:21:22 2016 -0700

     utils.bbclass: note for deprecated base_contains

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 81b92cb..ce639b2 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -24,6 +24,7 @@ def base_version_less_or_equal(variable, checkvalue, 
truevalue, falsevalue, d):
      return oe.utils.version_less_or_equal(variable, checkvalue, truevalue, 
falsevalue, d)

  def base_contains(variable, checkvalues, truevalue, falsevalue, d):
+    bb.note('base_contains is deprecated, please use bb.utils.contains instead.')
      return bb.utils.contains(variable, checkvalues, truevalue, falsevalue, d)

  def base_both_contain(variable1, variable2, checkvalue, d):

// Robert

>
> Ross

