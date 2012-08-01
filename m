Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <damien.lespiau@gmail.com>) id 1SwaFy-0007KF-ET
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:50:41 +0200
Received: by vbbfr13 with SMTP id fr13so6706252vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 07:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LLzehD0RLDrZWDRhZCfaIJ0oCxNpG4Pl+pdcJlF0F8Y=;
	b=RuNeVOoNenMYTXPXWSbezpzImxrSR3pwJrduJQ3rFSDAhj2t9ImS+mcJsxBi83gSeh
	58iKYwe4IWGL922kOcgtwocippmDQqU7+gQVvZ3SmDTZwoPvnlcCgdf8xhXEmRbKMpk5
	pzydHcfX8npuiAr8clL5A2DIcaaXe41wCaDKSNSQIHYUcWhnMbvt0lSGZ+eE0uMYFP40
	M9EDqPO+IpDhrtEbhUidf+TuD2PaC361JBsUJF4XfbGYG3oPPB/D8lI6V5qc4BMBoLCS
	ZxL4X0um220DIfRMWsGrMtCZzZLdJXwBej6FNUvU/PWoZUZzaRhMtoa6tG+v7H9E1C3n
	bxeg==
MIME-Version: 1.0
Received: by 10.58.164.98 with SMTP id yp2mr5932052veb.50.1343831933928; Wed,
	01 Aug 2012 07:38:53 -0700 (PDT)
Received: by 10.58.240.73 with HTTP; Wed, 1 Aug 2012 07:38:53 -0700 (PDT)
In-Reply-To: <40FAF05B-A7A4-45DF-8BA7-872A97FDF157@dominion.thruhere.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<40FAF05B-A7A4-45DF-8BA7-872A97FDF157@dominion.thruhere.net>
Date: Wed, 1 Aug 2012 15:38:53 +0100
Message-ID: <CAGrt=7hVBjV+3de21AEHnC9ZuTBhAO6sdnt8krt=4kMxFuvFFA@mail.gmail.com>
From: Damien Lespiau <damien.lespiau@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/12] Mesa upgrade/improvements
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
X-List-Received-Date: Wed, 01 Aug 2012 14:50:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 1 August 2012 14:32, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 1 aug. 2012, om 14:31 heeft Ross Burton <ross.burton@intel.com> het volgende geschreven:
>
>> This patch series upgrades mesa-dri to the latest upstream, enables GLES2 and
>> EGL
>
> That will sadly break all the powervr based evil binaries (e.g. all cortex arm chips from TI) since there will be 2 providers of those libs.

Why could one prefer providers of virtual/libgles2 and virtual/ligegl
on a per-machine basis. This maps quite well with the reality.

-- 
Damien


