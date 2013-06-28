Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id C2C4D6AD1C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 10:21:22 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id m1so1664253ves.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 03:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=Wfk6dynkWPMBn1PHYgczF1JK46amNS7ZvXh+EGBApa4=;
	b=Ck0BywkTiLDzvGCrKVryDes9VDphKOubtNCgEcSnIsDUb+Evewesa6mfu52242o2zU
	aVE/M08voUaW3iN0njP+ZKAxnt1yUtTrCa8lpPfszuPcpZ9ug7Dh3v+3fqKK2Fec2ILY
	e+fiOa3xjyT6Tc5ZxCpZpntxxJ89RscHGy+jd8qrwx6eSPLqvLkqwPg5TC6DH9LgOXaK
	i3qGMmxAz1qbnGuoD7crlVHIwM28eDHK/MgBgOqGWu7MrRi4p3K4K0vzqOKaB4VhAjbQ
	71Q/ZR1a97WssuOZ+nG0OyP5FQ7W12sd1xxdTca/5fHOCG81O1gh7YP1iqvPQ4J8B6Bm
	onJw==
X-Received: by 10.52.94.142 with SMTP id dc14mr4480842vdb.86.1372414883175;
	Fri, 28 Jun 2013 03:21:23 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Fri, 28 Jun 2013 03:20:43 -0700 (PDT)
In-Reply-To: <CAJTo0LY--AwQsoe8LKxdqFptoa7TXd2AhqexP6XvnC_Ua+v52Q@mail.gmail.com>
References: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
	<CAJTo0LY--AwQsoe8LKxdqFptoa7TXd2AhqexP6XvnC_Ua+v52Q@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 28 Jun 2013 11:20:43 +0100
X-Google-Sender-Auth: uyg7rGGN_qZv6QC4lIzPcvVaUAY
Message-ID: <CANyK_8eBqvC7nSKzE8Dg2imQ31+_9RdGqB5_GbuKB6YSaHw04w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3 v2] sanity.bbclass: Check for the known broken version of make
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
X-List-Received-Date: Fri, 28 Jun 2013 10:21:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 27 June 2013 15:21, Burton, Ross <ross.burton@intel.com> wrote:
> On 27 June 2013 15:08, Mark Hatle <mark.hatle@windriver.com> wrote:
>> See GNU Savannah bug 30612 -- make 3.82 is known to be broken.
>>
>> A number of vendors are providing a modified version, so checking
>> for just the version string is not enough.  We also need to check
>> if the patch for the issue has been applied.  We use a modified
>> version of the reproduced to check for the issue.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>
> Verified that this detects the 3.82 in Debian's experimental
> repository that is well and truly broken.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

This picks out the current version of make in Arch Linux as broken
despite it having a patch for bug #30612. I'm not sure if this is
intended, could be that the applied patch isn't a complete fix. I
don't have time to dig into this, just thought it'd be useful to you
to know.

If you know what fix you're looking for, the applied patches and build
script can be seen at
https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/make

Thanks,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

