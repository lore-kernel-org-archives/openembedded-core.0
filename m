Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4655260034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 20:35:37 +0000 (UTC)
Received: by obfe9 with SMTP id e9so63890740obf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 13:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ThX4umUhdnfcgDfEl64115r+6TpOM2NB4GfpfR4Ysb4=;
	b=vRNZZlqlTmhz5o+mU+RapNPK6kRGFdXW7y/JGpUfW0cMIya9e6aPvXgc8v3+AA3d/k
	SGrMz/MBfa9puupBII972aMxjoNY7LIZgrwRAFYtFz4sYRRmiMXBZiYqjmGFCkirK2Mh
	oRANz/s4m3PZ5yk6693De1wDRUemjbFNk61XWMrYcRmO2XqRbqUBXdlQeqRqod4EtCdO
	zV9IhmWzfFIm5xmghQPIm1nUxKlfp65B9ohruRPMirs0uAiwa45ZFGWYETRxLvkiraAw
	YC779BZ7OBVoKcSBGs5oJKS2yNrJtd7TNeNZ4fz6VfvcDKUfZVqG7pKM92U1Zu6kSc5n
	FghQ==
MIME-Version: 1.0
X-Received: by 10.182.87.36 with SMTP id u4mr4567866obz.50.1431117338947; Fri,
	08 May 2015 13:35:38 -0700 (PDT)
Received: by 10.202.102.13 with HTTP; Fri, 8 May 2015 13:35:38 -0700 (PDT)
In-Reply-To: <CAP9ODKqyMGSov5FpbWkwN5cqVrHdCmP5ZeHB31+2Q6vhQB-YJQ@mail.gmail.com>
References: <1431097454-28641-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAJ86T=UDg+yZPgsuuNXqV0ZENMTAatbnx1qk1LxscwTfN0ndkg@mail.gmail.com>
	<CAP9ODKqyMGSov5FpbWkwN5cqVrHdCmP5ZeHB31+2Q6vhQB-YJQ@mail.gmail.com>
Date: Fri, 8 May 2015 13:35:38 -0700
Message-ID: <CAJ86T=W2chZiZXvey7oeuisVYTEHkukKMQ5jFioZaA9HFY+vFQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gstreamer1.0: convert GSTREAMER_1_DEBUG to PACKAGECONFIG
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
X-List-Received-Date: Fri, 08 May 2015 20:35:40 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 8, 2015 at 12:12 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, May 8, 2015 at 4:07 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> ...
>> Or perhaps even use the "GSTREAMER_DEBUG" variable in gstreamer 1.x recipes?
>
> I think the PACKAGECONFIG is a nice compromise as it allows for
> granular control over what to enable or not. It is easy to enable it
> for recipes in a local.conf using pn-<package>_append or similar.

Over-riding GSTREAMER_DEBUG could be done on a per-package basis too,
if there's really a need to enable debugging selectively.

However, I guess when you want to enable gstreamer debugging, you
typically want to do so through-out gstreamer and all plug-ins... and
needing to control PACKAGECONFIG for each recipe makes it harder to do
that.

Whatever happens, the GSTREAMER_DEBUG, GSTREAMER_1_DEBUG and
GSTREAMER_1_0_DEBUG duplication should probably be fixed.

I don't have a strong preference though and I'm stuck partnered with
an SoC vendor who only supports Gtreamer 0.10, so I'll be watching
from the sidelines as everyone else debugs GStreamer 1.x in oe-core
:-(

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

