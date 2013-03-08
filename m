Received: from mail-oa0-f54.google.com ([209.85.219.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UE2fc-0001dX-4c
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 20:09:38 +0100
Received: by mail-oa0-f54.google.com with SMTP id n12so2421523oag.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2013 10:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=villhj2joUTid/hDOUuHnpOjBp313GZPoiY2pNvZeeU=;
	b=rWH0yhmqqvDVjJpTtH1Ly/203SZhr7lXnOwPP9oc8v5jcCmwt+ShGCyOPHtXK1m/cZ
	PNY5iZr82tXfVNnnlfZzQfgToTtmW1T0f5PrYFZFBwwQnYguldzjR/q6GQV/p3ccWJ9r
	EJGzn7y8ndNFNdCxeiaQ4LKgDYOQNrC0X9JsH3AFSE1qnZa3/rXH9nfumDML4VFompkw
	2irq4a9mzQHLI92IAH8j85T66iKJFl5mfznUZ92PAirveE9qKeyjha9OYBev2ahJhYAc
	RtOnpomV7x/qGFfyimyvHRVqbrFYn5kmZqrpyOzaOKYg7j6B1K1Kk5Zu+MBirRMW+m+t
	H9xg==
MIME-Version: 1.0
X-Received: by 10.60.19.129 with SMTP id f1mr2598021oee.82.1362768777825; Fri,
	08 Mar 2013 10:52:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Fri, 8 Mar 2013 10:52:57 -0800 (PST)
In-Reply-To: <1362765064-27663-1-git-send-email-Chase.Maupin@ti.com>
References: <1362765064-27663-1-git-send-email-Chase.Maupin@ti.com>
Date: Fri, 8 Mar 2013 15:52:57 -0300
X-Google-Sender-Auth: nmX5JqhdqU8_C685nogS3rOBwxo
Message-ID: <CAP9ODKphM_vr-CgBbpm60tQixxepsCcMN60yGwofnhSRhrm-kA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chase Maupin <Chase.Maupin@ti.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] soc-family: fix SOC_FAMILY override order
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
X-List-Received-Date: Fri, 08 Mar 2013 19:09:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 8, 2013 at 2:51 PM, Chase Maupin <Chase.Maupin@ti.com> wrote:
> * the current order has SOC_FAMILY settings, which are generic
>   settings for a group of devices, overriding the machine specific
>   settings.  For example:
>
>   KERNEL_DEVICETREE_ti33x = "xxxx"
>   KERNEL_DEVICETREE_beaglebone = "yyyy"
>
>   Should yield "yyyy" when building for the beaglebone because
>   that is a more specific device than ti33x.  However, without this
>   change the result is that the value is set to "xxxx" meaning the
>   more generic setting overrides the more specific setting.
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Maybe while on that you could look at supporting xx:yy as SoC family?
like am37xx:am3715 ?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


