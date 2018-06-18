Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C8EB6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 17:52:15 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id o17-v6so10092812vka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iGkUd9LGTEFHeydOn2iOo0HAsVzLAVnWj4sOCpfn7IA=;
	b=GUTHuPkc8IvBgM7RXDrF07yE4QKJ6OP52iBfDlpUqqLN93UDLhP3i0oVj94ciXhkwM
	a/zae4ZJIv3CpT34MvNwkdkD1lSYqUziOgCUQebT6JpPk4wKx8WKo6/Pj/xq/vNs5mWD
	k0eF484UJaekBSv8lIrcUkoeIghkVnlK4zlIxki6Ejr/b3yIhT6ztsk4Fzg080r0qtAx
	FGjpTIOb2tvku8BtnTx77DzTBzV7Xl2kma2fIHDBY51leOvvjCwT9rI4VpzaOLHUe24u
	svTPEb866WXh9C+W8JAQrV3EyyFoo9HH6VU+AAAGoQgyLvqZiQgLnV0VA9nU2U5U16EK
	v/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iGkUd9LGTEFHeydOn2iOo0HAsVzLAVnWj4sOCpfn7IA=;
	b=aRHqUoAW06asSeAMXTVp9+qpHkFNHgCMPlNZiwL1l8WskhUj3pOU+NZITopSVDa/T1
	3slLySigfQEt2+4EXFDa4g4TdVpDySaijkQWh43bHIdn15W2lPwZ0bJ70cY8HLaCh6P/
	vTAl4JXKG6cSDghGl95aQT6YMHzfk9HhoVuTuocHeERCYjaUTSA9Kw5qWYTZRDGpogZz
	OMA4uNUuPFo5jjDJ5Hi+rblveEzvqIv1XLZ30v0PcBbB4FUoWzbSgbvL0Y3a7uuNI7TE
	Ww17K9/BnfYPIjCn5AXM1jpUg/ApchebX2FayUUVY5JU1PwnJVVPmKwFX9asAilCWVWS
	i1AQ==
X-Gm-Message-State: APt69E0hJ6e5zxEKCLvUHx3SSDVjTFN+Y7ZYargmtxcVdOH9OjRYkQaj
	dDO7yOyVZdcg/CsRep3/qS89PCG0LT4Yw2pG9kI=
X-Google-Smtp-Source: ADUXVKL4lVnlckQbSzDo/X6hxv/htIfZxTcN1Jpz/CATfNC5qDneFQhYRNnTt7FIRWQgWGQBkgxwddYHj0uJKnfWOWo=
X-Received: by 2002:a1f:9757:: with SMTP id
	z84-v6mr7065237vkd.174.1529344336331; 
	Mon, 18 Jun 2018 10:52:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 18 Jun 2018 10:52:15 -0700 (PDT)
In-Reply-To: <547a3ea5-f66a-54fb-163e-0fe31998d59a@windriver.com>
References: <1529093808-10025-1-git-send-email-armccurdy@gmail.com>
	<22e45738-aa92-24c7-a3fc-03a0918a1c3a@windriver.com>
	<CAMKF1srvZ830wY4_PEV06L4Tea6OkHkSi+fcZMuG0sungLCdyQ@mail.gmail.com>
	<CAJ86T=VjYfk1T0MmN-6oyVSZmjYXZ3VNnaGAdLt49d12ZDEWwA@mail.gmail.com>
	<CAMKF1srWE9vVhv7MjcVh32mK+_FPt4OgYU7j9nWhW5fdd_hQ8Q@mail.gmail.com>
	<547a3ea5-f66a-54fb-163e-0fe31998d59a@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Jun 2018 10:52:15 -0700
