Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id D185860851
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 08:19:27 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id x201so257649833oif.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 01:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YJKXen0hLwrZz28dHj95bzyRnJQfPK/V10JgXoxUMco=;
	b=bcxPd5WDE2xxCIaHowNwgwRitj5KjPEWVmvUqA8PAFc5+2ZPWyDyvfpzjAs1zsHndn
	iDD2JGI7F67WKVhUOiiX4rJQIMKhEomlTrqkXRIWKX2temhYBhfU4/NHz0hfr/jWCcfK
	G5NB1asBTGSE9w8qQvWGcVpv6vYQYwNWDl4RFPx0Q2wmpwbbvzDtO/pIaUWoCuC0QdTN
	LSdm8o3D4gn4pWVUQG3h76ol/G8O48Xa4YJBahm/8cDVzQ7OAVorD6Nv/h3W1z6sr1nO
	A0YoWMGnj6SrSJE4R/8MT8SVjIMuaHXynMJ9gzWOcGLH2TSmBK2mwvG7Y7wpl73Iz+0I
	pONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YJKXen0hLwrZz28dHj95bzyRnJQfPK/V10JgXoxUMco=;
	b=FpKjyqsio7APpab7toyaxHXM6JVoZEIW1D4pJPnfTXPNLl4tV3UIw+phWzfP6tIUq+
	W4POAikxIuw/4nw6vp2WvGknhr2M/IdV5ZOo6BxFewWXl80bApJTI6yQWmIgmsjO2oiG
	egyPlR7RX9OEnh6HfBrBnexHPyyhDV05Yg4CRQ2c1xRsgk2+8GWCNxa669QtlHbL48VM
	t3+L6KsMQOqU1bg9km/98KL2nHJvDQlMHi9wPbYmLAx0nffkfPV0Sx5VeMuVVq+nTw1B
	yIa7lWo7uIZW7Hsd14GvClFw8sNzaMGm1XpNjs75w7DDU6Tu9/s9O627TM6lxz+qPw+n
	6Q0w==
X-Gm-Message-State: AOPr4FU+Uq7w6XpyoXzo1v59Mkc86NHjbAqzFwHFgzPSQ/yjiH4ZdtCfJPPgNYDZGWQQT/S2iXDI3z57JL7FUAET
X-Received: by 10.202.206.141 with SMTP id e135mr16770906oig.173.1463386768031;
	Mon, 16 May 2016 01:19:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Mon, 16 May 2016 01:18:58 -0700 (PDT)
In-Reply-To: <CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 16 May 2016 11:18:58 +0300
Message-ID: <CAHiDW_FQJuwT=JPtvCMPM3bcQozTqyEDFq8LjziNe=NHT+HPMw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Mon, 16 May 2016 08:19:30 -0000
Content-Type: text/plain; charset=UTF-8

On 13 May 2016 at 23:15, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Thu, May 12, 2016 at 4:20 AM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
>> Support for multiple new protocols, many new features:
>> https://lists.freedesktop.org/archives/wayland-devel/2016-February/027039.html
>>
>> Weston now depends on wayland-protocols (which is protocol
>> collection split off from weston).
>>
>> Remove upstreamed patches, add a patch to fix the wayland-protocols
>> path used during build.
>>
>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>
> I am working on rework the weston recipes and it seems Weston 1.11 is
> close of release. I think instead of adding 1.10 we could use 1.10.91
> and upgrade it to 1.11.0 when it is out (end of May). This avoids
> another cycle of rebase of patches during 2.2 development cycle.
>
> What do you think?

I don't have a burning need to get 1.10 in at all (I almost didn't
send these in the first place because of 1.11 being just two weeks
away). If you'd rather avoid the churn I'm fine with doing other
things and looking at this again after 1.11 release. I'm also totally
happy to keep my paws off this completely if your rework is going to
include the 1.9 -> 1.11 upgrade in it.

Here's my current 1.10 branch in case it's useful (the important
change is the WAYLAND_PROTOCOLS_SYSROOT_DIR hack to get multilib
working with allarch wayland-protocols):
  git://git.yoctoproject.org/poky-contrib jku/wayland-1.10
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/wayland-1.10

Just to be clear: Based on this discussion I don't currently plan to
send a V2 to list unless there's demand for it.

Thanks,
  Jussi

