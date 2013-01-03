Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tqjkr-0005ep-2c
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 13:18:38 +0100
Received: from mail-vc0-f198.google.com ([209.85.220.198])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 03 Jan 2013 04:02:32 -0800
Received: by mail-vc0-f198.google.com with SMTP id n11so23324752vch.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 04:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ABVJFRDI5RRcyvcqUnGYJyKj+FfcK3tRknRV9sPyLOI=;
	b=LfyoGX7EG05uQ8vIFVEyOg8V3gHA3NKEeEHuztLigue8H61SNpV5DlxqfKzJu5ggE1
	Dfca8F5vM0J6LWHej3FzD9F0L4w3V5yfarJjLFSEo7ElxK7Xh0E/1Rme7dGNBuGD+uyT
	+DeKrgDpcdYvrxJ9OvIHPpWUxf28zEnjrnKZfNCj9e4Now0MUiQmYNd22LPDIjLFpCDf
	ktJvgb1nDS/Vvh0clsnbcUCa/KAejPydf+4gP9WU2dAkBRJNXTh6I9kT60oeVe43ondb
	GSXgfR7vBCFTvQmzHxn2t7d1sCszHi877dg7vuBh6xMF83BXMDtlPqN3uLPD6ib1eRG+
	fT4Q==
X-Received: by 10.58.48.231 with SMTP id p7mr76221323ven.11.1357214611211;
	Thu, 03 Jan 2013 04:03:31 -0800 (PST)
Received: by 10.58.48.231 with SMTP id p7mr76221318ven.11.1357214611087; Thu,
	03 Jan 2013 04:03:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Thu, 3 Jan 2013 04:03:11 -0800 (PST)
In-Reply-To: <20130103120117.GF3276@jama>
References: <1357213493-25506-1-git-send-email-ross.burton@intel.com>
	<20130103120117.GF3276@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Jan 2013 12:03:11 +0000
Message-ID: <CAJTo0LZnnb7YL9qAe=oMz7YXpjVXMJ3W7qqy5eEU-eK7sFyLtQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQlTrUhJ3K0e4VvbUBm7Be9Drzv13FIIOBhBVC4euHGJpl0hBkJPToQ1Thwd82Bnb0s4/voxDVf0UVdzOgNOVeUe+A6E6BXFQpNFcO+Cs1X0NupRImt0yFxjaSkC44/658k+lnvfKT+Tq7WuhwSF0M6SjA3h1Aw+d/bfcY3+6iJIA5bwHjTsfZdZ5ZGFxd1eWi+H0SDV
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+: add native class
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
X-List-Received-Date: Thu, 03 Jan 2013 12:18:39 -0000
Content-Type: text/plain; charset=UTF-8

On 3 January 2013 12:01, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Jan 03, 2013 at 11:44:53AM +0000, Ross Burton wrote:
>> It's easiest to bootstrap GTK+ 3 using a native GTK+ 2.
>>
>> (Patch taken from meta-oe)
>
> That's 4th or 5th version of this patch:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019625.html
>   rejected in http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019683.html
> http://patches.openembedded.org/patch/33761/
> http://patches.openembedded.org/patch/36913/

Hm, this could be fun.

Ross


