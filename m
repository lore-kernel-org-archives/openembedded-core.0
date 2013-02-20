Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1U8Ay5-0004yY-DY
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 15:48:21 +0100
Received: by mail-vc0-f180.google.com with SMTP id fo13so5141214vcb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 06:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=97aJTIufx+jpwttUfJT5dYjcfbFwpmPyZsT0P7pSKT8=;
	b=Usx/aqIA5tf0ysTFwACw1SajROAIQan/m2CtQ82MAViaT0t44DoXBm74hnmm6THyr+
	tphn+lVrWkXpr6cF7qb3XiTBNB7WGN3lDiUuureWBkfUlre8ay990XjOzf2o+OntF/ga
	2p7dnbk0vuQ+28hoM1vfbZoXLPY6cNjSKqEOM8HE4K25hIV/606xDa7y+LZ4qapdI/A8
	TBSW173BlQ/HHH12DWIYIuAJnazcKUfVsuJRLVTIjXWXJ2jat03icgdSSNsejRy9/+TV
	6G1ncBMSUCiSCYv2EuVFVbn+r63uRKrm1j/ah5T7V4I5S+r2QvnFdZyP7h2b26gyaJlq
	SyrQ==
MIME-Version: 1.0
X-Received: by 10.52.75.65 with SMTP id a1mr22469027vdw.79.1361370730335; Wed,
	20 Feb 2013 06:32:10 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Wed, 20 Feb 2013 06:32:10 -0800 (PST)
In-Reply-To: <5123B265.9050003@linux.intel.com>
References: <cover.1361091390.git.cazfi74@gmail.com>
	<5123B265.9050003@linux.intel.com>
Date: Wed, 20 Feb 2013 16:32:10 +0200
Message-ID: <CAF6bG8ei3p_RjsZX2Nmf5fy+StgJThrcR6R_rZ6-wT_A+6kAkg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] automake-1.13 and upstream version updates
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
X-List-Received-Date: Wed, 20 Feb 2013 14:48:21 -0000
Content-Type: text/plain; charset=UTF-8

On 19 February 2013 19:12, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/17/2013 01:00 AM, Marko Lindqvist wrote:
>>    libffi: update to upstream version 3.0.12
>
> Not sure what's going on but I saw a batch of failures with glib-2.0, take a
> look at the autobuilder failure:
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/808/steps/shell_29/logs/stdio
>
>  or
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/931/steps/shell_29/logs/stdio
>
> Not sure why, but glib-2.0 is not finding the libffi library, but it seems
> to exist in the sysroot.

 I should be able to take a brief look next weekend, but tonight and
tomorrow I'm busy with other things.


 - ML


