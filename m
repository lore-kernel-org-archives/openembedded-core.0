Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UZlMp-0001jt-OK
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 19:08:03 +0200
Received: by mail-we0-f175.google.com with SMTP id p57so767925wes.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 09:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=TlA4dlN0isDl4i3BF/o3OA52KS2mNouC58y6kg2Aq9U=;
	b=kPBmzNukErkgL4l0UAPW4sPIWlNxv+85Vc19uM7vaVQMbdZfLfbhBk7Jx+1DrjUIj0
	cxrMKEyBwkouQnPnb4I2WCCTSkZAWdfXo51sMkhnIlK3HIO85VitSfxNVs7WVmLdaVZI
	WjY3yPRZeKc7inQER+EW5zaT5JTPspDg5rVFwCw9vdhtSpteUxdzhtihhBtMSU08Ewz/
	7izz476/nfVrqQ3gPUCUi26VRzzhWCLr3vehaAdeIvSQhUnhw9Undoy2YqSU7eMjxUd1
	tOADy4NBQe45QHs3Q49ypg7onyI2/7X9/+dj/9tTjabVcfgcZMxviwnxQD2k0CNE8Z6A
	CO6w==
MIME-Version: 1.0
X-Received: by 10.180.73.173 with SMTP id m13mr4671827wiv.27.1367945394925;
	Tue, 07 May 2013 09:49:54 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Tue, 7 May 2013 09:49:54 -0700 (PDT)
In-Reply-To: <51892D8A.5030806@windriver.com>
References: <51892728.3090609@farnsworthtech.com>
	<51892D8A.5030806@windriver.com>
Date: Tue, 7 May 2013 12:49:54 -0400
Message-ID: <CAHUNapRAZVrC4eKTRiPNaun2wg2bEQs2Qt-x8dA67h9Uvb2NWg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: SDK meta-toolchain
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
X-List-Received-Date: Tue, 07 May 2013 17:08:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 7, 2013 at 12:36 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> There are two ways to generate an SDK.
>
> * targeted SDK -- This is a meta-toolchain* recipe that lists -exactly- what
> is going to be in the SDK.  This is great if you want to limit your SDK to
> specific libraries for your application developers.

Is this the one created using:

    $ bitbake meta-toolchain

?

> * implied / image based SDK -- This type of SDK bases off of what is in the
> image to generate an SDK that contains all of the libraries that are
> runnable inside of the image.  This is a very simple way to generate an SDK
> for application developers that -will- match the run-time image.

Is this the one created by:

    $ bitbake -c populate_sdk <image>

?


