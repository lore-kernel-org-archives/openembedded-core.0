Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RsiOI-0000bd-2A
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 23:10:58 +0100
Received: by lahc1 with SMTP id c1so927806lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 14:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=959pRHJ6V1YDZ3BmbklsVQFvDbBFf+Wdh5BPhekjT+A=;
	b=j7+Z1Tfed+pwRmIopoDSYuxqSv6tEqMFn1Tcl8OcpFhVVyDcsdStYtEIfBvPLALO7H
	KBFEIkmvFAW5J0eeaASuM6eXC4jKuZleAIKWwHz9zftTwF2YsFvhrecVQEOexW6jzoft
	FiIlvFyetrtxXdf7WDGUR9qXWK/BF/oCydhCs=
Received: by 10.152.112.41 with SMTP id in9mr170791lab.27.1328133782258; Wed,
	01 Feb 2012 14:03:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 1 Feb 2012 14:02:32 -0800 (PST)
In-Reply-To: <c960e8c29574bd5b5ca6649394468169ec264854.1328133261.git.nitin.a.kamble@intel.com>
References: <cover.1328133261.git.nitin.a.kamble@intel.com>
	<6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
	<c960e8c29574bd5b5ca6649394468169ec264854.1328133261.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Feb 2012 14:02:32 -0800
Message-ID: <CAMKF1srmsx1KQ_3Y4===JVFaOHaPMt7nyanjymD=yF+ksQO9JQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] gmp: upgrade from 5.0.2 to 5.0.3
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
X-List-Received-Date: Wed, 01 Feb 2012 22:10:58 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 1, 2012 at 1:55 PM,  <nitin.a.kamble@intel.com> wrote:
>
> Removed sh4-asmfix.patch as it is not needed with the newer code.

has it been applied upstream ? or is there any other reason that fixes
the underlying problem.


