Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC596C735
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 15:53:14 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id w7so1102073lbi.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 07:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ugyxi7dqC+wdcBLP4BaTzVRFh7Ba8wRLgm7Yh9o35ZQ=;
	b=CCZMdthWaGp+oRODWMKHUKRfvbbCTpt1KfDbu/IejtBGubhVSvlkudb9YkrptU2oYA
	VLU2Eu1wyKOKHXtf3ntulfOWM/tG2nhF/m7RzXYGNBJgbhfVn6lxivPBP5YDvFMIc58y
	tPqkM441re58TUd9EB60NheaWzM1zhiVqZ9eKvHMlRmJK8q3tprlHEkVGdT67HgqFfp4
	buyGixAlbuyzVQYXxXXooLAGzrohIcfk2NYvJ+Ac/68ELURpHvqko0AD3QYYEhF9g4wY
	MRXolWZ1f6Go/kjw3VWPOs+qloJhjjb2EkDYmF3P1/W7y0ywEtB3inr6gX3Q9Ly0vUeE
	R2aA==
MIME-Version: 1.0
X-Received: by 10.112.136.163 with SMTP id qb3mr9589267lbb.14.1385135593062;
	Fri, 22 Nov 2013 07:53:13 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Fri, 22 Nov 2013 07:53:13 -0800 (PST)
In-Reply-To: <1385129059-941-2-git-send-email-mac@mcrowe.com>
References: <1385129059-941-1-git-send-email-mac@mcrowe.com>
	<1385129059-941-2-git-send-email-mac@mcrowe.com>
Date: Fri, 22 Nov 2013 10:53:13 -0500
Message-ID: <CADkTA4NNCzjF9M1xQsvdETjtb3MiFiHjiCbaCJ6Sy3Y=p0qFoA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Mike Crowe <mcrowe@brightsign.biz>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] Revert "kernel.bbclass: move bundle_initramfs after kernel_link_vmlinux"
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
X-List-Received-Date: Fri, 22 Nov 2013 15:53:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 22, 2013 at 9:04 AM, Mike Crowe <mac@mcrowe.com> wrote:
> This reverts commit 3baa63b4d588c3262254528b406ede265dd117bf. It broke
> builds that aren't using kernel-yocto.

Can we get a log message of the breakage in the commit ? And a follow up
question, have we simply restored the issue that the original commit was
fixing ?

Bruce

>
> Signed-off-by: Mike Crowe <mcrowe@brightsign.biz>
> ---
>  meta/classes/kernel.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 48999fe..ba13e67 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -152,7 +152,7 @@ python do_devshell_prepend () {
>      os.environ["LDFLAGS"] = ''
>  }
>
> -addtask bundle_initramfs after do_kernel_link_vmlinux before do_build
> +addtask bundle_initramfs after do_compile before do_build
>
>  kernel_do_compile() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

