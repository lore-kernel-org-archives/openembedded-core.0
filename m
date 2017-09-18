Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id A833777E9A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 22:56:56 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id m18so1684668wrm.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 15:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MMfD9I915GxVn7pH7diuCsmJ+c5oCsHNJnGdkPt+VGk=;
	b=pTsELGC9/55WDKHzAWCf+pgvvRz9MN1JWqSALL2c0q2KLwwNz9qsD6i39rNjFMx8BW
	GR9f5SXhMJjVirQtC/fhVmD5ECTstNZnCNr90mJkPSEEaEkMIEavbJwxbenRCgPgMOgb
	nJ9YUTAb8ryc3NHkZRsWZ6PbRuHriKyC+MSIaFmtVht6/eLHQ5cpAcOcMOLRGV4dEkvU
	DZvr1D3BOBcRsTiuhBZ8DeGZnYInZHbzetHexcIrGs1KQmSBYuSzKHvmJRZyo1gE+x49
	Q9BZscBq16I75W/g1L/ClraoH9YrJ9PBGoarEuLLYmsYIgVoI1KxwNzhl06uzVBpGgWH
	j/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MMfD9I915GxVn7pH7diuCsmJ+c5oCsHNJnGdkPt+VGk=;
	b=MzNSTW8UJrdtgRpR486caT4bfobswHZsQSHW7xYkukoD5sWrBWjBJxRkTODR1KfdWx
	8oOQiIkPlEKGBxBdr/+8/pksKklr4rJC0m0VNQ+x3rAJtzhwpUZ8g5FNvqy9mVYNn7bw
	7xPlTXoeTUFrGnJe5K8OXP5Bpjf3zQ5QlNDf1vFTe/K+kzk1h2QWQgCUV4LsZfjZqY1E
	ZL1JPJ9FqZ85z8dUbZ8MsFq4ZnfXdVbV6o0v/Nmgn/FFGqHff0BtpeQ/xJ9ye0HDAq2U
	Uwfgc4UJfhuXgA4Ce9dlM7gVC+E2mDcqNc1hCfBatYySqVUa9ijpVkPGgVXKEXEUgd2H
	CyLA==
X-Gm-Message-State: AHPjjUiEZeatbTf/0OhXCaRGRqDX75gua4io08a+/Hy52oHfORpX1FCp
	AMNdVzszgaPnCZtUKeOMwTOuWSsUan0KXRe8dOk=
X-Google-Smtp-Source: AOwi7QB0iDsPwsIRVZ3NIb8BfGAI0unF71FM+wvECFsDJwRg4zuiR2xNk/Q0qNAQWfmmlKqeLDIE8VTsLR65t90jG58=
X-Received: by 10.223.146.197 with SMTP id 63mr4328534wrn.180.1505775417375;
	Mon, 18 Sep 2017 15:56:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Mon, 18 Sep 2017 15:56:56 -0700 (PDT)
In-Reply-To: <649e138d-4ccf-770f-9e4d-aeb066d325a5@windriver.com>
References: <d8c3aa94-8f9f-2d06-0dac-9c46a1639505@windriver.com>
	<CAJ86T=XSXk4DGhJqDT4hmKO1BK0y-39rFc7r_codDWf72vAoCg@mail.gmail.com>
	<41556f05-e92c-1962-99af-97d1812909d1@windriver.com>
	<CAJ86T=VO8un10ov9_8orHkhec5z5z5GCO6dnvtikqchukT285A@mail.gmail.com>
	<649e138d-4ccf-770f-9e4d-aeb066d325a5@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Sep 2017 15:56:56 -0700
Message-ID: <CAJ86T=VJkYG3VN2oxsM+3rE3RY18tJbb68BWea-FQ+zYY9uEsQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain / /bin/sh requirement / ldconfig backfill
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
X-List-Received-Date: Mon, 18 Sep 2017 22:56:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 18, 2017 at 3:00 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 9/18/17 4:33 PM, Andre McCurdy wrote:
>> On Mon, Sep 18, 2017 at 2:20 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> On 9/18/17 4:05 PM, Andre McCurdy wrote:
>>>> On Mon, Sep 18, 2017 at 12:30 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>>>
>>>>> Because of this, there is no way (with a default configuration) to build
>>>>> meta-toolchain....
>>>>>
>>>>> Investigating further, ldconfig support moved from "USE_LDCONFIG" to a
>>>>> distribution configuration.  It does this via the "DISTRO_FEATURES_BACKFILL"
>>>>> (introduced in commit: a905df2dd8f43a2febffa64a39b6e508510326a0)
>>>>
>>>> The intention of that commit was only to change the way support for
>>>> running ldconfig on the target is controlled (ie changed from an
>>>> ad-hoc bitbake variable to a distro config option). It's enabled by
>>>> default now, but it was enabled by default before that commit as well.
>>>>
>>>> Did meta-toolchain work previously? If so, was USE_LDCONFIG being
>>>> forced to 0 somewhere?
>>>
>>> In many distributions, the default was 0.
>>
>> Right. As mentioned in the OE 2.3 reference manual, if your distro
>> previously set USE_LDCONFIG to 0 then you now need to disable the
>> "ldconfig" distro config option instead:
>>
>>   http://www.yoctoproject.org/docs/2.3.1/ref-manual/ref-manual.html#migration-2.3-miscellaneous-changes
>
> The key is that meta-toolchain worked before, and doesn't now.  (In a default
> configuration.)

Do you mean it worked before in plain oe-core or poky? Or was it only
tested in a custom distro which sets USE_LDCONFIG to 0?

If it fails in the OE 2.3 default configuration (ie when the ldconfig
distro feature is enabled) then I think either it should also fail in
OE 2.2 default configuration (ie when USE_LDCONFIG is not forced to 0)
or the change in behaviour is not related to the a905df2 commit.

> Either someone needs to add a message to meta-toolchain to tell
> the user it can't work with ldconfig set, fix it (so the missing dependency is
> resolved [optimal solution], or ???
>
> In the past there was a way to tell the package manager to ignore a specific
> dependency (such as /bin/sh) and allow the install.  I don't know if there is a
> way to do this any longer.  2.2 was the last version I know this worked on.
>
> --Mark

