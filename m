Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 57F4C7520C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 22:48:19 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id 200-v6so6563973vkc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 15:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UdRxXWFydERVCbvnOj1uFSP/kZZaZ0IVvQz4jV4qZks=;
	b=ARnJ5ItLYwZwHxCI6oN+dfQZ4MV3g8Abqcr8R0Ya7b9fnfEmVfLQ4f9whQ43WG6GQN
	Dffpacbcp+bQZNDoFaLHh+S9IQCBNAkiJTqQpJOKr2WvmH7yaBtA1jmB/uR2+hAxtCgF
	acwFTvwAzpdIRcvYK6uivycfOSf7V5nVG1QN3kn3duiPPGI4d+ZOEGh1v1pIAGKKMej5
	yXApsx7o7VPygueRHi3PEUg/EaQLlbFz+LcrGBX0F54rvdHxObJgUiCjxpRdBjRfa2dL
	je+9wAGSFsBSWefMCu2ObrtWzo9EkmoVHov5/i94ne2ZJE351j2oIQ1khBXtF5qmFnN6
	6IrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UdRxXWFydERVCbvnOj1uFSP/kZZaZ0IVvQz4jV4qZks=;
	b=gyFftVvR/bPLeOH1r/9qvNewXtBG2+WDC6bmeDWsujlOxvRYUU5nyNTmfuqLtB4XTV
	cDYvn6W7gEGEXB/cnQ1uD5O36YNPsG0s1L6mBszMNiU50nE4pwhXBlMX5660LOf2Mhkj
	rTh8Ky0Rwamo+AFZkc9durtphoX3eB3u2pxV1M7s41ZsjFSVVonm/esxMv41FvK/EhJs
	SSmtluGNE16XrJkKBvHmqIXKIlOp2VpQ9L8KY51VAeYSL9lRDXbjajKSytCUaalKlye3
	6SYPp1Mgkxn5clhrwwU/jT5N7EbUWPXRuThXRLdr6p7dyzIXDvtrBHFvGAUghQ5PGL+T
	+EXA==
X-Gm-Message-State: APt69E3D5EUNeNiJW4RdN8IS4krzhM4xYVm1w3VFYFciW1Jv3ajuultt
	KoLv6gFQVwAjCWWyEtD+r2BSv8V1zaMQagV1bzA=
X-Google-Smtp-Source: ADUXVKJftWzOlL9fwg+SjCHFGkUuE70Q+ti4Z065OILis6vNbj9f6mXi2iMMVBbO9yy/hRPDiAQroadfs3wKhikF26Y=
X-Received: by 2002:a1f:c3c7:: with SMTP id
	t190-v6mr2181508vkf.24.1529102900241; 
	Fri, 15 Jun 2018 15:48:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Fri, 15 Jun 2018 15:48:19 -0700 (PDT)
In-Reply-To: <CAMKF1srvZ830wY4_PEV06L4Tea6OkHkSi+fcZMuG0sungLCdyQ@mail.gmail.com>
References: <1529093808-10025-1-git-send-email-armccurdy@gmail.com>
	<22e45738-aa92-24c7-a3fc-03a0918a1c3a@windriver.com>
	<CAMKF1srvZ830wY4_PEV06L4Tea6OkHkSi+fcZMuG0sungLCdyQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 15 Jun 2018 15:48:19 -0700
Message-ID: <CAJ86T=VjYfk1T0MmN-6oyVSZmjYXZ3VNnaGAdLt49d12ZDEWwA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 15 Jun 2018 22:48:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2018 at 3:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jun 15, 2018 at 3:14 PM Mark Hatle <mark.hatle@windriver.com> wro=
te:
>>
>> On 6/15/18 3:16 PM, Andre McCurdy wrote:
>> > From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>> >
>> > Some projects are starting to use it.
>> >   https://spdx.org/licenses//BSD-1-Clause.html
>> >
>> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>> > Signed-off-by: Ross Burton <ross.burton@intel.com>
>> > (cherry picked from commit 77f692ecb39d880b2cb420850a31534860eb2cc5)
>> > Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> > ---
>> >  meta/files/common-licenses/BSD-1-Clause | 9 +++++++++
>> >  1 file changed, 9 insertions(+)
>> >  create mode 100644 meta/files/common-licenses/BSD-1-Clause
>> >
>> > diff --git a/meta/files/common-licenses/BSD-1-Clause b/meta/files/comm=
on-licenses/BSD-1-Clause
>> > new file mode 100644
>> > index 0000000..ded8897
>> > --- /dev/null
>> > +++ b/meta/files/common-licenses/BSD-1-Clause
>> > @@ -0,0 +1,9 @@
>> > +
>> > +Copyright (c) <YEAR>, <OWNER>
>> > +All rights reserved.
>> > +
>> > +Redistribution and use in source and binary forms, with or without mo=
dification, are permitted provided that the following conditions are met:
>> > +
>> > +Redistributions of source code must retain the above copyright notice=
, this list of conditions and the following disclaimer.
>> > +THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. "AS IS" A=
ND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
>>
>> Hate to nitpick, but isn't BSDi defunct?  I don't think it makes sense t=
o list
>> BSDI, since as far as I know they never had a '1-Clause' license.
>>
>> Maybe a <Organization Here> would be more appropriate.
>>
>
> I think we should sync the files we carry with SPDX e.g.
> https://github.com/spdx/license-list-data/tree/master/text

It doesn't look like that will fix the inconsistencies... those
versions are inconsistent too:

https://github.com/spdx/license-list-data/blob/master/text/BSD-1-Clause.txt
: THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. "AS IS"

https://github.com/spdx/license-list-data/blob/master/text/BSD-2-Clause.txt
: THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS"

etc...

>
>> --Mark
>>
>> IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPO=
SE ARE
>> DISCLAIMED. IN NO EVENT SHALL Berkeley Software Design, Inc. BE LIABLE F=
OR ANY
>> DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAG=
ES
>> (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVI=
CES;
>> LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED =
AND ON
>> ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>> (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF=
 THIS
>> SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>> > +
>> >
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

