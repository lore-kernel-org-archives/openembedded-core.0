Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 613FA779F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 20:52:12 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3y6B6h0CsGz1qqyb;
	Tue,  3 Oct 2017 22:52:11 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3y6B6g65nbz1qrmj;
	Tue,  3 Oct 2017 22:52:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id QUUU5IhRNUNt; Tue,  3 Oct 2017 22:52:10 +0200 (CEST)
X-Auth-Info: 81waqwuVgLchlN3w8ZIkBE00L4A/ilkUqSUEJqL5zs8=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  3 Oct 2017 22:52:10 +0200 (CEST)
To: "Bystricky, Juro" <juro.bystricky@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1507060295-34074-1-git-send-email-juro.bystricky@intel.com>
	<0794973c-f52e-b63f-010e-2bf72b76cb5a@denx.de>
	<6E51916E4A1F32428260031F4C7CD2B611A22BC6@ORSMSX112.amr.corp.intel.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <96f05331-a0f7-b79c-f1eb-249e3726cd1e@denx.de>
Date: Tue, 3 Oct 2017 22:52:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B611A22BC6@ORSMSX112.amr.corp.intel.com>
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>, "Gan,
	Yau Wai" <yau.wai.gan@intel.com>
Subject: Re: [PATCH] siteinfo: nios2-linux - remove wrong mutex info
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
X-List-Received-Date: Tue, 03 Oct 2017 20:52:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/03/2017 10:44 PM, Bystricky, Juro wrote:
> 
>> While I understand ARM/ is wrong, why is removing the db_cv_mutex a
>> correct fix instead of ie. s/ARM/nios2/ ? The patch description does not
>> explain that.
> 
> With the relatively recent commit http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/recipes-support/db?id=f4e8e9242c5df095b52688b083df3c9d36e7144b
> some nios2 builds (uboot, core-image-minimal, etc) were broken due to db trying to
> use ARM instructions in mutexes. The reason was db "configure" used the cached entry 
> from nios2-linux (which was incorrect).  So the remedy was to remove the incorrect cached entry
> and let db "configure" figure out which is the proper mutex to use. 
> Besides, I don't even know if nios2/gcc-assembly exists.
> Also, none of other Linux info files provides this entry (db_cv_mutex).
> 

This should be in the commit message ...

-- 
Best regards,
Marek Vasut

