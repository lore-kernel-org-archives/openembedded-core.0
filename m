Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPHPH-00031x-It
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 20:02:35 +0200
Received: by qcso7 with SMTP id o7so2071773qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 10:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=KzHexrhwGrdBxFPw1hIW0DklCBTUt+an1I6FlpohhtU=;
	b=R5bRRipdpQe9rqk7E5BzzQKQzSEHOheFh1Vo/y7kGw+ih4fLJEamUzduQyhWSps1un
	kpnCW4DJ3aEaTuHdN4MsKWrNJqKcCgUVmhYjKymmeeseZ6mRPrfkPdBcmR7TNiXH9Mis
	/cKFnQWYjNGex34dI8V0dBMOPI2tWVVvIwyQD44ElKPJ6ZERFbxVgwJylxy33RN6g/w8
	S/2T/c5p8KGygVu0hL6XuyExMaI5Nx2cfSfh7E5zHqG65X6eTshwSuQFsg6+57H9yJNn
	K12hpCHGBysQif34EuNbbtXXTb3oe6KaVd78B8RXFa1NkVw8q+oafdplDtSXB7iV/xIK
	WKcw==
Received: by 10.224.185.204 with SMTP id cp12mr16866603qab.42.1335894771795;
	Tue, 01 May 2012 10:52:51 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Tue, 1 May 2012 10:52:31 -0700 (PDT)
In-Reply-To: <CAMKF1spq7z3nOUEESunkUmfbTVg2T3LHpD6A3AFMh7zovkWq3w@mail.gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
	<118912916f6c04b157345bbcb1c722a575769859.1335887732.git.kergoth@gmail.com>
	<CAMKF1spq7z3nOUEESunkUmfbTVg2T3LHpD6A3AFMh7zovkWq3w@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 1 May 2012 10:52:31 -0700
X-Google-Sender-Auth: yGwrTkSNVov3XpHV8-vAVKeOrMg
Message-ID: <CABcZANkir_w2WPY4w==Nmq66M1dxnooDqveP646zCeQPPYagvg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] tcmode-external-csl: use the existing precompiled locale files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2012 18:02:35 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 1, 2012 at 10:28 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, May 1, 2012 at 8:58 AM, Christopher Larson <kergoth@gmail.com> wrote:
>> +# No need to re-compile the locale files
>> +GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
>> +ENABLE_BINARY_LOCALE_GENERATION = ""
>
> should this be 0

Either 0 or the empty string have the same effect. I suppose I could
change it to 0 for consistency, though.
-- 
Christopher Larson


