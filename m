Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7A6600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 13:55:38 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id kb1so15358701igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 06:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ilcaqXkfs+iVPibuSYJhLLz8KheacnHf/mWXqK3NWt0=;
	b=I8orpo102xoOyWzG36npMObi8mMoDykchb3Ql2cS9eg9BVpqfAEVsFPvpFSgRp2ZjG
	Fya5dc8CZH+q0v+0D0LUI5cvUsqWMrA7+ktktxBtjo9W0Hf/TE0E1CpNccRGkA8bkfK5
	B3qg/kkH22SY9UP0lA2af+6051ljz8GRFZYmrXE/xF1AyfOAnR/Op7Rb0qXFCq5K9SaA
	ONgqhJXgYA4Uw8iJghoU9KZGjv4D6Qev+iYgUiuH2kNUhPRH5CjJCJB0/xq8VM2Ws0Zo
	rKVUq54KLJQ8dBdtAPTzVE96GgNwrsyopmypazdgM9QqSY1ZWNgazYxV0GPlT7ar0vs7
	FU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ilcaqXkfs+iVPibuSYJhLLz8KheacnHf/mWXqK3NWt0=;
	b=F49Ybra20s+0eOnSXSpGxtVYkctlKX4TW8sMme0100f0jNlxzYxlXV1UefmjUbw0/K
	mKMDs6stEZzsT7KpfQpmppPDnZxBFJ1nsuGe2kPtDlL6NJtwf4Z63r/ciugv+sQwJNso
	RKul3EIBPgaGGn+o+0nZIaSbn7ZNxVAG7wmDGbUzxIlOaLqK8gVQNblRuSC2u8ONwLbm
	6SIQOaBqb/50j3OI9VZmZhfjZGicbkKAW0CxtcMYUmE/phZUwFQSYIRys+agdL0FbPWO
	4I66SEl0iVCFx0zG5zloq7VvHZBgstL4Tv221qtRuRNTJ42HIJrEb2tSKUKpzwNJgMeR
	eXkA==
X-Gm-Message-State: AOPr4FXQmTHzLiIOin/9UXNlR7rOecD+NnHZjfEm285diTH+YahMMOhGsfDvO2VBnmiKV6Yl9u8YHJzs8sjEF6As
X-Received: by 10.50.78.8 with SMTP id x8mr19745117igw.78.1460987739404; Mon,
	18 Apr 2016 06:55:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Mon, 18 Apr 2016 06:55:19 -0700 (PDT)
In-Reply-To: <5714DC35.7040206@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
	<CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
	<5714AA1E.9020505@windriver.com>
	<CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
	<5714DC35.7040206@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Apr 2016 14:55:19 +0100
Message-ID: <CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Mon, 18 Apr 2016 13:55:41 -0000
Content-Type: multipart/alternative; boundary=089e01183a4c3abb7b0530c2b789

--089e01183a4c3abb7b0530c2b789
Content-Type: text/plain; charset=UTF-8

On 18 April 2016 at 14:08, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> If sysroot is required, override DEBUG_FLAGS to remove -fdebug-prefix-map
>

We should probably get this in the release notes, as many people do indeed
want remote debug to work.

Can you tell gdb the base path to use when looking for symbols?  I've not
done remote GDB for some time but wouldn't "set substitute-path /
//my/sysroot/" work?  Or maybe /usr /my/sysroot/usr?

If gdb can't be told then instead of having to replace all of DEBUG_FLAGS
it would be neat if the prefix mapping variables where in another variable
that could just be unset.

Ross

--089e01183a4c3abb7b0530c2b789
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 April 2016 at 14:08, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mail=
to:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":c2" class=
=3D"a3s aXjCH">If sysroot is required, override DEBUG_FLAGS to remove -fdeb=
ug-prefix-map<br></div></blockquote><div><br></div><div>We should probably =
get this in the release notes, as many people do indeed want remote debug t=
o work.</div><div><br></div><div>Can you tell gdb the base path to use when=
 looking for symbols?=C2=A0 I&#39;ve not done remote GDB for some time but =
wouldn&#39;t &quot;set substitute-path / //my/sysroot/&quot; work?=C2=A0 Or=
 maybe /usr /my/sysroot/usr?</div><div><br></div><div>If gdb can&#39;t be t=
old then instead of having to replace all of DEBUG_FLAGS it would be neat i=
f the prefix mapping variables where in another variable that could just be=
 unset.</div><div><br></div><div>Ross</div></div></div></div>

--089e01183a4c3abb7b0530c2b789--
