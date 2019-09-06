Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE197F363
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 11:09:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46PvwP1k4sz5c;
	Fri,  6 Sep 2019 13:09:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567768197;
	bh=ANE+JquqDJq99lCzdarA+m+9BNmHDBFNz5Ca5IoPXAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T2HsgS2GUAkDFtJrxcqLWq5wmAKAha/Q+09+XEIH86k9j4Cki2yL8LaVpyKPZ2blb
	8R6cQZRGGblkud1+MvZol6sfSF/LWu69/qR16Ae+a2wOXZpP4Ril84csMXRvD7yzrk
	cqGZ+qvQ10UvIv7KJzE3UmW12o6yff83+1kAoJVRVA2yDhNz454CrtGlRbn/zoQAxt
	PRKV4wjOrz5BHnCZhVL+esXnl8OIduk/lJR6SLRBMhtN1fKs2ye82pVc06m+YrcIrC
	7YtsxXfGCA8zuT7mm7AmLJnUzweQSo9PVmVZ+abXvrWqFnok/zfQLilkpq01fVuBi0
	FgLsbEDZ2i7v+GQcXYF8yRf5CVC0n+wIhUGcYwqCg67sHtUL325sV39bnFmPHDtoXa
	nRZNIDasmg1QaAPRAs4UMvR0jLjl9keYqfaxGyPgyj68LCv0vOuZ7LYWOuH5BEIzNE
	FliqhVDYK0cRhX8aA6ToTCU06c11XudU9sKAIG2Ee0S2WzPHzDM3ogihYg+Rvkg2G6
	42C2fg11OZn7PsUuI7Glptmd+1i7361K4qp72klbV6e6y0+RHzmgPXNPKA1GXwg2OG
	NJT9nKIHJ0180E0aISocWuS0A0eUCOAx9aqycARH3UdIGrAJj1nUcO2TDsJ6xLYrEC
	FV9CR8GxiVbIvoLTXqDCPyIk=
Date: Fri, 6 Sep 2019 14:09:55 +0300
From: Adrian Bunk <bunk@stusta.de>
To: yocto@yoctoproject.org, Scott Rifenbark <srifenbark@gmail.com>
Message-ID: <20190906110955.GA7337@localhost>
References: <20190731132957.4782-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20190731132957.4782-1-bunk@stusta.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [yocto] [yocto-docs][PATCH] ref-manual: Remove documentation for the removed gnome class
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
X-List-Received-Date: Fri, 06 Sep 2019 11:09:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

ping

On Wed, Jul 31, 2019 at 04:29:57PM +0300, Adrian Bunk wrote:
> When removed all it did was
>   inherit gnomebase gtk-icon-cache gconf mime
> which would also be the most trivial replacement.
> 
> Most of the time not all of these classes were needed,
> and it is recommended to use only the ones actually required.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  documentation/ref-manual/ref-classes.xml | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
> index 37619e382d..5403f20b6f 100644
> --- a/documentation/ref-manual/ref-classes.xml
> +++ b/documentation/ref-manual/ref-classes.xml
> @@ -920,21 +920,6 @@
>      </para>
>  </section>
>  
> -<section id='ref-classes-gnome'>
> -    <title><filename>gnome.bbclass</filename></title>
> -
> -    <para>
> -        The <filename>gnome</filename> class supports recipes that
> -        build software from the GNOME stack.
> -        This class inherits the
> -        <link linkend='ref-classes-gnomebase'><filename>gnomebase</filename></link>,
> -        <link linkend='ref-classes-gtk-icon-cache'><filename>gtk-icon-cache</filename></link>,
> -        <link linkend='ref-classes-gconf'><filename>gconf</filename></link> and
> -        <link linkend='ref-classes-mime'><filename>mime</filename></link> classes.
> -        The class also disables GObject introspection where applicable.
> -    </para>
> -</section>
> -
>  <section id='ref-classes-gnomebase'>
>      <title><filename>gnomebase.bbclass</filename></title>
>  
> -- 
> 2.17.1
> 
> -- 
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto


