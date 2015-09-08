Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E9EF660132
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 01:24:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t881OPdZ006169
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Sep 2015 18:24:25 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 7 Sep 2015 18:24:24 -0700
Message-ID: <55EE38C7.30300@windriver.com>
Date: Tue, 8 Sep 2015 09:24:23 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1441592391-108731-1-git-send-email-wenzong.fan@windriver.com>
	<CAJTo0LYt6Qd0OGqZgGKAtxpKuq9Cr2SUr42=vNa67+zPsUebYg@mail.gmail.com>
In-Reply-To: <CAJTo0LYt6Qd0OGqZgGKAtxpKuq9Cr2SUr42=vNa67+zPsUebYg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnu-efi: Make setjmp.S portable to ARM
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
X-List-Received-Date: Tue, 08 Sep 2015 01:24:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2015 10:08 PM, Burton, Ross wrote:
>
> On 7 September 2015 at 03:19, <wenzong.fan@windriver.com
> <mailto:wenzong.fan@windriver.com>> wrote:
>
>     +  > Note on targets where the @ character is the start of a comment
>     +  > (eg ARM) then another character is used instead. For example the
>     +  > ARM port uses the % character.
>
>
> Is the documentation badly written or does this now broke the build on x86?

The lib/arm/setjmp.S is introduced by gnu-efi 3.0.3, there's not such 
assembler file in 3.0.2.

It only fails while building qemuarm target.

Thanks
Wenzong

>
> Ross

