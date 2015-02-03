Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id B0F6C6E678
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 12:53:50 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id z6so18388058yhz.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 04:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=DaRabO7xv5fUCUnCYuacGWt3jqtyNKnB6WAUM1hF+98=;
	b=lHEREVnqFG+MDRTSjOqb6ZjlIviZI40nGXL5s1VFX3UDGulDdzgxU8Lxg+aLXbe0zM
	CH5xX8iYiBizd6kT8HThTZJzHDs0uMwraTZcpIbm2MSSvaBR7X9Pr1kULxnPnYUvKrFG
	kNG9bz51PoiNO3StAcgTJ9WFaFCjmswsWC97hfYoZgW4ED+GhPHj6czY4bKB6bagzl44
	D7SzFVCSHSbZObfO4XBlhhWETP3qfCDLVEq8pECUseiklXSihKI3u6oA37zOil8Jr7mI
	bnnZhMFu/o7pdiFsETPkOISI0v4K92Wak0hePfc1YwJXq4uBOreO0O5gd9x/xVVkqLed
	Ls8g==
MIME-Version: 1.0
X-Received: by 10.236.109.168 with SMTP id s28mr9637828yhg.67.1422968031859;
	Tue, 03 Feb 2015 04:53:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Tue, 3 Feb 2015 04:53:51 -0800 (PST)
In-Reply-To: <54D0C433.50705@kernelconcepts.de>
References: <1422873041-19803-1-git-send-email-florian.boor@kernelconcepts.de>
	<CAP9ODKrSVAaspV7pv+s-eVuhjf3ptFuO-+qc+johEYQbpGaPFg@mail.gmail.com>
	<54D0C0B1.1090500@kernelconcepts.de>
	<CAJTo0LZxw5LV55fi9QA6X=vgM4UrZ-LtHXqp2KuMEVmGffgNiA@mail.gmail.com>
	<54D0C433.50705@kernelconcepts.de>
Date: Tue, 3 Feb 2015 10:53:51 -0200
X-Google-Sender-Auth: 7bt01qHY_vyu-ziaQwE3ONp_iN0
Message-ID: <CAP9ODKorL58Y=bAxv39bz+CFBmJqxbtxtgZbA92=8q8nHL2Mow@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Florian Boor <florian.boor@kernelconcepts.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Use bb.warn instead of bb.error for deprecation notification.
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
X-List-Received-Date: Tue, 03 Feb 2015 12:53:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 3, 2015 at 10:50 AM, Florian Boor
<florian.boor@kernelconcepts.de> wrote:
> Hi Ross,
>
> On 03.02.2015 13:40, Burton, Ross wrote:
>> bb.error is fatal, so it's all good right?
>
> last time I checked (some days ago) it was not necessarily fatal. I was able to
> build complete image collecting a pile of PR_INC errors. That's what confused me...
> I'll check if I still have the log on another machine later.

Florian has a point here. We should use 'bb.fatal' and abort all build
as soon as possible.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

