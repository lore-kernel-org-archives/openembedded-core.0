Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5C00E6102D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 19:11:04 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id gd11so1845142vcb.19
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 12:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yFLhIN762zOhN3tqUvh+IOQP1kdnb1uc8Kt1irGvf8w=;
	b=BOpjcCPFL8OGYtchlv5YryaGAefgzjonemgbsQobwcjhIZCVRQNcqBsRq2Ge3QTGCx
	oMi25JZCI3ZyL6MNcPrNKFlrNvJRnVxvM34TKnWD6V+XiVLD9oBftUi3ZOJdrmTchE3Y
	e+SXJ8YzLc9dyblVwa1+gK8b32eNvm+PVies3Svj1uvtFup7PORxLodupcAKE+gAJSrB
	KeXTasV22BunEqCXL7pxtHxhDzSReX7xKpzDILPcUKTXKQs3JoGc5h99iGKqh8laDQhI
	4PwBF25lkZmSuOFLw0ItjvzMpalECsD/ya4KkMdQKosht5bIivsezRZbxfFdPHoQMG08
	R5ng==
X-Gm-Message-State: ALoCoQkQZ6ivElMqGBEsEHR1y3z5/l2/E1xzycqSbIrAeLrl4JVtdzfzSTIGkXZlhditQLc0KOPn
X-Received: by 10.52.107.134 with SMTP id hc6mr14894167vdb.10.1379185865711;
	Sat, 14 Sep 2013 12:11:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Sat, 14 Sep 2013 12:10:45 -0700 (PDT)
In-Reply-To: <CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
References: <1379114920-23851-1-git-send-email-jslater@windriver.com>
	<CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 14 Sep 2013 20:10:45 +0100
Message-ID: <CAJTo0LazMZXn9bajiMwNhAPiQiry4onu3iZfHws8XKb=sb1BJQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Joe Slater <jslater@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkit-gtk: limit ld memory requirement
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
X-List-Received-Date: Sat, 14 Sep 2013 19:11:04 -0000
Content-Type: text/plain; charset=UTF-8

On 14 September 2013 05:35, Khem Raj <raj.khem@gmail.com> wrote:
> It does not come with out a price. Have you measured how much performance
> degradation it brings in ?
> We need that to assess the trade off and also describe the machine
> configuration where this option is helping

Agreed - there's a bug which is tracking this from Kai.  As far as I'm
aware the failure cases are 32-bit hosts (3GB limit per process) or
64-bit hosts with limited memory.  I suggested that we benchmark with
and without this - if the performance hit is measured in seconds then
we can probably enable it for this recipe out of the box.

Ross

