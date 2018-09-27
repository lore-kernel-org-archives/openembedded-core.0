Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D8B8F74599
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 11:23:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8RBNn1P009201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 27 Sep 2018 12:23:50 +0100
Message-ID: <e12a8b37c4c590890dd0e8da52fa972680b395d7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Belal, Awais" <Awais_Belal@mentor.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Thu, 27 Sep 2018 12:23:49 +0100
In-Reply-To: <1538039039046.3259@mentor.com>
References: <1537266969204.31967@mentor.com>
	<CAJTo0LbCJwoD8Rc4uLffTx5P0enQxppY4-5YmGYPDbhahU8j8A@mail.gmail.com>
	<9a58ea4be84c4f0eb2c34680a9345186@SVR-IES-MBX-03.mgc.mentorg.com>
	, <CAJTo0LYtN8Rn=Kw1opw9=-a9j2zFFaUqikvwU4LXqoqHiEot5Q@mail.gmail.com>
	, <1537536706360.96813@mentor.com> <1538039039046.3259@mentor.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-package.inc: correct intention for deleting /usr/lib as needed
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
X-List-Received-Date: Thu, 27 Sep 2018 11:23:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-27 at 09:03 +0000, Belal, Awais wrote:
> When do you think this would go in?

Its not going in, it doesn't build and broke things.

I thought someone had reported back but that hasn't happened, sorry.
Getting SWAT on the autobuilder to happen reliably is proving tricky
right now :(.

An example failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/2/builds/62/steps/7/logs/step1b

I think we aborted that build run after the errors:
https://autobuilder.yoctoproject.org/typhoon/#/builders/6/builds/71
so most say cancelled but I think other errors were piling up.

Cheers,

Richard




