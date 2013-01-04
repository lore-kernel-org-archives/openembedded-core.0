Received: from mail-vb0-f45.google.com ([209.85.212.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrAqd-0007tt-DF
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 18:14:57 +0100
Received: by mail-vb0-f45.google.com with SMTP id p1so16887760vbi.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 08:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pXDyPJd88qJ9LFRGjizjfWOUSUADELwab6nhf2sm90k=;
	b=aisgXVZuLbLGqmk2cE4qYb+TiuIUysUBnD1v1ZPv70LXd63rk01FBt+B5KrvauCnuK
	x9WzA6QI5iF4t6jt+AI1FHryYFs5a2tXe7L4UpcDUDfX03xJlbF2JXh7hOfqQ5Tzbw3j
	HDFgZqSssNEI0v6+qOYh2H5HbYv6iSIcMNCATxge+QEtI7ySoFIPzGdnzaE2AeUSrjfo
	2GnyRWbN578VPnO2gB3zYDxZHlnPtbZNJuaeMhrfmyWxte3bgTyGVnEZlDxJrDoVWCUg
	4KIA49IokFDcnsbvwWPLhaoSHa4TZsxX/gSHlbcgB5i5iGVZI96GddXygiDB580WdBfI
	VrLg==
MIME-Version: 1.0
Received: by 10.52.33.228 with SMTP id u4mr67170721vdi.4.1357318757759; Fri,
	04 Jan 2013 08:59:17 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Fri, 4 Jan 2013 08:59:17 -0800 (PST)
In-Reply-To: <50E70742.6060201@balister.org>
References: <50E70742.6060201@balister.org>
Date: Fri, 4 Jan 2013 18:59:17 +0200
Message-ID: <CAF6bG8d=147QWj7C3nzXdbFkenUF4b7EefnNTSXFBB15W8nySw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Philip Balister <philip@balister.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Recipes with SRC_URI in .inc file and checksum in bb file
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
X-List-Received-Date: Fri, 04 Jan 2013 17:14:58 -0000
Content-Type: text/plain; charset=UTF-8

On 4 January 2013 18:45, Philip Balister <philip@balister.org> wrote:
>
> I am on the process of updating the fftw recipes to the most recent
> version. Along the way I noticed it looks like the checksum test is
> being ignored. The only way I can get it to fail is to remove all the
> checksum entries from the bb files.

 I've got this kind of problems when I have made several iterations of
the recipe update. In my case the explanation has always been that
first test already downloaded the file, so no matter what I do to
checksums after that, there's no download + checksum check on later
tests.
 Remove file and <file>.done from download, + 'bitbake <recipe> -c clean'


 - ML


