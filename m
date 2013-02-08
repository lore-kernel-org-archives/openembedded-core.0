Received: from mail-ve0-f180.google.com ([209.85.128.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3m6T-00054z-0m
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 12:26:49 +0100
Received: by mail-ve0-f180.google.com with SMTP id jx10so3115101veb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 03:10:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=47/EDzz384oIdn7SHWhtgbBEirl7bZU+jY9wN5S6Cu8=;
	b=eUQKx87eEmDYXlNUQnKNktS4Y+uG9/uskhJLkXV6R2o6ZVr5D71ct6Gin0fMwDf9nh
	IT8GSTgyvl/S2hOfWr2x6+qbOhvZNbp9S7Bip2ntE/viFfn3VO4oNMDG1ldAvmuEXw3b
	FzF1LP4QxcxapSS+qLgNQ6EZj7/rWJlBdoXlf5BiZ5kkPKM6XOUHbXtZLoUqJ58KobZW
	EH8rBxMGOx7VwVxaQ385ubT/31yvDh0O3nQSf0UopDfLgGCd20ZvnSq0bPdODFb1S3t2
	SNWF42byf+gA2b1kv19VYV5Mn5bUKP3MoATB2+pxD1iAVt3F4GgeADOEt1LcEq6xlHtU
	2/8A==
X-Received: by 10.58.106.161 with SMTP id gv1mr6126483veb.35.1360321855058;
	Fri, 08 Feb 2013 03:10:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 8 Feb 2013 03:10:34 -0800 (PST)
In-Reply-To: <CAP9ODKrBmqnOgRH0FhvuEvS-narJuQA_RLOLfBjjOsSPZa07ig@mail.gmail.com>
References: <1360090154-26766-1-git-send-email-ftonello@cercacor.com>
	<51115E97.1080404@linux.intel.com> <511182A9.2060702@felipetonello.com>
	<0CB2DDB0E2D34358AAD3481B8F78E9F1@intel.com>
	<5112D7D3.6020304@felipetonello.com>
	<CAP9ODKrBmqnOgRH0FhvuEvS-narJuQA_RLOLfBjjOsSPZa07ig@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Feb 2013 11:10:34 +0000
Message-ID: <CAJTo0LYtmvmEXQ9hu_ktj+TC+q4wB_6UgXA1onDxM3P3Wo4UFg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQlpF23/iVPWnA7pyErCB6WSDxJd3NzK11drFbixSbyIWrqpeBZbv4nQ1i11qqqXAXhQKOcN
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Fri, 08 Feb 2013 11:26:50 -0000
Content-Type: text/plain; charset=UTF-8

On 8 February 2013 11:05, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> So what was decided? Should I re-send the patch with what path?
>
> Until something inside OE-Core uses it I would prefer it in meta-oe. Ross?

If it were connman enabling in Qt directly I'd say oe-core, but as
it's a separate library meta-oe is the right place IMHO.

Ross


