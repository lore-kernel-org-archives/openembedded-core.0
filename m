Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UcEkv-00023a-Nt
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 14:55:05 +0200
Received: by mail-vc0-f180.google.com with SMTP id gd11so455432vcb.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 05:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=1eJY4p929umygfNAZOfiX9ozmabHz/H1oDsjocA9D1Q=;
	b=MziFCy7Syfm1xUFI6a0IbF9bx+juGfmsR4rVU8h/+WHK/aoBLLDsnhcMmarobBlEG9
	nHUOklnevG92392imGJAa3+04OjXmziXqPFo3oG+poszToP0uFqNNHRbq3UQevQilJWJ
	dzjn+4uaxqUyu7CQnG3XmvieLc6RL2yERYtPB6y5brrmnXv+mMjS0mwiTJ3bMoWdzUT3
	UEgXcwf6GwHAjEGpBc5T6swO+dChFKx7fr5Gyyz3/NRXCyENMasYIETQbpaFSrJT/Igg
	dAl2NRJRKJFstUjwdI0KHZezSS6xbI6yVLQVM5oNdwUY1YJvXYcnAaLIxmDEXHz2ydZK
	DJNg==
X-Received: by 10.52.37.196 with SMTP id a4mr18417548vdk.82.1368535010096;
	Tue, 14 May 2013 05:36:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 14 May 2013 05:36:30 -0700 (PDT)
In-Reply-To: <51922E4A.4020809@topic.nl>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518FB7F9.2020102@linux.intel.com>
	<1368384890.16243.79.camel@pb-ThinkPad-R50e>
	<3529451.hQA8zCVn47@helios>
	<1368442968.6920.4.camel@phil-desktop.brightsign>
	<CAJTo0LYSqikcyXKsXA5OpnUNmwbvrRqbi4kQ93r2QzBtEuo2zQ@mail.gmail.com>
	<5190CF63.2030303@r-finger.com>
	<1368456796.6920.23.camel@phil-desktop.brightsign>
	<51920240.3070408@r-finger.com> <51922E4A.4020809@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 May 2013 13:36:30 +0100
Message-ID: <CAJTo0LbsZmpF=wrhRHiBunkEyviguY-VxThLTM6=AOraAYkk8w@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQn2Ob4qZ2Rah9UvzBAJiqg4DbsZMPrrnk5JNAI+pwrRSR3U4y0fBiwDh8VFEFAhcRhg6DEO
Cc: openembedded-core@lists.openembedded.org
Subject: Re: libsoup missing DEPENDS
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
X-List-Received-Date: Tue, 14 May 2013 12:55:10 -0000
Content-Type: text/plain; charset=UTF-8

On 14 May 2013 13:30, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> I suspect libsoup-2.4_2.42.1.bb is lacking a dependency, I don't know what
> provides the "intltoolize" program though.

Yes, and it's "intltool".

Ross


