Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC227FDEC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 12:26:51 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y1so5056375lfb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 04:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FznnqTzihSWns96pYpEma4CD/iCBwPoCdJZhWEeXGVU=;
	b=X0PxyBUPRlSQv+CCyCItsrdUYgGGxCUGQ3kBDDMq6qP0S7LOvXePRLqAgjJ73c1g/A
	pOLvXp5RzswAPNEXrALtOgTImYIgQvnLmQPNWtdTufHn99QIB8S4ayY1hBEY9aBzpJ5G
	cPITYRRP7ploDphPETgMCVV+Ro6o21i6xMFxUOzK5oInt5i5o/YF6SidCWfDJwxEXAC5
	e3RY5dw5TN/6jt8sfjH5oUs8YZSK2UZqFQtuZ1pZ/T64/aK6vPYpd+RTba9aHMcOeARi
	DOh7ydOgta5ckNcFhOjLqFGgMtyoDPRRs5yVX70sLj4T2pVA6u18x1PIduacZUwI1S7n
	ZXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FznnqTzihSWns96pYpEma4CD/iCBwPoCdJZhWEeXGVU=;
	b=IPXkWKakjHFgUF+PykUOqD51MGbT2ePq+2qqx7ew7pMSfJROr9EVss/Swa5yx48h9j
	Enq056TgUyLNtA4Ftjpgst/gfB6L+D2yFleXB2SWm4A51ZSaVCsyuhWPJa58FEZx1KAF
	Uv7e8EoIEErnxtlqt4jeIjw5JVCbivNoGCE21Y2u205tM+4cOFFmiv9/6lNIHquEaSML
	CljW56CsYwlbM7OAvVulZYQNHZbk05CaVOhSauADVWBY576a2iGSbFH/k5Vf+0fJD7s4
	VlNjt3gHSEpS1aDJj2R/LIhkXODrwKNDOLR6V6vJC6/ed3gCQX0DU4UmDVBX8qQzzlk+
	61eA==
X-Gm-Message-State: APjAAAXU5YaQIK3TD8t6u9QWz7hue2u0kX1J2h3fue055JMkTNMJwg4+
	To7ItIB8reRvOdCCMsQOIegBT5uIqxjMOsGKOZ0=
X-Google-Smtp-Source: APXvYqwpbWGyeBjF0k8EjvEIXu/OHNHZgA6HKe0WU+bKAkX4e4iFbjxk/4YDcs+dgz20R23A6VXy0CGoTmuzdx/RZzg=
X-Received: by 2002:a19:784:: with SMTP id 126mr5906775lfh.191.1578572812103; 
	Thu, 09 Jan 2020 04:26:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1504036763.git.pkj@axis.com>
	<CAJ86T=VajsxSGRakyVVmTZcEWwwLaVZxKpcsE+ZU75bGrsUkbQ@mail.gmail.com>
	<70b15633357a418095d460b943d3e994@XBOX02.axis.com>
	<1504043397.2175.19.camel@linuxfoundation.org>
	<5ba32c0773d848ef8e6afb117a72abb0@XBOX02.axis.com>
	<CA+chaQeak4gD3C=jgxE-gg=9yf+g=4sgcHqP3ooMVRMJsbtO5w@mail.gmail.com>
	<CA+chaQdRJQ8i+a2Ko3_D7Gp=yAJvA5M5wCmZstMykip-x-FYbg@mail.gmail.com>
In-Reply-To: <CA+chaQdRJQ8i+a2Ko3_D7Gp=yAJvA5M5wCmZstMykip-x-FYbg@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 9 Jan 2020 13:26:35 +0100
Message-ID: <CAPybu_248oLQ=9_8J=Owna+_AnJH9AE0bUsUfn4W=0bFywzwJA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Avoid build failures due to setscene errors
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
X-List-Received-Date: Thu, 09 Jan 2020 12:26:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

I am also hitting this wall. Any reason why the original patches could
not be merged?

On Fri, Nov 29, 2019 at 5:49 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> On Wed, Aug 30, 2017 at 9:54 AM Martin Jansa <martin.jansa@gmail.com> wro=
te:
>>
>> I agree with this patchset and it would be OK with IGNORE_SETSCENE_ERROR=
S conditional as well.
>>
>> We're also sometimes seeing these errors, sometime anticipated when clea=
ning shared sstate-cache on NFS server sometimes unexpected when NFS or net=
work goes down for a minute and for some builds it happens between sstate_c=
heckhashes()  and using the sstate.
>>
>> We normally stop all jenkins builds, until the cleanup is complete (ther=
e is jenkins job doing the cleanup, so it puts jenkins into stop mode, wait=
s for all current jobs to finish which can take hours, then performs the cl=
eanup and cancels the stop mode), but we cannot stop hundreds of developers=
 using the same sstate-cache in local builds (especially when we cannot rea=
lly know when exactly the job will have free jenkins to perform the cleanup=
) - luckily in local builds it doesn't hurt so bad, because the developers =
are more likely to ignore the error as long as the image was created, but i=
n jenkins builds when bitbake returns error we cannot easily distinguish th=
is case of "RP is intentionally warning us that something went wrong with s=
state, but everything was built correctly in the end" and "something failed=
 in the build and we weren't able to recover from that, maybe even the imag=
e wasn't created" - so we don't trigger the follow up actions like announci=
ng new official builds or parsing release notes or automated testing.
>>
>> Yes we could add more logic to these CI jobs, to grep the logs to decide=
 if this error was the only one which caused the bitbake to return error co=
de and ignore the returned error in such case, but simple variable is easie=
r to maintain (even for the cost of forking bitbake and oe-core) and will w=
ork for local builds as well.
>
>
>  I was using these 2 changes in my fork of oe-core and bitbake since they=
 were sent to the list, but today after getting a bunch of errors like this=
 from build which unfortunately wasn't using my forks and few questions abo=
ut why these errors aren't ignored from fellow developers I've finally foun=
d time to improve our CI jobs to deal with this and ignore the bitbake retu=
rn code if it's reporting failure only because of these setscene fetcher fa=
ilures.
>
> If someone needs similar work around for bitbake behavior, here is what I=
 did:
> https://github.com/webOS-ports/jenkins-jobs/pull/12
> yes, it's ugly, but it seems to work and is a bit better than forking oe-=
core and bitbake just because of this issue.
>
> Regards,
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
Ricardo Ribalda

