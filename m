Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id CED4577060
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 15:55:24 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id 5so16758723igt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 07:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=OQVN+QOemLIUuNSYmgPOQEvFqq+wv3tIbTSxp4PmWgQ=;
	b=szWIbyVxcnAyf43ETJKgXIVa5omf/L4dYY+keZnXdsh5YE9dRrdGjIEwka9mhW9HkM
	71zpQBUqwilRUmyeAZwDS2+pHw5k/pdSyMWF/zyPr3T72bsrSy/4fZ36fqJDA4mw2vxo
	O9XfFFqWrpiBIVBito44NW6DZobhHkKnoKyexH9EeM8wDg4GFgrUrn22z8RPR/kRFDgO
	9B7Slqx+CSQXdNLxXAEuWQB9teL4cbUEG5nldoTsTY61AR+WidU0VbCzbtvj9pLG12cw
	TJrDAa0INEfwXQ+JuAzTOkHGki2HAxQEbf2ZwrfkWx0U+X/xcB8PfykkyRWFLVZUkuiY
	tNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OQVN+QOemLIUuNSYmgPOQEvFqq+wv3tIbTSxp4PmWgQ=;
	b=XM2XFeeulVAhnWOSHYexgutHefgCQw2SQHwxyHYs8m2bjBMgOH1U5MFBHxv86mS8QW
	SurLEFjRMB8FZy7KHO8Dg/GS5+aZqyyrb9YrGbp2C3zMbdyrfUSwEouCSQjzut1X2TRg
	RARUThPDdm5F/5v0amUXIti9wYI+B+mscdj8EXx5q2s2bT0hDGQAuHqzv/hDh55ZM33i
	/3ZpxVjwWa2X4Mf3trEflM68UMdsFd7q0TofKct3jIBK63GS0mJk2dhb/fkDv8+O9f0Y
	Bm7NOmh/PPfPhAk2Y4S6ZJvqrWWorNUj6NV5zvyCexEZgGgGuyMahGYJxJLz6pnrtGWH
	RMbw==
X-Gm-Message-State: AG10YOTUfTowRQMwr/2WiOU9jJivx1JJnZQ88x6l1v0wh80AAoppI6v7QikapxsloxTle4B+ibw6GxixARJtaKk8
X-Received: by 10.50.160.7 with SMTP id xg7mr7021258igb.64.1454687725169; Fri,
	05 Feb 2016 07:55:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 5 Feb 2016 07:55:05 -0800 (PST)
In-Reply-To: <1454627058-26663-2-git-send-email-armccurdy@gmail.com>
References: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
	<1454627058-26663-2-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Feb 2016 15:55:05 +0000
Message-ID: <CAJTo0LbvHFKywioso4iYxpGQLOYCgjZ6tHSqkSA9kQrJ595MyA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] gstreamer1.0_git: avoid including <sys/poll.h> directly
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
X-List-Received-Date: Fri, 05 Feb 2016 15:55:25 -0000
Content-Type: multipart/alternative; boundary=001a11339de81e498b052b07e1b7

--001a11339de81e498b052b07e1b7
Content-Type: text/plain; charset=UTF-8

On 4 February 2016 at 23:04, Andre McCurdy <armccurdy@gmail.com> wrote:

> musl libc generates warnings if <sys/poll.h> is included directly.
>

Are these not required for the versioned recipes?

Ross

--001a11339de81e498b052b07e1b7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 February 2016 at 23:04, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":h3c" class=3D"a=
3s" style=3D"overflow:hidden">musl libc generates warnings if &lt;sys/poll.=
h&gt; is included directly.<br></div></blockquote></div><br></div><div clas=
s=3D"gmail_extra">Are these not required for the versioned recipes?</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a11339de81e498b052b07e1b7--
