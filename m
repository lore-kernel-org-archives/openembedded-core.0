Received: from mail-oa0-f52.google.com ([209.85.219.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UAAW6-0001vR-Pf
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 03:43:54 +0100
Received: by mail-oa0-f52.google.com with SMTP id k14so4424694oag.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 18:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=xHZSAikgY3wrhDJIVCEs+vEPhL22Ig7iYDsVTmL+lJc=;
	b=c/UVCqazEVZIy7iHlSILdYi55p92IYhQOAD7nLAyy7ZlwPjq351/NcOsMCoyJMWhXs
	frbLYGWY9jnD+VWaU69ftJzgJneYB3VD7J0Szi5pkZK6uh191FAw2fOnlQo7fKmD/kLR
	2XqK0GIFoSQoEBWTzGdRyQYqzZ+qYZ95m7u4Ro9J4/reK66NnSDvSHDQza8LTdbCgXTX
	2llcST/atBz1hwAJy9x79eMAbBjv2NLQrysDDMGhLiWxO/YVBBja20fSYg7J2AKUXSoY
	LWQcRzePO/hNwKQnbm9E2ebOrclPqKPUYGNL54pM8w6HgpoCOzEOXDbq3hpgbiaSCpt0
	yAVA==
MIME-Version: 1.0
X-Received: by 10.60.19.228 with SMTP id i4mr27409oee.40.1361845643765; Mon,
	25 Feb 2013 18:27:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Mon, 25 Feb 2013 18:27:23 -0800 (PST)
In-Reply-To: <1361841584-4776-1-git-send-email-ming.liu@windriver.com>
References: <1361841584-4776-1-git-send-email-ming.liu@windriver.com>
Date: Mon, 25 Feb 2013 23:27:23 -0300
X-Google-Sender-Auth: KZD-G4WUvC_1XhDQfHfiMMUYeNc
Message-ID: <CAP9ODKo4LVNcTWoW8dmM87fHeZ12i7Jm7RLCnyWqapKbAmbXvQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ming Liu <ming.liu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V1] parted: fix several integer overflows
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 02:43:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 25, 2013 at 10:19 PM, Ming Liu <ming.liu@windriver.com> wrote:
> Integer overflows were found in libparted/labels/dvh.c, while attemptting
> to assign unsigned int values to int types in some places. These overflows
> only can be observed on BE platforms like MIPS, when the "WORDS_BIGENDIAN"
> macro is defined in parted.
>
> Defined by unsigned int instead.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>

Did you send it upstream? Jim or I can review it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


