Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SS8X6-00088Y-Mw
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 17:10:28 +0200
Received: by wibhj13 with SMTP id hj13so1720493wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 08:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=fnw/GPo61GDfUeJl+sINrYvZsyxVbeZvZ0LXjAtmOq4=;
	b=XUnCIf4A3gggvrAIXgh+VTmXvGd1uukkGI3sGvI9KnThx7eSaCsQOxueb+YBOCoYsl
	ytw3KRKCAIbNB1W21HmHJ3/PQA9rgs/Xnkl7JjTBsmxGfpjvVvRyec9nev7ePZXFpo4C
	r8Bgz5q0BZDRi+wbdlxnZyKTD4MOAnreGKMySapbsSPR0y60X0JjPo+lxx5FRw0gTq66
	VDP9JidOwCerfzTlKWQ20g/u6oghHDd5Lut1DVz/Y6MNZNdpRgG34ftC3cOTGVHrFdkC
	LmaFYLGgStBJR8kMMrMH5OtM/hh7wgVcGer6/NvkVZAfK+Kclb1Xj+rXCcpKCS6+cD/9
	GxkQ==
Received: by 10.216.134.27 with SMTP id r27mr190137wei.107.1336575635826;
	Wed, 09 May 2012 08:00:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm36894541wiy.7.2012.05.09.08.00.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 08:00:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FAA8321.707@windriver.com>
Date: Wed, 9 May 2012 17:00:33 +0200
Message-Id: <3FD5DEF0-E53F-407C-B5D4-B1B4181C4E3A@dominion.thruhere.net>
References: <1336571192-15711-1-git-send-email-jason.wessel@windriver.com>
	<1336573316.5602.68.camel@phil-desktop>
	<4FAA8321.707@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkyIQuK/B3QoC7yzanepICyBZ4kXYtqY681Q2qrN8jK81JuY3MlSIRxfvSGVK20jI1E4PLG
Subject: Re: [PATCH] .gitignore: add /bitbake to the ignore list for external distributions
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
X-List-Received-Date: Wed, 09 May 2012 15:10:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mei 2012, om 16:45 heeft Jason Wessel het volgende geschreven:

> On 05/09/2012 09:21 AM, Phil Blundell wrote:
>> On Wed, 2012-05-09 at 08:46 -0500, Jason Wessel wrote:
>>> External distributions based on the oe-core will typically include
>>> bitbake in the top level directory.  The idea is to make it easy
>>> for external distributions to easily assemble a distribution
>>> with a pristine version of oe-core, add avoid the git untracked =
messages:
>>=20
>> Presumably any non-trivial external distribution is going to include
>> other metadata as well, in which case they're going to have to
>> edit .gitignore for themselves anyway.  So it doesn't really seem as
>> though having bitbake be mentioned there in oe-core buys much.
>>=20
>> On the other hand, actually moving bitbake inside the oe-core =
repository
>> seems like an idea which might have some merit.  It's not obvious =
that
>> having it in its own tree really achieves anything other than making
>> release engineering slightly more difficult.
>=20
>=20
> It appeared to me that the bitbake was maintained by an entirely =
different group of people

Yes, Chris Larson and Richard Purdie. Those names sound familiar :)=


