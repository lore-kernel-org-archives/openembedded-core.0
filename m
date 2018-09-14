Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED5279933
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 13:06:52 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id p84-v6so12751397oic.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 06:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hIKpjW29ik0x3JFx7bJSgn760C7jpzWbukFkW5W0miI=;
	b=JDDnecxUX7hAQnm9hSLoT7iAf0poD0pbBlfkCKUZ/IGrICfa6uefXh67077GQiJmCY
	wmFXReUKGcgVxBZklB+x0towWyV+qlE7rYKosTUWd9ve7yeYrvvqfqraasGFxUr5fvhQ
	psvFkEqw/ixeAbey6RyqZMYLs/O603H0gseiaCKXLABa0VxYwLe8AGM0ZxTJAyd/HUIQ
	8ea/tnL1Fnq9csHPTRjOYGLxzTBwFTJZ7llYxetQwJ/n/DHcDXpLOtXA54ysdRxMGJZt
	yq9JbNEUs/x9N3Smm53vepy0H1lkcB9sY2EvVSpBUai0E7brAR97ZjZCEWh4Wba2id3c
	ybsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hIKpjW29ik0x3JFx7bJSgn760C7jpzWbukFkW5W0miI=;
	b=Z6pRNrOR30t7Telm6aSCieJ0roeG+qg5p/BZpcvfJ9XSJF6DT/GRJ1R+uQk5R85bKP
	JpB0XdghpK1YDAxOj8ekQHCi+cMIrmlZlrY+XYTvagNXay5MzVhRzRDtfHm4PXywBQ+X
	IpdM9Bt4o1MrdPStI4204N1uchurxMI2uQNsUFaYfNuUEYUfX4BTghBJeW9PZ/9Gc+4r
	ZmeY6CxWVteQBFBNEQ6hXC4RdVnZoo0p2Ds47TVGlz/yLudQbVmlxIVdsB8RKxCHQ/Cc
	N53yHS8w538wdr3ivR0/jlSsuOV9WNuCp+ETYeYnmFfKl07h9f6ozR7yj20e/lTgypMG
	GaRA==
X-Gm-Message-State: APzg51Bm1HO/bjEXvpq1umj4GElwHRw4ONAspmIxuoJwuS24WZEPQxni
	k/ICRNekuLV0KIQDVdZjCHwCsd7YDDVYkLjvXx5hwg==
X-Google-Smtp-Source: ANB0VdYpNCC9YRuKsTt7lpC9ikRaHisU5VXN4H8twSxLrua0OsUpjt7ZRbBVa9c5Ass4xLVSI4KjXQultiGQOdEv5ro=
X-Received: by 2002:aca:a04:: with SMTP id 4-v6mr9806977oik.203.1536930413122; 
	Fri, 14 Sep 2018 06:06:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Fri, 14 Sep 2018 06:06:32 -0700 (PDT)
In-Reply-To: <CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
References: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
	<CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
	<CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Sep 2018 14:06:32 +0100
Message-ID: <CAJTo0LYBrnBuL-jTw6cDXf6qztp8H5YpphBgsrrUyUuaQ-KoyA@mail.gmail.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Fri, 14 Sep 2018 13:06:52 -0000
Content-Type: text/plain; charset="UTF-8"

On 14 September 2018 at 00:49, Burton, Ross <ross.burton@intel.com> wrote:
> On 14 September 2018 at 00:30, Burton, Ross <ross.burton@intel.com> wrote:
>> I suspect simply adding python3.5/*/test/ will catch the bulk of this
>> now and in the future.
>
> Gave this a go and annoyingly the manifest generation must sort the
> list because the glob works for everything apart from packages after
> tests alphabetically, so the tkinter and unittest tests don't get
> moved.
>
> I guess we could change the manifest to put the tests package at the
> top of the list, and be sure to respect the order when generating the
> lists.

So I went and did this.

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/manifest

Does anyone have a problem with this?  Basically all the test code is
merged into python3-test, including the previously separate
sqlite3-test.

Ross

