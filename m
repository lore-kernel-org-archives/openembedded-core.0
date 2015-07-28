Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id ED114761D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 13:08:40 +0000 (UTC)
Received: by qged69 with SMTP id d69so73912065qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 06:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=poJc6Xh6BYqjRbhRUbV5C+QFMy54LRxKIIJ3Z/4mZTo=;
	b=Rfcs5zmmkB/XsL8oN01oK1EOwBJcoJ1Q4Em1AGbVLQOVPo9DRQSeRU0fczRJPEAdmC
	GVqYw/rthk1xUGtR+Bppn59mWnfwjAMi0RzkISZp+OcXQOIdUQKRBb3XsHwGF0C1cArr
	TLvh+rOggEaQQxYeLFZFSFRVld32XNDnDYRMwPurGSnXTTBZ6WPzQ1r+vA89dN2KsOZ7
	D0v2WYTZlP9ZYqoT0jqUDyIRaBdTQ8zLmG0xbLHN8k+eJy5PFMRL19+UVhlKuHdD2KSP
	SlgMrr5zPVJqeIKuW0JHXi63bLF3QwpFrGphj8sDgQxfTNalLkxumF8MOS9jvJZQUFl6
	UWQQ==
X-Gm-Message-State: ALoCoQm/W1MIFVZNjpO3JmSwW+HTdKqRV79BT34SDBWm6WUL6KrZ3U1OnA/2muLF9g6Ft0mMG7Hc
X-Received: by 10.140.235.19 with SMTP id g19mr51494209qhc.52.1438088919569;
	Tue, 28 Jul 2015 06:08:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Tue, 28 Jul 2015 06:08:20 -0700 (PDT)
In-Reply-To: <edf889b1140dcb63168fe1c0dd2368ea3d6d1875.1438049511.git.liezhi.yang@windriver.com>
References: <cover.1438049511.git.liezhi.yang@windriver.com>
	<edf889b1140dcb63168fe1c0dd2368ea3d6d1875.1438049511.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Jul 2015 14:08:20 +0100
Message-ID: <CAJTo0Lbz+MGPLHZCc4jphi3os9Nk8RvUpnonBThxpz0tR3btKw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] file: 5.23 -> 5.24
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
X-List-Received-Date: Tue, 28 Jul 2015 13:08:41 -0000
Content-Type: multipart/alternative; boundary=001a11376dac34f4ea051bef2bc9

--001a11376dac34f4ea051bef2bc9
Content-Type: text/plain; charset=UTF-8

On 28 July 2015 at 03:12, Robert Yang <liezhi.yang@windriver.com> wrote:

> * Use git repo rather than tarball since the original SRC_URI is not
>   stable, it is not reachable sometimes.
>

Personally speaking I see this as a recipe for a release of file which just
happens to use git to fetch the tarball (and presumably that hash is the
5.24 tag).  In situations like this I prefer to see the recipe called
file_5.24.bb as there's no point having a giant PV including git SHAs when
it's just the release.

Ross

--001a11376dac34f4ea051bef2bc9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 July 2015 at 03:12, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4f" clas=
s=3D"a3s" style=3D"overflow:hidden">* Use git repo rather than tarball sinc=
e the original SRC_URI is not<br>
=C2=A0 stable, it is not reachable sometimes.</div></blockquote></div><br>P=
ersonally speaking I see this as a recipe for a release of file which just =
happens to use git to fetch the tarball (and presumably that hash is the 5.=
24 tag).=C2=A0 In situations like this I prefer to see the recipe called <a=
 href=3D"http://file_5.24.bb">file_5.24.bb</a> as there&#39;s no point havi=
ng a giant PV including git SHAs when it&#39;s just the release.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11376dac34f4ea051bef2bc9--
