Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6EE8A6AA07
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 13:10:52 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id m1so1904427oag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 06:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=A198QyAhNA/+4khvs6WjsIL1xxDqjMpK+Bbue9Fg8nw=;
	b=ZkGtUhxP5DDDl1Dt8Dr7Ev20nUda2r5zrc47r61pUROzTfpgV7kQmCNZozVdnqRwKT
	seGnRvb+QMbBvVcuxAedLGD/V/PcNS2Gnwts6EkbQlL9y7rwAG74p0Hd8SDBWeqv/dx4
	RPemQFwrJPTqV6ipSyubID0wfKSdj0YpPlEExLMh/r280TjFNWhKJp4Ndzmso3bjuF4M
	TkRuvrlIBB+vd/BwTkVCt932qa0Km06zGWHv4Jupu/V77Xnirsu2/K3zN5fTpTTc1zQj
	7nPcEBxO5SqYjnHXyShk6bpiW/tzxQi5KBYW9m3riWO71aqo7PlMLfongvop48wOHZma
	dnLw==
MIME-Version: 1.0
X-Received: by 10.60.115.199 with SMTP id jq7mr6021814oeb.19.1372943453002;
	Thu, 04 Jul 2013 06:10:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.98.133 with HTTP; Thu, 4 Jul 2013 06:10:52 -0700 (PDT)
In-Reply-To: <1372871077-6363-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1372871077-6363-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Thu, 4 Jul 2013 10:10:52 -0300
X-Google-Sender-Auth: 4N-QGk09sIrIs3zhDBC4SmOUqb4
Message-ID: <CAP9ODKrXD9MzMTdqXTWNFiShCPv9TsRXFPcP9AEwQcSPuQjmCQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: disable qmeegographicssystemhelper
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
X-List-Received-Date: Thu, 04 Jul 2013 13:10:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 3, 2013 at 2:04 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> We don't want this enabled just because we have EGL and OpenGL ES 2.0
> enabled.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Agreed; maybe this could be considered for dylan as well?

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

