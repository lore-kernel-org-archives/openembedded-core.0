Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TGRnJ-0005E3-7H
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 11:51:09 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 25 Sep 2012 02:38:05 -0700
Received: by oagn9 with SMTP id n9so6518168oag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 02:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Mve/DmvYBLmpD9kMYRribnh7DEQlOkF6EchXiYb1Jws=;
	b=eta3DeDE5+SWomGVo8JnWBVeaazMN/WvnuORIUS+knKZ+JazZ7FPifn7zesQOX0yEf
	dekHDIEsj4+mfocy/07S901ggZa0Qf1YR4Spdcvz8yp2EaeEOBgrJ1toqFDLIoIRTOvS
	fiQTxkmZCZxRsi7MnPAyv4z9UUSpmiHqmr/Ddksi/hKg/hXl4SAZEXYGUDb3NTXkvZ9u
	HzGu0h2iuEYPZ3DCOahgaBw27HKMiH8NX+Icu4u9xwcmffxYHh5gaYSNuQFu6ShK8XiW
	lJR/f7oQNDug+opl8Dn/xa4a/B6rGJ9Suf69vlDVyPfubTBDcf3rRUxLTE8Ml2e2+FW3
	XnEQ==
Received: by 10.182.179.100 with SMTP id df4mr12104662obc.59.1348565898394;
	Tue, 25 Sep 2012 02:38:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 25 Sep 2012 02:37:58 -0700 (PDT)
In-Reply-To: <1348530882.25427.1.camel@lenny>
References: <1348530882.25427.1.camel@lenny>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Sep 2012 10:37:58 +0100
Message-ID: <CAJTo0Lb+6r338hR7V3bX7DrMRP6BmNy4snRLp=89qdf_NOo1XA@mail.gmail.com>
To: Colin Walters <walters@verbum.org>
X-Gm-Message-State: ALoCoQnm2ekoI9lKFbKu8MvBg+fJ0tRSDdyrUQU/Qa/4N906JrTBGoB2UuwoHpcQrJH5q6cGbUSO
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add packagegroup-core-buildessential
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
X-List-Received-Date: Tue, 25 Sep 2012 09:51:09 -0000
Content-Type: text/plain; charset=UTF-8

On 25 September 2012 00:54, Colin Walters <walters@verbum.org> wrote:
> So packagegroup-core-buildessential is intended to be similar to
> Debian's "build-essential" package.  It's the stuff needed by say 80+%
> of components, not worth repeating over and over.

Makes sense to me.

Ross


