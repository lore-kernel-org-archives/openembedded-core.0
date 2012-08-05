Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sy4qf-00020O-QQ
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 19:42:41 +0200
Received: by eaad12 with SMTP id d12so626350eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 10:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=KauMc3mp3KaWORPM6i3OrGThgsooKFigYS6MZl+axHE=;
	b=ev3IVAzmqIZ3/g9Z+lXm4osBuUA8lBZW9kQLDBjhcqStlgO2jWx0XrP/d7OG6qaCMp
	DXfuoPUbRCc2U0XdYWgUtyW8hRv25wHLHvAk/1AE/c/NO3RpDz/k6LsqgAsBliGBeuzs
	DgnMRG5xY5EJ8PnPY/sRAmSMWi9B4+150xCxL7LhgbdbtlMfh1b2YBIOos49xtfFxftp
	GRYxVT+DhO53C4wQA/QPf3oY5xaeowjNu61BH/fUMMhhOjinwR/NgpUrvKtQOEMhO/nw
	k8MbdYO7x+ndTXMafUcB6muF2DPZNygLzmIvDS3dwMg6IvSqVbn/FUVV88a7hKBSDnZc
	cWGw==
Received: by 10.14.202.69 with SMTP id c45mr9837194eeo.4.1344187858263;
	Sun, 05 Aug 2012 10:30:58 -0700 (PDT)
Received: from [172.20.0.2] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id h42sm41023392eem.5.2012.08.05.10.30.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 10:30:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <501E9EF3.2020208@gmail.com>
Date: Sun, 5 Aug 2012 19:31:00 +0200
Message-Id: <A35353F6-FFAE-481C-9C36-F38CE110284F@dominion.thruhere.net>
References: <1343942157-15997-1-git-send-email-yao.zhao@windriver.com>
	<501D7090.2040500@gmail.com>
	<EB05DE7F-A81E-4CF6-BD49-F93604EA1EDF@dominion.thruhere.net>
	<501E9EF3.2020208@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQlCuyxUPeN06vg3xCuSs1vgw4wIZo6kosEBTdv+1x5ZwUmqqofwaYsQdFszGo8HzMTyEUN9
Subject: Re: [PATCH] gstreamer: gst-ffmpeg: fix build issues for libav
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
X-List-Received-Date: Sun, 05 Aug 2012 17:42:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 aug. 2012, om 18:27 heeft Derek Buitenhuis =
<derek.buitenhuis@gmail.com> het volgende geschreven:

> On 05/08/2012 7:52 AM, Koen Kooi wrote:
>> I find it a lot easier to build gst-ffmpeg against an external libav, =
that way you don't have to jump through all these hoops to get a proper =
libav. That's what the meta-oe bbappend does :)=20
>=20
> I've always wondered why Libav was not its own recipe.

It's been in meta-oe for ages. I guess we should move gst-ffmpeg (which =
is called gst-libav nowadays) into meta-multimedia together with libav.=


