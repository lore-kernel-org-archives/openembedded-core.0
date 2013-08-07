Return-Path: <cazfi74@gmail.com>
Received: from mail-qe0-f48.google.com (mail-qe0-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8C72661013;
	Wed,  7 Aug 2013 16:09:19 +0000 (UTC)
Received: by mail-qe0-f48.google.com with SMTP id 9so1079033qea.21
	for <multiple recipients>; Wed, 07 Aug 2013 09:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=yR9S9hhCZ+ev+QEYxh5H/lJyzEy+78YXuCHkOgnVzWU=;
	b=z1rIXjfiVvZbvnxILgLsxllcPGMwqUlklvX7oHErK3QO55CYrfk4wY+40fAl9ixPTf
	XZ368Y6gTR9hYnjg+RMBW7LCJNQBIlQCTomYrEmBsAtRpcwSXJUM2QwU14y8UZSz4wE8
	RRcFwwymepSJkquXcCdYuoMmSIyzGykV/Q8/zRheDUrwTcBREmaEgETT03eQq9Yb81Fv
	XUQ1U/hQtUbd+kpoVvgIE1RKOqAOR6EkKfMk6zDDxOVR960op5YwOz8EUjKsR8Mx6Dg1
	9kZlW/Asw8Zn0I79BUfvxqr1RZ5Jnnf3cPnriIlQTX5nW+h5CkBryViYafEY6dmGBFU/
	sYTA==
MIME-Version: 1.0
X-Received: by 10.224.65.3 with SMTP id g3mr1455362qai.42.1375891759844; Wed,
	07 Aug 2013 09:09:19 -0700 (PDT)
Received: by 10.224.114.207 with HTTP; Wed, 7 Aug 2013 09:09:19 -0700 (PDT)
In-Reply-To: <20130807122314.GF17450@ibawizard.net>
References: <51F18346.2@windriver.com> <20130807122314.GF17450@ibawizard.net>
Date: Wed, 7 Aug 2013 19:09:19 +0300
Message-ID: <CAF6bG8fFOL8rDQrtJkwBDt2SJw0sWbLVSo0ZMk2pJ6g_f+-Qcw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>
Cc: koen@dominion.thruhere.net, openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Add lua to oe-core.
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
X-List-Received-Date: Wed, 07 Aug 2013 16:09:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7 August 2013 15:23, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> Randy MacLeod <randy.macleod@windriver.com> [2013-07-25 15:57:58]:
>
>> lua-5.2.2 is current, see: http://www.lua.org/download.html
>> so we'd likely uprev and send that version.
>
> Just FYI Lua 5.2 has quite a lot of changes to Lua 5.1[1].  So I wouldn't
> consider it as an drop-in replacement for Lua 5.1. Simply said it's not
> compatible out of the box.

 Yes, 5.1 and 5.2 are incompatible to extend that there simply is no
way to do some things so that it would work with both (5.1 has it one
way, 5.2 has it another way, and neither understand the other) It can
take some effort to switch application from using lua 5.1 to using lua
5.2.


 - ML

