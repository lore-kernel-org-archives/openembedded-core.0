Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id EF6E565CF7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 18:57:54 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o6so6897000oag.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jul 2014 11:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=6NFZwtDmVS+zYQgw/NU1+X7nNHo0rXUrzaKbcGiosCM=;
	b=PtcAAB6OOh/YM8LbpgBgtY7Y4L1e2LwpWTLqcqYoqESvLBK6RJzNv8EMuJFb7tlvZ/
	mysc2dyMVv1WEnHuDDSVxP8xKKICSEzvWKbzW7+QqtsizlYd6Ls1bfSgIGAwIIzqLT2W
	C3s7wSpe8dVcju2sXGFA7MmFc2ni6Igkd1NIQd35UsKZoPsIgF/VtPDJpRBESYQD5rV2
	djUm3QGkKrnyKBLG0f1ac13iONLF1uGT+X0baFvs5Y2dOa68pqC0a3RG0bjQGc/ofSZd
	zbrnAWyJOy9hfeczHPT5Axr1ji52YUvnCaSIYAqHpTYcrsDwuq4pZLKIvSI0KrZ6MgAd
	Ugyw==
MIME-Version: 1.0
X-Received: by 10.182.214.98 with SMTP id nz2mr41219707obc.62.1404845875412;
	Tue, 08 Jul 2014 11:57:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.84.164 with HTTP; Tue, 8 Jul 2014 11:57:55 -0700 (PDT)
In-Reply-To: <cover.1404812342.git.hongxu.jia@windriver.com>
References: <cover.1404812342.git.hongxu.jia@windriver.com>
Date: Tue, 8 Jul 2014 15:57:55 -0300
X-Google-Sender-Auth: SgYFtFfoknnIL1opXjygi4PdLyc
Message-ID: <CAP9ODKrRR-F-6Qpnj=KLqY0=S3gf0VTPdAsppVj7G+xOX7GODw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] support xmlto
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
X-List-Received-Date: Tue, 08 Jul 2014 18:57:59 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

On Tue, Jul 8, 2014 at 6:47 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> The xmlto was shipped from meta-oe, and fixed the defects that
> 'xmlto/xsltproc stylesheets cannot be found even when they are
> installed in sysroot'
>
> The xmlto required docbook-xml-dtd and docbook-xsl-stylesheets,
> we refered debian's docbook-xml-dtd and ubuntu config.
>
> We also enable xmlto for alsa-utils, xorg-proto-common.inc,
> xorg-lib-common.inc, xserver-xorg.inc.
>
> The test is easy, just build alsa-utils.

The commit logs in the patches need to be extended. Please bear on
mind that people does not have the cover letter when reading the 'git
log' and thus all important information needs to be added in each
commit.

I also don't see /why/ this is being done. Please clarify.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

