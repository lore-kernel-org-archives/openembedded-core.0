Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id D2C236A467
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:25:26 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id pa12so4991587veb.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 06:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NXfT9JTEv0FaNPA3FL0NSnGHMpfKV1OYdeFuWqHvjQI=;
	b=mvO7XEnNw89mm/HH08jls9JIhp2tZjqncQzYNGScjKbobdnhtfD1N565huhFsax7cN
	JfrbEZKt38zHeiHP7R9aPby0ZzOeswc1zVt6zW/Ms7AZ5xIgsJnMecDpcwLdgjbIkHre
	0OvBRU0i24CFxqhMGfYwA79bMJWoUM07KX/zJfYih0bgwzNs2Tuaoae2JoUdxyA3WHVd
	dBJOdlfSQ1b9p7160UUdo7YSpPT72Zv7KgXgrREkd+KQdl/C/O4L97kFiZgTFa61eXCe
	9OsLj2c6jxCxcdxF1oHpnq2GQr3tAhhhjEkX71+Xzo74N6tz9KjJZ2/acXIO3U2DoOox
	p5OQ==
X-Gm-Message-State: ALoCoQleeB++sIZN4nimRfra/QMeE3XZkOE08g7EtCoOcWd685WwdxTQaykRaIbNM6hOmmMU0s61
X-Received: by 10.220.253.66 with SMTP id mz2mr16139211vcb.10.1384784728652;
	Mon, 18 Nov 2013 06:25:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 18 Nov 2013 06:25:08 -0800 (PST)
In-Reply-To: <528A0C0A.2090008@windriver.com>
References: <1384773018.6460.202.camel@ted>
	<CAJTo0LZWNbMFA1ogn2W7dvxtXh31LovO9QbYKcQsGpTR7C6KCg@mail.gmail.com>
	<528A0C0A.2090008@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Nov 2013 14:25:08 +0000
Message-ID: <CAJTo0LawvzuXTw+v3ccqJYmHWRdnDp3m-zPMFh3KJY1r+LWkag@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: DORA RFC: FILESOVERIDES in dora
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
X-List-Received-Date: Mon, 18 Nov 2013 14:25:27 -0000
Content-Type: text/plain; charset=UTF-8

On 18 November 2013 12:46, Robert Yang <liezhi.yang@windriver.com> wrote:
> I'm afraid that the problem is it doesn't work well after revert the patch,
> either, as the patch says:

Sure, but Dora's been released and tested: changing the behaviour
there in a branch means huge amounts of validation will need to be
done.  Just how long has the order been wrong?

Ross

