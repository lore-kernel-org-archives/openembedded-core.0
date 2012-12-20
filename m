Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tlecp-0007iV-RW
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 12:49:20 +0100
Received: from mail-yh0-f72.google.com ([209.85.213.72])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 03:34:33 -0800
Received: by mail-yh0-f72.google.com with SMTP id q46so4651365yhf.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 03:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=7Jv7C9KyQg/tBB8f9iLkVh/9GboxRGtsgk0ALl/UKgI=;
	b=H5u9/XxpZ77iN8dp96RBs+OE1obSicuS+8XN5piKIfgom3yVriqIg1vjBbG8T31/tF
	o6pWlO1HIBf9kP6ufX5p7RxZhQ3tyfbke1JAa/J0xbL7juZobSwxIqyYpUJc/G1kRVNy
	qUHE+9cRwhgCmHOF79JUSq6AWLKmbgL9vM8fESH7AlzcRi0Da3hfCmsItjIGzTX7/lSW
	b0E4YgYQPLfVeib0fvKhfo7ihmE7TeigpLC58F+XCxcQd2qwP3LtbIreFvH2BmlMuL/X
	dwBIlHb/+NMhmQxxHYzXmZlySwnOsJXBrVKMet+8ij5o76SHUsWeRWMFxQTRIvGQJAsH
	Fmpg==
X-Received: by 10.58.107.235 with SMTP id hf11mr14323130veb.16.1356003273011; 
	Thu, 20 Dec 2012 03:34:33 -0800 (PST)
Received: by 10.58.107.235 with SMTP id hf11mr14323118veb.16.1356003272845;
	Thu, 20 Dec 2012 03:34:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 03:34:12 -0800 (PST)
In-Reply-To: <CAJTo0La4ou6_1NvgRo0rqHNEDqmAFH29qFbg_N1Wfv8L1uUa=Q@mail.gmail.com>
References: <1355839120-12142-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1355839120-12142-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<CAJTo0LavddUVfHnF2qVGgE9U2Vb7NtbL_B3M5PPtHNV6V6D8qg@mail.gmail.com>
	<50D1B088.3000009@oss.bmw-carit.de>
	<CAJTo0La4ou6_1NvgRo0rqHNEDqmAFH29qFbg_N1Wfv8L1uUa=Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 11:34:12 +0000
Message-ID: <CAJTo0LYieHXLYPCUuAkScUhrxsnQm4XyPfVX17uwnAPfmw24oQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
X-Gm-Message-State: ALoCoQnxZE+NLES+q1MgywauYlqiaE5ZnJq7pFEAWcciRveqYjycOC9BdPMvnKM3C+7tvvlffaUGKDDQGm2ztaZ5VpF453b4Vy7PMh9EyqsQGpZPRAYLxFszAKlNNHvqen2fHhb4Ltia18t9ndWQQW7U8pGSVjBrTPnN2hq3JiV2EdSpraUpYC1Sdu24Pwb41eA0tOdwZIf0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] easyinstall: class to create and extend the easyinstall.pth file
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
X-List-Received-Date: Thu, 20 Dec 2012 11:49:20 -0000
Content-Type: text/plain; charset=UTF-8

On 19 December 2012 12:24, Burton, Ross <ross.burton@intel.com> wrote:
>> From your description I could not find the version of python-mako that uses
>> the --s-v-e-m option.
>> Where can I find this version of the file? Maybe I was just looking at the
>> wrong repository...
>
> The patch isn't in meta-oe yet, it's in the list archives somewhere
> but it's also on my branch here:
>
> http://git.openembedded.org/meta-openembedded-contrib/commit/?h=ross/piglit&id=2d6ae0a328c2e3d24e43b2858c70a5f404796d21

Not sure how I failed to notice this, but there's a setuptools.bbclass
in oe-core:

inherit distutils

DEPENDS += "python-setuptools-native"

DISTUTILS_INSTALL_ARGS = "--root=${D} \
    --single-version-externally-managed \
    --prefix=${prefix} \
    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
    --install-data=${datadir}"

Yeah, that.  I'll fix python-mako and this should be suitable for you too.

Ross


