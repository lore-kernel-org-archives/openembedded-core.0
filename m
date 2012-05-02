Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPax3-0008Lq-OZ
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 16:54:45 +0200
Received: by wibhj13 with SMTP id hj13so4002068wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 07:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=DJvAvkQas7QBqMyleE/40K8oyTkDIjJZy1RsSg3vxXY=;
	b=fLVGe9g1lVQ0TLegcB44NWIWMZg8kYa4+yK0thk09I4I1au3koykpc+A1uIeNQOUtJ
	FQ51KInKfthP+q7+a380wePAASg79SGIpl8zJ6cYjxv5vy0BDQ+AGF8mQH2rRVDWQ0bI
	Vm437w+aSqsHBeK+KqcRcXU2Zci/9bC3MHH5Dk4s9d34Yh8PiBreL1+ri4IYNMt9kPHR
	0rrKfTlI+jKW3ZJLieNPu+yUOnnUBMjP1ls3Im5EfCCNxmpVAUpYWc6aBFdepBBemRuc
	5/c0DiWwGFvcsQLesGarjS7iE08g+TnXCUvyOtfpIu/tT6+HQhYdMentdN5zR+xSmxXl
	+MNg==
Received: by 10.180.105.69 with SMTP id gk5mr17104673wib.3.1335969901541;
	Wed, 02 May 2012 07:45:01 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w10sm7301158wiy.3.2012.05.02.07.44.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 07:44:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FA145AD.4070606@windriver.com>
Date: Wed, 2 May 2012 16:44:44 +0200
Message-Id: <965C6250-6D1E-438E-8207-1E1D9DAF398A@dominion.thruhere.net>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<DE7E5733-CC28-46DD-A4BC-C1AA663F925B@dominion.thruhere.net>
	<4FA145AD.4070606@windriver.com>
To: Jason Wessel <jason.wessel@windriver.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk038uvwoJHTjo4j+FXBpuRoFQ0NYWOTE2tfHm7OZ8ZleYEwD6RRKCXOxtnl/J8zDX/foXW
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
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
X-List-Received-Date: Wed, 02 May 2012 14:54:45 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 2 mei 2012, om 16:33 heeft Jason Wessel het volgende geschreven:

> On 05/02/2012 09:29 AM, Koen Kooi wrote:
>> Op 2 mei 2012, om 16:23 heeft Jason Wessel het volgende geschreven:
>>=20
>>> The user mode NFS server does not get built by default when you are
>>> using a purely command line driven development environment without =
SDK
>>> tools.  In order to accommodate simple test configurations and have
>>> all the tools built for the minimal validation with qemu-native,
>>> simply add the dependency to unfs-server-native.
>> So all images I build for e.g. qemux86 now have an nfs-server? Can we =
please move settings like that to the specific images?
>>=20
>=20
> This is part of the simulation environment.  Not all of the run qemu =
functionality works correctly without this.

I repeat:  Can we please move settings like that to the specific images?

I don't need nor want nfs servers in the images I build for qemu. And =
they work just fine without it.=


