Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy6XP-0003jR-9X
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 21:30:55 +0200
Received: by obc16 with SMTP id 16so1140684obc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=cpdHCYDHIwh5anUI6VMJgvr2Hn32PMBeD7KG7XmA/bA=;
	b=c2etiGAOr6YSBoV1TaW0MJPSbwnPF8uxKZBOyKdhe1DuXNlhp7SKTDnapsY0qoX7bH
	3oLZEan2LgIFuqhCu/m2qclXpsOcIuakGaeVKpxdKU/960J+CaLsTi4Ts7XMDFT9bckH
	JRLBmSRYsmr6lYB56afLfRyA7mhqrYKb4AEwIUt82NDoq6EESRuccM1BHCORFgQX6BB0
	Jw3w0DdsOpefib9U5mleUP+BFzPhznMBVnBtn8HYlbyMM16IqUUcIl8wCj9VmIa0erLf
	Wu1ekzSq6EYBxMmIKF20zlYRBMo2ubFr4s1uHUHkDPDORrHjErlpJAtmJaeP8nmbVled
	IwMw==
MIME-Version: 1.0
Received: by 10.182.146.46 with SMTP id sz14mr15486255obb.76.1344194351047;
	Sun, 05 Aug 2012 12:19:11 -0700 (PDT)
Received: by 10.60.33.129 with HTTP; Sun, 5 Aug 2012 12:19:11 -0700 (PDT)
X-Originating-IP: [188.79.230.198]
In-Reply-To: <CAMKF1sqcLBQo0JrDEGXfkRCFXRXQ+fr8C974_HBoMyOcZDR7hA@mail.gmail.com>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
	<CAP9ODKqyQ5HGMxWpzuDGE2XEdpm4pp0AuNM3Ld35u_N+3mPJLw@mail.gmail.com>
	<CAMKF1sqcLBQo0JrDEGXfkRCFXRXQ+fr8C974_HBoMyOcZDR7hA@mail.gmail.com>
Date: Sun, 5 Aug 2012 21:19:11 +0200
Message-ID: <CABxcv==etW8qh0Qk3m2jd092bG-9VD-CHJTObeqXtK9ZnKMAVQ@mail.gmail.com>
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn/siSKsxZJitp7Y+P7rIY4OK4Ql3+KX+9vRbpNnyX4sEbjm1dNgKD1/V2JvV+SXwiiD9W3
Subject: Re: [PATCH 00/30] cleanup: use variables instead of hardcoded paths
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
X-List-Received-Date: Sun, 05 Aug 2012 19:30:55 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 5, 2012 at 9:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Javier
>
> On Sun, Aug 5, 2012 at 11:16 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> On Sun, Aug 5, 2012 at 12:53 PM, Javier Martinez Canillas
>> <javier@dowhile0.org> wrote:
>>> Also, I didn't increment the PR on the recipes since the modifications
>>> don't introduce a semantic change on them.
>>
>
>
> thanks for doing this work. highly appreciated. However some distros
> use flattened tree meaning no usr/
> so for them it will be a packaging change. So as Otavio said, it will
> need pr bumps.
>
>> This is wrong; if the distro changes the variable value then it does
>> change semantic. Please change PR on them.
>>
>> --

Hi,

Thanks a lot for pointing me out this issue.

I'll prepare a v2 then with the recipes PR version bump and also I'll
squash changes for the same recipe as one patch.

Best regards,
Javier


