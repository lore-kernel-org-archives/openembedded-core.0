Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id D0CD161883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 13:45:54 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id fb19so3935835obc.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=BCWJluYx+87g6veRm+HShTi50cpkiqJ8oor43lGFzNQ=;
	b=pty+xN+VmP6m+ZfeMVUYmEDV1ilH7QqqH8h1lGuBClzS8wycNFXAPwqMLtsIMxQJL6
	66TwSNzkQnyYXQZuL5kPHHLxa0ffisgszQiuVtg57A6rbnkAghVXql8nyXHZfwG4KO/W
	/CFQVloHis0atq+O4ynxZHKPp6bAdOZOURonyjikHKZ49ihjHopyW+Z7RbjHe1kngJjj
	hRaekhiPC5ndSvzbZc9+fsut6eEuXX4sya4Fz+/6+N957V73qzAq7HdEx0rZi0wSztqH
	5bN6IuvMYyiAIDlqoX1zW6KrfasDuENAkVmP9vg+iFzsgaAc/z0KzPe12OkpTB+cGsxE
	wd6Q==
MIME-Version: 1.0
X-Received: by 10.60.79.3 with SMTP id f3mr1277572oex.50.1375364755135; Thu,
	01 Aug 2013 06:45:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 1 Aug 2013 06:45:55 -0700 (PDT)
In-Reply-To: <1375362513.3362.9.camel@ted>
References: <1375283605-25870-1-git-send-email-otavio@ossystems.com.br>
	<1375342673.3362.7.camel@ted>
	<CAP9ODKrKdvyBtMLUzDztyfZHgC0=Y6p37Q_nHjoVb-cZ8=6CJg@mail.gmail.com>
	<1375362513.3362.9.camel@ted>
Date: Thu, 1 Aug 2013 10:45:55 -0300
X-Google-Sender-Auth: VjtStPMVxEMxiV0o0t4YIaKK_sk
Message-ID: <CAP9ODKpH_qhWehJG=o5KiubLQum+Yiz-0WevSrP=qSROUFgjpQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Thu, 01 Aug 2013 13:45:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 1, 2013 at 10:08 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2013-08-01 at 09:19 -0300, Otavio Salvador wrote:
>> On Thu, Aug 1, 2013 at 4:37 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Wed, 2013-07-31 at 12:13 -0300, Otavio Salvador wrote:
>> ...
>> >> +    # Avoid readding the removed features later
>> >> +    d.delVarFlag("DISTRO_FEATURES", "_append")
>> >> +    d.delVarFlag("DISTRO_FEATURES", "_prepend")
>> >
>> > I quite clearly said this was a hack to allow you to see what the
>> > problem was with the code and that it was *not* an acceptable change to
>> > go into the core. I don't see any mention of that now and that is a
>> > little frustrating to see this being proposed as a patch.
>>
>> I forgot to add it to commit log, sorry. The idea was to send the
>> working code so people using it could use a valid one. I understand we
>> need to find a better solution for this but I am clueless about where
>> to look.
>>
>> I can work in another solution if someone can tell me what needs to be
>> done. I looked at bb.data_smart code and didn't find any other way to
>> fix this.
>>
>> The finalize code would be the other place I can think about changing. Any hint?
>
> Using existing API, did you try just d.delVar("DISTRO_FEATURES") and
> then setting it again? Unlike the above, that doesn't assume any
> knowledge of bitbake internals.

Works like a charm. I will send v4 with this one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

