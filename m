Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T3u4z-0005ao-Ht
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 21:25:33 +0200
Received: by lban1 with SMTP id n1so168688lba.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 12:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=pU4stwI0BkP0+uPBSWtvFtdt0k42IZLPoPsJ/LTzAcw=;
	b=ViRhfZISRLj6vZWyzKJLE0ct7Nk0kQtGEKPXyXQitzWxhaMExw4nAgJDFVr3UPPYHT
	auuFXstoMyMEAAbCvOiNR2sQX7xlSDwheqlLelh3c3OIqy2NyjKOrcBy9PtFsd+8D5l3
	GA6IIHnh6LEpTQ5VTC4zA70P/U1G0AbaxsaHNF3khLCwFAFHSn3u773ops03eUCe74rM
	r/odlo4s3PhXjCQ7InxiXlvrFIDZ4C/yaY296fwWH4rDo7CsKgWf7w1tQLFi1Nm9qflF
	meYEMYozC03A/6GjYzVI1/Dj1Kn36V9a5pfI3imviI9ZwT3Iq3YyEgKdp4N39qouehZY
	tgGw==
Received: by 10.152.113.68 with SMTP id iw4mr18646164lab.50.1345576409470;
	Tue, 21 Aug 2012 12:13:29 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Tue, 21 Aug 2012 12:13:09 -0700 (PDT)
In-Reply-To: <CAEsOVNdFLhWft6kK-vY47DC7YHRxc1CUdgNgo-9LkdR2fEcvHw@mail.gmail.com>
References: <1345566017-15508-1-git-send-email-msm@freescale.com>
	<CAMKF1sp2eYPuaU0yF-BBX9DNjPHwFjfOknLen10gog1n3spDfA@mail.gmail.com>
	<CAEsOVNcX=DeAbNpcMPP_sZPzgqN+uKksgodhS6-fTGAaZkLx9Q@mail.gmail.com>
	<CAMKF1sphgACT00prBya6svo_dbcV2hOGdj1ACk1hVUyEvqtNEQ@mail.gmail.com>
	<CAEsOVNeFeP9DTnsZhOBT1Ntr3P7Maw_UJmnVAL6c0D1Cu17W1w@mail.gmail.com>
	<CAMKF1sqAvkE=TM3KeAdW3DjaPWpDi6=8ZAGpOgBDHR7hXDwsug@mail.gmail.com>
	<CAEsOVNdFLhWft6kK-vY47DC7YHRxc1CUdgNgo-9LkdR2fEcvHw@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 21 Aug 2012 12:13:09 -0700
X-Google-Sender-Auth: z4KrrtrmnfzQXXc0eXADDCrHi3g
Message-ID: <CABcZANkRkduAEgBmG-nooaw=XEsuw_-eLbJVfgFKyiusxjwT0A@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kmod-native_git.bb: fix builds for hosts with older libc
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
X-List-Received-Date: Tue, 21 Aug 2012 19:25:33 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 21, 2012 at 11:47 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>> #ifndef O_CLOEXEC
>> # define O_CLOEXEC 0
>> #endif
>>
>> and be done with it
>
> Well this is seemingly the same way of doing it, just looks like you
> always want it applied? I don't think it should always be applied.
>
> If this was it takes to get the build fix in, then I will do it...
> please confirm what will be accepted.

No, on newer systems O_CLOEXEC will be defined, so that #ifndef block
will never be entered, and there'll be no change.
-- 
Christopher Larson


