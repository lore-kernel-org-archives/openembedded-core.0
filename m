Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPqXy-0002Ni-8d
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 09:33:54 +0200
Received: by wera1 with SMTP id a1so1037929wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 00:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Ou01DGJ9cA7I8u3hwtc9LD5p0LZENcYlIPIZFd+l+YY=;
	b=gM+5KdfskQFQVcBlyuTzSbIeTWojtCG1yuDkH5YwbldL5MMDWFtx4pIygeG+gXZobi
	ZZhVyFxZB9pkr8tQ3YH0TH228/mAel4rbb8FwjlPGpKVZDwgq9UFtnDpQGimNSrDztAG
	mN9i6gq+LkxcOA4APeOGy+nIV+5ZinQEDQAeDICrovahLdDs9eIHrmcrosDcRJTMU+J0
	8w56cWEBDlIkUWC5YUXtPQiiWywGgPh5j/iLBSdel2LDW4juPc3/Im1ccL8qMrM1QIou
	/avljU9QLgboKTqSHW95ndrUs+w0nkjw5M14THmHGoxVzjeCaY4gy5d+86etBeQt2CYc
	BpBw==
Received: by 10.180.81.37 with SMTP id w5mr449758wix.16.1336029849057;
	Thu, 03 May 2012 00:24:09 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm799709wib.0.2012.05.03.00.24.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 00:24:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FA1A928.20309@windriver.com>
Date: Thu, 3 May 2012 09:22:45 +0200
Message-Id: <0AD9669E-F619-404D-A636-368B89234428@dominion.thruhere.net>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<DE7E5733-CC28-46DD-A4BC-C1AA663F925B@dominion.thruhere.net>
	<4FA145AD.4070606@windriver.com>
	<965C6250-6D1E-438E-8207-1E1D9DAF398A@dominion.thruhere.net>
	<4FA1A928.20309@windriver.com>
To: Jason Wessel <jason.wessel@windriver.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkAEkNNL/wkVaE4ZQiBmzEK+U81p4SNdFLGOteJkXUuu7/+tlmQK3UdPuUg77ebRsa21PjV
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
X-List-Received-Date: Thu, 03 May 2012 07:33:54 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 2 mei 2012, om 23:37 heeft Jason Wessel het volgende geschreven:

> On 05/02/2012 09:44 AM, Koen Kooi wrote:
>> Op 2 mei 2012, om 16:33 heeft Jason Wessel het volgende geschreven:
>>=20
>>> On 05/02/2012 09:29 AM, Koen Kooi wrote:
>>>> Op 2 mei 2012, om 16:23 heeft Jason Wessel het volgende geschreven:
>>>>=20
>>>>> The user mode NFS server does not get built by default when you =
are
>>>>> using a purely command line driven development environment without =
SDK
>>>>> tools.  In order to accommodate simple test configurations and =
have
>>>>> all the tools built for the minimal validation with qemu-native,
>>>>> simply add the dependency to unfs-server-native.
>>>> So all images I build for e.g. qemux86 now have an nfs-server? Can =
we please move settings like that to the specific images?
>>>>=20
>>> This is part of the simulation environment.  Not all of the run qemu =
functionality works correctly without this.
>> I repeat:  Can we please move settings like that to the specific =
images?
>>=20
>> I don't need nor want nfs servers in the images I build for qemu. And =
they work just fine without it.
>=20
> Are you advocating that you really want to make the system harder to =
use where somethings just do not work out of the box for no obvious =
reason?

I'm advocating doing it the right way, if you want to throw a hissy fit =
over that, so be it.

>  I realize that for your particular use case everything works fine, or =
you would be submitting patches to fix it.
>=20
> The qemux86 appears to be a very generic BSP aimed at having an easy =
to use simulation environment.  If you build a minimal image it would =
seem that it should work for all the the runqemu boot methods out of the =
box with no additional steps.

So add the dependencies to run the images to the images themselves.

> If your BSP has no simulator, you will not be building QEMU and in =
theory, this is not an issue.
>=20
> Example of what happens today:
>=20
> 1) . ../oe-init-build-env
> 2) bitbake core-image-minimal
> 3) runqemu-extract-sdk =
tmp/deploy/images/core-image-minimal-qemux86.tar.bz2 nfs
> 4) runqemu qemux86 nographic `pwd`/nfs
> --- And now the error ---
> Error: Unable to find rpc.mountd binary in =
/opt/poky/scratch/build/tmp/sysroots/x86_64-linux/usr/sbin/
> --------------------------------
>=20
>=20
> If you are in absolute disagreement with this patch,

I am.

> please suggest a way to accomplish the same thing with the same number =
of steps or fewer.

Move the IMAGE_DEPENDS to the images themselves.=


