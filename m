Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id DE3196BDFB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 23:53:12 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wo10so4074294obc.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 16:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=2KPFeEsG8P4fQSB61w5PRGZ+kvmJpbXvj5bn1DAAGvk=;
	b=d0+hQGRd65VOQ+YQb3yuSd2ojJlcSEXNbTZKPDm//BO72OByF601EsZlsvIvOsfe9B
	DGgkQM5dwS5RSeNH4oHOwyZq/XN/9EBq9XCrlIXgvkM3zCeTZxzJMNowS0Qfyd/b/a6t
	B+rgb23/WaphefG7AnFSx5AZFJ4HDXT0TUONfCLpvb23/LrFQx3HWdrEiYVomhJ+hptA
	gUgfg77Ppubs0Mpvd4gUB8dZsK8S2GpKTMkm1dmSslP8mYwtLVlbXw/YeSbdCF9TKrV1
	XYqz897U9nLt9KyF3gmxd4zYMAjjX4WIPbRAeP+yyY3wEvqBIjTp6CHooHGTlsurBSf7
	s86A==
MIME-Version: 1.0
X-Received: by 10.182.81.65 with SMTP id y1mr3754609obx.89.1378511594285; Fri,
	06 Sep 2013 16:53:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 6 Sep 2013 16:53:14 -0700 (PDT)
In-Reply-To: <6fbcf0525455de69c3ca8eab73a36fbaa0305cf8.1378498892.git.dvhart@linux.intel.com>
References: <cover.1378498892.git.dvhart@linux.intel.com>
	<e5bd7a223ff269bbd33766b5e6bd866cc2fa4dbb.1378498892.git.dvhart@linux.intel.com>
	<6fbcf0525455de69c3ca8eab73a36fbaa0305cf8.1378498892.git.dvhart@linux.intel.com>
Date: Fri, 6 Sep 2013 20:53:14 -0300
X-Google-Sender-Auth: jEq9HrwAuX1rBebedb22g_FdoW0
Message-ID: <CAP9ODKosCzpvwjwqQG3-kmcpfBzgU1kQf6Oec75dCR4Np39=HA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>, yunguo.wei@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] genericx86: Create a genericx86-common.inc base for the x86 BSPs
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
X-List-Received-Date: Fri, 06 Sep 2013 23:53:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 6, 2013 at 5:30 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> The genericx86 and genericx86-64 machines share a great deal in common
> in terms of machine features, required packages, etc. Use a common
> include file to simplify changes to both machine definitions and avoid
> accidental omissions.
>
> Replace the hard-coded XSERVER assignment with the XSERVER_IA32*
> defines from ia32-base.inc.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: yunguo.wei@windriver.com

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

