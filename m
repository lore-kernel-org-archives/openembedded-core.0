Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id DB99F60670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:18:18 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id q21so40213986iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rbmFvsqqFC7PNChN1uEcEQ0X31jw8rr91WEjZsfQFww=;
	b=G1j//OxCfsNqHDXcd7JOxl32G6kZEC2Edgy4L+Ip1+JUAIWsXLx1FvZ4awTnBPaCfv
	N3WL6ctblWdUsKo60xXqH1pvZIkRC9zjruUXq5eUGWuL6ZzOYl9wpqupj3upvniDeseO
	DNnLRlznQ+twy3Ioedv0S1UPQjYoacdxEgEhYuZTOP3UwexbQ/N20KTG3bADF9JZmNxB
	7UNmvYK/LXO56FsiAo5hUGxda7j4Qnv0dj/OXTX+lPI3ixGz7/4InE6lZ6ZVyAAffHGJ
	QUqqadpPBd/1jzENAmNe4XyAO7sHK/huj5vOC0pSGthyR+zAD2JmJy1AHIIH0iRZQmIE
	XR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rbmFvsqqFC7PNChN1uEcEQ0X31jw8rr91WEjZsfQFww=;
	b=mlTXLTI5B9JshwAvcGdV0fLWh/fwGeIlM96z1QupxUP8ff/IWi9ura3n+GUSp+ltdZ
	Ie4DC7PrEZloOsphezzF0wYzPtuNDza79pr+lQMyGLn+3Dox7OJvYDEnV7LLYogMSA28
	2w6JKwQEAYfw81OiVSIi76ncRbYlrSa6Xm5nFhzMK9oB9mM2b+dJLvTFYXj++p8XPnTF
	YD31RQhzZuMkQp+MHgCiQ0ktnLg4jirh+4KcPYajvAvOt0137O98nFf+WBBXT+6ZaCV3
	Aa4cRVh6owvI5H6O9R15OytgEoI5GYIsstfXOHthTUAQqIGFhBPb2t8XTZKZALPIriP4
	CntA==
X-Gm-Message-State: ALoCoQn2fqZFEc7yKBnDm+OzE1Lbe1GvHo7z6ZfLyEfK/POotFCrvYKH675p/hWeo1VUPyi0bJgEEmehDwHXQWvOg0SqvXjo7A==
X-Received: by 10.107.34.79 with SMTP id i76mr40526271ioi.195.1453342699079;
	Wed, 20 Jan 2016 18:18:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Wed, 20 Jan 2016 18:17:49 -0800 (PST)
In-Reply-To: <56A03499.2080703@windriver.com>
References: <cover.1453281406.git.dengke.du@windriver.com>
	<2a8d19d4ef60a323c8770722ec7f60811ced53ca.1453281406.git.dengke.du@windriver.com>
	<1453282408.27999.143.camel@linuxfoundation.org>
	<56A03499.2080703@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jan 2016 18:17:49 -0800
Message-ID: <CAMKF1soSrq1P9ztt5_Uavc7e_jtHtR-PNzYH7PERUE3dJfgeaQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ncurses: drop the compatible option
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
X-List-Received-Date: Thu, 21 Jan 2016 02:18:21 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 20, 2016 at 5:30 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> I had talked with Dengke, we have upgraded ncurses to 6, so remove
> --with-abi-version=5 seems better. He had tested world and sdk
> build based on oe-core. He will test it based on meta-openembedded.

we need to ensure that all apps using ncurses are able to work with
new APIs if we drop compatibility.
may be have ncurses5 package still around to provide backward compatibility.

