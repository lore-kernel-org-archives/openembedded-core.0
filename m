Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBMjq-0005nJ-VG
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 11:26:35 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 02:14:03 -0700
Received: by obblz20 with SMTP id lz20so382889obb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 02:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=dlSdOl4/6TKNRkZNUfr0O8B6W2b5IUH2iFuHOB4Y3QY=;
	b=bmcM1WvMGAF2vFQ05zhJEPoHIHqWxK5hFUqsVnUDt+4QDnvgtmY7NOPO1dUOK9763S
	AVwjrIc/3PGgrKScz2zRt8phzbfgO9nTWmc0kRSKjFy0Yd7Bt2l99KMUoIrChedYeqr7
	EUjs5Rilwh0MATIsN5Jrg9uIeLoVcngUcr3+f+Fkt4vGM1zeksL0o5DI0Czy0EsH3jKt
	sQLViYYIDN+npOANvdf2Jo8FqVEswAXrQu1vR2eNakqjwRiX5XHAZDwDN4ZrajeBf9W0
	aEmHZBrVKo5+AY42Grb34IbODxCOUSGOPQLkS0utMHFQFG/Y9dwt9kIQwVKVDcKue0j5
	BRCw==
Received: by 10.182.179.100 with SMTP id df4mr4520511obc.59.1347354841876;
	Tue, 11 Sep 2012 02:14:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 11 Sep 2012 02:13:40 -0700 (PDT)
In-Reply-To: <1347312212.1908.2.camel@lenny>
References: <1347292942-7241-1-git-send-email-ross.burton@intel.com>
	<1347311665.1908.1.camel@lenny> <1347312212.1908.2.camel@lenny>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Sep 2012 10:13:40 +0100
Message-ID: <CAJTo0LZQYbMAidy9Y5or29CV5sB2pnaiL62Sz9X3XJw5-gx0RQ@mail.gmail.com>
To: Colin Walters <walters@verbum.org>
X-Gm-Message-State: ALoCoQk+8ZnWitW9GPnGVNn4gVp+d7DeoCPwv/HL2op0qVufENXGq+P0ZV056tnkBlxi04lOTcf0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkit-gtk: work around Make bug by re-running make
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
X-List-Received-Date: Tue, 11 Sep 2012 09:26:35 -0000
Content-Type: text/plain; charset=UTF-8

On 10 September 2012 22:23, Colin Walters <walters@verbum.org> wrote:
> On Mon, 2012-09-10 at 17:14 -0400, Colin Walters wrote:
>> On Mon, 2012-09-10 at 17:02 +0100, Ross Burton wrote:
>>
>> > +# fixed in Make CVS, so 3.83 won't have this problem.
>>
>> I know this will be painful, but did you consider looking at the make
>> version and determine whether or not this workaround is necessary?
>
> Or actually, why not just backport the make patch into core now?

I had a branch that added make-replacement-native 3.81 as a dependency
of WebKit, but that's far too fragile.

An alternative would be to add make-native as part of the bootstrap.
At this late stage in the release that's rather invasive.

Ross


