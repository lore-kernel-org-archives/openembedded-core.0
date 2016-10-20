Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 4F60471A9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 11:10:53 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t05hZ32pYz3hjWb;
	Thu, 20 Oct 2016 13:10:54 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t05hZ2n7rzvkjg;
	Thu, 20 Oct 2016 13:10:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id kGxmHsEMRMvh; Thu, 20 Oct 2016 13:10:53 +0200 (CEST)
X-Auth-Info: zi2HSesAK76VwwuQ2AKKJGXEE615QGOg365VvmsHlLBigx47tUp8ilC7aqnTIiQS
Received: from [10.0.0.72] (host-141-40-253-38.customer.izb-online.de
	[141.40.253.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 20 Oct 2016 13:10:53 +0200 (CEST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1476871513-19739-1-git-send-email-o.mandel@menlosystems.com>
	<1476871513-19739-2-git-send-email-o.mandel@menlosystems.com>
	<2cc36b90426449c9bf030d2604b93bab@XBOX02.axis.com>
From: Olaf Mandel <o.mandel@menlosystems.com>
Organization: Menlo Systems
Message-ID: <afb26082-a498-0a18-7a03-52fe1c271861@menlosystems.com>
Date: Thu, 20 Oct 2016 13:11:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <2cc36b90426449c9bf030d2604b93bab@XBOX02.axis.com>
Subject: Re: [PATCH 1/1] Remove $COREBASE/LICENSE from LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 20 Oct 2016 11:10:55 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hello,

Am 20.10.2016 um 12:44 schrieb Peter Kjellerstedt:
>> -----Original Message-----
-Snipp-
>> Subject: [OE-core] [PATCH 1/1] Remove $COREBASE/LICENSE from
-Snipp-
> 
> Even after this is applied, there are still nine recipes in OE-Core 
> that reference ${COREBASE}/LICENSE. There is also an example in 
> dev-manual-common-tasks.xml with a reference to ${COREBASE}/LICENSE. 
> AFAICT, they all look just like the ones that this patch removes. 
> Any reason they were not fixed as well?
> 
"Why not patch the nine remaining recipes": see my cover letter
"[OE-core][PATCH 0/1] $COREBASE/LICENSE in LIC_FILES_CHKSUM":

>>> I patched out the global LICENSE file from all those recipes that
>>> are short enough and where I feel reasonably confident of not
>>> having actually changed the claimed license terms in any way.
>>> 
>>> There are additional recipes that reference the global LICENSE
>>> file, but where I am not sure if a less blanket license declaration
>>> is appropriate or not. Especially for meta-toolchain and
>>> build-appliance-image, the global LICENSE is probably correct.
>>> Any comments?

So please comment away  :-)

> There are also 17 recipes in OpenEmbedded with a reference to 
> ${COREBASE}/LICENSE. They too need to be fixed.
> 
Same as for dev-manual-common-tasks.xml: I was not a aware of those and
not all belong on the openembedded-core list. And for the example: it
should only be patched once this patch for formfactor_0.0.bb is accepted.


