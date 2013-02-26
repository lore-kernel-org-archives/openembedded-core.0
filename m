Received: from mail-we0-f171.google.com ([74.125.82.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UATmo-0006Kr-4X
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 00:18:34 +0100
Received: by mail-we0-f171.google.com with SMTP id u54so3866358wey.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 15:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=ud98mMqp4vVpmtJUt2jJ7dP3bnXRdRDUqqYsL10tMfo=;
	b=BDXayP2WyHtvBNB2IyEP6RmwvVZamkXSW5YtqmMl1WGPU5eUYpKj4RF4zmO81z9b+R
	Z98Kjys1U5IzJP6bTKAgbk0h4DgUf/afo3aXh/6r2dtbINSi3ueg0vRgOwEiv2ThrJUf
	4MeXULCLfKWpGRO1zOSXay1bQlhJTgJomuv+lBBKRKajfNnAMAz0rRB1ODR5Ef3RYn7x
	oPTgGhdrPS0Y2GHdJhWU7XYshnAR4SxVRpdIfmEDhYf2gXvPINsFiKcXVSEO+Aa4cK8y
	M7V2pUPToK1ozMa5i8IwTS/zCvuR+uYLDiVn2IlbBKKHlNNovD8cpo+tmoL+stT3yQ0s
	z5Gw==
MIME-Version: 1.0
X-Received: by 10.180.75.177 with SMTP id d17mr97439wiw.16.1361919714657; Tue,
	26 Feb 2013 15:01:54 -0800 (PST)
Received: by 10.194.45.100 with HTTP; Tue, 26 Feb 2013 15:01:54 -0800 (PST)
In-Reply-To: <512D3E8D.8050500@linux.intel.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
	<CAHUNapS415=P=zzNjkHfv5dF2ptUdpad8A74Hcxm=9eaQ588bw@mail.gmail.com>
	<512D2EA6.7090700@linux.intel.com>
	<CAHUNapR+Zgsw59+M0fAYv35BaA5Evc=+N2XJHUwzFn-KgDVYXw@mail.gmail.com>
	<512D3E8D.8050500@linux.intel.com>
Date: Tue, 26 Feb 2013 18:01:54 -0500
Message-ID: <CAHUNapTe0m25b10PsVx_Vx3MDFoAvF85gVuw=myzxQTB3qQNRQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] Create ext* filesystems using debugfs
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
X-List-Received-Date: Tue, 26 Feb 2013 23:18:40 -0000
X-List-Received-Date: Tue, 26 Feb 2013 23:18:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 6:00 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>> mkextXfs.sh ?
>
> Likely to be confused with mke2fs itself. Perhaps:
>
> populate-extfs.sh ?

Sounds great.


