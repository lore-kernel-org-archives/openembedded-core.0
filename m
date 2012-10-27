Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TSGUr-00044J-4u
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Oct 2012 02:12:57 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so5256393ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Oct 2012 16:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=P4pr9b0PWrmczo5r4PYv0ZNVrhNiLb9lfjn5nNr+FlA=;
	b=u8QO4tYNRq2oNdql7bQ8Wn/hXUrxQPsgubv+EAErEQEHFYy0QYJdU+qm1DQapsVMks
	sT20SWewZYLiBQwsSQ6qcOe3Fc4rl7KKBZ6a9tKgfq/UecVmTAyNZglkMIIZJJVg/cKO
	OeL+uiIV/DuLI77lPptYiAbUaDPDUCrjaWlhWePAZMkJK1OrP1hQ9vTiRDNAb1/IoBii
	1kvCfbdWXpHstSo9FVt2o7QmL+lckSFPqUKF49Lp2nsE9AwhEX0t+wKYH6yR4rjH8ea4
	xW+NdFO3BX7xePvAdOQgyAigufjBX8NN2yPXjz4rpy0UTxSkVX1cANxmUryifqOOX8+C
	3vpA==
MIME-Version: 1.0
Received: by 10.50.173.37 with SMTP id bh5mr6033863igc.45.1351382364722; Sat,
	27 Oct 2012 16:59:24 -0700 (PDT)
Received: by 10.64.99.226 with HTTP; Sat, 27 Oct 2012 16:59:24 -0700 (PDT)
In-Reply-To: <CAAQYJAtxfQDkODhaPZP1Z8honP1azA1B6PuQ_DfjtuB--8YnvA@mail.gmail.com>
References: <CAAQYJAtxfQDkODhaPZP1Z8honP1azA1B6PuQ_DfjtuB--8YnvA@mail.gmail.com>
Date: Sun, 28 Oct 2012 01:59:24 +0200
Message-ID: <CAAQYJAvPAht4KDRwcYUyTjYteQu7wiXbbE4JT8H2+rR7tv=KNw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: devshell spawning twice
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
X-List-Received-Date: Sun, 28 Oct 2012 00:12:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Oct 28, 2012 at 1:55 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Since commit c76da87511d2668479745c2f18b8a9b8116c7489 (terminal: Add
> support for running custom terminals.) screen opens also in the master
> terminal, waiting for input.
>
> Reverting the patch fixes the funny behavior.
>
> This on Gentoo, using xterm.

Sorry, is gnome-terminal on this host.

>
> Regards
>
> Andrea


