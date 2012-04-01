Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SEKgh-00053L-IW
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 15:19:19 +0200
Received: by iaag37 with SMTP id g37so3003786iaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Apr 2012 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=fsM3aMaGgLKvnNYRmcn6muXzo0CImnS23/wTE5RWLi8=;
	b=fFHFJRUV4eaFxn1Z3Dmlws3ao+zjpNZK0EPJ4q5JHvXa+lkXP6hnEzsXRuJjLH+0ZR
	yLH2hLOk6j+jxnyv7sU+h9xSe4RA9wK4hyoWC3Yjl7V94pe5G0Trlhxdnnbu5t2aBwZi
	4gHbra7bksUGsrroQyUZnJVgp5WhosqOlUDJ20qQBYUoZWBB8x/OWjSdnPQbQqvE6I2c
	a3nL4TfhXGl+4Ax1QIujJOSJcK5tbmu6kcO06tq5DFAjNXWvzeK2T1uOzdJlJpt8XuZf
	nsItepqZG1MzFK4aeUTLP1moXLviU2IGanFMiC9mP39cbfggFVh0Kn1f7hiRLTmFvmtu
	8yXw==
MIME-Version: 1.0
Received: by 10.50.222.162 with SMTP id qn2mr3036969igc.65.1333285812224; Sun,
	01 Apr 2012 06:10:12 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Sun, 1 Apr 2012 06:10:12 -0700 (PDT)
In-Reply-To: <CALbNGRQFQ6=kFVCeVfOgUTPvBVpeSxZZQ2Zak96O5UjjRxxoqQ@mail.gmail.com>
References: <CALbNGRQFQ6=kFVCeVfOgUTPvBVpeSxZZQ2Zak96O5UjjRxxoqQ@mail.gmail.com>
Date: Sun, 1 Apr 2012 15:10:12 +0200
Message-ID: <CALbNGRT4h0ioq5J0r011Znn3tHaHQLR9WkeaQteTGMsTu_B0NA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: What causes a variable being static/global
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
X-List-Received-Date: Sun, 01 Apr 2012 13:19:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2012 at 5:32 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> some more stupid questions:
>
> What causes a variable being global (accessible by all recipes)?
> Does the declaration in *.conf lead to global variable?
> Are there other mechanisms forcing global scope?
>
> Thanks in advance
>
> Andreas

Maybe my intention was not clear. For a generic run-once
implementation (see patch for gtk-icon-cache.bbclass [1]) I need
variables which are shared by all recipes. Each recipe can append data
so the 'sum' is used at image creation. What steps are necessary
creating a variable which is existing as one instance for all recipes
using it?

Andreas

[1]  http://patches.openembedded.org/patch/24179/


