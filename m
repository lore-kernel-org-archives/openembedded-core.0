Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 75E8A6AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 23:28:32 +0000 (UTC)
Received: by wixw10 with SMTP id w10so78265418wix.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 16:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=8+25AMWjnocXTgvGrjy+Eb9TGLOy37290vB12r1XxhQ=;
	b=LOVA/GP0HaSMVLtOa+jcrNuRdIhBO/1ZdU1/v2X0ykgeYUP6SRCvdcgTNoBkFH5tvR
	/oUztbmeeoUy8po1XytpoKhXoF6KtOKnKFwbzyfthoGGGNhnLcD031srdlKeYOW3Mn97
	SGGWFvcW4fgNBgV4DAz54sQangrfT/RZXVK18Ejf1+srG796e8kNH+RzB3qtKSmbSrr2
	b+QHlv0AwLzEtA+fwJ7fYk0XXfd2Img3U1mPX+VTvrZLEnSRoL+7IBOSeNOPzynG77TR
	sYa74cjk202Uur+EVWB4nhu+NYlwg5pAlGn6v0wUlzb6uPbQ8Q112yylrRLt/Kr+8fCv
	NU/g==
X-Received: by 10.180.7.196 with SMTP id l4mr22951492wia.44.1427153313609;
	Mon, 23 Mar 2015 16:28:33 -0700 (PDT)
Received: from [10.42.42.77] (089144235077.atnat0044.highway.a1.net.
	[89.144.235.77]) by mx.google.com with ESMTPSA id
	fo9sm13323817wib.16.2015.03.23.16.28.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Mar 2015 16:28:32 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <61B03CA5-4945-49E7-9463-87CEADB22C67@gmail.com>
References: <1347436503-17966-1-git-send-email-raj.khem@gmail.com>
	<CAC1BbcR=K2mc7Z94+wpoWKCwzCzGqTfMuV2PQYU3u04TGZgmqQ@mail.gmail.com>
	<61B03CA5-4945-49E7-9463-87CEADB22C67@gmail.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 24 Mar 2015 00:28:23 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <0F5768A5-BBE1-491A-8C22-3CDF941D8654@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 3/3] uclibc: Revert systemd regressing patch from upsteam uclibc and uprev SRCREV
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
X-List-Received-Date: Mon, 23 Mar 2015 23:28:34 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On March 20, 2015 7:36:49 PM GMT+01:00, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mar 20, 2015, at 6:07 AM, Bernhard Reutner-Fischer
><rep.dot.nop@gmail.com> wrote:
>> 
>> On 12 September 2012 at 09:55, Khem Raj <raj.khem@gmail.com> wrote:
>>> This patch is causing systemd based systemd to not boot
>> 
>>> meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
>>> ...nt.c-wtent.c-move-functions-from-utxent.c.patch |  321
>++++++++++++++++++++
>>> 2 files changed, 324 insertions(+), 2 deletions(-)
>>> create mode 100644
>meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
>> 
>> Khem,
>> 
>> Do you remember what exactly this was fixing?
>> 
>> I don't immediately see how reverting it makes sense..
>> Many thanks in advance for a hint or reproducer or instructions on
>how
>> to reproduce!
>
>just remove the patch. System use to hard lock during boot. you will
>not miss it.

Cannot reproduce this on current OE with qemux86-64 -smp 22 kvm nor qemumips (no smp as that just hangs before or early in the kernel) both sato images. Nevertheless I have reverted this now and will redo it piecemeal.

Sounds more like a since fixed (?) systemd bug or something.

Thanks,



