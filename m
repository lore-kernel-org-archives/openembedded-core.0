Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4B306719F7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 17:53:56 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id w50so2040385wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 May 2017 10:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fFUWjcL/3kx4PbUM5bOyBn7EW92IssnWMNoA0VK742o=;
	b=Nz3StOPvAIKSFcOpfEQfNdo4vYvD13Y4BkJPNUo6QNyRSOLAUy7mhyBCVvVzxK7JT6
	ZTjIjaOtsnjt3jfqoH7IwbZRB874ObB4u79z9VW4xazUUD1Ib7HMMZkMyTEqZ5J16gzN
	C5hZF1PV5u7ulUtibDDvw7VN6uxf9FARulaNfcBpD8UBQWguseycdQNVotG3Z8ABBzpc
	gwgATC2lYdo44ZuPPqBYMhBcMcHzJ56LoRPJ4qXVHF9Xu7HxBZfCQNKOlBIvgZATeYVv
	3PHjpSM6mryOdAlG9ViRlKj+USg5ZExPpLz0oNxz5tcaNcI1xTzNpw0qRBjvDqg3oQpx
	wRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fFUWjcL/3kx4PbUM5bOyBn7EW92IssnWMNoA0VK742o=;
	b=ootG8KQXYChauLefnuhQf1joVpnvnNcxSHt/LGyCpa4i1bZV/WrT2fkG/y0YCYquNk
	jAQ7J6Tl8Jj/kwV1DVNu3PcKQNIZ2hHbZ0F3dVolt+k7obpPvts1RyDU3x3E+lIJ9neA
	2URaL4gyHq6Vg1usgjafMup25eZY3Nc9fa7h1lJPSEgn6MKW7cmWApwbftKWR2UDqCh5
	T8ZkOR4iW6TeZq2m5sldRNlw376JnIDJTjyY2gvapwMK/YDmJ1KMJJtP87koTPPAyWAl
	c9l57j/rHByLvh6k686Pao0XL3aNX3tedHJQDU7zJWxw98tNmDzKShobvWg1aDqh3xJj
	w83g==
X-Gm-Message-State: AODbwcDMfNdWNFmffJB0qT+u09U/p7yySNJY5/4W1G+3+GFAcDhvkvI+
	vAlLnVOAKX3CggKPA01VuyHL5sAjMQ==
X-Received: by 10.80.134.208 with SMTP id 16mr1002336edu.67.1494352437922;
	Tue, 09 May 2017 10:53:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Tue, 9 May 2017 10:53:27 -0700 (PDT)
In-Reply-To: <CAJTo0LawDD1aJZG7ymjBQ0S8fxBMaQPUVwP7hQMCK4o9=+nokA@mail.gmail.com>
References: <1494236357-904-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAJTo0LawDD1aJZG7ymjBQ0S8fxBMaQPUVwP7hQMCK4o9=+nokA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 May 2017 10:53:27 -0700
Message-ID: <CAMKF1sqj5ETEr_FO68+AyoBvXw_53MR+MO_6pBcGOtLJAk9+1Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libnl: 3.2.29 -> 3.3.0
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
X-List-Received-Date: Tue, 09 May 2017 17:53:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 9, 2017 at 6:18 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 May 2017 at 10:39, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
>>
>> 1) Upgrade libnl from 3.2.29 to 3.3.0.
>> 2) Delete patch "fix-pktloc_syntax_h-race.patch", since it is integrated
>> upstream.
>
>
> Breaks under musl:
>
> In file included from ../libnl-3.3.0/include/linux-private/linux/ipv6.h:5:0,
>                  from ../libnl-3.3.0/include/netlink-private/netlink.h:54,
>                  from ../libnl-3.3.0/lib/nl.c:28:
> ../libnl-3.3.0/include/linux-private/linux/in6.h:32:8: error: redefinition
> of 'struct in6_addr'
>  struct in6_addr {
>         ^~~~~~~~
>
> In file included from
> TOPDIR/tmp/work/i586-poky-linux-musl/libnl/1_3.3.0-r0/recipe-sysroot/usr/include/arpa/inet.h:9:0,
>                  from ../libnl-3.3.0/include/netlink-private/netlink.h:32,
>                  from ../libnl-3.3.0/lib/nl.c:28:
> TOPDIR/tmp/work/i586-poky-linux-musl/libnl/1_3.3.0-r0/recipe-sysroot/usr/include/netinet/in.h:23:8:
> note: originally defined here
>  struct in6_addr {
>         ^~~~~~~~
>

you can cook a fix based on
https://lists.01.org/pipermail/connman/2016-August/020853.html

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

