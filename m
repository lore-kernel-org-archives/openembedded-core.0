Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RjJ1x-0000dr-Uh
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 00:17:02 +0100
Received: by lami14 with SMTP id i14so651418lam.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 15:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=41mavZoxgPmVhiVyrCwtOGnTQjfHwR593A6Y54zREBA=;
	b=n6NTde/ko5+dC8Pw4UIbE8TLCQoTnjw6PlZCv9XYKV6rCSDdxOIVHY8/4QiZpdYIGj
	HgDdD7PA8iptsU77rHMMLnKIoBTEY2IMsOnc75867c4heHSMbfbNvYTQFlFWcvieN9Rf
	f/0hnnUyLlAGWSQ5N8yN/qzexXC2cv5ZTJlvE=
Received: by 10.152.123.75 with SMTP id ly11mr3013493lab.32.1325891377397;
	Fri, 06 Jan 2012 15:09:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Fri, 6 Jan 2012 15:09:06 -0800 (PST)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C014F82@ORSMSX106.amr.corp.intel.com>
References: <1325821207-2843-1-git-send-email-raj.khem@gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C014BC2@ORSMSX106.amr.corp.intel.com>
	<4F069E36.7000600@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C014F82@ORSMSX106.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jan 2012 15:09:06 -0800
Message-ID: <CAMKF1sqrrShTqFjoutMxgtNuU2n2u31wftB9n=Wsy6FGPyvngA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: Upgrade recipes 2.14 -> 2.15
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
X-List-Received-Date: Fri, 06 Jan 2012 23:17:02 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 6, 2012 at 10:07 AM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
> That is a big change for x32, It may work out or not, last time x32 + eglibc-2.15 was causing some issues which were I think actually more eglibc-2.15 issues. The worst case is I can move the eglibc-2.14 recipe into the meta-x32 layer.

If you are not on a release trail I would suggest to try 2.15. You can
move the recipes to a
layer certainly but its better to keep less versions around for
maintenance sake. what problems do u envision that can happen with
2.15 ?


