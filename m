Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 79FF0610D4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2013 18:08:15 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id x13so14105871ief.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2013 11:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=gGI/8vFk4t/dDEWmgfOsY27q5U21HMEvW49wgm9AhWg=;
	b=FtKJv2EA3e6d+QFYaXuMNic5R5R29G4LSxheaO3L3K8AFCGg6cH0eRMNAWR5erlVTy
	p4LNvTno22mrwCuYYGDx/vWjXzNwjuoi4LqsdSCYj8yANwb3m+YJjJNMeiwBoiVqzcMX
	RcimACrvibRl0Cnt62zQ6qxRm6acFCxSWA0TN59w9/ZbCAOxjfUmMWnAUb60L//EJRb8
	1LOmJl5EpmxVfYZuBUrUkGupd9kqfiJjj1OItoqnTn4ZongUZQDSYQFMLNrqiq0+imE/
	9/1vW6gdVh032RFpOVv7VsUVmQrUXzxSDF+Fj87ny90jh642dz4dA7Qhny4ErvFH9KZi
	HtfA==
MIME-Version: 1.0
X-Received: by 10.50.114.168 with SMTP id jh8mr14087625igb.6.1381082896792;
	Sun, 06 Oct 2013 11:08:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Sun, 6 Oct 2013 11:08:16 -0700 (PDT)
In-Reply-To: <1381049833.30971.16.camel@ted>
References: <1380925365-18427-1-git-send-email-otavio@ossystems.com.br>
	<1381049833.30971.16.camel@ted>
Date: Sun, 6 Oct 2013 15:08:16 -0300
X-Google-Sender-Auth: dBCeGu86zBBRnUaWRpRmfJQzhIk
Message-ID: <CAP9ODKpM1OWqVCcJW_yXyNgLNXG-dd=sc+-xF-c4JvLorBjD=g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-buildenv-internal: Add UBOOT_CONFIG to environment whitelist
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
X-List-Received-Date: Sun, 06 Oct 2013 18:08:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Oct 6, 2013 at 5:57 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-10-04 at 19:22 -0300, Otavio Salvador wrote:
>> The uboot-config class uses the UBOOT_CONFIG environment setting to
>> choose which U-Boot option is intended to build. It is convenient to
>> allow it to be set from the shell, as supported for MACHINE.
>>
>> This allow, for example, to trigger a build as:
>>
>> ,----
>> | MACHINE=imx28evk UBOOT_CONFIG=nand bitbake core-image-minimal
>> `----
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  scripts/oe-buildenv-internal | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> There are lots of things which we can expose from the shell, we only
> really want to default to be things which are commonly changed though.
> How often do people realistically change their uboot targets? I
> appreciate that when working on uboot its useful but I don't think this
> is a significant portion of the userbase?

Well this is hard to guess; I know this is important for me ask we
used it daily.

Besides that it is something which is very tied to the machine and it
makes sense to be to be allowed to override it from shell, as this
easy user's life in development and testing.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

