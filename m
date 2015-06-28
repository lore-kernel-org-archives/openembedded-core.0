Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id DCB3860132
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jun 2015 13:24:22 +0000 (UTC)
Received: by pdbci14 with SMTP id ci14so101046475pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jun 2015 06:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=wKPsxDmJ2Dp0KmPORwMJbEgAxv4sY25qR01oaY43qA0=;
	b=zO7VAxpYOqLeWCu128hszX0/DcKbP0yQQDzJmDaJhRlGxABGm2xeRQ0qlTl7W30csH
	4NeF/5lSSa3ktQ0FOMJIpShULbUlFaekgqm3rgJFA4mj2k2vB0851717wHIBEovtx2Sr
	FfO0lj9vXgi2zRcalfrea7+NnvBPqpG1cZpASMAJnLHplZ7x2nMzMX9Bo11HGvlaky9t
	oaT0s1SeHdhPM0T0oFJ/YYWjepardkHCKX0nF38LQIgLaY2a/Tn101NIk5jfbCMeE4jp
	/iRLnNHCcTTBnqsBV4sngfCb8de+o6wKvxTa6u6KgrbD2L8MrmGJCHIaVMhuTb3wXHiF
	jwog==
X-Received: by 10.70.127.203 with SMTP id ni11mr22332063pdb.74.1435497863686; 
	Sun, 28 Jun 2015 06:24:23 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:3ce4:949d:70b:5e6c?
	([2601:202:4000:1239:3ce4:949d:70b:5e6c])
	by mx.google.com with ESMTPSA id x2sm39157414pda.31.2015.06.28.06.24.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jun 2015 06:24:22 -0700 (PDT)
Message-ID: <558FF57A.1000905@gmail.com>
Date: Sun, 28 Jun 2015 06:24:10 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1435174534.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1435174534.git.jussi.kukkonen@intel.com>
Subject: Re: [PATCH 0/1][fido][dizzy] dbus: Fix CVE-2015-0245
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
X-List-Received-Date: Sun, 28 Jun 2015 13:24:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

merged to staging

thanks,
armin

On 06/24/2015 01:04 PM, Jussi Kukkonen wrote:
> This is for fido and possibly dizzy, not master.
>
> D-Bus 1.8.16 fixes CVE-2015-0245 "prevent forged ActivationFailure from
> non-root processes". This patch does not contain the same fix but a
> configuration change that upstream suggests as a easily backportable
> fix.
>
> The issue is only a local denial of service so not terribly dangerous,
> but should be worth fixing since the patch is not intrusive.
>
> I've only tested this on fido, so the [dizzy] is just a suggestion.
>
> Cheers, Jussi
>
>
>
> The following changes since commit eb4a134a60e3ac26a48379675ad6346a44010339:
>
>    scripts/combo-layer: Fix exit codes and tty handling (2015-06-11 15:00:20 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib jku/dbus-fix-for-fido
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/dbus-fix-for-fido
>
> Jussi Kukkonen (1):
>    dbus: CVE-2015-0245: prevent forged ActivationFailure
>
>   meta/recipes-core/dbus/dbus.inc                    |  1 +
>   ...015-0245-prevent-forged-ActivationFailure.patch | 48 ++++++++++++++++++++++
>   2 files changed, 49 insertions(+)
>   create mode 100644 meta/recipes-core/dbus/dbus/CVE-2015-0245-prevent-forged-ActivationFailure.patch
>

