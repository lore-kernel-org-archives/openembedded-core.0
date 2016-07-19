Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id F0B2860746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 07:37:53 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id u186so86381484ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 00:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZUSDq+fU4NyQ7XO0t8b8iTEy2wNRGq9w0TviJueCZTM=;
	b=E25Cd5tYHqGj7fYlAxj0lj+JIjR0Dj4w7iYy2anHm/l64XfmOYIfTkaxkGvfcPw7QD
	XJSHLIYfEn0B9MUhOJbzBM/rBY4F9EZfdFXTlRqYYRY7VqwnSHWZy2btb9qQdt32/fpz
	ybbTWN3cWnzH6PFDlXsrorVNbLjuEzN13yLacRXFr+EChrJUfWchEpm82xxd71wxpOS3
	AB03fC7xtZLqiHxwR8pWMkJoPfVfJgfpbcgodICNH1Hy64ZeN8WxEqa0SyfN1BMd1x/m
	r8WC7xozGPUjd5pO4MLc4Zp2mj9S5MWjFwWYwb8t8kBFmdX4MfzP5XL27t7aCVEQlUJ6
	OKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZUSDq+fU4NyQ7XO0t8b8iTEy2wNRGq9w0TviJueCZTM=;
	b=hAuqahruWEUXuO8hMXd0tqaMV8rGaBG2pdagRtfP+eGK6xZSED1NSQM4EybhY+woM+
	6WkWws6CFv6bdT/jjd2clcPAhOXh28p6zrUmorLY1WVyvCov+7BIGKNic4hsj6fSHnQO
	JGmx7rnmjcrQRt6ktFHlZBZW42FF4mwMnz9TB1eSlnGOhsOWm64nf0eGUADzukZmx55G
	3bnJMnbMANxITpPR7CGBZPsTqAxIKFlDEOTkbmF3r6oJtsC6hKsLak00KjIQEWH6EmZD
	qjaS6hWILyr2VUSxRk2YDAp2PExVq8xqMdikG992mexj6MJcF/Zdi6L9IXeYa5ytrG68
	GdrQ==
X-Gm-Message-State: ALyK8tJnKdl/Jp4a36iAnOkYah3QIvMvWUcCewswaEJqv9lHSnyt7yfSZIyQTnSzjwSSZW8DHRZ4lnfLYp6hfb78
X-Received: by 10.36.87.140 with SMTP id u134mr1005611ita.38.1468913874238;
	Tue, 19 Jul 2016 00:37:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 19 Jul 2016 00:37:34 -0700 (PDT)
In-Reply-To: <CADkTA4OMij4vsjGfw9Vwjh3ymGYkJDUsAKou6=hU7f0Yt05FXA@mail.gmail.com>
References: <CAJTo0LYNjoPfahXjaKEVP6ey=mY3MKDKK5DoCPB9Dp151UgFpw@mail.gmail.com>
	<1468880306.2228.69.camel@pbcl.net>
	<CADkTA4OMij4vsjGfw9Vwjh3ymGYkJDUsAKou6=hU7f0Yt05FXA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Jul 2016 08:37:34 +0100
Message-ID: <CAJTo0La3a32dQXSKZVCZCzFjX-C-kHYgHd5cAVfqDUxvz0JaHw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Removal of uclibc from oe-core?
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
X-List-Received-Date: Tue, 19 Jul 2016 07:37:55 -0000
Content-Type: multipart/alternative; boundary=001a1135018cae17e20537f82945

--001a1135018cae17e20537f82945
Content-Type: text/plain; charset=UTF-8

On 18 July 2016 at 23:48, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> But do we need a sharpened stake to make sure it doesn't come back ?
>

I was hoping for agreement but wasn't expecting such a strong reaction :)

I'll sent this patch shortly.

Ross

--001a1135018cae17e20537f82945
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 July 2016 at 23:48, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>But do we need=
 a sharpened stake to make sure it doesn&#39;t come back ?</div><div></div>=
</blockquote></div><br>I was hoping for agreement but wasn&#39;t expecting =
such a strong reaction :)</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">I&#39;ll sent this patch shortly.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135018cae17e20537f82945--
