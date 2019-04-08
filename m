Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 748347D577
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 21:13:05 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id z17so1013080itc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 14:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vmDsmmpqpngc0fkjTD4B9o6TaqECGxlYdRw1nnsd1/Y=;
	b=fHxQqapYtJF4p7Cw0X0jKIc3QYSx4Ty1DVXMim0knpcxGJKcwc0MmxDwAvkDayb55v
	qRMs0z1t9+dwzD8VK243HxHXBOyM5O4R1FzK2JjT4VN89fifdrA55JdvjtYuXh1OvYv6
	XLk9kV4fszjSjhuJ5g40u7E3Ibc+fwsXBYGbuoMWau8JlUPbvF5BBZBeJzw/u4utC27C
	C9Lgi1WmzeP4XSDXQT9VRE6vLO2NwCDea+njWHfkqbE5+cn4wMVQYcVgFuWR84j7mGPz
	k0IeutP1jRL75qONw5p/k//0c6rHhIDdYk0Ovn3mf96hdQb4IZPgskG/D8yKNLZwGyMo
	Bm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vmDsmmpqpngc0fkjTD4B9o6TaqECGxlYdRw1nnsd1/Y=;
	b=nS94hsL5Uep4ZG9NoJSJsobEtB5nwjQWBJNeEpcpjBfVBqjktGuWqkkUrDk1vjeuUs
	3NjwfIAEwwcPS8emvV31xQN3UgzExkD8a4JfGGMsWgRld0eqevigaBLpysq886CIOSy2
	Gio8xo4D27PVFliASbkDEMsjlLD0gttFlXZ6kKFye0B4I4rK7W70HthSRGjGBRSIHx8Y
	3gSfAEC6ZrsUBT8CyKcYdOrZ2zWm23ci2fi3LZnI1scqtKcueB24TWCePjq3MY30gUiE
	CKBvASMryg8ROlIC7TQknGeW+CLpLaymeo4DHoAqpkPopjrjaF/8PjQlr0zQX+ix9sC3
	IaXQ==
X-Gm-Message-State: APjAAAUP/bo+9v8C9cg54nI3fCAWSGTEOP4c+o/THVCpBQtTBH06faAi
	LcknIVCUNh6GTK1H1bD4rxHWozUdzHkF4Xcto7I8HQ==
X-Google-Smtp-Source: APXvYqz1fzFwFalJPCbkIhftFjmgNVM9Ns4KNjrXlId5iLbWAYfc1BxmQt/X6mHvtSIg8W0M9mvqvwJ+/4Gk75vufIc=
X-Received: by 2002:a24:1749:: with SMTP id 70mr22462778ith.50.1554757986554; 
	Mon, 08 Apr 2019 14:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190408205558.11994-1-douglas.royds@taitradio.com>
	<CAJTo0LZSDcbaqTx=6gi3SuYDC-r3F_iVSBXLMYdjRaQGsQ1QuA@mail.gmail.com>
	<2ba57997-fef9-5f83-5f2f-c62957fb37b3@taitradio.com>
In-Reply-To: <2ba57997-fef9-5f83-5f2f-c62957fb37b3@taitradio.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Apr 2019 22:12:55 +0100
Message-ID: <CAJTo0Lb_fgV+okT_CTHXrRiHpua3rHtinRQ3Fu_5OQ3eVetvrw@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: Nikhil Pal Singh <nikhilpal.singh@taitradio.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Support Eclipse and other cmake generators
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
X-List-Received-Date: Mon, 08 Apr 2019 21:13:05 -0000
Content-Type: text/plain; charset="UTF-8"

Can you put that in the commit message, because I tried googling and
didn't find that list.  Maybe also expand the comment.

Ross

On Mon, 8 Apr 2019 at 22:12, Douglas Royds <douglas.royds@taitradio.com> wrote:
>
> On 9/04/19 9:04 AM, Burton, Ross wrote:
>
> On Mon, 8 Apr 2019 at 21:56, Douglas Royds <douglas.royds@taitradio.com> wrote:
>
>  python() {
>      generator = d.getVar("OECMAKE_GENERATOR")
> -    if generator == "Unix Makefiles":
> -        args = "-G 'Unix Makefiles' -DCMAKE_MAKE_PROGRAM=" + d.getVar("MAKE")
> +    if "Unix Makefiles" in generator:
> +        args = "-G '" + generator +  "' -DCMAKE_MAKE_PROGRAM=" + d.getVar("MAKE")
>
> So are there other generators such as "Unix Makefiles - Something
> Else" that needs to trigger this code path?  A real world example
> would be useful.
>
>      else:
>          bb.fatal("Unknown CMake Generator %s" % generator)
>
> Because obviously at this point, arbitrary generators are very much
> not supported yet.
>
> Ross
>
>
> Here's the complete list, from cmake --help:
>
> The following generators are available on this platform:
>   Unix Makefiles               = Generates standard UNIX makefiles.
>   Ninja                        = Generates build.ninja files.
>   Watcom WMake                 = Generates Watcom WMake makefiles.
>   CodeBlocks - Ninja           = Generates CodeBlocks project files.
>   CodeBlocks - Unix Makefiles  = Generates CodeBlocks project files.
>   CodeLite - Ninja             = Generates CodeLite project files.
>   CodeLite - Unix Makefiles    = Generates CodeLite project files.
>   Sublime Text 2 - Ninja       = Generates Sublime Text 2 project files.
>   Sublime Text 2 - Unix Makefiles
>                                = Generates Sublime Text 2 project files.
>   Kate - Ninja                 = Generates Kate project files.
>   Kate - Unix Makefiles        = Generates Kate project files.
>   Eclipse CDT4 - Ninja         = Generates Eclipse CDT 4.0 project files.
>   Eclipse CDT4 - Unix Makefiles= Generates Eclipse CDT 4.0 project files.
>
> All but one of them contain one of the strings, "Unix Makefiles" or "Ninja". In each of these cases, they generate the Makefiles (or ninja files respectively), but also generate the appropriate project files, eg. .project and .cproject for Eclipse.
>
> A user can set their OECMAKE_GENERATOR to any one of these strings, except "Watcom WMake".
>
>

