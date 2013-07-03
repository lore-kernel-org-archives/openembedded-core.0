Return-Path: <cazfi74@gmail.com>
Received: from mail-vb0-f53.google.com (mail-vb0-f53.google.com
	[209.85.212.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2064A61A45
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 08:19:29 +0000 (UTC)
Received: by mail-vb0-f53.google.com with SMTP id p12so5291319vbe.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2013 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Tvn+fVAGOnpCPwDhrNdRg8LNizUOca6IPPbj/DudyOM=;
	b=S+9Mjj+FQzXii5nb1Es5WHg+CMCUEV3u5i9RTeee3v/DT078DiiWjbz+kK4rgMnU0C
	O6wbd1XAHCFTIc23ihcUyA/4syGxzSnU6FnMtJv4cOUAsDAf/dU7I/rmo5YZ/TBjE13Q
	3Gxc1534CBxTakleCNFykveFq0wypiv2KKMCbccKg3WEEq/66YbCeafneeDWrcWsvMEe
	OUIrmwNeIrsm9rCM/yxNrbj/mpIX5sdizdzK62yxdXB2ulMteG6E8WTUjc1lTBBP9yHs
	bo5EQQP/JgDEHP72ruKbbW4QVgO/lAmIP6Cl/Uby3x0LQt3ZfBhRHJAp6dTh6NpiRTQS
	UMLA==
MIME-Version: 1.0
X-Received: by 10.58.54.70 with SMTP id h6mr12446452vep.36.1372839569787; Wed,
	03 Jul 2013 01:19:29 -0700 (PDT)
Received: by 10.58.238.37 with HTTP; Wed, 3 Jul 2013 01:19:29 -0700 (PDT)
In-Reply-To: <51D3DDED.7060804@intel.com>
References: <cover.1369298825.git.cazfi74@gmail.com>
	<519EA042.1@linux.intel.com>
	<CAF6bG8c7v4eFuw+QfjaE3HDsooYm9XOexx2wXQuaAM2W0OzM_Q@mail.gmail.com>
	<51D3DDED.7060804@intel.com>
Date: Wed, 3 Jul 2013 11:19:29 +0300
Message-ID: <CAF6bG8fVNGr+odjBEYhkgVRS+O=J9T9entPYikGz_uT53Y2g+Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Update automake to version 1.13.2
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
X-List-Received-Date: Wed, 03 Jul 2013 08:19:30 -0000
Content-Type: text/plain; charset=UTF-8

On 3 July 2013 11:16, Radu Moisan <radu.moisan@intel.com> wrote:
>
> On 05/25/2013 01:21 AM, Marko Lindqvist wrote:
>
>
>  Confirmed. Automake update to (any) 1.13.x version breaks gtk-engines
> build. I don't know yet if it's automake or gtk-engines bug.
>
>
> Any updates on this? Do we have a bug filled addressing this problem? I
> found several package which require automake 1.13.x for upgrade and this
> automake issue is blocking them.

 Sorry I have had no time to work on this. I did file automake bug
report, for which the response is
http://lists.gnu.org/archive/html/bug-automake/2013-06/msg00014.html
meaning we need to patch gtk-engines.


  -ML

