Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 771646E3C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 17:30:14 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id m20so799502qcx.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 09:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=QCUKRhIYNnGDZ7QlsFmOPkzv83yDnwd/ebCuNil7uoA=;
	b=RANxJR3hLKvvNNLlkSAZ64tJVW+SH46MX+A476LRVb5MKVd518YC0WkiCxfc+PA38+
	Bn2uuThYM9oiN+RKwXoUO601BVdhqY3JNFLiFbICTYM5WWvJ7jTIqfkLPsRYp1Motjvm
	n2rF0qG8jqIZa9kamWUouV3/y4b69Hf56P2zhczu0T/oG1bvJhJOss17Jr+E4r3ZvbPY
	FNKT30Qsv2MDNfrwn2LpZpV9nc9jpTtalI98fHpQ2x54eLrtdHY2/uOwj1gptvVQcO2+
	QiT7eCaRMJeqaEiqYleAsUJ/p/wwsBuqniRU2cr+cuioRaDZKWpjj8vZfH90N1MxGU1n
	Oqgg==
X-Gm-Message-State: ALoCoQkrFhuC9wMy8jYjNELWVHghKmuO/C4wOFnR6ZCfAqxsFGMXKGTOjuhWgxY+CB1dRe7zl4yf
X-Received: by 10.140.81.74 with SMTP id e68mr5035373qgd.99.1393608615598;
	Fri, 28 Feb 2014 09:30:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Fri, 28 Feb 2014 09:29:55 -0800 (PST)
In-Reply-To: <66416D1B-68E3-487C-B0BA-EE211FF59DA0@gmail.com>
References: <1393587200-16322-1-git-send-email-david.nystrom@enea.com>
	<66416D1B-68E3-487C-B0BA-EE211FF59DA0@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Feb 2014 17:29:55 +0000
Message-ID: <CAJTo0Lb+qvbPH+U0nioZ0m8OF6a-hzaYxPh=-LmDmjJSskheHA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: Add util-linux-libuuid to DEPENDS
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
X-List-Received-Date: Fri, 28 Feb 2014 17:30:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It's a build failure, so not at all. :)

On 28 February 2014 17:24, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Feb 28, 2014, at 3:33 AM, David Nystr=C3=B6m <david.c.nystrom@gmail.co=
m> wrote:
>
>> -DEPENDS =3D "util-linux"
>> +DEPENDS =3D "util-linux util-linux-libuuid"
>
> it should be RDEPENDS if at all.
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

