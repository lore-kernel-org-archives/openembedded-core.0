Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9C6A46F917
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 20:00:24 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id a41so1420563yho.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 13:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=VedOxtmsQCdiNBMGB8fBtH2BZ7zHW8Wry6TUYwQyBio=;
	b=SCFRqMNxYFH8PuvaxpH2qSZDxJwM4DmXkefhHyzV4pNw+k+9IAYqpea35/F8J4lBgS
	T1SWAhwum13YodVk7aAMe7w145GaCWumryA2q331axdja7bjzsvTgaO6mBBZlBJ6LLKB
	D5QtuFdYgaVQNN0y23vWP1l63Fi8vUjbImOsoK1PVvV/+MXFkMsBAMZfy/l/439+0WDz
	zcEyvqZoQgGvcJ3gksJAI9qPcbo6UAloibkmXCPQDymmmejMLdoTCRVL82YANEf734/F
	9gi8aRVFebZMF4fBoE3BMwHCDEMHMeHfX7WVof3sUgtvKC4JTPgf5i2nRGPfwjboeHnC
	+z/w==
MIME-Version: 1.0
X-Received: by 10.236.60.68 with SMTP id t44mr36893506yhc.47.1395345625376;
	Thu, 20 Mar 2014 13:00:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 20 Mar 2014 13:00:25 -0700 (PDT)
In-Reply-To: <1395246282-8546-4-git-send-email-otavio@ossystems.com.br>
References: <1395246282-8546-1-git-send-email-otavio@ossystems.com.br>
	<1395246282-8546-4-git-send-email-otavio@ossystems.com.br>
Date: Thu, 20 Mar 2014 17:00:25 -0300
X-Google-Sender-Auth: zWS29jUqOuPycNLC6fCfjCISYbc
Message-ID: <CAP9ODKpoaUqrGUVB9PeaK1RQDsSxsMsxVim=RYNirmbxRY7YiQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, "Burton,
	Ross" <ross.burton@intel.com>, Saul Wold <saul.wold@intel.com>
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 4/4] cogl-1.0 : Update to 1.16.2 release
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
X-List-Received-Date: Thu, 20 Mar 2014 20:00:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 19, 2014 at 1:24 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>
> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

This update fixes some build problems we had in meta-fsl-arm. Prabhu
did runtime test it and we'd like to have it considered for inclusion.

Looking forward for your feedback on this.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

