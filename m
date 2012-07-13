Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Spkym-0007lU-V1
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 20:52:41 +0200
Received: by eaal1 with SMTP id l1so1049412eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 11:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=vqeveG0KJCYLZA12huq4tiw17y95FRm7ReyZAFYNnK8=;
	b=aSc1uM+gbSq3T3QnmQHu5O+md7cPScjBIxhMlkoIfhUxW9AVr/Ve2tUXQLLh2j/OtO
	+62uICEmN2qEi4Ghjy/mXHxKI6RQ8ByE4h9xiotJPiL7Oy3G3epBzNB3JomjL2QmGtbw
	D96onZbBXRD5CvW1RThPUUkBSpD+jxAeUET4RyApZTAqjf39MvjokkZrs7FYlvGQ21xh
	37NdkBeoS95Y7udWtPMzLcOF5+l09AyZA1TkfHfd28+S4oqVcGEyzpEHw6cc8aOUG8SN
	JobpJ2MSEDVhYgiutF/qD4wSQGtYilLYs8OlsIzeEH08rGYInBPBrAAkMbhns4HNp5t6
	DXkA==
Received: by 10.14.99.201 with SMTP id x49mr559918eef.142.1342204886324; Fri,
	13 Jul 2012 11:41:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Fri, 13 Jul 2012 11:40:56 -0700 (PDT)
In-Reply-To: <1342204577-9605-1-git-send-email-msm@freescale.com>
References: <1342204577-9605-1-git-send-email-msm@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Jul 2012 11:40:56 -0700
Message-ID: <CAMKF1sq6g7uidfS5NXZ7xxujAjSz9vk7WFSreG1y2P1KUmLvcQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-package-runtime.inc: Fix QA warning
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
X-List-Received-Date: Fri, 13 Jul 2012 18:52:41 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 13, 2012 at 11:36 AM, Matthew McClintock <msm@freescale.com> wrote:
>> ERROR: QA Issue: gcc-runtime: Files/directories were installed but not shipped
>>   /usr/lib/libgomp.so.1.0.0
>>   /usr/lib/libgomp.so.1
>

that should go into the real libgomp package not -dev package


>  FILES_libgomp-dev = "\
> -  ${libdir}/libgomp*.so \
> +  ${libdir}/libgomp*.so* \
>    ${libdir}/libgomp*.la \
>    ${libdir}/libgomp.spec \
>    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
> --
> 1.7.10
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


