Return-Path: <sakoman@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD04621CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 12:58:42 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id l20so5927769oag.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=/AwC8W1u+I8sbnMI81N7B0PkJxNAi6tTI9OMvPpCFxA=;
	b=I8DaCi4TncMIXSOK/q/crJMXRf6mmyxXDr3K/D9TQ/a4iAp4qgaw38cvkEXJTiZCWJ
	ShQ2tiNXIBvio0FdlVk2rbZjNb8fkXUfpN9YS5nopa1uQgsZbyZVYklYdiPzka1YU/Qq
	4+/QXSzyZz3IQorroBDwh3uC/9v8qMQImQVWlCN3/7vZJI6hpavghjDkFgMarS20WPCI
	4K0pUfb26PTcw95knv//8BzFz2jd6T+uBApeqQLO+Wj4KdIsIj0ltvGe7szK7uc3dzNS
	mCLiuaRGUggSxKEWh72UTNX7lqRUJDRj65665RAN8/HqJq1SDx1Fl/YG7OxuISG8Z1iA
	xbmA==
MIME-Version: 1.0
X-Received: by 10.60.51.234 with SMTP id n10mr7670464oeo.103.1370869122964;
	Mon, 10 Jun 2013 05:58:42 -0700 (PDT)
Received: by 10.182.213.130 with HTTP; Mon, 10 Jun 2013 05:58:42 -0700 (PDT)
In-Reply-To: <20130610094536.36e83ecd@e6520eb>
References: <CAGDS+nnQjF9P9s61--FW+_1gs_-qbcugmKt7-xd2i6gwkVFpRw@mail.gmail.com>
	<20130610094536.36e83ecd@e6520eb>
Date: Mon, 10 Jun 2013 05:58:42 -0700
Message-ID: <CAGDS+nmZVx2Jg3+DDhn_-zQytwzBOsKNREFNXF=GgFBn_7pnDg@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qt4e-demo-image with meta-fsl-arm: successful build?
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
X-List-Received-Date: Mon, 10 Jun 2013 12:58:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2013 at 12:45 AM, Eric B=E9nard <eric@eukrea.com> wrote:

> the strange thing is why do you get a X qtdemo when building
> qt4e-demo-image ?

I haven't begun debugging yet, but I had 2 initial thoughts as to why
the X error message:

1. The qtdemo init seems to be written to support both x and x-free
setups, so perhaps the init is getting confused
2. I had built the x11-free version of qt prior to the qte version, so
perhaps that causes the issue

I started a clean build just in case #2 is the cause.

Steve

> I've launched a build and will test on my imx28evk asap.
>
> Eric

