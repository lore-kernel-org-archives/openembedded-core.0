Received: from mail-ie0-f176.google.com ([209.85.223.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U5okQ-0008Fg-UJ
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 03:40:41 +0100
Received: by mail-ie0-f176.google.com with SMTP id k13so2615080iea.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 18:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=pE7coSvRcxWHS0WNd0+d19faF1mORQyP/v2Rgz1MxmE=;
	b=yPicfLxCIaYL6cuppz7LldBd2cP+xlY6FPXBkHOI6Z4UbKavRE2E59Wwfm1Z/QyPbu
	bner1/lkCvk3o/VSmSdmm0T/hnFttoMa309zMUiWZlApcqIOA2aSmDAok4nAHm8Y7kqm
	BOCN1PRWQ1cieI3Anx7AQiBVvTsHkab5U61pinDWqtsMvlFbRaO4TMMhVQ64uwJCSZLc
	0cS5yTwrnltMuLyrHHqiNtTzl8uCLYLMPkkGdD8OZiyNrc+t6eb7w7fIVIyij1El7yh2
	yWGfUkO/RJx/HMk2IBIdq9vInd1K6MUbrpiV+GFSSckxsfv1/1kmv1zyVbUblkzfhMKj
	2Puw==
X-Received: by 10.50.56.141 with SMTP id a13mr16148878igq.24.1360808668708;
	Wed, 13 Feb 2013 18:24:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.13.204 with HTTP; Wed, 13 Feb 2013 18:23:58 -0800 (PST)
In-Reply-To: <1360777925.4246.86.camel@phil-desktop.brightsign>
References: <1360690970-9432-1-git-send-email-raj.khem@gmail.com>
	<1360704254.30425.67.camel@ted>
	<CALbNGRSiit5QwsYsrAbWhGQUzgCYYjScUdZPuoBxCDRDgOKbgQ@mail.gmail.com>
	<1360777925.4246.86.camel@phil-desktop.brightsign>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Feb 2013 18:23:58 -0800
Message-ID: <CAMKF1sr_L9s_Be9qT+r-iBX0MfUEarVZ2skJt1sdiFART3-=6w@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd.bbclass: Introduce do_install_append and use systemd unitdir
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
X-List-Received-Date: Thu, 14 Feb 2013 02:40:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 13, 2013 at 9:52 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2013-02-13 at 00:55 +0100, Andreas M=C3=BCller wrote:
>> Copying similar code in in tons of recipes is easier to maintain?
>
> If the code that needs to go in the "tons" of recipes is just:
>
> do_install_append() {
>         install -m 644 ${WORKDIR}/my.service ${D}${systemd_unitdir}/syste=
m
> }
>
> then yes, this is easier to maintain than a mechanism that magically
> fishes out files from the workdir and installs them for itself.  As
> Richard mentioned, we have previous experience with this in the form of
> binconfig (and there have been others in the past) and this sort of
> thing has universally turned out to be a maintenance headache after a
> while.
>
> There's even a comment in the code you quoted:
>
>>> +     # ensure installing systemd-files only (e.g not avahi *.service)
>
> which suggests that some poor soul has previously found that it was
> installing things it oughtn't to have done.
>

I have dropped the idea of having append and taken the pain to add the appe=
nd to
bbappends I think as systemd gets adopted widely I think the packages thems=
elves
will start providing systemd support and then we have to start
dropping them one by one
so if they are per recipe then its easier.

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


