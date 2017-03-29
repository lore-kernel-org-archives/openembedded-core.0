Return-Path: <raltherr@google.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4A97677B99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 15:30:48 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id w11so19636464wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RKxj6mH1p9eAVTxLVYt6MdySskIVNtdXo7wufRA40Ik=;
	b=PcrIN1a3Z3CpEpsNxLbJ6PDWC27u34yGbmJImsOWWZLBGINGUyssaHIbyOFii83GLB
	aRXPQBqk8TCx+bK2eU289iI+8YVv70JyjtmSwwnTQYDVRq7uj7erBbpRV0zyv81xmc/S
	Zbjuwelm2exHbV1bLcjb2XRPUIyBpMuVGRKVnjAPbgVdQ69F4TPM0ic4kmBq4w87biG3
	zRZKlKVhvBjKfI7txhQZRVkSCqFkQwdwkzkIAkYt6NQxv1Wb5l8ROGF8CMDPcQUwaDmM
	56QN/+zep0jG/JMD7OXZSvJmc+j/tQePw5+H2xC7EY3MiUBrie6kSCMkYXiWpLU3crwq
	Vjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RKxj6mH1p9eAVTxLVYt6MdySskIVNtdXo7wufRA40Ik=;
	b=t3jOlyMZjcvWs7LwU9tn26O16b3Kp8Oa3vPm7KItFr9cLuSgZ1qjmNLwEmXXxfnhfW
	NU6iZnw1Cg8kIwsAEGxtycmArvmuTonYU79fPIKoczhZazXfmHH1Q4OFFYfrqyRje8dA
	VJ8ModbnDp1O6ns//d/HNjlZbmcCpbJi6OtDliWIRIXM96BvrzGjv/U156D3p9VOfVFy
	0RqIEnnSK4N4szYxaNLIsYY0Lry6rLlA+GqCgAMt05GzHbyXdjmsQ2Y8xoXzBOvyQybj
	VKF7cvapZDTDlGZDe7dzcBs+rsAT8ay38DuhcU9HSmHM8cebKCRbef/exIW1pmkT678C
	yFzA==
X-Gm-Message-State: AFeK/H07qavTwqe8TCVEcYLdbs6BLbMsJ6svUL898eZALzixwj0FDut9YAcN0+HIH4usRce6PjT6ga9EWiqoUoyx
X-Received: by 10.223.164.6 with SMTP id d6mr1081927wra.132.1490801449314;
	Wed, 29 Mar 2017 08:30:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.169.8 with HTTP; Wed, 29 Mar 2017 08:30:48 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703290532280.1776@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703281817440.27955@localhost.localdomain>
	<CAPLgG==F8OV8U6CVZ2yEyErUhCJw+UwHmbEaCmaXpJBaBeLHaA@mail.gmail.com>
	<alpine.LFD.2.20.1703290532280.1776@uk63952.mitel.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 29 Mar 2017 08:30:48 -0700
Message-ID: <CAPLgG=nPSi+MDPnVHdWk8DXEGAZ+48q6DVkLFOwX=69EDskScA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there OE support for building multi-image/component FIT image files?
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
X-List-Received-Date: Wed, 29 Mar 2017 15:30:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 29, 2017 at 2:33 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Tue, 28 Mar 2017, Rick Altherr wrote:
>
>> kernel-fitimage.bbclass loops through all the DTBs listed in
>> KERNEL_DEVICETREE and adds a FIT section for each one.  It looks like
>> only the first one is put into a config section though.
>
>   maybe i just haven't read far enough, but what value would that
> have? as i read it, "bootm" can either boot based on an actual image
> reference, or a configuration entry. i don't see how you can select
> from among DTBs unless they're referenced in a configuration entry.
>

bootm takes 3 arguments: kernel, initrd, fdt.  Each of those can
reference a specific image within the FIT using
<fit-address>:<image-name> format.

>   can someone clarify this?
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>

