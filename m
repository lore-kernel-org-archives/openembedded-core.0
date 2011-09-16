Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1R4dRs-0003xe-AX
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 20:47:40 +0200
Received: by gyg8 with SMTP id 8so6528276gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 11:42:26 -0700 (PDT)
Received: by 10.236.197.104 with SMTP id s68mr17644000yhn.20.1316198546758;
	Fri, 16 Sep 2011 11:42:26 -0700 (PDT)
Received: from mail-gw0-f41.google.com (mail-gw0-f41.google.com [74.125.83.41])
	by mx.google.com with ESMTPS id m10sm6368585ang.12.2011.09.16.11.42.25
	(version=SSLv3 cipher=OTHER); Fri, 16 Sep 2011 11:42:25 -0700 (PDT)
Received: by gwaa12 with SMTP id a12so4003195gwa.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 11:42:24 -0700 (PDT)
Bcc: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Received: by 10.150.183.4 with SMTP id g4mr2820977ybf.40.1316198544600; Fri,
	16 Sep 2011 11:42:24 -0700 (PDT)
Received: by 10.150.95.3 with HTTP; Fri, 16 Sep 2011 11:42:24 -0700 (PDT)
In-Reply-To: <084F6773-2D94-45C1-B359-24DBE2F1C3A5@dominion.thruhere.net>
References: <1316196859-2561-1-git-send-email-jdk@ti.com>
	<084F6773-2D94-45C1-B359-24DBE2F1C3A5@dominion.thruhere.net>
Date: Fri, 16 Sep 2011 14:42:24 -0400
Message-ID: <CA+T6QP=nKGeS0qhRo66ZbkPH4y_+J8y3RJMQY6eUNavZ6oVhsQ@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
X-Mailman-Approved-At: Fri, 16 Sep 2011 22:18:07 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, beagleboard@googlegroups.com
Subject: Re: [PATCH meta-ti] linux-3.0: use die-id for BeagleBoard-xM eth mac
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
X-List-Received-Date: Fri, 16 Sep 2011 18:47:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 16, 2011 at 2:22 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> please follow the README when sending patches, this is the wrong list

+angstrom-distro-devel

corrected my typo of beagleboard list name

oe-core list moved to BCC to avoid additional follow-up

>
> secondly, use the patches from the export/ directory, they have much less cruft in them

Should I include the bias patches that are there now?  I'm not sure
what cruft you are highlighting.

>
> Op 16 sep. 2011 om 20:14 heeft Jason Kridner <jdk@ti.com> het volgende geschreven:
>
>> Also removed broken ULCD driver and fixed a potential issued due to the dropped
>> update_mode function in omap_vout_probe.
>>
>> Updated ulcd patches with touchscreen support should be coming shortly.
>>
>> Signed-off-by: Jason Kridner <jdk@ti.com>
>> Cc: Joel A Fernandes <agnel.joel@gmail.com>
>> Cc: Koen Kooi <koen@dominion.thruhere.net>


