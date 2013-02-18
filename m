Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7UZy-0006rp-Lc
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 18:32:59 +0100
Received: by mail-vc0-f182.google.com with SMTP id fl17so3732238vcb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 09:16:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Gj0VdNDcZRSDoj9il8XNxa/9x4Jxiop636vrxYm8TB0=;
	b=j9HOJ8NoOUQ5In4J/Kg9cfBXExpg4yqydPa4YRciMCoQPhgOEB+yWXMo96AAEm5t2/
	CfiVxNnh2kRlDuFQLcg697ooZiuw8m3LSq0Z3Es967pBSuSkaj0KhC8STXY/Qjdd6D2b
	CyBPbC2wixe4eL255PdnndHkq3FGcbyyxsvdIPlGheoiB2LmV72pyHERHGPH6KOTq+Gq
	Qhi1N1TC1wPE991+bw8GKlimSRRWwOV4nVp9z06FhiqxM855QxMaf+Q4i22ymJWo/BbP
	i63eo8NJ6vSgdzqVoeiiltTEMsb5H91vNt3Ji2LCQZFccnzRavh8IjeQCvLu8Bq+ijAf
	TPww==
X-Received: by 10.52.96.134 with SMTP id ds6mr14254322vdb.107.1361207790207;
	Mon, 18 Feb 2013 09:16:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Mon, 18 Feb 2013 09:16:10 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1301011252140.20712@oneiric>
References: <alpine.DEB.2.02.1301011252140.20712@oneiric>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Feb 2013 17:16:10 +0000
Message-ID: <CAJTo0Lady=XrQnuF-=CedC3D+Q8K-LyUP8zX4Gs6FoAHJ46Xrw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Gm-Message-State: ALoCoQnZ2TjloZjhIwn5xSl5HbrCZumEQbcXhn57xtPQ8cm4KSM/hK57mXaRSdPDskyuScVdEbP5
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: weird FILESEXTRAPATHS_append in mesa-common.inc
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
X-List-Received-Date: Mon, 18 Feb 2013 17:33:01 -0000
Content-Type: text/plain; charset=UTF-8

On 1 January 2013 17:55, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   these two lines from mesa-common.inc:
>
> # for mesa-dri and mesa-xlib
> FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
>
> that second line is definitely misleading as it doesn't append, it
> prepends (as opposed to what you see in mesa-git.inc):
>
> FILESEXTRAPATHS_prepend := "${THISDIR}/mesa-git:"
>
> which is still unnecessary since all you need is
>
> FILESEXTRAPATHS = "${THISDIR}/mesa-git"
>
> no?
>
>   also, that comment in mesa-common.inc is out of date, as mesa-xlib
> disappeared a few months back.

Just re-discovered this in my starred mail folder.  Yes, it can all go
- build-testing now.

Ross


