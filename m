Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qquta-0005cI-OH
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 00:35:35 +0200
Received: by eyb7 with SMTP id 7so506603eyb.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 15:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VtAGRUxsVcLAcCs0MNvlddC70Jlvs0CJKWreVngfgPQ=;
	b=gk0sl3qBEoePWRiupVyeX2nifPAuXwq4M+o8AZ0uRw6dujuyl8/Hu87Z2nrd2XYNiG
	IjuVoTtV9nW+iXl1sDu79qvV3XPn9yw99PR8hvWjwuzP0nR1qibXGJNBCYv2Tx7YUnnk
	74yIwWe2RV4zZlbs8amaYNTnS79reMV6Jfl8g=
MIME-Version: 1.0
Received: by 10.213.104.2 with SMTP id m2mr948391ebo.15.1312929064792; Tue, 09
	Aug 2011 15:31:04 -0700 (PDT)
Received: by 10.213.114.20 with HTTP; Tue, 9 Aug 2011 15:31:04 -0700 (PDT)
In-Reply-To: <CAD=GYpZ=B3ieP=oOctGJook69b5C2pTmi8RwxLSVYKCi9uAibg@mail.gmail.com>
References: <CAD=GYpZadKJYSOxnhyMtJOWOjO2iX6tpaWrGGZPtcc4bYvzTtQ@mail.gmail.com>
	<CAD=GYpY1ki5Y_u0KFWf+TJBJxDoSzvpV7W2hXBC1XJqfhruOPw@mail.gmail.com>
	<CAD=GYpZ=B3ieP=oOctGJook69b5C2pTmi8RwxLSVYKCi9uAibg@mail.gmail.com>
Date: Tue, 9 Aug 2011 17:31:04 -0500
Message-ID: <CAD=GYpZ-5b5SU-203W1dFoT=PRvo8f-j-9OV++jbfkMbi72a2A@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: "Kridner, Jason" <jdk@ti.com>, "Kooi, Koen" <k-kooi@ti.com>
Cc: beagleboard@googlegroups.com,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: systemd boot hang
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
X-List-Received-Date: Tue, 09 Aug 2011 22:35:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 9, 2011 at 5:30 PM, Joel A Fernandes <agnel.joel@gmail.com> wrote:
> On Tue, Aug 9, 2011 at 1:59 PM, Joel A Fernandes <agnel.joel@gmail.com> wrote:
>> Just posted this on the systemd mailing list.
>>
>> It seems that I didn't go through enough testing on the
>> systemd-gnome-image built by OE. The success I reported with boot SD
>> card instead of over NFS was just a got-lucky case. So SD Card and NFS
>> alike, the boot still hangs.
>>
>> Koen and others, could you try my image?
>> http://www.beagleboard.org/~joelf/images/Angstrom-systemd-GNOME-image-eglibc-ipk-v2011.08-core-beagleboard.rootfs.tar.bz2
>>
>
> It seems the rtc twl patch was causing problems so I've removed it and
> uploaded a new image [1]. Could you try it?
>
> Steve has suggested to apply a newer version patch but for the
> purposes of debugging systemd so I will try that, but for now I've
> dropped it.
>

Sorry, I meant that for the purposes of debugging the boot hang issues
we're seeing, I've dropped the patch from my tree for now.

Thanks,
Joel


