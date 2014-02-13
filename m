Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7C5536E894
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 10:42:54 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id t59so9923000yho.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 02:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=XxdNutbnDcLk3YCkKygYesROdbtBDNfoCgKlC1yCaTc=;
	b=GOkJkdcucDKHYvqgtpQzNeamDKnI1hhi5UyXXBhOtBJzbThDqD9ROfxoHy7OJf1lmO
	MPxxd6Xf91LKnKKq3LICKpPHXr2Ana/yfrlnh+3aixV63TtDSaXYX+ax15+saZ4Maj2g
	rJOVoEV5XB8Detl9auztsDB3H1FamchSGOc9rgamQhi93WQMH2eaGGdgS4i/w9MSMvJC
	pzHeedO/KPCDB3aCjewEk6l+IEhvKAuZWFcP1OwEsIkHEDo7NZlHZt/WyYuZ7HqWxPEt
	3rYroizlq8Zw15i/wXCIaJN7F4asrwKAXjH+a1w1/M4VJoDzEtXWkHiag5uJKlrzKeW1
	4R0Q==
MIME-Version: 1.0
X-Received: by 10.236.157.102 with SMTP id n66mr614078yhk.41.1392288175211;
	Thu, 13 Feb 2014 02:42:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.161.3 with HTTP; Thu, 13 Feb 2014 02:42:55 -0800 (PST)
In-Reply-To: <1392277181-19357-1-git-send-email-fathi.boudra@linaro.org>
References: <1392277181-19357-1-git-send-email-fathi.boudra@linaro.org>
Date: Thu, 13 Feb 2014 08:42:55 -0200
X-Google-Sender-Auth: 00MSDKOqLIiZL-F4i6Ep9VghuNs
Message-ID: <CAP9ODKoYyYCBx4Ei7Fcf9KsKcWx1+E=98H72VQvxX28kH_j=WA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemtap: fix error: 'EM_AARCH64' was not declared in this scope
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
X-List-Received-Date: Thu, 13 Feb 2014 10:42:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 13, 2014 at 5:39 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> bump SRCREV to commit 508059f04842ed85d10bfbec8a9c688d57368860
>  Define EM_AARCH64 if elf.h doesn't.
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

