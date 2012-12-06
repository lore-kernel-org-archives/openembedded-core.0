Received: from mail-ia0-f177.google.com ([209.85.210.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TgX51-0001eJ-3u
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 09:45:15 +0100
Received: by mail-ia0-f177.google.com with SMTP id u21so4548349ial.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2012 00:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8ZdL3RLSra4dh3PaqRAYzkvU9ZiEOwLpnDVbAuipgXo=;
	b=iAZnneU3M2LFaYcBAqU8jsKEPffP8J/Yb5PU0smWrnKR7EDGUhDJvUbByHZ/QGJJPz
	IkAoly0Z8nU+pa3oZrlCUhCftOKjZlLvUJaIThrD6fX4IEUTsR9TbltDjUYWe+YvCki8
	Lua2/FUrFJVY4NdhcFWivkBejCtkzx+1G717tOCZiU5SYe8uy4A4FezPMmm00Uhz8j7H
	XCSDIzCciBHXjeeOH+bG3q+hIYZtwS4Cy4v54xN3m83QqiXIcRl3Qz5p4j9srlmPqYPr
	WVxjFuTQqvMD37PHLdefO7OmKewQwQYo4GfYryEF5dqLFjlISNq+/xoCULC1ZgkY1hew
	eYnQ==
MIME-Version: 1.0
Received: by 10.50.153.169 with SMTP id vh9mr612595igb.67.1354782649533; Thu,
	06 Dec 2012 00:30:49 -0800 (PST)
Received: by 10.64.24.175 with HTTP; Thu, 6 Dec 2012 00:30:49 -0800 (PST)
In-Reply-To: <CAJTo0LaEnxc5GwZbxP2iqy943LSbE0AonKYaJkRBkciCVs4g9Q@mail.gmail.com>
References: <1354746794-24290-1-git-send-email-cazfi74@gmail.com>
	<CAJTo0LaEnxc5GwZbxP2iqy943LSbE0AonKYaJkRBkciCVs4g9Q@mail.gmail.com>
Date: Thu, 6 Dec 2012 10:30:49 +0200
Message-ID: <CAF6bG8eaPKiBWELJG+7DcVPiiah1v626hcix0XN0Eh8tk3EDJw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libmatchbox: fix build against libpng15
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
X-List-Received-Date: Thu, 06 Dec 2012 08:45:15 -0000
Content-Type: text/plain; charset=UTF-8

On 6 December 2012 00:44, Burton, Ross <ross.burton@intel.com> wrote:
> Hi Marko,
>
> Is this backwards compatible with libpng12, or should libmatchbox
> check it has libpng15?
>
> Ross

 This is backwards compatible. Those functions exist in libpng12.


 - ML