Message-ID: <CAJ86T=VbRuByAyGFaf+tRFtyrKMo5K9uZKSsm5mPc9yvMdS+2g@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@jci.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] common-licenses: Add BSD-1-Clause
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
X-List-Received-Date: Mon, 18 Jun 2018 17:52:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 9:20 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 6/15/18 7:23 PM, Khem Raj wrote:
>> On Fri, Jun 15, 2018 at 3:48 PM Andre McCurdy <armccurdy@gmail.com
>> <mailto:armccurdy@gmail.com>> wrote:
>>     On Fri, Jun 15, 2018 at 3:36 PM, Khem Raj <raj.khem@gmail.com
>>     <mailto:raj.khem@gmail.com>> wrote:
>>     > On Fri, Jun 15, 2018 at 3:14 PM Mark Hatle <mark.hatle@windriver.c=
om
>>     <mailto:mark.hatle@windriver.com>> wrote:
>>     >>
>>     >> On 6/15/18 3:16 PM, Andre McCurdy wrote:
>>     >> > From: Andr=C3=A9 Draszik <andre.draszik@jci.com <mailto:andre.d=
raszik@jci.com>>
>>     >> >
>>     >> > Some projects are starting to use it.
>>     >> >   https://spdx.org/licenses//BSD-1-Clause.html
>>     >> >
>>     >> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com
>>     <mailto:andre.draszik@jci.com>>
>>     >> > Signed-off-by: Ross Burton <ross.burton@intel.com
>>     <mailto:ross.burton@intel.com>>
>>     >> > (cherry picked from commit 77f692ecb39d880b2cb420850a31534860eb=
2cc5)
>>     >> > Signed-off-by: Andre McCurdy <armccurdy@gmail.com
>>     <mailto:armccurdy@gmail.com>>
>>     >> > ---
>>     >> >  meta/files/common-licenses/BSD-1-Clause | 9 +++++++++
>>     >> >  1 file changed, 9 insertions(+)
>>     >> >  create mode 100644 meta/files/common-licenses/BSD-1-Clause
>>     >> >
>>     >> > diff --git a/meta/files/common-licenses/BSD-1-Clause
>>     b/meta/files/common-licenses/BSD-1-Clause
>>     >> > new file mode 100644
>>     >> > index 0000000..ded8897
>>     >> > --- /dev/null
>>     >> > +++ b/meta/files/common-licenses/BSD-1-Clause
>>     >> > @@ -0,0 +1,9 @@
>>     >> > +
>>     >> > +Copyright (c) <YEAR>, <OWNER>
>>     >> > +All rights reserved.
>>     >> > +
>>     >> > +Redistribution and use in source and binary forms, with or wit=
hout
>>     modification, are permitted provided that the following conditions a=
re met:
>>     >> > +
>>     >> > +Redistributions of source code must retain the above copyright=
 notice,
>>     this list of conditions and the following disclaimer.
>>     >> > +THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. "A=
S IS"
>>     AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO=
, THE
>>     >>
>>     >> Hate to nitpick, but isn't BSDi defunct?  I don't think it makes =
sense to
>>     list
>>     >> BSDI, since as far as I know they never had a '1-Clause' license.
>>     >>
>>     >> Maybe a <Organization Here> would be more appropriate.
>>     >>
>>     >
>>     > I think we should sync the files we carry with SPDX e.g.
>>     > https://github.com/spdx/license-list-data/tree/master/text
>>
>>     It doesn't look like that will fix the inconsistencies... those
>>     versions are inconsistent too:
>>
>> We should report that to spdx folks since they
>> Work on licenses and might be interested in addressing this
>
> Agreed.  I think we need to get the SPDX to fix their examples, and then =
use
> them once they are fixed.
>
> As for our version of the code, I'd suggest the "<COPYRIGHT HOLDER>" (as =
in the
> BSD-4-clause example) in all cases.

Agreed. So while Mark and Khem fix up master, is it OK for Armin to
backport the current version to rocko? Or should master and sumo be
updated first?

>>
>>     https://github.com/spdx/license-list-data/blob/master/text/BSD-1-Cla=
use.txt
>>     : THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. "AS IS=
"
>>
>>     https://github.com/spdx/license-list-data/blob/master/text/BSD-2-Cla=
use.txt
>>     : THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTOR=
S
>>     "AS IS"
>>
>>     etc...
>>
>>     >
>>     >> --Mark
>>     >>
>>     >> IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULA=
R
>>     PURPOSE ARE
>>     >> DISCLAIMED. IN NO EVENT SHALL Berkeley Software Design, Inc. BE L=
IABLE
>>     FOR ANY
>>     >> DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIA=
L DAMAGES
>>     >> (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS O=
R SERVICES;
>>     >> LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER =
CAUSED
>>     AND ON
>>     >> ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, O=
R TORT
>>     >> (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE=
 USE OF THIS
>>     >> SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>>     >> > +
>>     >> >
>>     >>
>>     >> --
>>     >> _______________________________________________
>>     >> Openembedded-core mailing list
>>     >> Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

