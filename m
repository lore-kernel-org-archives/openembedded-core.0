Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web12.10539.1603103884240378364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 03:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=Z7IFKpW2;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4CFCrn4C2kzQl8x
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 12:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-type:content-type:in-reply-to
	:mime-version:date:date:message-id:from:from:references:subject
	:subject:received; s=mail20150812; t=1603103877; bh=q5Jz2hYm9+Qw
	8NE20lsYbUzwKR4d/g34fTYkYb6+Fu8=; b=Z7IFKpW2O9z5DH1+6Jmcm6QrNSS2
	YX6+j1atEjsPdlwoI+2DO5ONT1iIEbvPvJFUhEfJvUw8sw5i2Fv6gZ5xOQWD4P5y
	u33r+lykBqA06bZEy1fqCpgh4P/2lM+YyEwlD0z4Xtu3XExnIyC8Ds+3WTNQLfMv
	yWkOvTtOpgV2iKideSI2ZObpjH6aLsLuHcqBhkBDfFbI1dv0KlMJCUd8jxp3BGTg
	NwKAcIDDS/Dh9Ao4CV+XawXnrvLtM0K9GlojlzG8S9AO7NGPlR96YJTC8JzvjAQC
	4J3AwE4IzRh7igsPyMfYMuPs0Q+HqZWU5ESCZyR2PEieyY7GxfiV8J4VdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1603103879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tLTp2zrEoZdQcWGzknhxmGaaJrwH/Cy2k5uCFdx4+sg=;
	b=BnjW81erq8JcphaVeKM8socZcIPFsfX1dnivjK1yx7BuoRcKGPCse32R5FVtGXoL1Vmu8L
	J0HgoS7eG6WwERe7fg3NAmyIm+50NwjTTTXYJUsoH9DwE5oJt6DiZQzqlVBV2ZmkGHoGcB
	G5NuZ/4KhHw2H1Glmnd+ioXo8Gsq6JJ8gbMOWPYN95A1bUfleI2iJg5lZV0bpXniIRgqGh
	M+FKpI1jqrTKle/lfwBIUhq6QmJZ1qWZ0gSnjW+Jsq89ayeimOvzbTVUgJlW4kBzRjxHXI
	xAGvNly7Tmt0UTKWZxfU4i/v+mql2N1G0QL/IBLYSz+jAiOw0QnkgWdZzePRlQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
	with ESMTP id 2QRJrzDyPi-S
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2020 12:37:57 +0200 (CEST)
Subject: Re: [OE-core] [PATCH v3 12/20] gstreamer1.0-python: upgrade to version 1.18.0
To: openembedded-core@lists.openembedded.org
References: <0cee3989-5bb3-2705-39ce-2a729418cdba@mailbox.org>
 <11807.1603103343461617494@lists.openembedded.org>
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
Message-ID: <c4b5b27a-50b7-cc3a-dc2f-cabe1045cdc4@mailbox.org>
Date: Mon, 19 Oct 2020 12:37:56 +0200
MIME-Version: 1.0
In-Reply-To: <11807.1603103343461617494@lists.openembedded.org>
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -4.69 / 15.00 / 15.00
X-Rspamd-Queue-Id: 49E4E1709
X-Rspamd-UID: cfa3e6
Content-Type: multipart/alternative;
 boundary="------------2FB5202B4BE231096C69493E"
Content-Language: en-US

--------------2FB5202B4BE231096C69493E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ah ... right. Somehow I ended up using the V2 patch instead of the V3 
one. Thanks for pointing this out.

On 19.10.20 12:29, Jose Quaresma wrote:
> I think you are using the V2 pacth the V3 pacth have this fixed
>
> -DEPENDS = "gstreamer1.0 python3-pygobject"
> -RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
> +DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
> +RDEPENDS_${PN} += "gstreamer1.0 gstreamer1.0-plugins-base 
> python3-pygobject"
>
> 
>

--------------2FB5202B4BE231096C69493E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Ah ... right. Somehow I ended up using the V2 patch instead of
      the V3 one. Thanks for pointing this out.<br>
    </p>
    <div class="moz-cite-prefix">On 19.10.20 12:29, Jose Quaresma wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:11807.1603103343461617494@lists.openembedded.org">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      I think you are using the V2 pacth the V3 pacth have this fixed<br>
      <br>
      <span style="white-space: pre-wrap;">-DEPENDS = "gstreamer1.0 python3-pygobject"</span><br style="white-space: pre-wrap;"><span style="white-space: pre-wrap;">-RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"</span><br style="white-space: pre-wrap;"><span style="white-space: pre-wrap;">+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"</span><br style="white-space: pre-wrap;"><span style="white-space: pre-wrap;">+RDEPENDS_${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
</span><br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------2FB5202B4BE231096C69493E--
