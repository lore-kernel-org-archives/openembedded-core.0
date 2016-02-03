Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id BC5BC7739A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:52:27 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id mw1so45123480igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 12:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YznL3qmN866CvadeAp4GdSDAf6pp7wNe4GDjcWLYVgg=;
	b=Gih/UOfJi9WKzUQYYMUvUYPyufY76VY/KZshseBQQD3XEinO+cDBzxD+80Ro9g9aJu
	zLZtik4rfRbelo6k5sN9z/JSbYltZwOvk1EwuDrjiQFFHO3Hjkzm1yEJ5Ip9MqOahey0
	dCQVaj94OxlxEydMxCSuAbsCW2pEkCzns5pCV/T5bBeXwCc3dgmcmoJcrzFpqYbokrpo
	D383XyrVOz6omfRS+PbyVRlZcLGT4S2AMvz4b2bMsJ7P1lw9n9yMWtLWezWqAXy5IL21
	G/1XUWza6xQgG2dwi9QiL4GaSrx8oMn6fnntamzUFLV7zCgWsNuSVnsw4tnUvrzMemQ8
	mXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YznL3qmN866CvadeAp4GdSDAf6pp7wNe4GDjcWLYVgg=;
	b=lpil22LWU0XL9h+NMdmuRec4aL8fclx6ZjwZxPHWsi5WfU+gp6nHN1vRx25xCMhInw
	slqHnJh1TcpjbCdvSOaFJHJAsDFMZB3sfleYSbgM7JftpVMP1zn1egPeAeWEKfP6xnTs
	eVntupBbtiuIjLxtJ2AHLtK5zpYYVW6/+7sV+PqXe5+57B3FBy0/cQr9ICNXdnov3uCZ
	4FJ51Fq/12GZPd2dog+HMMYCavmqSo7cQx6YTMwUonf8wPH7qdFYZ+rFwjYcWVE7NOHB
	WFhHngBCzl+3ZM35p9JknBARIP7G0NI3sR0ijGN/S0/5ZGmpHQm+SCjuhJovktY1MDG2
	rnVA==
X-Gm-Message-State: AG10YOT5O+enWGILZfYxdFddSMQB9F/lfvuJYM6CQFdc0c7JHw11b3v+2BaYXFHko0llI6BUNLBZpFc3uBCRYg==
X-Received: by 10.50.79.196 with SMTP id l4mr5807713igx.11.1454532748690; Wed,
	03 Feb 2016 12:52:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Wed, 3 Feb 2016 12:51:59 -0800 (PST)
In-Reply-To: <1454532510.7421.54.camel@pbcl.net>
References: <56B0AE88.3090103@siemens.com> <1454446338.7421.45.camel@pbcl.net>
	<46DD8494-2C7E-44B8-8793-12228FD56738@gmail.com>
	<1454532510.7421.54.camel@pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Feb 2016 12:51:59 -0800
Message-ID: <CAMKF1sqevO99mD2V1xxZEa7--LX9vctuFebLc59fOej3xnjkhA@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Default value for FULL_OPTIMIZATION
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
X-List-Received-Date: Wed, 03 Feb 2016 20:52:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 3, 2016 at 12:48 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2016-02-02 at 22:17 -0800, Khem Raj wrote:
>> -pipe does speed up build time so its an optimization.
>
> How much does it really speed it up by?  I seem to recall the effect was
> fairly negligible, but maybe I am remembering that wrong.

it does not create files for intermediate objects so if you have slow
media it can be significant
but if you have SSDs then it might be diminished.

>
> p.
>
>

