Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7387702B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 16:00:19 +0000 (UTC)
Received: by qkdv1 with SMTP id v1so10394565qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 09:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Z/9riAIojMgUm+lAvBsj1bD/HD56Gu5b0SHpdDBQenA=;
	b=e1E6C/w1adszq9wmG9JIZ9hsiV0GR0m/S9MLPLwQuhSlzfWwK5b5JI4Q/VGOnX3vpo
	6s6pDSWeN6Xs9p36ey/hx0+veNeqMBwH9lzsoJhAH5FR3zxLPfaTD0KkaN2y+mPyhgtZ
	IDIJoTSpdOu1DpqdtqFsVOrPQA4nAG+AUyjnIFq/6qng+am6HO4JJgwYUz7KQwYlXhmm
	YeWaiHSS80BURgV3MA7TXTHsJaNfFJQQFgzz5SogEfxsECNStQViItLl4Ri7EchOPkU4
	w2c5Wk9Go9bR+0zMv9lMjdXuqVaoYW36DtoAzi0tAt0OOFNy/9ZoM4vvuiZ5ohMy9Xbm
	RaCA==
X-Gm-Message-State: ALoCoQnZZbc1stbqSv1g3jK7cIy74tVHUp1lZl4brpx7nmNBcK1rd5IpiOX9ptvk25t4kyK7QtUc
X-Received: by 10.55.15.3 with SMTP id z3mr6264075qkg.29.1441382419991; Fri,
	04 Sep 2015 09:00:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 4 Sep 2015 08:59:58 -0700 (PDT)
In-Reply-To: <CAGrhNMy9tDeSecYg3avrzem+tZt0Sh3mmOrG6J2JqBhaj-C53g@mail.gmail.com>
References: <CAGrhNMy9tDeSecYg3avrzem+tZt0Sh3mmOrG6J2JqBhaj-C53g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Sep 2015 16:59:58 +0100
Message-ID: <CAJTo0LZwA3rQBt1Ga8q4vamV6qVBHDCJFMAQjd+aLXTj8k9+EA@mail.gmail.com>
To: Felipe Tonello <eu@felipetonello.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Remove oprofileui-server
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
X-List-Received-Date: Fri, 04 Sep 2015 16:00:20 -0000
Content-Type: multipart/alternative; boundary=001a11474c6021265a051eedffac

--001a11474c6021265a051eedffac
Content-Type: text/plain; charset=UTF-8

On 4 September 2015 at 10:05, Felipe Tonello <eu@felipetonello.com> wrote:

> oprofileui-server is obsolete since it uses legacy OProfile's
> 'opcontrol'  commands to record a session, instead of operf. It
> doesn't work on fido builds.
>
> Anyone familiar with the code base can tell if it is too much work to
> update it to use operf?
>

Yes, its known that it's broken (bug 7054).

It hopefully isn't too much work to update it, although part of me wonders
if a better use of time would be to add remote debugging support to the
Eclipse OProfile support.

Ross

--001a11474c6021265a051eedffac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 4 September 2015 at 10:05, Felipe Tonello <span dir=3D"=
ltr">&lt;<a href=3D"mailto:eu@felipetonello.com" target=3D"_blank">eu@felip=
etonello.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">oprofileui-server is obsole=
te since it uses legacy OProfile&#39;s<br>
&#39;opcontrol&#39;=C2=A0 commands to record a session, instead of operf. I=
t<br>
doesn&#39;t work on fido builds.<br>
<br>
Anyone familiar with the code base can tell if it is too much work to<br>
update it to use operf?<br></blockquote><div><br></div><div>Yes, its known =
that it&#39;s broken (bug 7054).</div><div><br></div><div>It hopefully isn&=
#39;t too much work to update it, although part of me wonders if a better u=
se of time would be to add remote debugging support to the Eclipse OProfile=
 support.</div><div><br></div><div>Ross</div></div></div></div>

--001a11474c6021265a051eedffac--
