Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBW9f-0001f6-Sc
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:29:52 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:17:19 -0700
Received: by obblz20 with SMTP id lz20so1362622obb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=CI3JbveLUbzEEXDBlD3lXnD+ABfgo1D2OG/QpGs6tMQ=;
	b=TabJy4aWgq1Naxt2qzXaTjCdqqSXqN8hiWKt4gY+5nKM1yzYmuB9aMXnrb2OcZs5BB
	uKvhBY151uTEUP6BA1/hjjQdTGmODQ3pOYdUnKvHaPJ3RJIVAfeIDWOnjmG4AlEguEvl
	KuzCq9t5muz6ArvDz5l7Sey9fu57Piz8ILi/3LdFZTLdwWziTh28jPSRmCO+g21UnVSG
	u1eRSzANPRuccep6hIwMUwCJoQVAYnkOTzEhrYe2exsOUtwHm6sqhUul4DX8JeWwgK20
	e1UvxHlsPA74oW/1X/dgZpaVGRzalyJUwpUlgMUJpouggeWzTeBIaIoyzCnDVx+jVUry
	FEEg==
Received: by 10.182.124.102 with SMTP id mh6mr19422219obb.48.1347391039179;
	Tue, 11 Sep 2012 12:17:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 11 Sep 2012 12:16:58 -0700 (PDT)
In-Reply-To: <504F8D62.8010508@intel.com>
References: <504F8D62.8010508@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Sep 2012 20:16:58 +0100
Message-ID: <CAJTo0LYf2C0PmrpMf3-RsUub1pQmN=G3f6Tt8ou6UNJ-8NoJKA@mail.gmail.com>
To: Scott Garman <scott.a.garman@intel.com>
X-Gm-Message-State: ALoCoQkDbzfk6kkmMptnnGEK3gJdug1bOqTaBbgdAuh4N2YR0Gu+AR2j4kEQkg/VDjsCwIPHpjYz
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Sato virtual keyboard - how to close it?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 19:29:52 -0000
Content-Type: text/plain; charset=UTF-8

On 11 September 2012 20:13, Scott Garman <scott.a.garman@intel.com> wrote:
> In the Sato desktop, there is a virtual keyboard which you can bring up to
> enter text from a touchscreen interface. Once that keyboard pops up, how do
> you close it? I'm not seeing anything obvious.
>
> I'm helping out with a demo at a conference and could use this info
> urgently.

Moving the focus from a text field will do it.  I thought there was a
keyboard icon on the panel which should explicitly hide it, but maybe
not.

Ross


