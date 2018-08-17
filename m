Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id B3314745F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 02:27:51 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id m11-v6so11663061oic.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 19:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Wqkw9zbf9wPgeQXh7bc4gTeseWLbgaIYlT0GM9ch6A8=;
	b=R2waJSUh6A0Q1IZzJX1ix/4JYhdaQebz2vcDkFos1e8nnzpQ/76qqbc688eP1Ky7vX
	dbj0wzmwCQsmdDAxik06FCphV2BRBT4FWg32UbMAii2O+hOyrf6xg1NnMtERdK8P9hal
	o137NgmUnI4h4NkwoMMjN1lQ+v1vF31xwE69YzAa43PhjoeV1pG7CziRTgxL1mKCxbXK
	EQiStI8OkXaiMdeHVdqmjTo45y/+otLH0tnKKIqf5Aq/KnXNOjbi4q1ne7WeX/Zr+mcV
	5uSy7/mE7FHWPdzIINyTFSLuKoE9XWMDfDujCXlqFw3doLXCruLBfDb7uaWZ6TFW+Czd
	+eRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Wqkw9zbf9wPgeQXh7bc4gTeseWLbgaIYlT0GM9ch6A8=;
	b=aMASR6sJyN1EKkrRlMoqQJKK6TX83WucwtiupO8mfk01VtM5E35j4kxRidxJivu1aL
	zGPfc5/KsIiTRndkCcah7Wa0DiT+s9EKPdRz+ABMnbuPzxwDOukpBjtHSXJhnTt4h0ct
	NEtzki2c1wpKAtTwYApF7aMSHmUwV4I7wU0bQeazdZjKYnZMLdGnWgZRVmtVmwKYqtKY
	vPPPkaNksQq5YTNPzjVFi17vvaMdPDaFSySdQNhTpUlMEvrI1Pt4YnvsrbnMtBZtAyn7
	m6AGbx0z7RopDODoSr4EJYmHiyuD5UBI5Yekikeq+E8q4lk+MmLL8YGy8sEmnST0vEPF
	oTtw==
X-Gm-Message-State: AOUpUlEqtLKOHwUFzVciZOfBDZ3Xgh6E0+xg5o++Fp7wl8ilVSa7kEsB
	NqLzBMxmwuf4mCl7SEB5SHzxQDfU+amfVM4i5LiZnw==
X-Google-Smtp-Source: AA+uWPwydWjbMHYUo5i41tyYdTWm6WSKKf/Uad7OmEV4SZUwU0VBEzCx8WwwB+/6WaXF+iJcnPzEITB+p8bY7Q4nLnk=
X-Received: by 2002:aca:4107:: with SMTP id o7-v6mr626853oia.76.1534472872651; 
	Thu, 16 Aug 2018 19:27:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6455:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 19:27:52
	-0700 (PDT)
In-Reply-To: <CABcZAN=dEfDCWptBRUjO7MTK9Ym-eRt31E4Y-kGH9dXvisFuMw@mail.gmail.com>
References: <1534441498-4659-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CABcZAN=dEfDCWptBRUjO7MTK9Ym-eRt31E4Y-kGH9dXvisFuMw@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Fri, 17 Aug 2018 07:57:52 +0530
Message-ID: <CAD3vsf4evOo5KZ0ce_zWrDmZy5spxpfDQ6RuXhxVUG03-6hWYw@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-run-native: Add *-native directories under STAGING_BINDIR_NATIVE to PATH environment variable
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
X-List-Received-Date: Fri, 17 Aug 2018 02:27:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. I have removed colon ":" before
find expression in v2.

Regards,
Jagadeesh

On Fri, Aug 17, 2018 at 2:59 AM, Christopher Larson <kergoth@gmail.com> wro=
te:
> On Thu, Aug 16, 2018 at 10:45 AM Jagadeesh Krishnanjanappa
> <jkrishnanjanappa@mvista.com> wrote:
>>
>> It helps to find/use native tools under ${STAGING_BINDIR_NATIVE}/*-nativ=
e.
>>
>> Solving below error:
>>
>> $ oe-run-native python3-native python3
>> Running bitbake -e python3-native
>> Error: Unable to find 'python3' in
>> .../tmp/work/x86_64-linux/python3-native/3.5.5-r1.0/recipe-sysroot-nativ=
e/usr/bin:.../tmp/work/x86_64-linux/python3-native/3.5.5-r1.0/recipe-sysroo=
t-native/bin:.../tmp/work/x86_64-linux/python3-native/3.5.5-r1.0/recipe-sys=
root-native/usr/sbin:.../tmp/work/x86_64-linux/python3-native/3.5.5-r1.0/re=
cipe-sysroot-native/sbin
>> Error: Have you run 'bitbake python3-native -caddto_recipe_sysroot'?
>> -- snip --
>>
>> After this change we have native python3 to be found:
>>
>> $ oe-run-native python3-native python3
>> Running bitbake -e python3-native
>> Python 3.5.5 (default, Aug  8 2018, 17:45:49)
>> [GCC 4.8.5 20150623 (Red Hat 4.8.5-28)] on linux
>> Type "help", "copyright", "credits" or "license" for more information.
>> >>>
>> -- snip --
>>
>> [YOCTO #12889]
>>
>> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
>> ---
>>  scripts/oe-run-native | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/oe-run-native b/scripts/oe-run-native
>> index bbdd1d8..8412b18 100755
>> --- a/scripts/oe-run-native
>> +++ b/scripts/oe-run-native
>> @@ -55,7 +55,7 @@ fi
>>  OLD_PATH=3D$PATH
>>
>>  # look for a tool only in native sysroot
>>
>> -PATH=3D$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECOR=
E_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin
>>
>> +PATH=3D$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECOR=
E_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin:$(find
>> $OECORE_NATIVE_SYSROOT/usr/bin/*-native -maxdepth 1 -type d -printf ":%p=
")
>
>
> If I'm reading this right, this will leave an empty entry in PATH if no
> -native subdirectories are found, which is harmful. I'd suggest reworking
> that.
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics

