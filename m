Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3216E76420
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 13:04:28 +0000 (UTC)
Received: by qgx61 with SMTP id 61so6498006qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 06:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RF2tQXjjUUmOsPBBh0dJ2HzWJTs9osyjhj+A3U4UQ58=;
	b=XL8YHLUOkn5OagH8gPS2BSwt/9tCh561TasiqhPAanHflsotP+gklHrIFPXnYqS9UD
	ISXfYFpYIflhrrl/jxe1Au+fvIjVzdVWZrXCXeqDN7NHwnAk5714Z4EMBwWF+7s2Csc8
	QF+9gUahVbNHyfsn094pXgPrtpfQjjrE0i8t7JztXB3pzDLh/S+Nk6rOrgXssRp9xV9S
	tlQus+aG2QqCSSnk3Bahl0ZOUj511v/nWSN9BF5TUR6viXzMJRS2tipJBinU/L//Su91
	AwiCZSGi57ds9AhEUNSq3tyjJF8Q7Sq+CzozvcUm9QKX42+P8zm3eGUAdPW80tlLPpOq
	wKpQ==
X-Gm-Message-State: ALoCoQmcmtll4RwacVjAtDAgKlFQtEOwNB9zCn/7ivXJ2cUacwGVQlLY09Npbw3YH9DqpvgeIzDE
X-Received: by 10.140.132.71 with SMTP id 68mr46642507qhe.64.1441803868284;
	Wed, 09 Sep 2015 06:04:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Wed, 9 Sep 2015 06:04:08 -0700 (PDT)
In-Reply-To: <b4be4eb148b3551893639ac087be2d4e8dcb8eb5.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<b4be4eb148b3551893639ac087be2d4e8dcb8eb5.1441753511.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Sep 2015 14:04:08 +0100
Message-ID: <CAJTo0LaCUeR2pt6d2=yrTtdfJsd1AOd4iUeZMXOuOm_ROvcsWg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/16] webkit-gtk: Backport fix to remove FrameDestructionObserver
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
X-List-Received-Date: Wed, 09 Sep 2015 13:04:30 -0000
Content-Type: multipart/alternative; boundary=001a113510d467d267051f501f3f

--001a113510d467d267051f501f3f
Content-Type: text/plain; charset=UTF-8

On 9 September 2015 at 00:07, Khem Raj <raj.khem@gmail.com> wrote:

> This helps clang compile webkit without problems. This is a backport
> from upstream
>

MUT has an upgrade to webkitgtk 2.8.5, would this version have this fix
integrated?

Ross

--001a113510d467d267051f501f3f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 September 2015 at 00:07, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":16x" class=3D"a3s" st=
yle=3D"overflow:hidden">This helps clang compile webkit without problems. T=
his is a backport<br>
from upstream<br></div></blockquote></div><br>MUT has an upgrade to webkitg=
tk 2.8.5, would this version have this fix integrated?</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113510d467d267051f501f3f--
