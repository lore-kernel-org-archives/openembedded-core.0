Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1RGKhM-000779-7x
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 03:12:00 +0200
Received: by ggnq1 with SMTP id q1so1174300ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 18:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Y5kDtzRMgiJX3weSyo11Fxtz57/LED8ijU7enJfsLoM=;
	b=GoYRVzRwQt2JMReDd5dw90a9NhzURY6zcXmWp0yijFa04i/ZHfZSwnGKvYBdzy5UC9
	S3XPBc+njSkUOia9UT/tOprNr85dXWv+WVIEXBCHMMJHoldG77wMtZ0vQ+kWNbS0d3lt
	Ga721BNLY1GEzJyalQYPVO29fsu9jrqs4IKGU=
MIME-Version: 1.0
Received: by 10.236.129.228 with SMTP id h64mr6973551yhi.101.1318986369468;
	Tue, 18 Oct 2011 18:06:09 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.236.209.97 with HTTP; Tue, 18 Oct 2011 18:06:09 -0700 (PDT)
In-Reply-To: <1AE11CCC-207A-4634-BFBB-E17671ADBA96@dominion.thruhere.net>
References: <1318966354-9188-1-git-send-email-cliff.brake@gmail.com>
	<1AE11CCC-207A-4634-BFBB-E17671ADBA96@dominion.thruhere.net>
Date: Tue, 18 Oct 2011 21:06:09 -0400
X-Google-Sender-Auth: SkA4Bhd3FXzhrk8xmN7fx9X9oRQ
Message-ID: <CAOd_LFwrEZvgzce7g6+qb2moQGNZsahamtLS+RGJE4vPS8grhQ@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] squashfs-tools: add recipe
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
X-List-Received-Date: Wed, 19 Oct 2011 01:12:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 18, 2011 at 3:54 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> The entries in this recipe are all over the place, could you run it through the oe-stylize.py in meta-openembedded/contrib? That should give you an idea on what goes where. The general rule of thumb:
>
> 1) things belonging to the same task are grouped together (RDEPENDS/FILES/pkg_postinst)
> 2) ordering follows task ordering, fetch, patch, configure, package, deploy, etc

Thanks for the suggestions -- I'll post a new patch in the near future.

Cliff


