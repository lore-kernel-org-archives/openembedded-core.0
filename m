Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SD7Wu-0002jG-8Q
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 07:04:12 +0200
Received: by eekc1 with SMTP id c1so564985eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 21:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=AL396Wz4RkDib8N1e0sXHxB0zAhSBjjuvTi7U0mbWWQ=;
	b=IDv9nZMoxpQDdv1i3RLmgeBM+//VXT9/6RnhwtjXIx8d/PyXsfgW9ndAFYDjsmn9GS
	wQ2q5h2OZKLYWUPXTWage+xGNfAIIOs/E4uT93uu1LMsJHzlg/agW1F1OAszSjyT1bqf
	veMJKKGoSFC+FQbit8dfvF5Wk8WXtvewwC9I8ke0K5F9NuQJNTArZlnbmPcefiKRXkPk
	G9Dcl1nj85gSmU7ZI7oHDSyGSpRlyVmRYqXUevVbe+jH3+sm868tQxybo+pCmOehZ6TB
	CxzYEMT4SYVznb6rSnKkQzEKPLBgrmiflsEMTgcjAGU5LcHQWT9sJP7X/IgoxCIt81xK
	LfMw==
Received: by 10.180.89.130 with SMTP id bo2mr1803433wib.17.1332996909008; Wed,
	28 Mar 2012 21:55:09 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.86.11 with HTTP; Wed, 28 Mar 2012 21:54:48 -0700 (PDT)
In-Reply-To: <CAEsOVNc9s=t77p4iN5DU6FP5=NVe4Lr+ZV=SG2BrZZ6-AtcKng@mail.gmail.com>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
	<4F72219A.2020301@windriver.com>
	<CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
	<4F723618.6060104@windriver.com>
	<F4FE715B8B374104BDAF129362EBDD00@gmail.com>
	<4F723B78.2060308@windriver.com>
	<CABcZAN=-uE0_UkROO_abncN3m17Qxy=_kqo-Qg=L_pLNKJ99Hg@mail.gmail.com>
	<CAEsOVNc9s=t77p4iN5DU6FP5=NVe4Lr+ZV=SG2BrZZ6-AtcKng@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 28 Mar 2012 21:54:48 -0700
X-Google-Sender-Auth: CiZMrAVAQvKsXTZAxeN3QYLPN7U
Message-ID: <CABcZANnyVxQsJ6ntV=DTeOtPb3R=d8=JSbny8+iOAT8XV99+UQ@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
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
X-List-Received-Date: Thu, 29 Mar 2012 05:04:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 28, 2012 at 9:47 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Tue, Mar 27, 2012 at 5:16 PM, Chris Larson <clarson@kergoth.com> wrote:
>>> If you can explain why the override isn't overriding the default
>>> TUNE_PKGARCH (and it's intentional and not a bug), and we can consistently
>>> modify all of the elements... I'm happy to accept the changes to all of the
>>> tunings.
>>
>> See above. It's not an override. And plenty of files already specify
>> TUNE_PKGARCH_tune-<tune>, so I don't see how it'd be inconsistent to
>> do so for the defaults, personally.
>
> If no one else has complained so far it makes me believe they are not
> missing any TUNE_PKGARCH_tune-<tune> then.

I don't understand the point you're attempting to make here.
-- 
Christopher Larson


