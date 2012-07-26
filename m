Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SuMdR-0006Of-CZ
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 13:53:41 +0200
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 26 Jul 2012 04:42:09 -0700
Received: by yenq6 with SMTP id q6so1640890yen.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 04:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=a0iwBMhh9uVoF9fXeFexIgeZPhVLQCE0ENo2kd3BVpg=;
	b=Wz6ni3+G8emfbn9jniRdw8/7zADOOs66ZcdsvbasPWvlX9KczQKc8oM6Sc1nrjR9tg
	kdQxLs2/eR/+JD8kopkP4GMUEidLshtYT8xdeyrz0TMLsjjKQBdX/GWiPFBHV3Byuw39
	gZnHAnzLkZ/YynyllrbgJ32RQ4Fhd5DJp/qmJ94zQWOJyaU4n3ss+Mme1j4utENxS66d
	bM/sL+BQthnDuftc4R16PcfPShFj+dNnfe2/ZGLm5fQZpKrdyA5v0hx/kv01A4ODZrzc
	ojWw7g9VtXJ7K7n+Fv7VvBiGHzAEka2xAaLxhxHypOwyewtUDrGwXP3prHoXE4DNoGb+
	Ok5Q==
Received: by 10.50.179.74 with SMTP id de10mr1304384igc.61.1343302928028; Thu,
	26 Jul 2012 04:42:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Thu, 26 Jul 2012 04:41:46 -0700 (PDT)
In-Reply-To: <20120725173817.GD20145@jama.jama.net>
References: <CAJTo0LYgXx4camSSmap_HpitQ+gMOhshDLbJDDEr71=kfYnyUQ@mail.gmail.com>
	<1343234476-22803-1-git-send-email-ross.burton@intel.com>
	<20120725173817.GD20145@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Jul 2012 12:41:46 +0100
Message-ID: <CAJTo0LZWC3qE=OFHJThzmiA-kJ5ipniY+WbNiw-_smac3HnBjA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnz6lxCqii2a709mo88P3A4haOxzK8PD+2RpG8PYJZCLOAcRHGcy9l1Vzmzwb7McoJJ8LQ7
Subject: Re: [PATCH] package.bbclass: don't error when the root doesn't exist in do_split_packages
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
X-List-Received-Date: Thu, 26 Jul 2012 11:53:41 -0000
Content-Type: text/plain; charset=UTF-8

On 25 July 2012 18:38, Martin Jansa <martin.jansa@gmail.com> wrote:
> Isn't this real error which shouldn't be covered by this?
>
> e.g. if someone removes or loose tmp-eglibc/work/foo/image (happens
> to me all the time because tmp-eglibc is on tmpfs) then do_package is
> reexecuted when sstate checksum is changed (even with
> BB_SIGNATURE_HANDLER = "OEBasic") and in some cases it successfully
> repackage .ipk files which are now empty and in some cases it fails
> (e.g. with systemd.bbclass checking that requested .service files are
> available in package during do_package).

In that case it really should fail before do_split_packages() is called, surely?

Ross


