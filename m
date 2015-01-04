Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 11D117275B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 12:17:29 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so1734617wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Jan 2015 04:17:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=C52AXN0rQu9Yw9Lj+SxM2WCNEejQ1NsLV4iGqBUJ97w=;
	b=TQlQrmtbvkl+IzpRqKkajW1VjIAkIoGpipl+PWk08nHyAUxhkA6efoe9Wipc8xokH0
	01nh3AXgH6LdiK1QrYXO+rZUPgs8ygCJJXq5hESEyf3nY4/9DW4qmP0NlBriiBq5CdS0
	Qggah4VodzPcoiDHsqaVdO6oknNHyiUSbKEmG6zV/zJVskhsZAwU0de//8R6OmOUz8pT
	53Ko3ntJ1dH5ggXNCzPmjoyoPL4v+3LrsMLZ8b8DaPEehokc+2yrwF8DXFA0ptx36Oy9
	vQgzDPMjv+PszEtxSDmUDB57EZ9VcMYF5+ATs8k323Fmwzxc/6UONbmpkOGBEz3CQb3j
	0W/w==
X-Gm-Message-State: ALoCoQkqhJiRDCB5oqaIc1hAVFeU6URMCeQ4NJHDGd7zoz0vM4ae4cGSnicuhjuFWB4MegOtvk4k
X-Received: by 10.180.8.70 with SMTP id p6mr15837700wia.72.1420373850018;
	Sun, 04 Jan 2015 04:17:30 -0800 (PST)
Received: from ?IPv6:2001:610:612::296b:df03:b323:bf11?
	([2001:610:612:0:296b:df03:b323:bf11])
	by mx.google.com with ESMTPSA id
	ww4sm51150420wjc.47.2015.01.04.04.17.28
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Jan 2015 04:17:29 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP71WjzrFn=W8QYoDQybKyLxEpi4zL6yN8xkFZK=ze-6YZ_rLw@mail.gmail.com>
Date: Sun, 4 Jan 2015 13:17:27 +0100
Message-Id: <ADD5E5A7-ABF1-41DD-A47A-151856FA7468@dominion.thruhere.net>
References: <1419846408-31247-1-git-send-email-awais_belal@mentor.com>
	<CAP71WjzrFn=W8QYoDQybKyLxEpi4zL6yN8xkFZK=ze-6YZ_rLw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Mailer: Apple Mail (2.1993)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-omx: use mulitple SCMs to fetch submodules
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
X-List-Received-Date: Sun, 04 Jan 2015 12:17:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 29 dec. 2014, om 13:41 heeft Nicolas Dechesne =
<nicolas.dechesne@linaro.org> het volgende geschreven:
>=20
> On Mon, Dec 29, 2014 at 10:46 AM, Awais Belal <awais_belal@mentor.com> =
wrote:
>> The gstreamer omx package uses a submodule 'common' which
>> is fetched by the configure script. This approach fails
>> on non-network builds as the fetcher tries to look upstream
>> for the submodule.
>> We now use multiple SCMs, one for the main omx package and
>> the other for the 'common' submodule so it is available in
>> the downloads_dir for later use.
>>=20
>=20
> we have the same issues with all the others gstreamer1.0-*_git.bb
> recipes, don't we? maybe we should fix them all. i am not sure if
> there is a nice way to do it for all recipes, like with a .inc file,
> to avoid duplication..

Why not use the 'gitsm' fetcher, that's what it's there for after all?=

