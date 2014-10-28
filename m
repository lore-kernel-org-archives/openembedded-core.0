Return-Path: <paul.betafive@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9E70C601A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 23:34:35 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id w8so1297133qac.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 16:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=8hekQ2uvsRKzjnhUma+sMyQ8TvM4cMiuwt5gEcOn+X8=;
	b=otOA1IwASUFpYkPEhqlcBJCQH2O+7qUHSRlAaaRpAEt+RMjVqnNRhtSQwvlbqFwF2d
	i9Hh2TW5fDdT7tMyzqpLQWZz5xPrG9WsHsXewH5tyz4fAP5DUcq38JvAdJqrPjodP8XF
	XkvFHAq91XkN6D6aouzUUXZRSUy8o27IivReITXcDWpPl8AVMuhFcCEN3Qjzj+nHYNFn
	EV80ctD1mRIZOTSiuURzckkN8ePD3eophYtqirfQarq1yZRzfUtQo76uTvfVEds7BvaG
	blqwo7GB4zCInATbJmBrNOLKX0SevzRkTSMEJ3/vwJh6oBpOGV61jW+KyfVYJaN3FxkQ
	D4Vw==
X-Received: by 10.224.61.7 with SMTP id r7mr10341132qah.9.1414539275798; Tue,
	28 Oct 2014 16:34:35 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Tue, 28 Oct 2014 16:33:55 -0700 (PDT)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 28 Oct 2014 23:33:55 +0000
X-Google-Sender-Auth: 9HV7X4RsARQMYwu6MD-NDWrqVFo
Message-ID: <CANyK_8cFPyXs2R5+x3AiMNnPW4Q6hWnNdsjTHrf50M4F6VGJQQ@mail.gmail.com>
To: Yocto discussion list <yocto@yoctoproject.org>, 
	OE Core <openembedded-core@lists.openembedded.org>
Subject: opkg Status Update
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
X-List-Received-Date: Tue, 28 Oct 2014 23:34:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

This is fairly relevant to OpenEmbedded so I'd like to give you all a heads up.

I'll be releasing opkg v0.2.4 in around 2 weeks and will be following
that with v0.3.0 in the next month or two. The v0.3.0 release will
incorporate some useful features, including cache improvements and
package file extraction improvements. A dependency will be added on
libarchive which will replace the crufty manual handling of tar and
gzip formats which used to be in opkg. Due to these changes, I'd
definitely like to get this tested before the v0.3.0 release and so
I'll be tagging release candidates. If anyone would like to help with
testing please let me know! I have a meta-opkg layer
(https://bitbucket.org/opkg/meta-opkg) which makes it really easy to
test opkg release candidates and git commits in OpenEmbedded, it even
has a readme file with instructions.

Also, my circumstances are changing over the next few months. I've
come to the end of the 'active' part of my PhD research and I'm now
writing up my thesis part-time. I'm also starting full time employment
in January. This will make for a pretty busy schedule and I don't know
until I settle into the new routine how much free time I'll have to
work on opkg. This would be a great time for someone to step up and
help move things forward to v0.4.0 and beyond. I'll still be involved
in opkg development and I'm happy to continue my role as maintainer,
but I just want to make it clear that my time will be limited and any
help with development, patch review and bug triage would be much
appreciated!

Many thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

