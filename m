Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBbMo-0005eN-9g for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 01:59:14 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p960060A015718; Thu, 6 Oct 2011 01:00:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MFUZMOxe6IGR; Thu,  6 Oct 2011 01:00:06 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95NxwqR015691
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 6 Oct 2011 01:00:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 06 Oct 2011 00:53:22 +0100
In-Reply-To: <CAEsOVNeNerChRP+bA8D354J2M+og5TPkWO9e_83rNLLbRZS4Jw@mail.gmail.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-3-git-send-email-msm@freescale.com>
	<CAEsOVNeNerChRP+bA8D354J2M+og5TPkWO9e_83rNLLbRZS4Jw@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317858811.6398.36.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 3/6] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Wed, 05 Oct 2011 23:59:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-05 at 22:52 +0000, McClintock Matthew-B29882 wrote:
> On Tue, Oct 4, 2011 at 5:03 PM, Matthew McClintock <msm@freescale.com> wrote:
> > -inherit image_types
> > +IMAGE_CLASESS ??= ""
> > +inherit image_types ${IMAGE_CLASSES}
> 
> So this does not work properly, I thought I tested it but... need to
> do something like this:
> 
> IMAGE_CLASSES = "image_types"
> inherit ${IMAGE_CLASSES}
> 
> then let the user added via
> 
> IMAGE_CLASESS += "image_types_uboot"
> 
> then there will always be something that is expanded to avoid this issue:
> 
> ERROR: Could not inherit file classes/$IMAGE_CLASSES.bbclass
>                            | ETA:  --:--:--
> ERROR: Command execution failed: Exited with 1

Its not expanding the variables? :/ This happened even when
IMAGE_CLASSES had a value before the inherit?

> or
> 
> ERROR: Could not inherit file classes/.bbclass
>              | ETA:  --:--:--
> ERROR: Command execution failed: Exited with 1

I'd be prepared to call this last one a bitbake bug...

Cheers,

Richard



