Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TT8ry-00049x-7g
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 11:16:26 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 30 Oct 2012 03:02:49 -0700
Received: by mail-ie0-f197.google.com with SMTP id 9so185188iec.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 03:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=d5h7sjLRPIqdAa/bIaaP2K2FjnZYWeZle48sJCvc1r8=;
	b=gZTpb2xaMSbQ8tOcSb2NSXQd63R892bdtk15WQCtH9bMMUWc5eyUODK/9bb6uKsCC3
	HCcoJnMTBZeoBV3l68zvQ2GmOth9l6sybfSZa9DYOtVfBoVgsGNDWL4KTBqpoimvBtrO
	7pmVFl/e3VSJlhqIil5g3bg0dd+qgr8uG3gZdXHweXsdT2k76zdtOo+BD9s0Ovdruw8w
	qTBpoKyXIGjiJ4svsEyGPOn20JMgXyzcIbHyN8u0D0lJGsGh4REUQUzJj+XQBAU5lnmw
	YApLJobm4OyMsyQBCP3QeE7G1+AtZ5w0yAxfXK3nh5nijJ179k4sVJCFZqQ/VK+S23n0
	RSTA==
Received: by 10.182.1.72 with SMTP id 8mr26876886obk.61.1351591368845;
	Tue, 30 Oct 2012 03:02:48 -0700 (PDT)
Received: by 10.182.1.72 with SMTP id 8mr26876882obk.61.1351591368716; Tue, 30
	Oct 2012 03:02:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Tue, 30 Oct 2012 03:02:28 -0700 (PDT)
In-Reply-To: <CAK18fxFzwdCszev=Ss+rMdytAqUgDcnA4e9HEC4_psz2SAJbxw@mail.gmail.com>
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
	<CAK18fxFzwdCszev=Ss+rMdytAqUgDcnA4e9HEC4_psz2SAJbxw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2012 10:02:28 +0000
Message-ID: <CAJTo0LZ=t_sWFtkbdt=uwyCEGuMmHnWdu7cO3=qMmseiMtVTHQ@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmIZJoOgv/LKgRpkMRpbU8V9D/RBkhrlBVGVTg1AhS3AaeRbdmne8Fp1uJmjCmhqXVwzDeEfoXl8M63MB6jjh40NBmZN3YtUIqe24yKWDko00cSSnjawjFOOw8c8qzkpS9J10vKIp8X7/zskNny+eRqOjObdrBYeZjyVtJXK0aoVhcLWQUMOMZ2vKx14Upr+QO+9J+I
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] pulseaudio: add GConf dependency
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
X-List-Received-Date: Tue, 30 Oct 2012 10:16:26 -0000
Content-Type: text/plain; charset=UTF-8

On 30 October 2012 09:59, Andrei Gherzan <andrei@gherzan.ro> wrote:
> This commit made pulseaudio unbuildable for builds with no GPLv3 packages.

What causes gconf to not build without GPLv3?

Ross


