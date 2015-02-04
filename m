Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6B22D60169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 21:42:59 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id p6so3599045qcv.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Feb 2015 13:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vzcs5HRWazeWvK/95U1iSs0IeZVd/fhg89NxI0j1khs=;
	b=VBehcJEJNhBuVua4u1PQaSzsRm51nCruhmt8jFW52u4nSS4bDBbZXaLM8qf4TesnSQ
	l5UiiXLHm3uvaOe3eb+mEtICr/XHOZN0NFHQKtl/GOILl4tKJ26+Vtnj7K4jE/yacD/F
	S1cXWYlG7iJIOwQVaDM1esS2ad+mWHHqAHmo59UuvMFWXLfq96nr8lpQzBm+r14u+wQy
	9NEhC3b/n+cJPvq+m4S5USnKGyk7sPEepmz6qUefNa1e5a9OcktfEDfjiL+fa/QqBKAu
	9lszcPD3OxcP33pZ1XMRlgmjZfjTnDHEdqSZ+PE00EIHlH23dGQfrRZ5SLuo4RamfEi9
	9eKw==
X-Gm-Message-State: ALoCoQlnWacREi6HanFxjFE6fY8uE/ELRqQg6ArfDjUrtMmcVZlKrn2ZjZJTo87B0ez+LZPMrI0b
X-Received: by 10.229.190.65 with SMTP id dh1mr1107353qcb.28.1423086181037;
	Wed, 04 Feb 2015 13:43:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 4 Feb 2015 13:42:40 -0800 (PST)
In-Reply-To: <1423066153-24933-1-git-send-email-danismostlikely@gmail.com>
References: <1423066153-24933-1-git-send-email-danismostlikely@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Feb 2015 21:42:40 +0000
Message-ID: <CAJTo0LaVxK8+SY7=o-wsNQZazWZcatdbYbD1a=TTqCd4p9=esQ@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] terminal.py: add tmux new window option
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
X-List-Received-Date: Wed, 04 Feb 2015 21:43:01 -0000
Content-Type: multipart/alternative; boundary=001a11339bec4e9527050e4a1216

--001a11339bec4e9527050e4a1216
Content-Type: text/plain; charset=UTF-8

On 4 February 2015 at 16:09, Dan McGregor <danismostlikely@gmail.com> wrote:

> Add a new terminal type that makes a new window in the running tmux
> session instead of splitting the window. 80x25 is not enough to run
> menuconfig inside a split window, so add the option to create a new
> window instead.
>

Is there an argument for just using a new window always, splitting seems a
bit weird to me.  My terminals are the size I like them to be, and having
have a terminal just for devshell seems lame.

(occasional tmux user but never beyond simply leaving jobs running)

Ross

--001a11339bec4e9527050e4a1216
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 February 2015 at 16:09, Dan McGregor <span dir=3D"ltr">&lt;<a href=3D"=
mailto:danismostlikely@gmail.com" target=3D"_blank">danismostlikely@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ks"=
 class=3D"a3s" style=3D"overflow:hidden">Add a new terminal type that makes=
 a new window in the running tmux<br>
session instead of splitting the window. 80x25 is not enough to run<br>
menuconfig inside a split window, so add the option to create a new<br>
window instead.</div></blockquote></div><br>Is there an argument for just u=
sing a new window always, splitting seems a bit weird to me.=C2=A0 My termi=
nals are the size I like them to be, and having have a terminal just for de=
vshell seems lame.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">(occasional tmux user but never beyond simply leaving jobs run=
ning)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--001a11339bec4e9527050e4a1216--
