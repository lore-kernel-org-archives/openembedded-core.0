Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 20D6C6FA30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 09:06:47 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id f51so15839190qge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 02:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=h9QRuPm3jgv68U72NMe+pKutWKPsYyr6GHjrMV87t3Y=;
	b=RPD7yMEl1/tgCG4zPLByLqy7ZQp+GGeY/+4p9O9FOBRtY0f8ReubfKjmnJWZBz3X5P
	PvUZkZPDOaXk4UjjkSvmGhIqG3vkCvDV8dBCbMwW+zNZpg11lCG03lAJOPvbbio05zqo
	Yai/eu3HrRbOhAJF0pqxmyhShbyKlWst1UkS4lNU9TYtFd0RNiPalia0FytRCXHz9uUw
	wtQb7iIj2OZHektiwlfFApNSStnuk/5qWhmJUVMO1ZrmUG09IuLJ9e+yYFiWvslugzPv
	7YIKohHVyEK2p0SpzhnNqZj7D6xQct4yiJwY0bGGGjj9WCcgeW25qFvcsnFHwmV+ORyQ
	z2pQ==
X-Gm-Message-State: ALoCoQlbFUC/zMj+Oh0oya7/HM35CcyJTGGfOu9wuea+Drtk+LpE/Fyvp6N/kXsrILK9780t126N
X-Received: by 10.140.109.9 with SMTP id k9mr49512844qgf.6.1395652008915; Mon,
	24 Mar 2014 02:06:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Mon, 24 Mar 2014 02:06:28 -0700 (PDT)
In-Reply-To: <532FE586.2050708@windriver.com>
References: <cover.1395646642.git.hongxu.jia@windriver.com>
	<9c06686dc4ccc2576bd8a171ed685ab00eecf84c.1395646642.git.hongxu.jia@windriver.com>
	<532FE586.2050708@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Mar 2014 09:06:28 +0000
Message-ID: <CAJTo0LY2rkPew8354+pYJKjXSrsBa50kZeEwxDrXSnQWgi8gRw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libsoup-2.4: upgrade to 2.45.92
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Mar 2014 09:06:49 -0000
Content-Type: text/plain; charset=UTF-8

On 24 March 2014 07:57, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> There was an error about mips-gcc optimization while compiling
> libsoup-2.4 2.45.3 with DEBUG_OPTIMIZATION enabled.
>
> The test code of libsoup-2.4 2.45.3 triggered gcc assert which located
> in gcc/dwarf2out.c:20810:
> ...
> 20806       gcc_assert (prev
> 20807                   && (CALL_P (prev)
> 20808                       || (NONJUMP_INSN_P (prev)
> 20809                           && GET_CODE (PATTERN (prev)) == SEQUENCE
> 20810                           && CALL_P (XVECEXP (PATTERN (prev), 0,
> 0)))));
> ...

So you've a bug in gcc and a well defined way of replicating it,
presumably you've reported this to gcc as that's the proper fix here?

Ross

