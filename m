Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7103360897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 12:36:59 +0000 (UTC)
Received: from [192.168.0.2] (unknown [86.137.102.112])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 4F417952B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 13:37:00 +0100 (BST)
Message-ID: <519B6A4E.7010707@r-finger.com>
Date: Tue, 21 May 2013 13:36:30 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
CC: openembedded-core@lists.openembedded.org
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369134259-12091-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369134259-12091-5-git-send-email-tf+lists.yocto@r-finger.com>
	<1369135252.6695.16.camel@phil-desktop.brightsign>
In-Reply-To: <1369135252.6695.16.camel@phil-desktop.brightsign>
Subject: Re: [PATCH v3 4/8] fix clutter
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
X-List-Received-Date: Tue, 21 May 2013 12:37:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/13 12:20, Phil Blundell wrote:
> On Tue, 2013-05-21 at 12:04 +0100, Tomas Frydrych wrote:
>> -# Disable pretty much everything, override in platform specific set up
>> -EXTRA_OECONF += "--disable-gtk-doc		\
>> -	     	 ${@get_fpu_setting(bb, d)}	\
>> -             	 --disable-introspection	\
>> -	     	 --disable-egl-backend		\
>> +# Disable backends we do not currently support building
>> +EXTRA_OECONF += "--disable-introspection	\
> 
> Was this supposed to have been squashed with 3/8?

Yes, sorry :( I think Richard already pushed the previous version as well.

Tomas


-- 
http://sleepfive.com

