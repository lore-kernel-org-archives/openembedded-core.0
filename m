Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4x5w-0008TY-9B
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 18:50:52 +0200
Received: by eekb57 with SMTP id b57so651342eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 09:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VQQU/XdaqU1O/GfcJypDujp/9ZSd5KbegSDnORhM0q0=;
	b=N31ig/9WbUrEdNCYnQdr8ToErp/cCciuoeEBjo5YCM+kXj7pWdtuGhO5U97O6LemmV
	bPfpbWZTPD0SdAFc7DnNFw+sHEZRGV4F6Z+bkLQNx5aFe9sxUgSF9mtzK/1frVSFY1jJ
	ppz3SU+oImdrlQNn4SKCEMJ+giHoNqGThj091E7PygEXw+MNeHXCLf4uiTE2XbL8GoMj
	WiGIwr0+/C6J4J33XcIbsB79onLt3lIu1e1pcatLlp8oR2DzH2z+xc1eQrA2KeUsvgi9
	TWjma+eeNpoqRNDoCZqpw88W2nr43yClO3IIFtvW77yOuIcys+/N5eBxveDKotPuKxPz
	Dtog==
Received: by 10.14.4.201 with SMTP id 49mr8391559eej.0.1345826324488; Fri, 24
	Aug 2012 09:38:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 24 Aug 2012 09:38:14 -0700 (PDT)
In-Reply-To: <1345822157.14369.74.camel@ted>
References: <1345817543.14369.70.camel@ted>
	<394E54E4-815B-42CD-BFA2-5CDE2744B1FB@gmail.com>
	<1345822157.14369.74.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2012 09:38:14 -0700
Message-ID: <CAMKF1sry2io4S_ijGe5sNmPUaTRgawCP8+yp7h76tBGPY0LTgA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.7: Add fix for libtool rpath problems
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
X-List-Received-Date: Fri, 24 Aug 2012 16:50:52 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 24, 2012 at 8:29 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Right now I'm just trying to get the builds working. I shouldn't have
> merged that sanity test yet :/.

I think its fine after all its master. Furthermore we are discovering
latent issues not introducing new ones


