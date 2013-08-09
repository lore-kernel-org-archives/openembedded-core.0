Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 796C76066D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 12:14:24 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id ta17so6370403obb.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2013 05:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=VIxEsvFt1SkRtrFHr7SZ2KavFsjG42b1e89ImDOCOQQ=;
	b=T3ohQxpvpfjX+Dbw7gnYVxRAwZpD88EwwugNPpkQUlcCcwuQhLxNhaioVMHXce8WKt
	uV8IiuLYnhCTSoMRK6bCDQJu36hc7eqGRYC1t+YYfInFmkXQ7lKtaTMXNto6R6lEOTWo
	4JEB1G6DCps8/hcwjnEIBySgGrA/gQXR0P7G6fUGtOxw2DTs5agArbkvWs/LKQ1Moofr
	T1y3fpx/H+yav7VcrDxgMFXeDG3lnj2vTM8/f0GZRlvjZPHHshC/ShL8Pj8PEDywjQKC
	JcYfiRehq/I+ZyWwqEwyFvOmYer9eEww2oCw6G/+1WZTT8s3pphzaoSbuCIa3xxp5fHc
	qDMg==
MIME-Version: 1.0
X-Received: by 10.60.140.168 with SMTP id rh8mr325216oeb.76.1376050465131;
	Fri, 09 Aug 2013 05:14:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 9 Aug 2013 05:14:25 -0700 (PDT)
In-Reply-To: <1376045619-27438-1-git-send-email-mike.looijmans@topic.nl>
References: <1376045619-27438-1-git-send-email-mike.looijmans@topic.nl>
Date: Fri, 9 Aug 2013 09:14:25 -0300
X-Google-Sender-Auth: A0ZLw_rZBCSZUfyhIlg7773UGnk
Message-ID: <CAP9ODKoYVYntLva_V17QQEOcqthRoxt_R6kGpZ-+KWO1ERWLzA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] linux-dtb.inc: Replace /boot/ with /${KERNEL_IMAGEDEST}/
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
X-List-Received-Date: Fri, 09 Aug 2013 12:14:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 9, 2013 at 7:53 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> Devicetree files were installed hard-coded in /boot. When KERNEL_IMAGEDEST
> is anything else but "boot", the postinstall script and the file locations
> no longer match and the postinstall will fail.
>
> Replace "boot" with "${KERNEL_IMAGEDEST}" to fix this problem, and to allow
> the devicetree files to be installed in another location.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

