Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4EC7FCAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 19:55:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47MHpP3330z4K;
	Mon, 25 Nov 2019 20:55:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574711757;
	bh=0CcJKU+C7zEsx3fEtVPTuCa+aoRt772QgOqbN39GhX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ri67B0/Rf8AGJ2j4RWVGx7KSue5tqHM7oRLW2n3qG6b+1ndzaaj21TMNoV5V+Pwcu
	FYBE32tAO3onGrEbd6s3TUcXvjUnVGTf2uAIjsVbxar2ZqlU9Z00gr3uny7bwybUFc
	YN22NsrcQ2g2hi0y1Tlmn0dr4WFAriJJC1KOd02zRvSttcMj8DDGxBdWqhPaDBDZY2
	DbOQ/Bb70p81p8oIPpJsCxRDyVru7D+31SEjovNc1YWKcU9dROQW8VEVfv1wazx0wF
	j0zlZXkK16Sfq0NRmpeaAJyFjfm3nkgGU+5mJg4S0m6zEo/RXVmdG5byQPMCc+o6Rj
	BeZWKQq5xJEeeF8ovuKcdLiQvuUennxJ+TgVTWR1DRJcmswJWvMTsBs2nXNMjTIZCa
	l2FgCsQer6B79J2lLBQ26FB4bUqPPmIxeaMiM4aGpRkGYkK2vxdmat1hJ6jyjdtOzF
	lyGTJDkqilZxD3QQzD87NgbVm6K5JcHrYsYcCyImI/IUwpY1upbq26odKHxMFEmgY9
	9G4evXEb4/7QjluYXDFyVxq6lvpOHvj4zMXFhMqFJLKTIuelmp2wvxMrc0KuLKrQYW
	4ALyzFWkhuL0gnAMH7o3JIaemd8UjgznGPQB8N4ANedq3fxECYpQ/o7lid3UE2xBcW
	/27u6sXjU9JboxidVplPnLUs=
Date: Mon, 25 Nov 2019 21:55:55 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20191125195555.GA31543@localhost>
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Mon, 25 Nov 2019 19:55:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Nov 26, 2019 at 07:37:48AM +1300, Ankur Tyagi wrote:
> Hi,
> 
> Based upon "thud" branch, I created core-image-minimal for am335x-evm board
> and resulting image size is very big (71M)
> 
> /lib dir is 39M and /usr/lib is 24M.
>...
> -rwxr-xr-x  1 ankur ankur *16537400* Nov 26 06:41 libc.so.6
>...
> -rwxr-xr-x  1 ankur ankur  *6416640* Nov 26 06:41 libm.so.6
>...

These sizes are the expected sizes for the libraries with debug symbols.

Are you setting INHIBIT_PACKAGE_DEBUG_SPLIT or something similar that 
prevents stripping of the target filesystem?

> Thanks
> Ankur

cu
Adrian

