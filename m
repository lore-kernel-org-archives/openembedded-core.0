Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id B596878372
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 11:42:29 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v5FBgNXw016509
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 15 Jun 2017 13:42:25 +0200
Received: from [192.168.253.100] ([163.242.56.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id v5FBgNc6020977
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 15 Jun 2017 13:42:23 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <1497454006-13902-1-git-send-email-andrej.valek@siemens.com>
	<1497508479-18852-2-git-send-email-andrej.valek@siemens.com>
	<CAJTo0Lb41uTXQp7Hbh7xBWd-B088ygi9gdTOAVJgGdMaYKfq0g@mail.gmail.com>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <58ae27c5-8cd0-3787-6e3a-87b708cf28a2@siemens.com>
Date: Thu, 15 Jun 2017 13:42:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb41uTXQp7Hbh7xBWd-B088ygi9gdTOAVJgGdMaYKfq0g@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Jun 2017 11:42:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

I am modifying already existing patch not creating the new one. Is it
necessary to change Upstream-Status to backported?

If yes, is it possible to fix only this patch, or do I need to push the
whole series?

Andrej

On 06/15/2017 01:31 PM, Burton, Ross wrote:
> 
> On 15 June 2017 at 07:34, Andrej Valek <andrej.valek@siemens.com 
> <mailto:andrej.valek@siemens.com>> wrote:
> 
>     Upstream-Status: Backported -
>     [https://git.gnome.org/browse/libxml2/commit/?id=ac9a4560ee85b18811ff8ab7791ddfff7b144b0a
>     <https://git.gnome.org/browse/libxml2/commit/?id=ac9a4560ee85b18811ff8ab7791ddfff7b144b0a>]
> 
> 
>     --- a/meta/recipes-core/libxml/libxml2/runtest.patch
>     +++ b/meta/recipes-core/libxml/libxml2/runtest.patch
>     @@ -5,9 +5,9 @@ Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com
>     <mailto:mihaela.sendrea@enea.com>>
>       Upstream-Status: Pending
> 
> 
> Upstream-Status goes into the path file itself, not the commit log.
> 
> Ross
> 

