Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6C12F6E65F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 05:10:28 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id s5so97586603qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2016 22:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Dri34fplmt78IAP9B2Zv2ctwST7Xqj+gBGIMnC+etzQ=;
	b=BOim0cQAYXZHkqaqw7XAaoRqIkQlxXQjkoYF4UyT39ZJEsYzA79Df4EGgyRwD+QVel
	fI7LDGVuacXURauB5AZgGZrSQlbdIMvX+dfly1Rc6JZBu0k4C0YOh6pDqPWDxCObKTvw
	DLDE5KDuijReAZ0OvCDo2HcabnUhTjsegGeZqxGrnaovQQ2u/Vez3jVFwsSxSq4y3JCc
	nOPl7I29lmXoEqt/vQjxv1ew73cjIL5qgkay2YXYTUJWLQAjZFFizd9Gh4NkBTiLR671
	e2Wo4cu/qp5Cue31SE2mDUat8aeaZxHWjBf4NFN5TJKqO7tlj1+ng8ushA7/5v2/+6oS
	YEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Dri34fplmt78IAP9B2Zv2ctwST7Xqj+gBGIMnC+etzQ=;
	b=JxUvf7x2+gnKbHSvoPk4l5NYUUMkAsew+PY8ADc5OtEZt74qNU9VslR1K0WQ3kYzi8
	PO07DRuZ9gi9Ae4auTUwAIbqnyDZjbCBsED+ZgoJf780qcsW+HKPmoKW2JWWPIZx+FLC
	d294BIgQI6Qx6irjujnGYeoMKZcC05mffCNWtLu/B1MlF1C3QTYOhLIa+QUqlKXVuyTE
	1Ow1S+mKVqzU6W85/gTbNhBVIrUzqtmvs4J2HLAJNlLK1ikKKv/1nOo/lCfMDpECLnD3
	mH0B+ljhh6Jpr81fh/gtWxUAlkxZPSLATx80bxQa2IkLBbnIHzm/FX5R7kmwDrmhQA2A
	+DMg==
X-Gm-Message-State: AD7BkJLunjfaxOFsZdE/WvTehLlRaUsqnktdHQiYS0OoFt1DPFs7mf+ZRCA24I9lDiDf/0e3iqmf11VsNgbmjQ==
X-Received: by 10.55.78.70 with SMTP id c67mr32495880qkb.37.1459141828840;
	Sun, 27 Mar 2016 22:10:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sun, 27 Mar 2016 22:09:59 -0700 (PDT)
In-Reply-To: <1458836404.3476.194.camel@pbcl.net>
References: <1458833075-543-1-git-send-email-raj.khem@gmail.com>
	<1458836404.3476.194.camel@pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Mar 2016 22:09:59 -0700
Message-ID: <CAMKF1sp28Zpc18=OQB=2y5bvbj1R0jRw+ix3B8g3w2hD2dbHvg@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nss: Explicitly link with libssp on musl/ppc
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
X-List-Received-Date: Mon, 28 Mar 2016 05:10:30 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 24, 2016 at 9:20 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Thu, 2016-03-24 at 15:24 +0000, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> This is all a bit obscure.  Please add an explanation of why this is
> needed specifically by ppc (and not other architectures) to the commit
> message.
>
> Also, the subject says "musl" but the patch doesn't seem to be
> obviously specific to musl.  Is SECURITY_LDFLAGS not used at all by
> other libcs?
>

This patch is not required anymore.

I took another dig at it and it turned out to be a bug in gcc for
musl, where it did not
detect libc's support for ssp correctly during configure as a result,
it would generate
wrong calls for __stack_chk_guard which were then marked with absolute
relocations
that linker could not resolve and spewed errors

See the latest pull request for more details.

http://patchwork.openembedded.org/patch/118829/

Thanks for raising concerns for this patch.

> p.
>
>> ---
>>  meta/recipes-support/nss/nss_3.21.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-support/nss/nss_3.21.bb b/meta/recipes-
>> support/nss/nss_3.21.bb
>> index d2e2411..9f2626b 100644
>> --- a/meta/recipes-support/nss/nss_3.21.bb
>> +++ b/meta/recipes-support/nss/nss_3.21.bb
>> @@ -41,6 +41,7 @@ TD = "${S}/tentative-dist"
>>  TDS = "${S}/tentative-dist-staging"
>>
>>  TARGET_CC_ARCH += "${LDFLAGS}"
>> +SECURITY_LDFLAGS_append_powerpc = " -lssp_nonshared -lssp"
>>
>>  do_configure_prepend_libc-musl () {
>>      sed -i -e '/-DHAVE_SYS_CDEFS_H/d'
>> ${S}/nss/lib/dbm/config/config.mk
>> --
>> 1.8.3.1
>>

