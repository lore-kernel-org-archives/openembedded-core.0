Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 300D277C7B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 17:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3BHf3sH013563; 
	Tue, 11 Apr 2017 18:41:05 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BqREGt3K5fVM; Tue, 11 Apr 2017 18:41:05 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3BHEBCE011567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 11 Apr 2017 18:14:12 +0100
Message-ID: <1491930851.12091.30.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 18:14:11 +0100
In-Reply-To: <becb96f0-bc8a-3a91-0649-cab9be51d6dd@gmail.com>
References: <1491508529-2862-1-git-send-email-martin@xevo.com>
	<becb96f0-bc8a-3a91-0649-cab9be51d6dd@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Martin Kelly <martin@xevo.com>
Subject: Re: [PATCH] libsdl: enable X11 for nativesdk
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
X-List-Received-Date: Tue, 11 Apr 2017 17:41:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-04-11 at 09:34 -0700, akuster808 wrote:
> 
> On 04/06/2017 12:55 PM, Martin Kelly wrote:
> > 
> > From: Martin Kelly <mkelly@xevo.com>
> > 
> > Currently, the following situation fails:
> > 
> > - Build an SDK and image. Make the image support graphics but not
> > X11.
> > - Extract SDK and copy image somewhere outside of the Yocto
> > workspace. Do
> >    runqemu on the image.
> > 
> > This results in the error:
> > "Could not initialize SDL(No available video device) - exiting"
> This seems to have fixed an issue I was seeing on FedoraCore 25 with 
> Morty with the same error.  Did I miss comments regarding these
> changes?

No, I haven't directly commented but these changes do worry me a bit in
that we're setting the PACKAGECONFIG to x11 for some nativesdk things
and ignoring it for others. I don't like the inconsistency.

I'm hoping the patch from Jussi today will be a better solution for
this problem, at least for master.

Cheers,

Richard

