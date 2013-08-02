Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id F28B66B42A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 12:17:58 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id n12so1171669oag.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2013 05:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=2/NixJ40OsHZFxxByeoLcADSMdlgwQYNANxNfkNc85k=;
	b=H1S+oOAs+ABH7+R4Rz8pXojhv0Tc/cYe47cootf91yb0Um25fspSNkGnPOjVnaWWTV
	y1bsl+Mluh55JtfuOr6gO/JHlIS7NZD4dL9Qp9PE9jTnvfUo36390D18tLS/zae3NuJq
	0y2dq1BnuQYvq+sdQZqD8ij8pXDortgiYO1Pl5CSp4INsMBGfOw7v4fULOtgRBa5zHRf
	Egj6dKiMww9IrgXcue8js+dpP3NS6eDDx5DWF2sTFwz2RMcYp5ees/lS3JRiZ1OnzkuO
	hFPgpW02w8WTbGdemx7kYOAPNKYjmm9j3JwRnnQ0voqIgc4nZX+si1Cy9vkvtzBrnPhA
	OO2Q==
MIME-Version: 1.0
X-Received: by 10.182.38.228 with SMTP id j4mr5005843obk.94.1375445879054;
	Fri, 02 Aug 2013 05:17:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 2 Aug 2013 05:17:58 -0700 (PDT)
In-Reply-To: <1375394875-23238-1-git-send-email-raj.khem@gmail.com>
References: <1375394875-23238-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 2 Aug 2013 09:17:58 -0300
X-Google-Sender-Auth: NoCxpnKtHdoaEIwD4kQy5or8xdE
Message-ID: <CAP9ODKqkn3WH=qohEVySc02rS12xJ3-N84drrApmJc7HYSRqOw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.8: Fix meta-fsl-arm iperf build issue
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
X-List-Received-Date: Fri, 02 Aug 2013 12:17:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 1, 2013 at 7:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
> This should fix the problem seen where gcc ICE
> was happening when compiling iperf with older 2.6.x
> kernel

In fact it is 'perf', not iperf ;-)

> Test this patch by reverting below commit in meta-fsl-arm
>
> commit daf582c93a7283fb0af3b25fe2ada48f4c9985c4
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Tue Jul 2 11:52:51 2013 -0300
>
>     perf: Disable FPU tune for i.MX5 SoCs to workaround GCC ICE
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> CC: Otavio Salvador <otavio@ossystems.com.br>

Tested-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

