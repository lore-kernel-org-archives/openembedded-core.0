Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id BDC72605C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 11:07:34 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id u68so7223584qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 May 2017 04:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sqPjRfvz0894xf1PhsuxJCZQrkEAvogLbPf4FCmbrz4=;
	b=XHFnzIoYd7lTlzA94g7g5lXp0CWDkCtEVfBsEMUSIpvdkff8uO6YJmy1QUUg4c0eWa
	1QUqmBJBBZ1Ryhkwxke8Zm6G2OLZcgQ7aNXntBs3tieALcejMKSHd44CstM1GxcILoSz
	5UOk1JaC9vtj0thySWETG0I4Bd/Kr3iztleNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sqPjRfvz0894xf1PhsuxJCZQrkEAvogLbPf4FCmbrz4=;
	b=jk7mLFOl2ExeoIMSWIVR7fiu4S/alkycfo+VwiOMjyLJudtp+6zYIHfGXq3w8Jan0i
	g2qmJQJ76JunQloVPS0kK3eMOa2RunmhmNDwc26xgvA4VVubxK6W9Lxj5LEkD5eNpmoA
	2s8wrpBnqfHy/Em2BRKEGFd2JMduw9mXhShaVb1wW3UNO4WLcb6UK6FzZ8UFBxdqKi3J
	+2UiSwwXEug0HZFXOCEr3P/i1y5I6nF2Y+zNLUzW6Kqa2I58K9DHLQwOsNylJS+noMvY
	C97f7Vvxby/Q9oWZ02UbM/l0njrDrZbhDtmaY9MVtfNRKv0cvZ982pUovy1RmgTQhTMu
	rJLA==
X-Gm-Message-State: AN3rC/4NLo9YQnPub6iGCd5umlBaprYBleClDiw6xrObB4cO2RQJsrxb
	vYn5lx1QxK2dXKPJJdOjNrudr5nMRviF
X-Received: by 10.55.204.16 with SMTP id r16mr22047659qki.169.1493636855889;
	Mon, 01 May 2017 04:07:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.84.168 with HTTP; Mon, 1 May 2017 04:07:15 -0700 (PDT)
In-Reply-To: <1493635218.23535.34.camel@linuxfoundation.org>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
	<CAK18fxHF1dPOAXSwFwtS0s_vaMo5--t4QS2dq8pBwbDPdFDmbw@mail.gmail.com>
	<CAC+thW0rVtEFKKoJChwLjK-2=aMmZuW5vRufJ9iaFXJt6JiEAg@mail.gmail.com>
	<1493635218.23535.34.camel@linuxfoundation.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 1 May 2017 13:07:15 +0200
Message-ID: <CAP71Wjwwp9ca=4_V-U1NpnX+=5x1V82DS18FkxPAaL9qYknVow@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-members@lists.openembedded.org, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OpenEmbedded 2017 General Meeting
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
X-List-Received-Date: Mon, 01 May 2017 11:07:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 1, 2017 at 12:40 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2017-05-01 at 12:27 +0200, Andrea Galbusera wrote:
> >
> >
> > On Mon, May 1, 2017 at 12:02 PM, Andrei Gherzan <andrei@gherzan.ro>
> > wrote:
> > > On Wed, Apr 19, 2017 at 9:48 PM, Sean Hudson <sean_hudson@mentor.co
> > > m> wrote:
> > > > The board would like to hold a general meeting with all members.
> > > Under
> > > > the new by-laws of the OpenEmbedded organization, we can meet
> > > > electronically.  This will also fulfill the requirement for an
> > > annual,
> > > > general meeting.
> > > >
> > > > Planned Date/Time:
> > > > Wednesday, May 3rd, at 8am US-CDT(UTC-06:00)/3pm CET(UTC+01:00)
> > > >
> > > > Wiki page with full details, including teleconference information
> > > here:
> > > > http://www.openembedded.org/wiki/2017_General_Meeting
> > >
> > > It seems like there is not Edit button for me to add my username to
> > > the attendee list.
> > Same for me...
>
> FWIW once I'd logged in I could add my name to the list...


well, it's the same for me. In the 'view source' page, i can see this:

==
You do not have permission to edit this page, for the following reason:
The action you have requested is limited to users in the group: Administrators.

>
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

