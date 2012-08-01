Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Swg9A-0003zS-Jl
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 23:08:00 +0200
Received: by ggnp4 with SMTP id p4so7072231ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 13:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=yCbk4FLKsL6Et94J2yG02tA2h16kkNYnJhah3wOgTkY=;
	b=VnqNONtIpaTIGnefZ1Pt4SSnBGRzg2pURMPRSKSbha07ZjoG8+4Bi3IEvgTtpEKWRJ
	ExN5z8IU1Sw9qUltilZ+XXKYzZGs13h+sKbNyxEGwYm5rYKPReGckE7XC5CvZOExIhIE
	pV3vnHsaTTZS8xLxlQDIpg0/Z7W+lqY2nJJsKnF55+IUVBOG5/W/TSRBfEDZ0MyPQvbe
	PDeteJ2VA7IgJ9W03es2xFiP+m1v1HM15sdabEBi1NJuEX5L1hC/+gy6zfxLPqnh61Yt
	AdLs2VCLed7YdFzsAmNL0fzTIFNYXcPJsSIevvyLwppwuy1CCPAX8NlsW0fbfgsaxnOG
	zRfw==
Received: by 10.50.94.166 with SMTP id dd6mr6635178igb.11.1343854580649; Wed,
	01 Aug 2012 13:56:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.50.34.200 with HTTP; Wed, 1 Aug 2012 13:55:59 -0700 (PDT)
In-Reply-To: <CABcZANm3J06scGP2Tkde0amm8QXfJGamGydUTDmXC1t3BGxKgg@mail.gmail.com>
References: <CALbNGRTYa-2M-pi0d+oBvT+z81kTi8j9VM4gK=iiUDfBSQ7N9A@mail.gmail.com>
	<CABcZANk2SzKKcXTdU0MLUeXwOWSxq4HqJceMPO6tOLP3M_GejA@mail.gmail.com>
	<50198091.6050001@windriver.com>
	<CABcZANm3J06scGP2Tkde0amm8QXfJGamGydUTDmXC1t3BGxKgg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 1 Aug 2012 13:55:59 -0700
X-Google-Sender-Auth: 0yceAVJNES4IDmIicQ962lcpc5w
Message-ID: <CABcZAN=t_q0HBqwPpzMqBP6ZSDiMH57y5OU5dRetc_6zPobvDw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: number of tasks increased since last update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 21:08:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 1, 2012 at 1:06 PM, Chris Larson <clarson@kergoth.com> wrote:
>>> I just went to build core-image-base and saw it building crosssdk
>>> stuff -- not sure if it's related, but thought I'd throw that
>>> datapoint out there.
>>>
>>
>> do you have the updated bitbake?  Prior to RP's changes about a month ago,
>> the task / dependency resolver was unable to resolve things on a per-task
>> basis.  So any task within a recipe triggered the resolver to build
>> dependencies.
>>
>> The SDK stuff adds dependencies only do the sdk task.
>>
>> With the current head of tree bitbake, I have not seen a revert of
>> behavior... the SDK items only build when triggered.
>
> Bitbake commit e49a656a499355a5c6e7eb00bf5b8f1795e8dddb, which is
> current master.


Nevermind, it wasn't any of the populate sdk stuff or anything, it was
the lingering dbus-x11 w/ nativesdk thing that hasn't been fixed in
master yet. I forgot to add the local workaround, so it ended up
sucking in everything needed by dbus-nativesdk.
-- 
Christopher Larson


