Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 255EE789D8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 14:57:49 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id i15-v6so12284840lfc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 07:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hlGWR34eCSMPscIRr1vYg2fJsLG4P92GH/c45hevc0w=;
	b=vXZtDfZm0z86PpKpKh7WHeNK0XIuZE6ioEeZFVFxOl28KRpzF6J6/c2dv6otlE322t
	IxqIYH5BF6Ko6aWEoj2zd7RCv84jw3xioTpWBhkA3bBU2TQf/FOaKE9TJgA7Gng6wGKy
	3Wcw7cOC2mvUDfvW+dGXrMXi7nHYkMTGqzPHzCscqrZHt2+u9K9pDnThwWGwfhvacmda
	ppknPou6OgRtxCfTcff219Tw87PcXg4sjnCwlR349glINB54JoESLz0vdDmaWsvL3FVB
	LyXjw4thvDpEfzzYc3x89OVZFhlzjGeIhqMGRn/XUfYnTW3GQJhb3zv57tDBzYt/m3uJ
	WSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hlGWR34eCSMPscIRr1vYg2fJsLG4P92GH/c45hevc0w=;
	b=Iom4fQwBDbdAarb8ymgC5YLMl1B+6WZsatSDEdTt35GcJlD8Q4grRy+xYaxca/iyTk
	SC39QD31eroqPhxxTpODsHZ53PMAvBWwlbP9LJAKYO5smkLGRUp4ui8dZDNwrmiXeivs
	sZTLMjUIY/kLUwFgRVLqHkr8Xf+zkC1VQWGd+1XuPnWmKpTX1Quz3wdfqUY4cf4GEs4G
	X+6IpuqS8Ian2bSIkVScUaLFHRjc4mBlyG2FF7lljBCK/sA3B+aK1u/U7EJrbGwAGbKr
	duf81Q4VxrLD+eGwAnoUHUUzRSX78neLWXC4lfe76aEi+t0tcdcC7Z7PDmUXkQnUSZOj
	MEbQ==
X-Gm-Message-State: APt69E11rFJqB+e4EZqe3jctwFZ9cRbeIZi6BzH9svwefziQe/6ARjrx
	B1E0DkUEKRxu4dbI2tOh48u3yEkGez7Y7XHyycU=
X-Google-Smtp-Source: AAOMgpfFYnsfoUOOubGIOcFD1evdD+D6RB34cxcOJOMrVyQFWlP62MISWAjI0zebR3jd1xEe5MkH4mDhBEeaEY0ioXk=
X-Received: by 2002:a19:921a:: with SMTP id
	u26-v6mr16023889lfd.89.1530543469683; 
	Mon, 02 Jul 2018 07:57:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP;
	Mon, 2 Jul 2018 07:57:49 -0700 (PDT)
In-Reply-To: <CAJTo0LaC=TNwr-eRfHBrV_u6kC1WkJ-AbVS7=-DQg0OrgAfyEg@mail.gmail.com>
References: <20180625175043.25267-1-jon.szymaniak.foss@gmail.com>
	<CADkTA4P881jar5PygYaY+i4VD_rXYsXOOhU3eZDLWGDn4xRcCA@mail.gmail.com>
	<CANge7vXk5XKAwmZEtfww0F0tUvOUyiE=sR3OsJoRZX3P-3kf=A@mail.gmail.com>
	<CANge7vVSu888hL05s9q07xxZmx1yzxHYD_sRvV8N5YsXsMTQXQ@mail.gmail.com>
	<CAJTo0LamQQmTSJTXuPgQmd4MbK4GBrtBD+L0Opg-X4RJCyKcVg@mail.gmail.com>
	<CANge7vXsQa9n7A8+W11vXwiz=_b2ndVKs2pp660TjjSN96F6Lg@mail.gmail.com>
	<CAJTo0LaC=TNwr-eRfHBrV_u6kC1WkJ-AbVS7=-DQg0OrgAfyEg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 2 Jul 2018 10:57:49 -0400
Message-ID: <CADkTA4Nk_QYv+=WVOXp775RnuTpJm0HN8vt+Mu7Z5agHPOnNZw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Jon Szymaniak <jon.szymaniak@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Use capstone version included via git submodule
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
X-List-Received-Date: Mon, 02 Jul 2018 14:57:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 2, 2018 at 9:18 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 2 July 2018 at 00:18, Jon Szymaniak <jon.szymaniak@gmail.com> wrote:
>> Alternatively, if the capstone dissembler only provides value when
>> debugging qemu itself (as opposed to regular OE/Yocto use-cases),
>> should we just use "--disable-capstone" ?
>
> If that's true, then yes.

agreed.

Bruce

>
> Ross



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

