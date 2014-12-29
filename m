Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6AD65CAF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 18:23:20 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id i138so25401729oig.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 10:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=6JU1wNoS+UsL5Tdx3mVh0b4I8ZrvsMKti5M4/s47Xl8=;
	b=ZQV+rRJ2WBRD8NgLFp7XHj0vJqc+ZkZ7aTFJq5+lt5dmV4VDRT+4oUdd6UDUO9VAre
	ScXBfIFE4zivxa2qBiGjoKD1mNkctDQajA0zMjL1GvP6+7n6nzChQeZ2WSxMY1W1hYXJ
	lpmx8YzJZF9WtSSrghuhxydbY2eVGoMMRCtJuy5rRxA1+v6dtt5DxVv5FgZe3qOrKbHt
	nn1WMzrcF1KE2HM3YpcCMLv9049F7wDSL8YlwmFj6WF02zvUqs6zttQNa5m+54CDSK3F
	Ghze2m5RwQ6sEZWvxcPUohPSp72tS/QudgrhTWm60/ele2wudFKEaDiPCnTZHcq6K/jS
	hNZw==
X-Gm-Message-State: ALoCoQm6ZpYw0jM9v3UNEY/GD/rabbV+Bbt7derPazxGrbhztOAkLSTzPjwpZB9G7hwZKi72FhfO
X-Received: by 10.182.86.100 with SMTP id o4mr26703254obz.51.1419877401313;
	Mon, 29 Dec 2014 10:23:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.116.130 with HTTP; Mon, 29 Dec 2014 10:23:01 -0800 (PST)
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28EA001E0A@EU-MBX-03.mgc.mentorg.com>
References: <1419846408-31247-1-git-send-email-awais_belal@mentor.com>
	<CAP71WjzrFn=W8QYoDQybKyLxEpi4zL6yN8xkFZK=ze-6YZ_rLw@mail.gmail.com>
	<2021B186DC632746BD5A3CE32F12BD28EA001E0A@EU-MBX-03.mgc.mentorg.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 29 Dec 2014 19:23:01 +0100
Message-ID: <CAP71Wjxf0KjvqZZtnn+T3DMxGpDGSG6BnoCGfb_0V-GA4R9x0Q@mail.gmail.com>
To: "Belal, Awais" <Awais_Belal@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-omx: use mulitple SCMs to fetch submodules
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
X-List-Received-Date: Mon, 29 Dec 2014 18:23:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2014 at 1:55 PM, Belal, Awais <Awais_Belal@mentor.com> wrot=
e:
> Hi Nicolas,
>
> I sent this against the omx package only because I wanted to see if there=
's any feedback on this for improvement or anything that I might be doing w=
rong. If this gets accepted I will submit updates for the other gstreamer1.=
0-*_git.bb recipes as you've correctly pointed out that they suffer from th=
e same dilemma. Doing it through a .inc wouldn't be a good idea because the=
 dependency from one package to the other lies not just only the package bu=
t the exact rev as well so it should be done in this way for all in my opin=
ion.
>

right... sorry, i missed the discussion from last week... that's the
problem with vacations ;-)

so, the changes look good. i have a branch with gstreamer 1.4.5
updates which i am testing at the moment, i will send the patches
later this week.

> The SRC_REVs will obviously need to be taken care of when an update is ma=
de but I think this is the way to go.

sure.

