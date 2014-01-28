Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id DBA116EA1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 23:10:43 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id x13so1336202ief.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 15:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UJ0iSFEfvD3lBz11YFEC2Oo3qcKmb9wRtzyBWPV9ZWg=;
	b=qwbZ1X527D2cOKcn8bIZzFrHORt9R8JafB0x+6aaJNOgyji7vsEcJeXpe9G4QCNb9h
	VzT8XiKr/dDwhnWUKBRFt1GPriTJeiANp9cJEpGgn5Z/FD+ddFde4bA9Wsq396fzFCFj
	cOKdZyOvMf1SNeQhOAnpL9FMji4hrx2Tuakh7b+M06RbmUXN2etw2JhAMyb8YbdpHoaE
	rxUhxN46JSxE7mpBlGmaQl9yaH/O5hbwQ/Pwgi4swrFe/HbDPRAcwQWMJbjdv1wvufdy
	cgXxoWNTlPz0jIEEiPckQIZnA/gK1Tkv4N8ZfWRzyVR3HYGeXea5ldxKr/g3bQ4yixXa
	IpXg==
X-Received: by 10.43.153.68 with SMTP id kz4mr3313346icc.29.1390950644945;
	Tue, 28 Jan 2014 15:10:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Tue, 28 Jan 2014 15:10:14 -0800 (PST)
In-Reply-To: <1390912914-31576-6-git-send-email-fathi.boudra@linaro.org>
References: <1390912914-31576-1-git-send-email-fathi.boudra@linaro.org>
	<1390912914-31576-6-git-send-email-fathi.boudra@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2014 15:10:14 -0800
Message-ID: <CAMKF1srV7p-EMraXcP8wOewVD4eLCwfCB9+o=zQdAK0Jr0XMQA@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 5/6] ltp: fix comment to refer to oe-core instead of poky
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
X-List-Received-Date: Tue, 28 Jan 2014 23:10:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 28, 2014 at 4:41 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  meta/recipes-extended/ltp/ltp_20140115.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
> index d9c707b..4e20f24 100644
> --- a/meta/recipes-extended/ltp/ltp_20140115.bb
> +++ b/meta/recipes-extended/ltp/ltp_20140115.bb
> @@ -43,7 +43,7 @@ do_install(){
>      # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
>      cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
>
> -    # We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in poky
> +    # We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in oe-core

Could expect is added as packageconfig instead of punting it out so
folks who have expect in their layermix can use it ? I know this
comment is not exact match for this patch however while you are at it
may be its  a good to consider that

>      # We will add expect for enhancement in future
>      find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
>  }
> --
> 1.8.1.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

