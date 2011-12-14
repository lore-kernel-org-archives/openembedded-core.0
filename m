Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ratpm-0008RI-DA
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 19:45:42 +0100
Received: by lami14 with SMTP id i14so619441lam.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 10:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=6uZzminxTJ4lMcXVwsNkj+Huw6FoEhte+zOd98vhhuA=;
	b=faEqe0FKtHwU2Qc8v/5oU/O7r07F3yWIo11R/EA4nyS3iYWZr8NKymDg0lsy5kziH9
	HFov4rlb/vZczZoYYC+pMZpBnrp7VWTiCL8VSmyGEiq5Iu1UlKKLSVkzJuFi+gWAiOKE
	8xs2wgfaqxoEqJyr3zf90VUnRK51nzw2Rv5qQ=
Received: by 10.152.106.115 with SMTP id gt19mr4492607lab.27.1323887925372;
	Wed, 14 Dec 2011 10:38:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 14 Dec 2011 10:38:14 -0800 (PST)
In-Reply-To: <4EE8E607.5080207@emagii.com>
References: <1323851280-6342-1-git-send-email-raj.khem@gmail.com>
	<1323856946.25491.31.camel@ted> <4EE8E607.5080207@emagii.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Dec 2011 10:38:14 -0800
Message-ID: <CAMKF1sqgzc=RK4G2yMahvFrTAGSwH40fxjCy=tifrMU=isdO+w@mail.gmail.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.6: Let G++ relocate gxx-include-dir when using --sysroot option
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
X-List-Received-Date: Wed, 14 Dec 2011 18:45:42 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 14, 2011 at 10:08 AM, Ulf Samuelsson
<openembedded-core@emagii.com> wrote:
>>
>>
> Not familiar with gcc internals, but just want to reiterate the point
> that the problem occured (the one I saw) only when I had
> BB_NUMBER_THREADS at a high value, so WHEN things
> are done seems to be important.

could you test out this patch in your configuration and see if you
still see the problem ?


