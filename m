Return-Path: <armccurdy@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4F43A61DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 21:22:37 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id p61so8197932wes.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 14:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NONa/BSy6ruetaC9l/10b7crOhGzkWKJEWuPMASup24=;
	b=HrbhL9bxNUU+0JvUMh+SK3LBGM8oQ+1XIIjstepIvkbQcUfL2h5oFoiFMYY/Rv/pkF
	+DIGkdiDuyjmRHQnROYlvPO73XwGAsmxdm9dY3mgep9ZcXgNvwnsqGkfU3VQjoz6OjeO
	yGfnwVdsKLZOAAkGTTZjiHwPBR2NWuAPnU2FDnOn/JSqOmU7G3F/yCmadfE7TGInvF1N
	S6RFSDpUKQLv5iXw1dVTuQWp9JCzAOUACUdUYcN+RvH1s6DLpVSimjEaaemV63wiSLlr
	Bu1jYITGJ+CYWJuSwEzhnLVBY2ebT7P2R34kZS8E3xsquQ6mIl7z+jeqzgrASAUN4tS9
	9VSw==
MIME-Version: 1.0
X-Received: by 10.180.37.20 with SMTP id u20mr7450421wij.21.1376515357384;
	Wed, 14 Aug 2013 14:22:37 -0700 (PDT)
Received: by 10.194.34.168 with HTTP; Wed, 14 Aug 2013 14:22:37 -0700 (PDT)
In-Reply-To: <1620077.DtNPbj50LY@helios>
References: <CAJ86T=UDy7FJWR735GcK3bWZxmwRrGPdinfb+f49Wc1dEmg+ZQ@mail.gmail.com>
	<CAP71Wjz1HsDcEQcV0MjXDiKLzo7OfE7H=DCuPBf_f0uwe3-+hw@mail.gmail.com>
	<1620077.DtNPbj50LY@helios>
Date: Wed, 14 Aug 2013 14:22:37 -0700
Message-ID: <CAJ86T=Vt+oWiazVVN_ZY-G46UNOhakpkcqOR=tF6s3pXQta8iA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dylan]devshell: broken
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
X-List-Received-Date: Wed, 14 Aug 2013 21:22:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 14, 2013 at 8:50 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Andre / Nicolas,
> ...
> I have just sent a patch for dylan to this list to exclude
> LD_PRELOAD from the environment which fixes the
> problem in my testing here.

Fix confirmed here too. Thanks!

Andre
--

