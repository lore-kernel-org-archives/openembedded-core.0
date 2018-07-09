Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8629D74621
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 09:39:12 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id w126-v6so34666056oie.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2018 02:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jkw1VxXjrGBVbYFlgrJScx8N6iMd6bbDfyX4UbnyULs=;
	b=JK+3R9KENk/kiGOo3WjfEGjSasdYXvRR4yueyZ8eJFbyC5f3P0Z31gxn+4+BquwlEa
	skw0SAfYk54nrfpZLe13nuHgbfoYzgVZ0qO+lfAChSyZJahp13mQCHs8WrOupPkKn4i+
	5cMdCMp3WPO1b6sKjaQ1sC/7Z2s5sLHcferlACTPT8zX/lkLW0dThIiooJHB1fo7AnVL
	4Ie6wMCCj+nUY3/UHzjI1CveYQzpPUhD6C1MYUneWn7UE6A2olUtJQSOa9BuYyOw3pgo
	ZM9seQGK/Ox+IzoCCLY6ydcsPNGM3a2JIKQSFkMmRwi6V0hHXDUpGhVam/fKiA/4457R
	KWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jkw1VxXjrGBVbYFlgrJScx8N6iMd6bbDfyX4UbnyULs=;
	b=doUDbWYil8Jo24SqCH8GPTFphVtVhcn9Ja710r9amk0pX7CJ5Dunlm9tpurdQ6w64L
	n61I+rXGa9pQziqrZbtZBWCWquLQmSWNUZ7/YmQnR+6VYSIP2QVcdTYTT3Pm2ki6pliR
	hRm7tl9NChVCR2GxCYb9pyTCCi3pbLhpDABTUzJ97sjw1cxHQJl6e5ypofEAy+Ly6/Kl
	NHbe9mgWr9UvmfKRLJLbwMop0AI9GIg7vbp6O2mcaTnKrQr6rNJB2D2zcZyb2CXm/98Y
	mgppUvLpx+5lucI+8XP8z5B3S5re7fTalanfBcM8ej+T1XtfzO/ZTtzhs5nnajyClcAO
	tLsg==
X-Gm-Message-State: APt69E1XzFFuumNXkTeMyAurhcJUb6lEXlYGZjHhMonQYqBJk9yHSHWD
	IJQezCqsaxQwm39PFN53QfMhaseni9+YXVE96pZDHg==
X-Google-Smtp-Source: AAOMgpcg/hTPqs3G405K0mPah1+50/+2Lhz1qgEd8evl0fAxsjua10s1AGzJS6A7hDajqp3WgCZgaqayq3bqqKdaoII=
X-Received: by 2002:aca:5f56:: with SMTP id
	t83-v6mr23510773oib.115.1531129154042; 
	Mon, 09 Jul 2018 02:39:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Mon, 9 Jul 2018 02:38:53 -0700 (PDT)
In-Reply-To: <CAMKF1sqvsQjmhZyBTCz0Kjieitai263b+MbQ2DFy7EOR6++h8A@mail.gmail.com>
References: <20180705155805.20847-1-ross.burton@intel.com>
	<20180705155805.20847-2-ross.burton@intel.com>
	<CAMKF1sqvsQjmhZyBTCz0Kjieitai263b+MbQ2DFy7EOR6++h8A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jul 2018 10:38:53 +0100
Message-ID: <CAJTo0LYVwM6ffbGC4Hf36CacjxHmSCTTY6kAf1KWKwcgYc6owg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] distutils: clean the build tree in do_configure
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
X-List-Received-Date: Mon, 09 Jul 2018 09:39:15 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry about that, I'll run a build against all of meta-python now.

Ross

On 8 July 2018 at 01:57, Khem Raj <raj.khem@gmail.com> wrote:
> For the record this breaks few recipes in meta-python
>
> meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
> meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
> meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
>
> It would be better if meta-python was exercised as testing for such
> changes in oe-core for better coverage.
> On Thu, Jul 5, 2018 at 8:58 AM Ross Burton <ross.burton@intel.com> wrote:
>>
>> base_do_configure() tries to do "make clean" if there is a Makefile present.
>> For most recipes using distutils there is not a Makefile, but we do know that
>> "setup.py clean" will work so call that instead.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/classes/distutils3.bbclass | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
>> index 6c303068820..99ad64d287d 100644
>> --- a/meta/classes/distutils3.bbclass
>> +++ b/meta/classes/distutils3.bbclass
>> @@ -8,6 +8,12 @@ DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
>>  DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
>>      --install-data=${D}/${datadir}"
>>
>> +distutils3_do_configure() {
>> +       if [ "${CLEANBROKEN}" != "1" ] ; then
>> +               ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py clean
>> +       fi
>> +}
>> +
>>  distutils3_do_compile() {
>>          STAGING_INCDIR=${STAGING_INCDIR} \
>>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>> @@ -71,6 +77,6 @@ distutils3_do_install() {
>>  }
>>  distutils3_do_install[vardepsexclude] = "MACHINE"
>>
>> -EXPORT_FUNCTIONS do_compile do_install
>> +EXPORT_FUNCTIONS do_configure do_compile do_install
>>
>>  export LDSHARED="${CCLD} -shared"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

