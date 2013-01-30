Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0bui-0003pm-Rj
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 18:57:37 +0100
Received: from mail-da0-f70.google.com ([209.85.210.70])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 30 Jan 2013 09:40:40 -0800
Received: by mail-da0-f70.google.com with SMTP id t11so1725096daj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2013 09:41:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=FTpTQupyNV03CpgTH4lNlvJTi3irwIzpF1BqM6LKpTw=;
	b=Bh1EThq/3ufB46v1Sxc7Z9dUbIKvWz7vfZhKA7YA3CQ/mq1+XS4g+ei0hZvHqWSzI2
	Msy9J8tKTrUEDmYRt6TKMe/d9SudZg9L9lRxhVox+65xdll623pw3kdPb2DqmaN8hGMX
	pTmOz3fqY3xQA6fI4bjRmTLe44RnB2YjEnN+bexNXoXSIK/1aUE0XCz3Rpw+RkYW/mYo
	KAdjQnakrXi3ZY4jhZswa5lVBOTJ0L/4vhev0eYIJA9W5D9RzxbScD48zeod/x1aLmOn
	ZCJETnG1YoG7uJqQFznzNAgBJuLZIGiScIvJsLlRBBLabU3TNjJIeQGR8XXGcBGwCg6f
	5dAg==
X-Received: by 10.68.202.65 with SMTP id kg1mr14488258pbc.28.1359567712123;
	Wed, 30 Jan 2013 09:41:52 -0800 (PST)
X-Received: by 10.68.202.65 with SMTP id kg1mr14488238pbc.28.1359567711960;
	Wed, 30 Jan 2013 09:41:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.66.193.225 with HTTP; Wed, 30 Jan 2013 09:41:31 -0800 (PST)
In-Reply-To: <B57A220D1EE1644685BA9AD5C790D20526BE045DE4@SOUTHSIDE.devonintlgroup.com>
References: <1359552371-27121-1-git-send-email-igeiser@devonit.com>
	<CAJTo0LbOKe5KhJyKZYPiOkEZdcGM=NJVOsgt8cc_TkqykU99sA@mail.gmail.com>
	<B57A220D1EE1644685BA9AD5C790D20526BE045DE4@SOUTHSIDE.devonintlgroup.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Jan 2013 17:41:31 +0000
Message-ID: <CAJTo0LbN4r7W2NkDrypzBiM8N1SMs7MiV45brZVRXixZheSyYQ@mail.gmail.com>
To: Ian Geiser <igeiser@devonit.com>
X-Gm-Message-State: ALoCoQnEaUz4jK6vp9Me+2OtSj3EBoVgfErRDAa8veSLqU3SyebfGvzgBsL24cbSyL9vrhd528qCYBwB/2gvVHDJEeEIazKPLR0ArbQrFscbYPIFbncV/c0bwxjskePjF5HWmOkzuKJpaGHcKSaO9Xbgotqb2satxhT1ZKpLmDWAo55FbdA1SxNcS+i1BVBc3Q81rmjhtTH2
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-dri: add extra dri drivers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 17:57:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 30 January 2013 16:38, Ian Geiser <igeiser@devonit.com> wrote:
> No, I was just extending what was there so I have no real preference.  I =
will need to check if it impacts non-x86 builds.  I do not think it will be=
 a problem, since most non-x86 systems have their own GL implementations.  =
I think it will just enable swrast on ones that are not x86.  I will resubm=
it with it set to auto where it will only build the appropriate drivers aft=
er I test.  Thanks!

In general explicitly stating things is preferred so the current
arrangement works nicely, so just adding the extra drivers to the
append lines is good.

Ross


