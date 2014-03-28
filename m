Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id B3D616C735
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 17:42:14 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id w7so3969210lbi.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 10:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=f9E8T7vQS7zbhXXkG9EFPNupJlD1lxZtFfJ785ST4g4=;
	b=z1EdC8y20E5rPpgGBOhHVCPgQRTq8svV/glUZeDfePL82OusVPUsthOdJPKlKbtCuO
	V5CmKkBAZp5kE+7dMfowsM9W6aQ/4jBo2Kw+oV5/OHd2vjWGNmBoPY137FhzCAPvD/+f
	EBSnc5iXwTcFatOvfWAF1FH4P+O60PYKdb1Yj0D8KxIfEVMhthgtwsa5yMg4SM0ZWMf1
	nLc+NFFbnm50HA+MJl0Gq/TMAxdRmGGrxgVq92kVnf+yosEKVlKrE/JQZ6sacHOEL+uc
	p/ATWX1P5wwo8/1XKpjPFxI0ZyphzuLpmqr60HgrubQK53/EdmzpAummBu618wqSe3Gq
	irSg==
MIME-Version: 1.0
X-Received: by 10.112.128.231 with SMTP id nr7mr6092161lbb.9.1396028534116;
	Fri, 28 Mar 2014 10:42:14 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Fri, 28 Mar 2014 10:42:14 -0700 (PDT)
In-Reply-To: <20140328173436.GK3370@denix.org>
References: <cover.1395825881.git.kai.kang@windriver.com>
	<CAP9ODKpRZXUxM=QGOBR4xmh=vBWBd6VOqYK0AZwvon_MG4pQGA@mail.gmail.com>
	<20140328171338.GI3370@denix.org>
	<CADkTA4MxeTfzCY6YT4657jZy3btMN=wDDcUAaktzE=85SvunOA@mail.gmail.com>
	<20140328173436.GK3370@denix.org>
Date: Fri, 28 Mar 2014 13:42:14 -0400
Message-ID: <CADkTA4Nn0imwAnmMJxhcJFP0tbygyFzVyApNLS_zp83oT52XAw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Replace ocf-linux with cryptodev-linux
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
X-List-Received-Date: Fri, 28 Mar 2014 17:42:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 28, 2014 at 1:34 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Mar 28, 2014 at 01:18:32PM -0400, Bruce Ashfield wrote:
>> On Fri, Mar 28, 2014 at 1:13 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > On Wed, Mar 26, 2014 at 11:42:39AM -0300, Otavio Salvador wrote:
>> >> Hello Kai,
>> >>
>> >> On Wed, Mar 26, 2014 at 7:15 AM, Kai Kang <kai.kang@windriver.com> wrote:
>> >> > Replace ocf-linux with cryptodev-linux because linux-yocto use cryptodev-linux to implement /dev/crypto.
>> >>
>> >> Thanks for handling it; I was going to address same issue this week so
>> >> we could have it upstreamed and drop the Freescale bbappends for it.
>> >
>> > So, we also have a recipe of cryptodev for TI builds. But it's not just a
>> > header file and we need the actual module to be built and packaged...
>>
>> As long as something out of tree can co-exist with in-tree implementations,
>> I don't see a problem with an incremental update that builds the module
>> as well.
>
> Thanks. So, I already have cryptodev-tests as a separate recipe that builds
> some tests from the same source, as main cryptodev. I guess I can look into
> separating module part into cryptodev-module recipe, which can be optional for
> kernels like linux-yocto that have it already patched in. Will that work?

Absolutely. It's the same dance we do with lttng-modules, so we are on solid
ground.

Bruce

>
> --
> Denys



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

