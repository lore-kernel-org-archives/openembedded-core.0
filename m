Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 18A816A9FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 13:16:20 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id n8so11256335qaq.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 05:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BkFFZlA52d9xdf89TVDKO33kOoV+gvfu1lG5kW+uDR4=;
	b=fL0fnLfh6Ab+6Bnl3hv7erplJ7o8224oOs+3toC8eOfw1uWV3eInMjbI+S4LWwKrGd
	g2xJlQ4qDU/MRu6pLwCxA0/X+Fnr2HO8+TuOmUATnwY5UurOKeR0A+53TpjC3NXahIHZ
	QS1KN+zIOHUKOBk0zI4p0nIw+52zL1g7fJL3aQdN0jH8lKnj2qLXB4n/nvgs6tbCmRxv
	UxLKC9WPfYsEQlGtR4U2069MYJq4kex9XWPpXphW+vUQQdLGtRxxVtK7xPFZGBUGl1z4
	Stg7JsLse2W/lbMNXMCrJr227fzevPxVeIBF5Ru5m7ma6giVlpd6de8KExwkcZKtuBI3
	Z87Q==
X-Gm-Message-State: ALoCoQnsL0KvI03nfPHXoavcr6Kyxjk/UW4W0H+u31I5Qf1yXwlTDrJXVDBqeIrkNOu/fYmfkNLm
X-Received: by 10.140.94.195 with SMTP id g61mr1740940qge.80.1422364580154;
	Tue, 27 Jan 2015 05:16:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 27 Jan 2015 05:15:59 -0800 (PST)
In-Reply-To: <1421391634-32189-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1421391634-32189-1-git-send-email-leimaohui@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Jan 2015 13:15:59 +0000
Message-ID: <CAJTo0LYYGZdESsXBeXVdUutdsjT-iT44jXNAjvuKb=LkGqxd_w@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2]gcc: upgrade to 4.9.2 and fix the bug #6824
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
X-List-Received-Date: Tue, 27 Jan 2015 13:16:29 -0000
Content-Type: multipart/alternative; boundary=001a113a59ee8ac526050da20ff7

--001a113a59ee8ac526050da20ff7
Content-Type: text/plain; charset=UTF-8

On 16 January 2015 at 07:00, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:

> The new patches 0060-Only-xxx and 0061-Fix-xxx aim to fix the bug in
> e500v2 as following:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63908 .
>

This doesn't apply to master anymore, can you rebase?

Cheers,
Ross

--001a113a59ee8ac526050da20ff7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 January 2015 at 07:00, Lei Maohui <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:leimaohui@cn.fujitsu.com" target=3D"_blank">leimaohui@cn.fujitsu.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3ry" cla=
ss=3D"a3s" style=3D"overflow:hidden">The new patches 0060-Only-xxx and 0061=
-Fix-xxx aim to fix the bug in e500v2 as following:<br>
<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D63908" target=3D"=
_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D63908</a> .<br></div=
></blockquote></div><br>This doesn&#39;t apply to master anymore, can you r=
ebase?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Cheers,</div><div class=3D"gmail_extra">Ross</div></div>

--001a113a59ee8ac526050da20ff7--
