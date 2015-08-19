Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 21BB573E11;
	Wed, 19 Aug 2015 14:04:57 +0000 (UTC)
Received: by lalv9 with SMTP id v9so3720983lal.0;
	Wed, 19 Aug 2015 07:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mIFfwgArVl5OCerV1kWJJmk0vhfUfOPoWPaAu3odpnc=;
	b=D26IbOjLiv1+o2/vSo+I1k7xvnJmo8dF3Rot7E6BEp4tbBV+N56OHIAid2HHIHI72p
	mPncNZyc3cjhvZ3YqMK8yauPwZ2LmtfGTVNconEH+lRZ/j4k6jy2rQ3ZyBa8riJ0z3EK
	2KbdDs+yFIHapmqN/sFLp2h8ut53YuJQyp93OPWwOo8KoCI349F1VVtcBN+Sx8jj7smw
	ZpDOQvmMYivsTu2m4MyYWJ/q+Wdofvx0XQZNvWtiEcCr3o7DwMfo76KK5Rab+as6RrSe
	3umTm+LY7+ZmVU+vTiDKfpjj4BRicYicC4rnpp1Sl3drRFcGTW/ykuY6s9yY5m6ZySfF
	WYKQ==
X-Received: by 10.112.156.137 with SMTP id we9mr8076837lbb.110.1439993096148; 
	Wed, 19 Aug 2015 07:04:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.22.148 with HTTP; Wed, 19 Aug 2015 07:04:36 -0700 (PDT)
In-Reply-To: <55D48BF2.3050201@mentor.com>
References: <1439986711-27572-1-git-send-email-ricardo.ribalda@gmail.com>
	<55D48BF2.3050201@mentor.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 19 Aug 2015 16:04:36 +0200
Message-ID: <CAPybu_35mGLnB8jHaVUH4gcvEUjH+FxDLkHi9NUSvzjL21NVSw@mail.gmail.com>
To: Nathan Lynch <Nathan_Lynch@mentor.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] Opencv: Add OpenCV 3.0
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
X-List-Received-Date: Wed, 19 Aug 2015 14:04:58 -0000
Content-Type: text/plain; charset=UTF-8

You are right :)

I repack and send

On Wed, Aug 19, 2015 at 4:00 PM, Nathan Lynch <Nathan_Lynch@mentor.com> wrote:
> On 08/19/2015 07:18 AM, Ricardo Ribalda Delgado wrote:
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
>> @@ -0,0 +1,128 @@
>> +SUMMARY = "Opencv : The Open Computer Vision Library"
>> +HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
>
> Is this URL outdated?  It times out for me.
>



-- 
Ricardo Ribalda

