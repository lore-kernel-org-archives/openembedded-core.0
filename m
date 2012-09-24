Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TGDau-0006Kh-4v
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 20:41:24 +0200
Received: by eaac1 with SMTP id c1so222987eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=D+wJtacBWSavNHMgF6XqkSGiKv89uelCQ9MU9yJ1JdQ=;
	b=ZCpfHEzfpDOBhKN01Mur2zpOALL1+4jOGfzMEzFBmIc/+eKywRp2rh3hfNB/gzbav2
	+ZDgoFTD6WURs4saWkLWaz69LeJ2LuRvxLbNSJGal93bffvNRIhApAH26xesZ4mp+tV+
	7HPPwMkPciGTRDt0yF5dbZk7O2TkZ0FZJw0aw0ahuVrbhrbLsxAN92OGt+KVsnIiPTBW
	H+COHKe73Bdl2t1j+PZc64naQ1/MG966JX3GPtH52U+CqxYPfdz2TsZG5vlO5xwHzXd4
	kFWbPdCDh+9r2U+8eEckv/0Tqqtm2Dfm8pf9cgVlbF5/rCYWL+h8/TrJuBd90qIgp2m+
	QaAQ==
Received: by 10.14.220.134 with SMTP id o6mr15918147eep.35.1348511316081; Mon,
	24 Sep 2012 11:28:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Mon, 24 Sep 2012 11:28:05 -0700 (PDT)
In-Reply-To: <1348487376.31293.31.camel@phil-desktop>
References: <1348487376.31293.31.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Sep 2012 11:28:05 -0700
Message-ID: <CAMKF1soJZLBPDBH-1rOs3Jk7Su9m76gue1aOWuKKN-598KP0CA@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kexec-tools: admit mips as a COMPATIBLE_HOST
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
X-List-Received-Date: Mon, 24 Sep 2012 18:41:24 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 24, 2012 at 4:49 AM, Phil Blundell <philb@gnu.org> wrote:
>
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-(linux|freebsd.*)'
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*|mips.*)-(linux|freebsd.*)'

I wonder if this expression should be removed completely now that mips is added
we dont have any supported arch left.


