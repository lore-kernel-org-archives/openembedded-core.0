Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RaREu-0000ag-Vu for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 13:13:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDC6mpk008475
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:06:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07989-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:06:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDC6eq6008469
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:06:41 GMT
Message-ID: <1323778000.2731.54.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 12:06:40 +0000
In-Reply-To: <CAP9ODKoU+nN0h62xiPxU2=NP-xi7b+6jOZqLJTmRzwv4GH8YYQ@mail.gmail.com>
References: <cover.1323688579.git.xiaofeng.yan@windriver.com>
	<fbfec531140ee0c6848402faf94ba93b903d02ef.1323688580.git.xiaofeng.yan@windriver.com>
	<CAP9ODKrGOc27fxR74Ops4YjF+vLAwU5kZRZFW4XZjiFBaS=hig@mail.gmail.com>
	<4EE72E39.9000103@windriver.com>
	<CAP9ODKoU+nN0h62xiPxU2=NP-xi7b+6jOZqLJTmRzwv4GH8YYQ@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 7/7] core-image-gtk-directfb.bb: add an image for gtk over directfb
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
X-List-Received-Date: Tue, 13 Dec 2011 12:13:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-13 at 08:57 -0200, Otavio Salvador wrote:
> On Tue, Dec 13, 2011 at 08:51, Xiaofeng Yan
> <xiaofeng.yan@windriver.com> wrote:
>         ... 
>         IMAGE_INSTALL += "\
>             ${POKY_BASE_INSTALL} \
>             task-core-basic \
>             module-init-tools \
>             task-core-gtk-directfb-base \
>         "
>         Do you have any comment about above method ?
>
> All is fine except I don't see the need of having one specific image
> for gtk-directfb use. The case, in case it is required, you might
> include in case gtk-directfb feature is listed, avoiding an image
> specific to this.
>
> Why do you want a specific image for it?

To put what Otavio is asking in different words, couldn't we have a
generic "gtk test" image which would work with both directfb and x11?

I think the problem is that such an image gets tricky to construct as X
requires a lot of extras such as an xserver, a general directfb image
has a much simpler content and is quite a different entity. I can
therefore see why a separate image has been created and whilst I agree
its not ideal, I think the alternatives are worse.

I think Yan's patch with the anonymous python is along the right lines
but please lookup SkipPackage() instead of using getpid and kill!

Cheers,

Richard






