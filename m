Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 02FF560132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 10:51:31 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id f51so26234135qge.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 02:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=o6jWaQuEOS4OBFt5u/YVzt28h1BmBaWb1N0tgOf49qk=;
	b=dcpT1zIix84Ng0p96feGP2o7WD+2D6EA0Tzhvzi9U/K5blcX/aep/fEYMzfgrMzk/G
	LXX8IMkZDvO1Q71Mf6QgqQCM13VtUlEMDhQnzBaWp8gcnwm3FHyABGQYWfgpyQQsuC1C
	R1giFVp3rog/TI3rliP5sjs3nmu8nUUZhUtLoJQYTSWa55kCllhLArsnVGXdJ46wHl5e
	ODBmB5O7wWyJqUGD0mQjm2QO27N9/iQyKkbHR+wiAr2eup2fkWi1SbsyTd+Km2E1kUpL
	/eiolyUEBWLQcxBv5OFWLKf3HqVF4fkL65Qa1hw7d6jcmW1QES7vewWbwJEXvXsuzfmT
	2XXw==
X-Gm-Message-State: ALoCoQlvQpEK1T0MHa2J4FbT8Heh04I5UZ5WBEsss4GNQwZ3AdUhvKwPBUcqsykJcBNYx0BXapr9
X-Received: by 10.224.103.129 with SMTP id k1mr33646qao.93.1422528692689; Thu,
	29 Jan 2015 02:51:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 29 Jan 2015 02:51:12 -0800 (PST)
In-Reply-To: <1422417862-62783-1-git-send-email-biannm@cn.fujitsu.com>
References: <1422417862-62783-1-git-send-email-biannm@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Jan 2015 10:51:12 +0000
Message-ID: <CAJTo0Laa12U-LZEjJh+RBt6fAiwh_LskO7xLQMXkL64Gr6pqBw@mail.gmail.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master]gnutls: update to 3.3.12
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
X-List-Received-Date: Thu, 29 Jan 2015 10:51:39 -0000
Content-Type: multipart/alternative; boundary=047d7b66f74b693184050dc84536

--047d7b66f74b693184050dc84536
Content-Type: text/plain; charset=UTF-8

Hi Bian,

On 28 January 2015 at 04:04, Bian Naimeng <biannm@cn.fujitsu.com> wrote:

> +PR = "r0"
>

r0 is the default value for PR, so you don't need to include this.  I've
fixed this when merging, don't bother sending a v2.

Ross

--047d7b66f74b693184050dc84536
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Bian,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 28 January 2015 at 04:04, Bian =
Naimeng <span dir=3D"ltr">&lt;<a href=3D"mailto:biannm@cn.fujitsu.com" targ=
et=3D"_blank">biannm@cn.fujitsu.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div id=3D":1y5" class=3D"a3s" style=3D"overflow:hidden">+=
PR =3D &quot;r0&quot;<br></div></blockquote><div><br></div><div>r0 is the d=
efault value for PR, so you don&#39;t need to include this.=C2=A0 I&#39;ve =
fixed this when merging, don&#39;t bother sending a v2.</div><div><br></div=
><div>Ross=C2=A0</div></div></div></div>

--047d7b66f74b693184050dc84536--
