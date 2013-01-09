Received: from mail-ie0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TszTc-0002Fs-1e
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 18:30:09 +0100
Received: by mail-ie0-f178.google.com with SMTP id c12so2440875ieb.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 09:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Zn0cm2njumKqQeM3fRQrBoDeFQsNxm+TKRWb0uf6jEk=;
	b=i4ConJsUrEJkdLjl7s0Jp3I2AABpS1ESRDMtkfiXUW7/T82CUAThKoL4YX6/03U5Wn
	/sL364tM26dMD6O3/N5APfydREwMKsvUygGfdMx2iUSNbbHa7ez2+gnR7hIPGvhqONOf
	bpPe1jpHSkW20PodBiI81zqWgXVDracXZ5UEfIZ18Zz8z7oc7za9XsosSH9ZqiAD3POF
	R/Mlwb6kOkr9ClQcU0wJ6jHDnr+v8GS3ECNHvjqwwR3VcWAtyjcMpfsQAkTUzksh+CIg
	3QdFhskDrcb7oaT+bel/R1pJC68ZsMhzUkEYG3mX3YbirAu7wjNHTAVMWem+R06llQmS
	qh3A==
Received: by 10.50.56.232 with SMTP id d8mr2339157igq.112.1357751695186; Wed,
	09 Jan 2013 09:14:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Wed, 9 Jan 2013 09:14:24 -0800 (PST)
In-Reply-To: <cover.1357647338.git.radu.moisan@intel.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Jan 2013 09:14:24 -0800
Message-ID: <CAMKF1sow_bbU84+EYXR0hU_pbFxeR50c1ueWYWGqUnr6Swdy6g@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
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
X-List-Received-Date: Wed, 09 Jan 2013 17:30:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 8, 2013 at 4:24 AM, Radu Moisan <radu.moisan@intel.com> wrote:
> As Ross suggested I've done the following changes to the previous set:
> * added two patches (the first two) that address multiple init systems support,\
> as in shifting from default hardcoded sysvinit to something more generic while
> the default values still remains on sysvinit
> * moved automatic setting of PREFERRED_PROVIDER_udev into default_providers.inc
> * removed ahavi-systemd since all it provided was service files; now service files
> are pulled in by avahi-daemon
> * also rebased on master
>

btw. there has been more merges into meta-systemd in meta-openembedded
since these patches were created I cant accertain
that you picked those too but please redo this series so the history
is a bit better for tracking purposes.


