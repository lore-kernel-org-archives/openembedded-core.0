Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQbpM-0003LW-7L
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 12:35:16 +0200
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 23 Oct 2012 03:21:22 -0700
Received: by mail-ob0-f197.google.com with SMTP id tb18so10963382obb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 03:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=irMT5pPkubzmTFumhbiw/IktzKvYiIZ2AImuTCnpnnA=;
	b=nkgD4gnvnRa+QptOyMQ6iH9AJ0gy1gfjvl8SKnbsj8g7kNaEYeVzMPe8EsLXoPIe+4
	ppHALyeP/9rMReDFHO8J2YI5PDWtnkx/io/q6Jv0ealXyEO+dW77dbR10WYBM+LUnDcA
	T86FpYd3eQlgFhRagKeEoRbD7jlituuioDnrQRe2yD4OQfjm/ZEnIWMxp3RZDeSWPINN
	kBof20q98Z8XdQB3DmGgrtIrvjpsUpeij+WhLujIXgr40KdIjT8lS9ine9yd0Ko/UqQL
	ur+b6S0Bza+PGKFeC/HTRXxt4GcZdPVNZcJUaJiOVYeLRUwrmyFIE46NETUDgku7kk1Z
	Tdfg==
Received: by 10.182.228.69 with SMTP id sg5mr4267553obc.2.1350987707942;
	Tue, 23 Oct 2012 03:21:47 -0700 (PDT)
Received: by 10.182.228.69 with SMTP id sg5mr4267549obc.2.1350987707824; Tue,
	23 Oct 2012 03:21:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Tue, 23 Oct 2012 03:21:27 -0700 (PDT)
In-Reply-To: <50866ACF.8010105@r-finger.com>
References: <cover.1350898066.git.ross.burton@intel.com>
	<dc59bf999e1f8a6d5953c02d21c6e45c53c204a9.1350898066.git.ross.burton@intel.com>
	<50865F91.5060002@r-finger.com>
	<CAPj87rP+FHP8QeBvqVHVDX0dUHh-fFL1W_BQbV-1HErG5dE4FA@mail.gmail.com>
	<50866ACF.8010105@r-finger.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Oct 2012 11:21:27 +0100
Message-ID: <CAJTo0LZNTJdx4hZoXPAN=72Myqmat13EpcrPrH_CM=aRpuho0A@mail.gmail.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>,
	Daniel Stone <daniel@fooishbar.org>
X-Gm-Message-State: ALoCoQlKmr3qJwBCsNP4a+KEN9F7gb325QoHxXO1EpseiPlM2oMLEqCh6OWGrTfCeRaVroUeC7SRLpzLmsHNQlg8vA0nw+dFLIlxnIzzgHqOmZ7a+w4CcfeYJvGrzrB0HhSY1niBPPXbhkh3xqvvT+9f4wEPMJbwVPc51DhM78/i3iRDiK4qACGubWUO5GcEnuSOJyJB4ACM
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libxkbcommon: New window system-independent xkb library
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
X-List-Received-Date: Tue, 23 Oct 2012 10:35:16 -0000
Content-Type: text/plain; charset=UTF-8

On 23 October 2012 11:00, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
>> On 23 October 2012 20:12, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
>>> I think this needs a -native tools as well, like,
>>> https://github.com/Guacamayo/meta-guacamayo/blob/master/meta-guacamayo/recipes-graphics/xorg-lib/libxkbcommon_git.bb
>>
>> Not anymore, we use Python for makekeys nowadays.  (And, in an
>> unpushed tree, don't use Python at all if we can avoid it.)
>
> Good news, but perhaps you forgot to push this into the public repo?
> makekeys seems to be C program even in the current master, certainly in
> 1c880887666f84e08ea1752bb8a5ab2a7bf1d8a0.

There's a better way than a -native package, see libx11.  Sorry for
not noticing this, fixing now.

Ross


