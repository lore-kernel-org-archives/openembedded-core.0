Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 03C2777183
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 07:31:41 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 74so6860285uau.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 00:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tEP7sNZreiAHgVm2/u3PY2o1nhBSuLtsq9jI1whr+GI=;
	b=tmoqNZ7sLlWHbbh7fCFGwol09Hg2ATX/aa4U6axVdO9rUD9EA6s4RbFzyvHgmVbDVr
	LJL2F85OOVHOdRfWLuE0fKNrQ23zo6rf+ZcssD1PS/AAkJfubb8HnMKy+byENzgY1o1R
	jDDWmD/mnwpllmmOyagA0e4gha3gCyoqhLV2PCzh/ks00+JSx8VXaPTV7n7naLzVzvGm
	S+k7WpC8S63dQhntJLIuhXpdy9yik1ARgUs07FKbiHK3sjngOyVXERWC8Q1qVhjmDs9u
	//KS7hjRqVSBhXVrDA4QS6L81JrXW/4kFPvifE3Yt30h4ldIDIXBdrhvEf4TVIJkhLsg
	lOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tEP7sNZreiAHgVm2/u3PY2o1nhBSuLtsq9jI1whr+GI=;
	b=LxdTK+7E/Y3meZvPZxxAUYGbJ7MqXQQ8guWA0vewz+/eY92qdswES1VvBZd3NvKwfn
	+wypueDFciL83l8hdWp7bgRAvzFG+KrMQQfrDlh+v2ZB4jreAJdYK8KJKu8svcQbpMlI
	WST8uGyI7y9Us4oQowHF3mK7jdWPpA5DKnMpFv8I6HNYH2CCHE0lK7qg2FVUm3Xw0d0C
	OS5YLsx/ctH5Kbz4uwPL7ANfoo0sIgAhqT/hYt0u4SWZd9/XY9SKcy1YQ2dO7271mUQq
	wZEN5NobarPVF/UpII4QV9BVAGnpsM4gzaZExUbWGiOZ999x0L3HOatJPXhyfJHl3Kpd
	u+Rg==
X-Gm-Message-State: AEkoouvWNNIM6S/8P9KFTAHy03pO8MeS8X8ARkQi29r4rqtE8CdnOrbPzfCBfjdRBdaCI/Ub/iqAVuGJsdrSng==
X-Received: by 10.31.56.73 with SMTP id f70mr46476439vka.135.1470641501721;
	Mon, 08 Aug 2016 00:31:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.66 with HTTP; Mon, 8 Aug 2016 00:31:41 -0700 (PDT)
In-Reply-To: <1741854.t2UPzGOPnl@peggleto-mobl.ger.corp.intel.com>
References: <20160729222801.9806-1-raj.khem@gmail.com>
	<CAP9ODKr5zc+cB-iGcze7Uq8DswUko=2cReYhWLyURe5DwLuE2Q@mail.gmail.com>
	<1741854.t2UPzGOPnl@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 8 Aug 2016 09:31:41 +0200
Message-ID: <CALbNGRSP+nbV045-UaW_bZXv0iwnTe-MhjMLe3NEqAeg=-6Lyw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-dtb.inc: Support for .dtbo files for dtb overlays
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
X-List-Received-Date: Mon, 08 Aug 2016 07:31:42 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 31, 2016 at 11:17 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Sat, 30 Jul 2016 08:00:45 Otavio Salvador wrote:
>> On Fri, Jul 29, 2016 at 7:27 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > From: Herve Jourdain <herve.jourdain@neuf.fr>
>> >
>> > Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >
>> >  meta/recipes-kernel/linux/linux-dtb.inc | 18 +++++++++++-------
>> >  1 file changed, 11 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
>> > b/meta/recipes-kernel/linux/linux-dtb.inc index 74f5ef8..8528d64 100644
>> > --- a/meta/recipes-kernel/linux/linux-dtb.inc
>> > +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>> > @@ -33,12 +33,13 @@ do_compile_append() {
>> >
>> >  do_install_append() {
>> >
>> >         for DTB in ${KERNEL_DEVICETREE}; do
>> >
>> >                 DTB=`normalize_dtb "${DTB}"`
>> >
>> > -               DTB_BASE_NAME=`basename ${DTB} .dtb`
>> > +               DTB_EXT=${DTB##*.}
>>
>> Bashism, no?
>
> No:
>
>   http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html
>
Anything wrong with this patch. The orinal patch was sent end of May!

Andreas

