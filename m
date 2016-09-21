Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4B42A71984
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 09:18:52 +0000 (UTC)
Received: by mail-yb0-f180.google.com with SMTP id 2so19915330ybv.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 02:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/bqJGgNsAOJ5pBPd2cEoA7+hF2gqbPIDOyKak288lGA=;
	b=zdUmA6l2g/nD5+V0quYvYa3UxFjFUHvTOOUjmkr9v5kORKiRTFMgBLGwAkMGB0047y
	XhKuoO7Q2Uw4IdnGOWSJci+GpHQeR3reqHObuDqrkwjbI1tuwCJiKZGoFHAf9YFk5T0b
	jAzv/qZVjbF9M7PY8BOXoGvONl2kDie/+/dO/NhdHWnn+pIHE7jjGYj2pA2QVWMRJjC6
	awRzfBFHEtsUS42NDD1ipN06l66NcZpf9ZKdX7qsIK7pvBMwWFLR/WirR4npxFX2dHrL
	ZvMdbyzOqOAsSaivzkE8Al6WtrtfkyuOPR+Oj1MT9KMfqjm9Un4/S5RxBnSdPo558CB+
	+H9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/bqJGgNsAOJ5pBPd2cEoA7+hF2gqbPIDOyKak288lGA=;
	b=P1ARly5mJQEre3cuFnCsAuXgxpLv0NByaVrParNVkk0QzD8CrO4C/dEhmQgcHQ7mfA
	BUuiQ3mpjVn7ni4y4fqLlrVe6Z1zZUFBxLu//jVz81ASj7R4pSKBsuQL5GycELX4J9PQ
	RIe6POYdX4a4JrLGvl4tGpvu6vSxqV/pazLM+GxllAFs25mpKHUPn1BTP86uHzDeBkSn
	rRVT77nOB7BWwUCeZlatc8YWu3ZrL2IZKp4J3RxJzkAW2JeXsmMq1Ej3h/qFyeFHMRhL
	eLhertgj1Ch8/e8sg2xDsf/ops3zDAoAvHg2QHcgZ26tUsSn8AtkFyxHYFljttjGD2jX
	ytYg==
X-Gm-Message-State: AE9vXwPnqbqBjxaUJL6Iw3ucI12xmfTKemKXKXg9LsUr2xGqOLNGfFvXwFcTucvUBZsgZtPDwjkWbOnuX8m2eA==
X-Received: by 10.37.194.70 with SMTP id s67mr32483274ybf.51.1474449533770;
	Wed, 21 Sep 2016 02:18:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Wed, 21 Sep 2016 02:18:53 -0700 (PDT)
In-Reply-To: <CAJTo0LaSU6xmyKqiD2oAGSZX=vadxMe8fNNpvuVveyt99WGMnA@mail.gmail.com>
References: <1474435844-16942-1-git-send-email-schnitzeltony@googlemail.com>
	<1474435844-16942-2-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LaSU6xmyKqiD2oAGSZX=vadxMe8fNNpvuVveyt99WGMnA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 21 Sep 2016 11:18:53 +0200
Message-ID: <CALbNGRTTtizQ9z7iXqrCfz9oyx4=_os3CDaZcDmfkJLeUndw5w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] scons.bbclass: reduce build time by adding PARALLEL_MAKEINST to scons install params
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
X-List-Received-Date: Wed, 21 Sep 2016 09:18:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 11:06 AM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>
> On 21 September 2016 at 06:30, Andreas M=C3=BCller <schnitzeltony@googlem=
ail.com>
> wrote:
>>
>> During install all files are recompiled. This should be investigated
>> further
>> later
>
>
> I'd put (pretend) money on it being because PREFIX/prefix change between
> compile and install, so it needs to rebuild.  Looks like this class is do=
ing
> something wrong.
>
> Ross
Answering your 1st email:
Recipes inheriting scons I found in my meta's were:

pingus mongodb mixxx gpsd

* gpsd do_compile is broken for me without this patch (not findinig
math lib although -lm is in ld's command line)
* all others I tested here

Answering your 2nd email:
All files are recompiled without actually doing something. If somebody
has the time for it - it might be useful to see what happens

* if we skip do_compile completely or
* what causes scons to force a recompile although it is told to install

To be honest: Scons is yet another build system doing same thing as
others and creating it's own bugs (e.g pkg-config variables). I
wouldn't want to spend too much time on because there are fortunately
only few packets using it.

Andreas

