Received: from mail-oa0-f41.google.com ([209.85.219.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UAOfJ-0001Xh-7b
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 18:50:13 +0100
Received: by mail-oa0-f41.google.com with SMTP id i10so5818141oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=GwzKGaP/H4E/xkgys8OxLXGVUQ7UBS5zQcEcSL/uySc=;
	b=yaW+6T7CQjHtkoUbCbByPNAmvt9/zupYxXqvBfHK7a89PEOyA3K3eC2sH/umFpj+2s
	mPLeNW4+ZyXAbPfYmsEafLz/xHlmBRzr6p2JUguLd9DjyhdKn/yDvSPds2AcKcFZSXvu
	KdrgI/ppdjzVDbDV1083tsklorrQjInApwK6q/73uvWvmxH4JvIGMT1ZBnm4HAvR1X5R
	dRmkh9SWhSQmmU2BQLa0st9NJWDQBb4bQZV7O32kE7Y62jL6kunCQF3ge4yrDI5yrdVS
	LEB5TybJFbkUsTZy0bImYgns45zMMQ2k772+9s6dVTPvC5JlNeTkaDr+SNS/s0FV6QUj
	meVQ==
MIME-Version: 1.0
X-Received: by 10.60.170.44 with SMTP id aj12mr2212162oec.42.1361900029326;
	Tue, 26 Feb 2013 09:33:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Tue, 26 Feb 2013 09:33:49 -0800 (PST)
In-Reply-To: <512CEFF4.8030000@linux.intel.com>
References: <1361891080-5035-1-git-send-email-constantinx.musca@intel.com>
	<CAP9ODKqfv-8=MG=ffQQG_DSTxj9=059Z_W4mPznQiwsKKaYM-w@mail.gmail.com>
	<512CEFF4.8030000@linux.intel.com>
Date: Tue, 26 Feb 2013 14:33:49 -0300
X-Google-Sender-Auth: DrJ8TEE10HXIQGi1NvgGP0dyRBg
Message-ID: <CAP9ODKpe2Gj7pQ8=K+UVsEn+qr+7_n2ONxrgwgdFcnt+UUPerA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] log_srcrev.bbclass: add a bbclass for logging SRCREVs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 17:50:18 -0000
X-List-Received-Date: Tue, 26 Feb 2013 17:50:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 2:25 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/26/2013 08:56 AM, Otavio Salvador wrote:
>>
>> On Tue, Feb 26, 2013 at 12:04 PM, Constantin Musca
>> <constantinx.musca@intel.com> wrote:
>>>
>>> - add a task which creates a file for each package with the following
>>> format:
>>>
>>> ${BB_FILENAME},${SRC_URI},${SRCREV},${FROM_AUTOREV}
>>>
>>> [YOCTO #3041]
>>>
>>> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>>
>>
>> What is the use-case for this?
>>
> I could reply with see bug #3041!
>
> There is a need to have the actual SRCREVs from AUTOREV'ed package version,
> so a build can be reproduced at a later date or so you know what SRCREV went
> into a given release.

I know I could read the bug but this ought to be in commit log. It
seems like a buildhistory thing from my POV, not another class thingy.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


