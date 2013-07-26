Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE5F6A960
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 09:35:41 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id pa12so1108708veb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 02:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=guEd/ij2JuLq8G6/3ALw5hmlRF3zo1fIEd0zK67xigc=;
	b=mOqOeCrPAzMLRQIC8l/JY3ghZVfpn96yOPaRyU8HR+5+dNNmcnplEHI2jVSXY4z1uG
	LHHdOHu6BMwUGgKnw8uBVyP/f24zzODqWtjv9cMYU+I78cApmdGgKdwGhcVsQRKIDeZI
	HbDRem7XStmUeX7qCGH414Wbcf9BodQjsb50SeLJt43rKDlUa44n9JS4GCv13oSiM0/8
	v517gbrIN5BzEazfO1Ba1cYt7ql9V2uCS6IrDQdsE8DMwil+VpFir0ey8lWGEZRWL03L
	aMklIJVWSqwBKG6ZVUo3UhV7BQuxMripHjrQNW1W7H2wvuM4eDIXJzeK1j4neb69y90i
	LL4g==
X-Received: by 10.220.124.1 with SMTP id s1mr2787437vcr.93.1374831341873; Fri,
	26 Jul 2013 02:35:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Fri, 26 Jul 2013 02:35:20 -0700 (PDT)
In-Reply-To: <cover.1374822498.git.sgw@linux.intel.com>
References: <cover.1374822498.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jul 2013 10:35:20 +0100
Message-ID: <CAJTo0LZddy=dtdm_wdqg+GJQmxmt24uhmNe8J6hM6gnK_ikocw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQltPRajNwfzPA8rNaKrKWahdG83zgYWmF1QpIph30ahMiO/9V0jFFe4zMvaPHPCx30cLtjV
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/78] Review & ACK
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
X-List-Received-Date: Fri, 26 Jul 2013 09:35:41 -0000
Content-Type: text/plain; charset=UTF-8

On 26 July 2013 08:14, Saul Wold <sgw@linux.intel.com> wrote:
> Emilia Ciobanu (12):
>   babeltrace: fix recipe name
>   build-appliance-image: fix recipe name add GIT revision to PV variable
>   chkconfig-alternatives-native: fix recipe name and add GIT revision to
>     PV variable
>   connman-gnome: fix recipe name add GIT revision to PV variable
>   docbook-sgml-dtd-3.1-native: fix recipe name
>   docbook-sgml-dtd-4.1-native: fix recipe name
>   hwlatdetect: fix recipe name and add GIT revision to PV variable
>   lttng-ust: fix recipe name and add GIT revision to PV variable
>   mtd-utils: fix recipe name and add GIT revision to PV variable
>   neard: fix recipe name
>   rt-tests: fix recipe name add GIT revision to PV variable
>   update-rc.d: fix recipe name and add GIT revision to PV variable

I meant to chime in on this yesterday but was... tied up.  For
packages where the SRC_URI is a git repo *but* we're only ever
checking out release tags do we really need to rename the package to
_git?  The _git version to me implies "a mostly working snapshot of
the development release" not "a stable release".

>   bluez5: disable obex by default

The message seems to allude to some other reason for disabling it
apart from a systemd user service not being packaged.  Is there a
reason, as the systemd issue should be fixable in systemd.bbclass.

Apart from that, Acked-By: Ross Burton <ross.burton@intel.com>.

Ross

