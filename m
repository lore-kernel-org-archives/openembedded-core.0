Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SEzWA-0002kr-KC
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 10:55:10 +0200
Received: by wgbdr12 with SMTP id dr12so3003330wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2012 01:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ScuB91f7uThWK/ilpSmU7Q7aaE2EOUom669/pJ2ePJQ=;
	b=qg7mtdpLYtuCFzArROahzYhkSgQVAdugrioIIPc/fNb9RHUFWv+iSeQXZNyfaQnKJi
	FFfhj7emCPhxVkxpotFyIjQBSYVLAnyCaSsqSATF9xH27N9BjH/AxKPRZX+soI2D9H3T
	PmdYmM/OTOAwzlj56zKUi8CBROipyx5wt1KUksWXrcJRZDiD2gBZffRK6nrSxvDZPvQM
	SLqIMsyYzLKbzMVvx8vw3u9w6XAIPunlQwIweHabHFtzLso7Rp9zZEKxZUoOO+B/Pepo
	dBYe4sDnROlLHCyCUcoPIIFCs+8IBjTu66p/dwzXGL+PxheONDfsrM5giZnmDLmU3ijb
	eKCQ==
MIME-Version: 1.0
Received: by 10.180.100.2 with SMTP id eu2mr34441095wib.1.1333442761790; Tue,
	03 Apr 2012 01:46:01 -0700 (PDT)
Received: by 10.223.89.83 with HTTP; Tue, 3 Apr 2012 01:46:01 -0700 (PDT)
In-Reply-To: <CAGiJk9djNRgipUj=6==L4A9muZ_cKO7GW5Gtuwa=j-5+K1vA2g@mail.gmail.com>
References: <CAGiJk9cA_NvrK9R_HrGFkTU853VBp3Ct3-j9nEQSZ00DTw2VLA@mail.gmail.com>
	<CAGiJk9djNRgipUj=6==L4A9muZ_cKO7GW5Gtuwa=j-5+K1vA2g@mail.gmail.com>
Date: Tue, 3 Apr 2012 10:46:01 +0200
Message-ID: <CAGiJk9eFmPM3JbjUAdFBmO9RdfWptA34gxzxhwf1SUBbkO6PJQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Odd behavior of docbook-xsl-native
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
X-List-Received-Date: Tue, 03 Apr 2012 08:55:10 -0000
Content-Type: text/plain; charset=UTF-8

2012/4/3 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> 2012/4/3 Samuel Stirtzel <s.stirtzel@googlemail.com>:
>> Hi,
>> I just noticed that building docbook-xsl-native appended the following
>> line to my user ~/.bashrc:
>> . /work/oe-core/tmp-eglibc/work/x86_64-linux/docbook-xsl-native-1.76.1-r0/docbook-xsl-1.76.1/.profile.incl
>>
>> Has anyone else noticed this behavior?
>>
>> --
>> Regards
>> Samuel
>
> My mistake, this recipe is not coming from the oe-core layer (like
> other docbook recipes)...
>
> Sorry for the noise.
>
>
> --
> Regards
> Samuel

Send too soon :(

-- 
Regards
Samuel


