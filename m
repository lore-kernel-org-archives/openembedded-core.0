Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZuXR-0000VA-2e
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 02:18:41 +0100
Received: by lahd3 with SMTP id d3so1674819lah.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2011 17:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=EQKH9a/uLPJfbnDppXaCXiXdyTn7fOKVZYhl8699bGU=;
	b=gJ8DdErazHqWHkC7zQaQehdvjmxBI8O3CvCNGaUEqyPBI3METRObRB1D95fMxozwcz
	Fv2gs7SmfmZCLt67M9o+Xelv7qNk7QxaP92nEbQEL938Eub2j22bWmsuiz96lAtx3td/
	o268ATIPyl5vs2U5fLYfNUSbve3jlAzXslR7M=
Received: by 10.152.106.115 with SMTP id gt19mr10722948lab.27.1323652303403;
	Sun, 11 Dec 2011 17:11:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sun, 11 Dec 2011 17:11:12 -0800 (PST)
In-Reply-To: <CAEsOVNf1qaYLPhMfJvR=0WCgwjFa85DWTyqQ6hb=x15ZYuDmYA@mail.gmail.com>
References: <1323419740.1294.70.camel@localhost.localdomain>
	<CAEsOVNd8AsZNrzcsP4RsK0zURAkkh7hJ6W=BwNKVRnkADxDEhg@mail.gmail.com>
	<CABcZANnsd0srVep_NSsuFZrGrF2KZocP1EUw3U+fMtTMPpWfvg@mail.gmail.com>
	<CAEsOVNf1qaYLPhMfJvR=0WCgwjFa85DWTyqQ6hb=x15ZYuDmYA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Dec 2011 17:11:12 -0800
Message-ID: <CAMKF1soD62qmg6yQsyQQHWndAjADzntz-J3UcUkvDHcrvabZgA@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: inheirt multi bbclass using variable
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
X-List-Received-Date: Mon, 12 Dec 2011 01:18:41 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 11, 2011 at 4:13 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>
> To clarify, my case was more like this:
>
> IMAGE_EXTRA_CLASSES = "${SOME_CFG_VAR}"
> inherit some_class.bbclass ${IMAGE_EXTRA_CLASSES}

I think you are expecting C like behavour where variables/macros are
expanded before keywords


