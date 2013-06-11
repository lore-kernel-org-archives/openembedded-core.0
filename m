Return-Path: <net147@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 54A986AA78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 23:51:15 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so8997699pbb.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 16:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=v9i0HD8Mce1Puu0Mv0U8nYVoDVyRy9eCrORCzVMcM7s=;
	b=k44X7oCZskrVMYkKwPCan9Ag7tyQfFWvMUB4yFCnIMQtqeQ4FWlC+9KO1FfTDmMY9Q
	XHsnIsOSdMfzZcj8jbX/lDg4t+ynkGkqnEfSzMeGnCwYDon4IgQ1UyycX8hLL9BFcQLm
	YFdcyw1TMl08k4uf8URvcMBWEFd3OBHk7bSPrD8nZQCDfPjvGpuOjxl81fVuL2LugBVm
	VOPLQM0nc5zOar0cb9R6Zp5+kj+AqwkCOe7bXEUQR5ISp4QnF1TdqDrYHj/nKQEbAUOk
	gCgkG8Jgiijxp3MPtZWfovRnzTDLztlhxOrf9B8Fd3EWp/7F+B+HeWyKDABn5Y+UhNSl
	ZgFQ==
X-Received: by 10.66.154.225 with SMTP id vr1mr21676250pab.85.1370994676268;
	Tue, 11 Jun 2013 16:51:16 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	cq1sm16557616pbc.13.2013.06.11.16.51.13 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 16:51:15 -0700 (PDT)
Message-ID: <51B7B6CE.8040301@gmail.com>
Date: Wed, 12 Jun 2013 09:46:22 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1370422910-24366-1-git-send-email-net147@gmail.com>
	<51AF6B79.3040506@linux.intel.com> <2054363.UxqkIOrzAJ@helios>
	<2653566.bBSFCXsGIZ@helios>
In-Reply-To: <2653566.bBSFCXsGIZ@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Tue, 11 Jun 2013 23:51:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 6/06/2013 3:04 AM, Paul Eggleton wrote:
> On Wednesday 05 June 2013 17:57:32 Paul Eggleton wrote:
>> On Wednesday 05 June 2013 09:46:49 Saul Wold wrote:
>>> On 06/05/2013 02:30 AM, Martin Jansa wrote:
>>>> On Wed, Jun 05, 2013 at 07:01:50PM +1000, Jonathan Liu wrote:
>>>>> qconfig.pri was not being loaded by qmake properly. This means Qt
>>>>> qmake projects are unable to query QT_ARCH, QT_VERSION and other
>>>>> variables defined in qconfig.pri.
>>>>>
>>>>> Export OE_QMAKE_QT_CONFIG, setting it to the location of qconfig.pri
>>>>> so that it can be located by qmake.
>>>> There is such patch already:
>>>> http://lists.openembedded.org/pipermail/openembedded-core/2013-May/07831
>>>> 4.
>>>> html
>>> Got lost in my queue, adding it for the next MUT.
>> FWIW I am still concerned by the assertion in the commit message about it
>> causing undesirable behaviour. I'd want that checked out and the note
>> removed before we look at merging this.
> (I mean undesirable behaviour on rebuild after applying this patch; I should
> mention I'm testing this at the moment.)
>
> Cheers,
> Paul
>
Looks like this was missed in the last pull.

Regards,
Jonathan

