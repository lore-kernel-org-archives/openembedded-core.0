Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id F3AF96BA22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 21:34:35 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t13so341348ply.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 13:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=j9S0YMWtsGa8Xw+5DuJJF712MFBM5jRbJJ8qCzuth/Q=;
	b=mDoinI7mzNxzrRLtt9V9Hu+Fh51z1rlvCwpPj+DdZ8/ZJHcrg4jv7LF4cY3ZrpqKWx
	JCNtAR5o+8NJhVe0L5ixOugKMFgqSKXQ0Knun1/IGtDP3c9iJVbv46luN+6Bq3aAL5eY
	rhlKkP/MgwgZ9uv7yxrga1Ksm/VkK06c+r+Ch9eDYei8oiWH46PMNCLMnFadyhn/KUTj
	+5yIKjQQkLq/0Vop282wPysPNo8jSwf7CAfL1IkWI2rVV02WnyStUfcIBDxotD8Mj2/9
	Ey+t6hf7tUASXhgmXk198VXEnHVNJ9GOoxCjztm5SZNs60KXB8fZzKmhJaVY6kmt02Gw
	IMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=j9S0YMWtsGa8Xw+5DuJJF712MFBM5jRbJJ8qCzuth/Q=;
	b=HQQoQK3Nm9RX1k5iI+mkPke0SUx+F0hbpubzhuTrFjpNGbn4T7dL7ZVeWLVOLWotSn
	S1YxXcsUD9Ori58BUtxmQ7sdpCGnFoumndjZ4bxF1XyiWmdQyBSPMxErBn6s8XlBqeMk
	PTLBbdxifpKbPE3fgU54eBfjW+vDE5ZSrfpE+HchU55HOjzDWtERPL53P+cDrIo6vfRE
	kdaeJSBar8V3OHyE7+y0sOdMNi3pujfhVRxkNWXdVLNs5giwcoVmSGJkPO/bW/7a15um
	xR4W836GftUH0wJDZH2sr39kbiCYPmQVp7Qi3F4bQrznmMQA/0sZrzrdRSxftFtvf7y9
	H4NA==
X-Gm-Message-State: AGRZ1gIE0qF0SJX0GiolQmlToyEUGAuzjoWWzDnuQvfriGckmhrCmWU4
	v/i9RaB3uHBRSAfXTV2g3pfUwuar
X-Google-Smtp-Source: AJdET5dOTfKdo1a4aPtV3hxlhiM5fdehp6WMsdf4uS+INrHrtNkZX9QzkiD2trXLjojOPbjvUTbkaQ==
X-Received: by 2002:a17:902:bc8c:: with SMTP id
	bb12-v6mr16753753plb.275.1541972076754; 
	Sun, 11 Nov 2018 13:34:36 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:7077:6962:50cb:42de?
	([2601:202:4180:c33:7077:6962:50cb:42de])
	by smtp.gmail.com with ESMTPSA id
	d65-v6sm16969373pfc.144.2018.11.11.13.34.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Nov 2018 13:34:36 -0800 (PST)
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
	<20181109142912.23102-11-richard.purdie@linuxfoundation.org>
	<eb4748cd-d26c-a916-f887-311dd6bbb8fa@gmail.com>
	<e1af6ef60da366ccc0cc163eb26040e03ee156bc.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3c59ccda-0370-c30c-ee8e-1c5165a56e5b@gmail.com>
Date: Sun, 11 Nov 2018 13:34:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <e1af6ef60da366ccc0cc163eb26040e03ee156bc.camel@linuxfoundation.org>
Subject: Re: [PATCH 11/12] testimage: Further cleanup DEFAULT_TEST_SUITES
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
X-List-Received-Date: Sun, 11 Nov 2018 21:34:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 11/11/18 1:18 PM, richard.purdie@linuxfoundation.org wrote:
> On Sun, 2018-11-11 at 12:52 -0800, akuster808 wrote:
>> On 11/9/18 6:29 AM, Richard Purdie wrote:
>>> Now the test markup of the development tools tests is complete,
>>> this
>>> can be further tweaked to auto run the correct tests.
>>>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>  meta/classes/testimage.bbclass | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/classes/testimage.bbclass
>>> b/meta/classes/testimage.bbclass
>>> index b00d47441b2..4e9494296e1 100644
>>> --- a/meta/classes/testimage.bbclass
>>> +++ b/meta/classes/testimage.bbclass
>>> @@ -40,12 +40,12 @@ TEST_NEEDED_PACKAGES_DIR ?=3D
>>> "${WORKDIR}/testimage/packages"
>>>  TEST_EXTRACTED_DIR ?=3D "${TEST_NEEDED_PACKAGES_DIR}/extracted"
>>>  TEST_PACKAGED_DIR ?=3D "${TEST_NEEDED_PACKAGES_DIR}/packaged"
>>> =20
>>> -BASICTESTSUITE =3D "ping date df ssh scp python perl apt opkg gi
>>> ptest dnf rpm parselogs logrotate connman systemd oe_syslog pam
>>> stap ldd xorg"
>>> -DEVTESTSUITE =3D "gcc kernelmodule buildcpio buildlzip
>>> buildgalculator "
>>> +BASICTESTSUITE =3D "\
>>> +    ping date df ssh scp python perl apt opkg gi ptest dnf rpm
>>> parselogs \
>>> +    logrotate connman systemd oe_syslog pam stap ldd xorg
>>> kernelmodule gcc \
>>> +    buildcpio buildlzip buildgalculator"
>> Again Nak. You are forcing folks to have x11, systemd etc in the
>> "Basic".=20
> No, I'm not. If the image doesn't have x11 in it, the test will show
> "skipped". If the image doesn't have systemd in it, it will show those
> tests as "skipped". If you just want to test ptest, you can specify
> that, which is what you had to do before this change anyway *just* to
> run ptest.
>
> So I'm not really seeing the problem?

So for meta-security, since it needs python and perl, will it re-run
those tests every time I run the meta-security ptests?=C2=A0 if it does, =
one
may interpret those changes as a negative to the overall testing experien=
ce.

- armin

>
> The only risk with doing this is that a test may be skipped when it
> shouldn't be. The plan is to verify the right set of test results were
> obtained when the QA overall results from a release build are compared
> against a known list of tests which should have run.
>
> Cheers,
>
> Richard
>


