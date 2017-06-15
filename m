Return-Path: <andrej.valek@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 85D3A78315
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 12:13:18 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id v5FCDFlF014469
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 15 Jun 2017 14:13:15 +0200
Received: from [192.168.253.100] ([163.242.56.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id v5FCDFQ9003648
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 15 Jun 2017 14:13:15 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <1497454006-13902-1-git-send-email-andrej.valek@siemens.com>
	<1497508479-18852-2-git-send-email-andrej.valek@siemens.com>
	<CAJTo0Lb41uTXQp7Hbh7xBWd-B088ygi9gdTOAVJgGdMaYKfq0g@mail.gmail.com>
	<58ae27c5-8cd0-3787-6e3a-87b708cf28a2@siemens.com>
	<CAJTo0LasesWRaRaacOETxM4DDV4hiKjM31XCyhND46LPeHZVuQ@mail.gmail.com>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <2c812cec-3b26-3d1d-9562-51786452c7a3@siemens.com>
Date: Thu, 15 Jun 2017 14:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LasesWRaRaacOETxM4DDV4hiKjM31XCyhND46LPeHZVuQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/7] libxml2: Disable LeakSanitizer when running API tests
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
X-List-Received-Date: Thu, 15 Jun 2017 12:13:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I have modified all patches and posted in
http://lists.openembedded.org/pipermail/openembedded-core/2017-June/138219.html
.

Andrej

On 06/15/2017 01:47 PM, Burton, Ross wrote:
> 
> On 15 June 2017 at 12:42, Andrej Valek <andrej.valek@siemens.com 
> <mailto:andrej.valek@siemens.com>> wrote:
> 
>     I am modifying already existing patch not creating the new one. Is it
>     necessary to change Upstream-Status to backported?
> 
>     If yes, is it possible to fix only this patch, or do I need to push the
>     whole series?
> 
> 
> If the patch is backported from upstream then please correct the status to be 
> backported, and remove the U-S from the commit message.
> 
> Also a later patch in the series uses "Backported" when the status is Backport, 
> please verify that all the patches have the right tags as there are scripts 
> which read the values.
> 
> Ross
> 

