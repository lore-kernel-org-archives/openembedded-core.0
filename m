Return-Path: <andrei@gherzan.ro>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3C7D27829F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 17:02:03 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id p14so2415774wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 10:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4qt69jOZ+saRPVdzSrPpMq2iZjHqk2R+Dvol7PUy7i0=;
	b=Fvl+CjgWkQxGrN2IrDEYuA8Fjqn8ocxKVyE55z0wYb8f0Nxk0LUWZcckzvjtaQPQ/b
	ZnGjb6W6jaAkqsQPKXJYqRPg8FkA4qGPMcOhR/YqgoIoERklcMLtogf9a4CF6KqtwAT8
	PtFigQRzTQ1ibgFCeTGSnGXaCamsXIvPmoKIhk7FaYiTnAlBjlixSCW2SZv0unpCqDtD
	bo5LxgAF1mHC7tKkMGkCfwoUiS81Z6aBR0GBxUK8tI+3X1lksOkxHVx673ZP4sqkHtPS
	cJsqF933zTOlCdo4n8ikXvqWoBNbWxBVUw1WgouYnunolJCwr+V5Z/XmdpjH72bqDF3p
	9MVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4qt69jOZ+saRPVdzSrPpMq2iZjHqk2R+Dvol7PUy7i0=;
	b=BSnsrN8qFhHltgpBVqRBqGi8O0kvxwPRp0NPOmXFVuYYFI15IrZQZdi6QoCC4La0Hn
	e3Re3+/3edMTNvFcI4rgUmDOuoU/fJkwr3/rNToN1L0gGBC5avls0kxg4R2cOVwdjAeC
	WJwl2qyNndVy6UyCs/SOS7O+4oOiZ/nlkRVRzp+LKriaSWi3Me+ilYfqr4MOy8foek5G
	C+5O9uJd+OyeY7/XzQXMSUN+tA4Xs9usIRlQZt7c8jiSkgKLxgS1UBfrlnmh4RVRjq4c
	FT2nOsZCiNwrY6QDZ2xrD50tMKasBwT4gcYhtb3BQo8bpRIysyogesNzguBxWyKuvaWl
	UjzA==
X-Gm-Message-State: AHYfb5hZoU+bcDbfZhwheuJWJ0KuwfdHvDOnDwaVj/FBzikXm+cD/u0E
	zJTBS8gGZKbzANeWQ8BfjvfH5uCMq7fZ
X-Received: by 10.223.169.109 with SMTP id u100mr2002245wrc.179.1503507724644; 
	Wed, 23 Aug 2017 10:02:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.45.195 with HTTP; Wed, 23 Aug 2017 10:01:23 -0700 (PDT)
X-Originating-IP: [82.22.166.118]
In-Reply-To: <9530249c-064a-8489-d8b5-f9687fa5c2a3@windriver.com>
References: <CAK18fxG23fiaTMk86hQUYZVbRZApZMtM3StvuM5QefmCEHdw-g@mail.gmail.com>
	<CAK18fxEj3ZLHzBAh5FgEKq8P9=QPr8MNBO6r4fri47nZZCeVbg@mail.gmail.com>
	<9530249c-064a-8489-d8b5-f9687fa5c2a3@windriver.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 23 Aug 2017 18:01:23 +0100
Message-ID: <CAK18fxF-6W_4vnw10PoSuEhKgER10qO+f25iqLZq0PAkUFdEDQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: kernel-yocto class requires BSP definition now
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
X-List-Received-Date: Wed, 23 Aug 2017 17:02:04 -0000
Content-Type: multipart/alternative; boundary="f403045cef4cd86e7a05576eabf5"

--f403045cef4cd86e7a05576eabf5
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 5:54 PM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> Already discussed with Khem and Richard in the original
> thread.
>
> I'm sending another patch shortly to back this off to a note/warning.
>
>
That is nice but wouldn't that clutter the build logs for no reason? For
people who don't take advantage of scc definitions that is. Could you point
me to the initial discussion? Just want to understand and maybe vote to
remove it altogether.

--f403045cef4cd86e7a05576eabf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Aug 23, 2017 at 5:54 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Alread=
y discussed with Khem and Richard in the original<br>
thread.<br>
<br>
I&#39;m sending another patch shortly to back this off to a note/warning.<b=
r>
<br></blockquote><div><br></div><div>That is nice but wouldn&#39;t that clu=
tter the build logs for no reason? For people who don&#39;t take advantage =
of scc definitions that is. Could you point me to the initial discussion? J=
ust want to understand and maybe vote to remove it altogether.=C2=A0</div><=
/div></div></div>

--f403045cef4cd86e7a05576eabf5--
