Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 550E16C13D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 14:56:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44PY0h3Bqkz5c;
	Wed, 20 Mar 2019 15:56:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553093812;
	bh=b/FJ5kaNPdvK86NZo3tEnFbvSjqTEaJU9O2BAuh/o6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPMQbDilMLUbR/qvFX4mn7EfO2MTBOf1/5nE0TRoRTVTYxtYlmaeHcEnAoj+2GjnX
	WG0hqvVvrJvKfWvZl/3/ufkeIyhVrpIk+8hUaVIwz8DcTYJNXCKATugfmCZKt71iix
	J7fL56z4c0XZcIBuD90QXiAB6TVeP+BMPxBV5+nYBZzaA0ED0pVbns0pvqr3MVEF9D
	Sl7+dfde32rr6BEp/TfM3gW6kG2Q+yY9fcT4rc551d3GHt8M3jzebsydh8ZdaJLIEI
	2W1/fbmsUNnozyUl/XLu81QBVWiQf0uzXOS/BGbEjw9DeL6iYTvztjhH/Cgo7JAs0r
	yHHxYT/6NyLTblpwCGKsqZyROkw8yMncVABSF9FfNLkw469wXb96kLQY/cKaEx5mJD
	H4ZZbInMoc6zBQGkfRkiJoDA8YXbCn20/ynfpbwiL/0TBgRa9gHihujI409nvCDIyN
	IxOSDHvVU9twP7/bWwdr25p6/sFCmrha0SI//VZFvcWyHlLpkBuU9FcK8pcG/LFsUe
	5MUQMtE+V0K1nPX5sPG4wJKvNQqwhNudXzywcR+OJwSDpXcTDZg4T9zZUOfdNR7HT8
	QkOC3h/Ikrb4g2YOj8FXbSS0cqy04dMuRqvyR6b6KObW/SFLwuvgSmu8bVgH+Gucm2
	+9aB0FpzhpGtTvT9w52Oh0XQ=
Date: Wed, 20 Mar 2019 16:56:50 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190320145650.GA31018@localhost>
References: <20190320140929.24410-1-bunk@stusta.de>
	<6682ab95-b029-e881-43ee-59d3f7cfc174@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6682ab95-b029-e881-43ee-59d3f7cfc174@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: Upgrade 9.11.5 -> 9.11.6
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
X-List-Received-Date: Wed, 20 Mar 2019 14:56:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 20, 2019 at 07:35:53AM -0700, akuster808 wrote:
> 
> 
> On 3/20/19 7:09 AM, Adrian Bunk wrote:
> > Copyright hash changed to to year change.
> 
>  You are missing one of the more important bits of info that would help
> make the decision if this gets into M4 or waits until after 2.7 releases.
> 
> Go look at the 9.11.5-p4 release notes.

What part of the release notes are you referring to?

And why are you talking about release notes for a version
that is neither of the two versions in this upgrade?

> Did you double check this is in line with DHCP?

What kind of breakage exactly do you fear?

dhcp still builds and I am staying on an LTS branch of bind.

> - Armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


