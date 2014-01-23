Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD6C6BC92
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:21:53 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wm4so1878428obc.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 03:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=IJAWIVd9m3jsq48HPpM71Z/qMZZ6qVc36Lrehz7J7uc=;
	b=oSx2sdGsXaXZ9gLSI5xlBgJuBeMfi2xQYE17SUzTh/X0BsTPAEi+qmw07sSRl7juc8
	2rJe1557xzO3AVBKQ1mbo6dYw2L2jw+oASu2WqYxtSwWoptLWGPThKMWraCxpzunPCnK
	iHVLdQVuE+NYrAvVmyUHIuhGWqqd8Ue6cpoblBgoNqTXUhkstmjckdU8CIGiO2HVra8i
	ZJsrXc6q2oz38IDgqXTT8WeIeOQW+m4dEjfcBrq1MXK5cg0+SiZYK+mtQZ9GKCi2aXDF
	3AV8n+ankxfsnhXJinUY1+sAjwTfh3tG/rTZm4Ubs8gOnHjVXI3ZyCoZHx6CGz1P94cF
	4Pyw==
MIME-Version: 1.0
X-Received: by 10.182.88.4 with SMTP id bc4mr274978obb.68.1390476114040; Thu,
	23 Jan 2014 03:21:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 03:21:53 -0800 (PST)
In-Reply-To: <1390459814-15764-1-git-send-email-sgw@linux.intel.com>
References: <1390459814-15764-1-git-send-email-sgw@linux.intel.com>
Date: Thu, 23 Jan 2014 09:21:53 -0200
X-Google-Sender-Auth: d6-SSniaW_UAsj9R8fMRAqfQ6EA
Message-ID: <CAP9ODKpRAwL0Sqbw1VAovLxK9irsOaECNVQxspFGFPNQn2R9NA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boot-directdisk: fix the support of vmdk
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
X-List-Received-Date: Thu, 23 Jan 2014 11:21:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 4:50 AM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Joao Henrique Ferreira de Freitas <joaohf@gmail.com>
>
> Previous change (086ce22b88f5ef5f75a83119a32c8b3fdcfa296d) broke
> the creating of vmdk images. This protects shell expansion variables
> and let dd generate the image to be transformed to vmdk by image-vmdk.class.
>
> Signed-off-by: Joao Henrique Ferreira de Freitas <joaohf@gmail.com>
>
> [edit to change the usage of IMAGE_FSTYPE to IS_VMDK]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

This is hard to review as it has two mixed changes.

It changes the IS_VMDK change and logical changes inside same patch.
Please split it in two patches.

Shell checking for true and false is Bash specific.

$ if [ false ]; then echo "Is true"; else echo "Is false"; fi
Is true

So this does not work with Dash. Please use IMAGE_FSTYPE = "vmdk" for
easy reading of the code.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

