Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBY6z-00009d-Tx
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 22:30:42 +0200
Received: by pzd13 with SMTP id 13so5323431pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 13:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=8/wrWg8r3goWK2CS4fvdp5iGW9xAPhxQ+ZaoHZ/6acs=;
	b=EVPIK1BlVaD7iyL+WcrdA34z3waVYEgRk/+RGXJ/xJg9vQDfgvAFMmWWsrm54uBwUw
	CbromWnAabwkkLn+wdDm9DYFCxMfQidw0+jI1bmS+6Cwh25Came7ZxJut393m9trCv6R
	yHX1WJza4ITCZVNtGPbU5Av5UOnPq7Kgz1p/s=
Received: by 10.68.19.196 with SMTP id h4mr21458723pbe.39.1317846306118; Wed,
	05 Oct 2011 13:25:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Wed, 5 Oct 2011 13:24:36 -0700 (PDT)
In-Reply-To: <1317845927.10776.3.camel@scimitar>
References: <4E8B6564.4090002@balister.org> <4E8B67C5.8050602@intel.com>
	<4E8B6C17.80509@balister.org> <4E8B6D47.9000600@intel.com>
	<4E8B8C05.5050508@windriver.com> <4E8C662B.4090300@balister.org>
	<CAMKF1soVx-m6aa0xhHeSvPDSBQvwc+L37r1xgTs58ZuCs+XhzQ@mail.gmail.com>
	<4E8CB801.7050003@balister.org> <1317845927.10776.3.camel@scimitar>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Oct 2011 13:24:36 -0700
Message-ID: <CAMKF1sqLRTW31wmtCnXo+kNU6cfJe0w4XSpwEAjfbXh5_fhDAA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bringing an image from OE to OE-Core
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
X-List-Received-Date: Wed, 05 Oct 2011 20:30:42 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 5, 2011 at 1:18 PM, Joshua Lock <josh@linux.intel.com> wrote:
> Core images automatically include the correct package manager when the
> image feature package-management is defined for the image.
>
> It would be nice to define a variable/feature to control SSH server.
>

virtual providers could help here.


