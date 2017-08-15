Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id C173177BDE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 18:08:23 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z48so1072832wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 11:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Juk7Szw61l/rcHp8jwsyiXDz6Ud5JwZ+Xxxtxk7Zo4c=;
	b=Pgz/4ToQdSBTJPMjOskDtub+MpdCigo3UhK5okuJtmk/iK2PKZM/UCFuewNGG8sr0A
	/sxoPBMX5GFzLHAgv7NACv5qft7u+xrZf5ic5NRefKZ4x28G388Qeg2WzcvQWRtA82F3
	5mUOS354nj/XRGw2d9p+jEI9uLMnhAJSq+IGp6RsBNEZbMkq1Td4Tu84WcL49fLSM5OQ
	wfguCNqZ17CKxvDX5+LmBfwK6mnmLeQHVInfCIlJ64OHB3rzPnSr/fZ7mkGl5iYECKk9
	jWHjSwHT15mTyFsUGjzJp7hLyJQk0a39+9GCgc+XxW/ao5RXY9CQti4NjJX2Y119dXub
	x8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Juk7Szw61l/rcHp8jwsyiXDz6Ud5JwZ+Xxxtxk7Zo4c=;
	b=eq3qJ0D8pqU/tnSvW1kx3ZH5gFhFclcZDQo3Nlq5ztVcujXVF3d/6YTZvikERSVgNB
	irzYxGo3DifSm8Upc539rFsqOGwLYdCZ8GkQvAtPMqpvEYwcmxQs51AV1mXo0uEdUAyb
	YdnobQbTqEf5kvA/JuBm2ESrx4ktpsGJxvUudESyZc3QcMuHYQfX6PbwraIM9loCWS0k
	t824YXJNOO63kPpciWvIX1TZpcv1146e3qx2Dnae+vqbpaqjy2XtZO56n/OPHOB0EHmP
	AM5j9+1E5hF3uLB96vZxBlJJHstZREZMbGI13JsKHYU1fDhxdDPXgAfbg2ycpOKrnqUp
	vlHQ==
X-Gm-Message-State: AHYfb5iP+7AY0xmMJjjY4wzZeHbcpEiyLMnqtThoHLSTi/00+CFpY+n9
	IKlTumRpP8JaJgLfBPJZvLMcoW+bKA==
X-Received: by 10.223.151.49 with SMTP id r46mr7486394wrb.6.1502820504286;
	Tue, 15 Aug 2017 11:08:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Tue, 15 Aug 2017 11:08:23 -0700 (PDT)
In-Reply-To: <1502806980.28941.38.camel@linux.intel.com>
References: <1502763838-84450-1-git-send-email-ee.peng.yeoh@intel.com>
	<1502806980.28941.38.camel@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 15 Aug 2017 11:08:23 -0700
Message-ID: <CAJ86T=VUO3j_D2-0JBP6Ng_5VUBfbNrm-tnTKERqHbAkzE1cqg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane: add qa check for lowercase recipe name
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
X-List-Received-Date: Tue, 15 Aug 2017 18:08:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 15, 2017 at 7:23 AM, Leonardo Sandoval
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> On Mon, 2017-08-14 at 19:23 -0700, Yeoh Ee Peng wrote:
>> Since we disabled uppercase characters in overrides a few releases ago,
>> uppercase characters in recipe names (and for that matter, distro and
>> machine names) cannot be supported due to their reliance upon overrides
>> including the name.
>>
>> QA check will produce an warning message when it verify that recipe
>> name is not lowercase.
>>
>> [YOCTO# 11592]
>>
>> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
>> ---
>>  meta/classes/insane.bbclass | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index b7177c9..8e062d1 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -27,7 +27,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
>>              installed-vs-shipped compile-host-path install-host-path \
>>              pn-overrides infodir build-deps \
>>              unknown-configure-option symlink-to-sysroot multilib \
>> -            invalid-packageconfig host-user-contaminated \
>> +            invalid-packageconfig host-user-contaminated pn_lowercase \
>>              "
>
> IMO, what you warn is that variable has uppercase letters, so the test
> should be named 'pn_uppercase'

All the other tests are named using '-' rather than '_', so
pn-uppercase (or uppercase-pn) might be even better.

>>  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>>              perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
>> @@ -1274,7 +1274,9 @@ python () {
>>      if pn in overrides:
>>          msg = 'Recipe %s has PN of "%s" which is in OVERRIDES, this can result in unexpected behaviour.' % (d.getVar("FILE"), pn)
>>          package_qa_handle_error("pn-overrides", msg, d)
>> -
>> +    if pn != pn.lower():
>> +        package_qa_handle_error("pn_lowercase", 'PN: %s is not lower case, this can result in unexpected behavior.' % pn, d)
>> +
>
> for performance reasons, perhaps it would be better to create a regex
> matching uppercases and if match succeeded, the raise the error/warning
>
> One more thing. At the beginning of the insane class, on the comments
> area you can include this one on the 'Checks we do' section.
>
>>      issues = []
>>      if (d.getVar('PACKAGES') or "").split():
>>          for dep in (d.getVar('QADEPENDS') or "").split():
>> --
>> 2.7.4
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

