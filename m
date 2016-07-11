Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8A80B607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 15:15:38 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id q83so39498655iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 08:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H1dJuf+arzV/CwO4HTMuCx0e+7pNFo58aMOSvr95YrI=;
	b=WcF2WkvrnohKn92fvnxvmIu2kDRMZBqPINcj0711+bmzTGBmiyCHqAs092qAx3ETBS
	yDn5EC9j68pLl8YoLMOBPhyqwm21Zh0nAqlUzMN+QhWtLsvhyFRQ7VhBEyvpAGBZYEjW
	/PgWegW5jZwilvpAeaHdEZQlZspnC/4iCIAPiJjJqEqjU2SuCowzfpjBon8Grrb30TD7
	EdDBVAw9Va1h17QDCFCfg0Mv9gQG96tit8G0Ks6wKVsH+gycSkQDhrCP/7ZwTDRU09Gw
	CuA9WTd0NtUYa0ioemLkK8LRBw0na1VPZEyudohpIB+nf5JIFT7hgQKsjY02SLHdSQSl
	QCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H1dJuf+arzV/CwO4HTMuCx0e+7pNFo58aMOSvr95YrI=;
	b=D9oRkSBiQ+e6Lt/Q2zVsjXyWcyAjgAwh1PaN1KUPCPWlR0h+sT92S0GV12ya/norjB
	jW3MZ+fYBWonSjDldMctntgQCvqOehvRwJo/iQWJS9u+HaUaaha5yCzNJL3nJG9SWECO
	jAQTAi/7OUxcpTOeBvCPR9fdQMIToj8yBwrKxc+ehimxcNoFyb7IdMzlg/m8wkXb7TQP
	lcHhheEeYDtMu1BlJnCoSaTRIvNW2CYwMfFkP5ccC6jWYhF36h90Grl729stxlEi3Dl9
	QJC0+MU38o45SEC1nmb/VyMs8KCbKO8rN2FUGzgm9sM5GAhtH6y2VsyrvQH1xospIvaY
	Afhw==
X-Gm-Message-State: ALyK8tJiMD1Q7gTQCU2yLkKvyL8JuuXTGRcAaJG71/qeTUXVvnlEz5SgD+MGAtPhVleewvLhTlP4aBI9T/ysutWS
X-Received: by 10.107.135.142 with SMTP id r14mr9916848ioi.133.1468250138872; 
	Mon, 11 Jul 2016 08:15:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 11 Jul 2016 08:15:19 -0700 (PDT)
In-Reply-To: <1468249814.17048.1.camel@intel.com>
References: <cover.1467378176.git.patrick.ohly@intel.com>
	<25bb70f088ffb603e1f389b7657c1fbf3f2871bb.1467378176.git.patrick.ohly@intel.com>
	<CAP9ODKo=BAgtk8iUbSgcOVh4+uVW-SBuEri6f8MkRH2qXfpVSw@mail.gmail.com>
	<CAP9ODKrNecB=hRAkFb-LL4TcTc9XXw=AmKu-efdjPs3PKDkY1A@mail.gmail.com>
	<1468249814.17048.1.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jul 2016 16:15:19 +0100
Message-ID: <CAJTo0LbfB=xCAAVAxVavARwOUCp+Vrk=7_+Rk7bPBqrqeN6TCQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] meta-ostro-fixes: initramfs-framework: add retry loop for slow boot devices (like USB)
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
X-List-Received-Date: Mon, 11 Jul 2016 15:15:38 -0000
Content-Type: multipart/alternative; boundary=001a113eccbcf82f4a05375d9fe6

--001a113eccbcf82f4a05375d9fe6
Content-Type: text/plain; charset=UTF-8

On 11 July 2016 at 16:10, Patrick Ohly <patrick.ohly@intel.com> wrote:

> > I noticed this has been merged but my comment here was totally ignored.
> Why?
>
> I can't speak for Ross, but perhaps he felt that it was already a
> worthwhile improvement. I wanted to address your comment (and still do),
> but didn't find the time last week. I'll do it via another patch now,
> okay?


Because I managed to remove it and then reintroduce it with a subsequent
rebase, my fault entirely.

Thanks Patrick for offering a follow-up patch.

Ross

--001a113eccbcf82f4a05375d9fe6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 July 2016 at 16:10, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; I n=
oticed this has been merged but my comment here was totally ignored. Why?<b=
r>
<br>
</span>I can&#39;t speak for Ross, but perhaps he felt that it was already =
a<br>
worthwhile improvement. I wanted to address your comment (and still do),<br=
>
but didn&#39;t find the time last week. I&#39;ll do it via another patch no=
w,<br>
okay?</blockquote></div><br>Because I managed to remove it and then reintro=
duce it with a subsequent rebase, my fault entirely.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Thanks Patrick for offering =
a follow-up patch.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--001a113eccbcf82f4a05375d9fe6--
