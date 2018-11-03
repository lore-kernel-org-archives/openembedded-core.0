Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id E9F3B6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 17:05:53 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id u13-v6so2451132pfm.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Nov 2018 10:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=BhjfVRMyNCz/JK4Wl98q2+i1cTK+TWNerPAeBPrBFU0=;
	b=eckcAJ5JetrKjciPOuKVvO1qIwIlyXVewhnrZasALxOh3SpnNQ7zczDHGstUCvw/Fq
	Q10ylr+gN5ofFfv865wT+gk7/6OCwSDpofLSiUiPOaSx1G2/AKPCz23Ozu26Rmeo//9a
	vwhKv5RGKg2qau/xe4ilGR8BNKLVo5frIjvu44p0RdA01IIm5M+sjFhkvmI6On64ec1i
	wCEvByaqhnO51GkqsmE4axCAYsybXuTJYhMxIYKt1fXuD7KSIo0lgrK9528OFGtF+swf
	+Q3M8Or9kqdxfQXmgLS8rCbdSt5f6Lf2PamZ846AnSGf7IBHUdu+8FSVgQZOcrfitlWw
	mdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=BhjfVRMyNCz/JK4Wl98q2+i1cTK+TWNerPAeBPrBFU0=;
	b=gp62jaE4vSR3mpdJA9oVCDNFnsUXxmO9De4orxpebpUIqG63+Mw1k8ukj1Gyh4kIfS
	COOpxk4/MDgnF08ebc5S7eNBslmZnD+NOJFjJrfiyHeQHZChdZlVFS77Cc42fwPTxwp+
	VU3yxuWuiN7GPRKcLIhV4cBvFKWW3AQ5M5b2hDAHFc+5+MfiDYOs4yCMCk8J+oUlXcJv
	u7Z2fRpl7B4zo3MNdq8kQcDaYWM9ONy12ZULKdPDnmaAdXT5bSQj9vI3Gkp2BVBVj0U4
	tDGTqYYEMQ5VYutmd+Bm8jRwGqalOX+WluwyrHKN3JY/TWossbDIC4EVFa/chjjvQqcU
	QTng==
X-Gm-Message-State: AGRZ1gIoq7UUW7nAAFlNy1XzxRzlJ1uLMSHilmcws21x6J5NQsMTSMA0
	Aa/BYJBywpSZB217REhbVEI+TPeNtW3LDpJ1+g71hPc8
X-Google-Smtp-Source: AJdET5dCUIbF2OrI8vzpuyaeutAb9FmSY8+gNJXiy3vP0skvs379zG0/OXlYDnXpFRTjqFlOnnKTx0mp69Hxx/zWhuA=
X-Received: by 2002:a62:b09:: with SMTP id t9-v6mr16047312pfi.36.1541264754700;
	Sat, 03 Nov 2018 10:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAM_RqkOk3NOGTOok0oXnw6rPcfA6GXqdj=mjGBPySeJUmzbwcQ@mail.gmail.com>
In-Reply-To: <CAM_RqkOk3NOGTOok0oXnw6rPcfA6GXqdj=mjGBPySeJUmzbwcQ@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Sat, 3 Nov 2018 22:35:43 +0530
Message-ID: <CAM_RqkN7YuUq6v_mAwedzWcmt42a=uuqGrfQMz6=DrQDmSVCvg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: Not able to find clang-4.0
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
X-List-Received-Date: Sat, 03 Nov 2018 17:05:54 -0000
Content-Type: text/plain; charset="UTF-8"

This issue will get solved by installing clang in host machine.
Regards,
Ankit
On Sat, Oct 27, 2018 at 12:42 PM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Hi,
>
> I have wrote a recipe for cmake based component, which has
> dependencies on clang-4.0.
> I have cloned meta-clang layer which includes clang-7.
> I modified and included clang-7.0 in CMakeLists.txt, but facing same
> issue that clang not found.
>
> Any suggestions?
>
> Regards,
> Ankit

