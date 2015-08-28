Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id ABE067626C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 23:54:30 +0000 (UTC)
Received: by qkfh127 with SMTP id h127so37498908qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 16:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=ORJZD4W0Q8VWZYFnfYuyoiki/XDEa0mTnoNUA5YxHBo=;
	b=Q2hPYUs4jziTJFVqpvtjcKYXzfmz2zWZw2OeWRARD/cW7g/Ub7v89L5CUhVRn6cj4L
	H9f3LaKcpNjqrXwLVTuW92Z9wYSsYRv+mY4z/whAGymeLc4VZZv0vf1sdMU0ouVp7C+s
	XjNoXIqxRI8TznJ/aAVoJqgk7HCIWNubr+PE42EwvvEsnHcTlQuRgrtx/hksewI1krrz
	+EE04rJiKgj/mE0qiwfqWE63Y877N9pNmdQ0jRtHrziRodsoJkRrAGsNck9btWdXiGxh
	I+g78pjbnbsiCJa2dL6ojxH7I4ovQ0y0HzMCcb81EeRVT0vyaWuaGjEJENk6jwy7Bkzo
	h+Mg==
X-Gm-Message-State: ALoCoQmpJHehQM9OYZzBUIAuehJd21Zp6VBW1zTynY5fdCcHSR/Kw2DUTTzVbsHuMwu2McRH/Vcc
X-Received: by 10.55.197.151 with SMTP id k23mr20692427qkl.13.1440806070156;
	Fri, 28 Aug 2015 16:54:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Fri, 28 Aug 2015 16:54:10 -0700 (PDT)
In-Reply-To: <1440805397-3775-2-git-send-email-ross.burton@intel.com>
References: <1440805397-3775-1-git-send-email-ross.burton@intel.com>
	<1440805397-3775-2-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 29 Aug 2015 00:54:10 +0100
Message-ID: <CAJTo0Lajxi8GD6DP_s4n4i4BBnQ3Sxsy0eOoYnxtEWL56u8izQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oeqa/runtime/multilib: change test case to use glib-2.0-utils
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
X-List-Received-Date: Fri, 28 Aug 2015 23:54:34 -0000
Content-Type: multipart/alternative; boundary=001a1149967000b5e0051e67ce10

--001a1149967000b5e0051e67ce10
Content-Type: text/plain; charset=UTF-8

On 29 August 2015 at 00:43, Ross Burton <ross.burton@intel.com> wrote:

> Using connman-applet as a multilib test case seems quite heavy due to the
> numerous dependencies it has, whereas the same test ("do binaries get
> swapped
> correctly") can be done with a lower-level library containing binaries, for
> example glib-2.0.
>

Updating the related bug made me realise that this would mean adding logic
to the autobuilder to handle new and old tests, so it really isn't worth it.

Ross

--001a1149967000b5e0051e67ce10
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 August 2015 at 00:43, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":119" class=3D"=
a3s" style=3D"overflow:hidden">Using connman-applet as a multilib test case=
 seems quite heavy due to the<br>
numerous dependencies it has, whereas the same test (&quot;do binaries get =
swapped<br>
correctly&quot;) can be done with a lower-level library containing binaries=
, for<br>
example glib-2.0.</div></blockquote></div><br>Updating the related bug made=
 me realise that this would mean adding logic to the autobuilder to handle =
new and old tests, so it really isn&#39;t worth it.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1149967000b5e0051e67ce10--
