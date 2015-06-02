Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 97B6A756F0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 11:50:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t52BoTL5008935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jun 2015 04:50:29 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 04:50:29 -0700
Message-ID: <556D9883.5080803@windriver.com>
Date: Tue, 2 Jun 2015 19:50:27 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1433137188.git.liezhi.yang@windriver.com>
	<da6567b5a4f3e8de65f1c21dfc1ac9a8a52da84b.1433137188.git.liezhi.yang@windriver.com>
	<CAJTo0LZCmxQgwTkjCgfnhxioQwS_1_D0cDnEr7mJ9r3OMBmiZA@mail.gmail.com>
In-Reply-To: <CAJTo0LZCmxQgwTkjCgfnhxioQwS_1_D0cDnEr7mJ9r3OMBmiZA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] btrfs-tools: 3.18.2 -> 4.0.1
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
X-List-Received-Date: Tue, 02 Jun 2015 11:50:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/02/2015 06:30 PM, Burton, Ross wrote:
>
> On 1 June 2015 at 06:41, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     -       $(Q)$(CC) -MM -MG -MF $@ -MT $(@:.o.d=.o) -MT $(@:.o.d=.static.o)
>     -MT $@ $(AM_CFLAGS) $(CFLAGS) >lt;
>     +       $(Q)$(CC) -MM -MG -MF $@ -MT $(@:.o.d=.o) -MT $(@:.o.d=.static.o)
>     -MT $@ $(CFLAGS) >lt;
>
>
> Pretty sure you don't mean to drop AM_CFLAGS there.

Hi Ross,

The patch I sent is a patch's patch, which means that this patch patches
fix-parallel.patch, after the patch is applied, the fix-parallel.patch is:

diff --git a/Makefile.in b/Makefile.in
index 860a390..8a6fbd7 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -142,7 +142,7 @@ else
     check_echo = true
  endif

-%.o.d: %.c
+%.o.d: %.c version.h
     $(Q)$(CC) -MM -MG -MF $@ -MT $(@:.o.d=.o) -MT $(@:.o.d=.static.o) -MT $@ 
$(CFLAGS) $<

  .c.o:


I think that there isn't anything wrong.

// Robert

>
> Ross

