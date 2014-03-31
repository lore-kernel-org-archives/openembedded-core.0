Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id E79B56F8B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 20:49:52 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f10so8177494yha.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 13:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=NPlc6beF/hbOLS8dvXnmH/E1rcxp1nB2HfzifzRcnF8=;
	b=meVrwvpR6JDnV5D56fJ2PhdmfAhXiTKpk1CKRlscFwWridnb5PO9GvQaZHG2h24qz+
	JAa5N1+/7p9LbVWFwUXeiUrhImt3mFrjnq83xqZdogtxuraWBMdyqPiT/oHiBWNtb1kX
	HgKPlvGShurR3vznDPWdL0vnKm79UiKP6aXMLy/73zUpMzcD06kYLYuboxKqyBaf9Dk7
	6ofh3NkSIzNk+U1x6dMV9n3SfwoeI1O7ZqLI9g/PUSopFOuOPsbvLUzHDJaXe0ak1QJE
	3QPtC0h5jIT5waopswEja/SSOiAOtvFtWRlaQ1EGXEoOOtetS6w1hz0lUe3at4CuOt+M
	IKDQ==
MIME-Version: 1.0
X-Received: by 10.236.40.12 with SMTP id e12mr4272604yhb.155.1396298993477;
	Mon, 31 Mar 2014 13:49:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Mon, 31 Mar 2014 13:49:53 -0700 (PDT)
In-Reply-To: <20140331151018.GG2425@jama>
References: <1396275649-32352-1-git-send-email-kai.kang@windriver.com>
	<1396275649-32352-2-git-send-email-kai.kang@windriver.com>
	<20140331151018.GG2425@jama>
Date: Mon, 31 Mar 2014 17:49:53 -0300
X-Google-Sender-Auth: jPh502yh-a2-6I7vi3CI80YQ2to
Message-ID: <CAP9ODKriT1eZNb7g_sReHh8HuCuTN+ovCyV1hyYYoJRpL6OULg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nss: avoid to use the hardcode kernel version
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
X-List-Received-Date: Mon, 31 Mar 2014 20:49:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 31, 2014 at 12:10 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Mar 31, 2014 at 10:20:49PM +0800, Kai Kang wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> When native package is built, use the uname to return the kernel version.
>>
>> When target is built, read kernel version from ${STAGING_KERNEL_DIR}/kernel-abiversion
>> to avoid to use the hardcode kernel version.
>
> Doesn't it make nss MACHINE_ARCH like most virtual/kernel providers are?

Yes.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

