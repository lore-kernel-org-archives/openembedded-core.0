Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 85BC3731C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 20:12:12 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id n7so6913634otk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 13:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=jRuz8NZxhX8M2XeiRhhHC/jS1jzj+IOAbIYoXzNKDIw=;
	b=MuxbyedOz+2DN3R9dAAHOCZxBkniaaPzElfa54iltDhSFSXfnzpikmU4B1NL7Y2GpY
	EjPFDKBwuRwYktfcYEAWW7JvqwrB3CktNQ4a9CSzMPMIO6OCUDA+ylWKMDAEqlSuxwNo
	+QXWwRdomWCO2ggeeN7XLwJZYRvxLZWseJZefboO5r1Zwi8CGDj3ze6sgsyDhK2egZoI
	FMq3VQz5rdHHz9B2pH83VcKaJVDUeE/X9dlbqc+esbaoITcpcRrIby2RtJR8Lr5pIy+o
	neQCvjrBvIGEw/rMvM7N55Iq3WgetGJOS0vfytTENK/cGIhNg5q1SMTiyYeiFNPN0N+s
	7hTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=jRuz8NZxhX8M2XeiRhhHC/jS1jzj+IOAbIYoXzNKDIw=;
	b=mEJABJyFf1VknIB1cp+EQPnO5z3U0FKDr+9qoOiatHKVTaVqGXOdgagaC/NS0AjetW
	4CH6uyQh1WF0jxvlRJrisSHzj268a4UmOhX8Fmrd2PHAzBADyD2BKjVTqM14x6jIv7um
	DfX/tul/OLomiFb3oWNWedZ4Xjm0En0k4g9QsUnGUxQ/z1sl9mhLuBBDlkO3jHOnvffZ
	wTzUiMHx6QTmg4m0HftLFb0TrC57/9Jt/A3uC4by85Jm+zMKgS7H8n2z0h8khWFbNzB/
	/aRLY4eZy77uw56KGzHLWMy0+l/ImcUOxQNNT4ELTLCOJK2014pJ5ulDS6NofgbM/lu+
	k8Og==
X-Gm-Message-State: APjAAAV6hnM/PTVIxwryOljM9hKJi8Rj1Euw1wYkHSeDnffWaI91oEvB
	4o9tKTQGXkbfilvR0ixAmyz7OQ5IVvnTtw==
X-Google-Smtp-Source: APXvYqz134W4t06QIxRoJdQW/v4VZcVp5W4pc8k/vY1tz85VX6Ry6lxVPSSWnDYvnYTbDhZ9ul/n3w==
X-Received: by 2002:a05:6830:1d4e:: with SMTP id
	p14mr9229459oth.292.1567800732875; 
	Fri, 06 Sep 2019 13:12:12 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com.
	[209.85.167.172])
	by smtp.gmail.com with ESMTPSA id y6sm2306136oiy.45.2019.09.06.13.12.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 06 Sep 2019 13:12:12 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f172.google.com with SMTP id v7so6048459oib.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 13:12:11 -0700 (PDT)
X-Received: by 2002:a05:6808:48:: with SMTP id
	v8mr8086494oic.153.1567800731432; 
	Fri, 06 Sep 2019 13:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
In-Reply-To: <CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
Date: Fri, 6 Sep 2019 17:11:59 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp8Bmss=NcsPYMgCqKAoKDpPSrCKzA7Tm8FoNOM8tSejA@mail.gmail.com>
Message-ID: <CAP9ODKp8Bmss=NcsPYMgCqKAoKDpPSrCKzA7Tm8FoNOM8tSejA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Fri, 06 Sep 2019 20:12:12 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Alexander,

On Fri, Sep 6, 2019 at 4:08 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> On Fri, 6 Sep 2019 at 20:47, Fabio Berton <fabio.berton@ossystems.com.br> wrote:
>> +Subject: [PATCH] Revert "meson: Improve detection of Python when using Meson
>> + >=0.50."
>> +Organization: O.S. Systems Software LTDA.
>> +
>> +This reverts commit cb3072488cd327155206e92d1ad8eb72a23ab04e.
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +This change need to be fix upstream. As a workaround revert this
>> +commit to prevent blocking update mesa recipe.
>> +
>> +Without this we get this error:
>> +
>> +/-----------------------------------------------------------------------
>> +|meson.build:765:2: ERROR: <ExternalProgram 'python3' ->
>> +|['../build/tmp/work/cortexa9hf-neon-imx-oel-linux-gnueabi/
>> +|mesa/2_19.1.6-r0/recipe-sysroot-native/usr/bin/python3-native/python3']>
>> +|is not a valid python or it is missing setuptools
>> +\-----------------------------------------------------------------------
>
> As I had previously suggested... can you try adding 'python3' to DEPENDS of mesa, and see if that helps please? I think that would allow avoiding this patch altogether.

Why a new build dependency if this works just fine?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

